/*
 * Copyright (c) 2021 Rockchip, Inc. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#include "rkadk_photo.h"
#include "rkadk_log.h"
#include "rkadk_media_comm.h"
#include "rkadk_param.h"
#include "rkadk_thumb_comm.h"
#include "rkadk_signal.h"
#include <byteswap.h>
#include <assert.h>
#include <malloc.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <unistd.h>
#include <utime.h>

#define JPG_THM_FIND_NUM_MAX 50
#define JPG_EXIF_FLAG_LEN 6
#define JPG_DIRECTORY_ENTRY_LEN 12
#define JPG_DE_TYPE_COUNT 12
#define JPG_MP_FLAG_LEN 4
#define JPG_MP_ENTRY_LEN 16
#define JPG_THUMB_TAG_LEN 4

#define VDEC_THM_CHN 10
#define VDEC_THM_VPSS_GRP 10
#define VDEC_THM_VPSS_CHN 0

#define VDEC_GET_DATA_CHN 11
#define VDEC_GET_DATA_VPSS_GRP 11
#define VDEC_GET_DATA_VPSS_CHN 0

#define JPG_MMAP_FILE_PATH "/tmp/.mmap.jpeg"

typedef enum {
  RKADK_JPG_LITTLE_ENDIAN, // II
  RKADK_JPG_BIG_ENDIAN,    // MM
  RKADK_JPG_BYTE_ORDER_BUTT
} RKADK_JPG_BYTE_ORDER_E;

typedef struct {
  RKADK_U16 u16Type;
  RKADK_U16 u16TypeByte;
} RKADK_JPG_DE_TYPE_S;

typedef struct {
  RKADK_U32 u32CamId;
  RKADK_U32 u32ViChn;
  bool bUseVpss;
  RKADK_PHOTO_DATA_RECV_FN_PTR pDataRecvFn;
  pthread_t tid;
  bool bGetJpeg;
  RKADK_U32 u32PhotoCnt;
} RKADK_PHOTO_HANDLE_S;

static RKADK_U8 *RKADK_PHOTO_Mmap(RKADK_CHAR *FileName, RKADK_U32 u32PhotoLen) {
  char data = 0xff;
  FILE *fd = NULL;
  RKADK_U8 *pu8Photo = NULL;

  fd = fopen(FileName, "w+");
  if (!fd) {
    RKADK_LOGE("open %s failed", FileName);
    return NULL;
  }

  if (fseek(fd, u32PhotoLen, SEEK_SET)) {
    fclose(fd);
    RKADK_LOGE("seek %s failed", FileName);
    return NULL;
  }
  fwrite(&data, 1, 1, fd);

  pu8Photo = (RKADK_U8 *)mmap(NULL, u32PhotoLen, PROT_READ | PROT_WRITE, MAP_SHARED, fileno(fd), 0);
  if (pu8Photo == MAP_FAILED) {
    fclose(fd);
    RKADK_LOGE("Mmap %s, errno: %d",FileName, errno);
    return NULL;
  }
  fclose(fd);

  return pu8Photo;
}

static void *RKADK_PHOTO_GetJpeg(void *params) {
  int ret;
  VENC_STREAM_S stFrame, stThumbFrame;
  VENC_PACK_S stPack, stThumbPack;
  RKADK_PHOTO_RECV_DATA_S stData;
  RKADK_U8 *pu8JpgData;
  RKADK_U32 u32PhotoLen;

  RKADK_PHOTO_HANDLE_S *pHandle = (RKADK_PHOTO_HANDLE_S *)params;
  if (!pHandle) {
    RKADK_LOGE("Get jpeg thread invalid param");
    return NULL;
  }

  if (!pHandle->pDataRecvFn) {
    RKADK_LOGE("u32CamId[%d] don't register callback", pHandle->u32CamId);
    return NULL;
  }

  RKADK_PARAM_THUMB_CFG_S *ptsThumbCfg = RKADK_PARAM_GetThumbCfg(pHandle->u32CamId);
  if (!ptsThumbCfg) {
    RKADK_LOGE("RKADK_PARAM_GetThumbCfg failed");
    return NULL;
  }

  RKADK_PARAM_SENSOR_CFG_S *pstSensorCfg = RKADK_PARAM_GetSensorCfg(pHandle->u32CamId);
  if (!pstSensorCfg) {
    RKADK_LOGE("RKADK_PARAM_GetSensorCfg failed");
    return NULL;
  }

  RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg = RKADK_PARAM_GetPhotoCfg(pHandle->u32CamId);
  if (!pstPhotoCfg) {
    RKADK_LOGE("RKADK_PARAM_GetPhotoCfg failed");
    return NULL;
  }

  stFrame.pstPack = &stPack;
  stThumbFrame.pstPack = &stThumbPack;
  u32PhotoLen = pstSensorCfg->max_width * pstSensorCfg->max_height * 3 / 2;

  RKADK_U8 *pu8Photo = RKADK_PHOTO_Mmap((RKADK_CHAR *)JPG_MMAP_FILE_PATH, u32PhotoLen);
  if (!pu8Photo)
    return NULL;

  // drop first frame
  ret = RK_MPI_VENC_GetStream(pstPhotoCfg->venc_chn, &stFrame, 1000);
  if (ret == RK_SUCCESS)
    RK_MPI_VENC_ReleaseStream(pstPhotoCfg->venc_chn, &stFrame);
  else
    RKADK_LOGE("RK_MPI_VENC_GetStream[%d] timeout[%x]", pstPhotoCfg->venc_chn, ret);

  // drop first thumb frame
  ret = RK_MPI_VENC_GetStream(ptsThumbCfg->photo_venc_chn, &stThumbFrame, 1000);
  if (ret == RK_SUCCESS)
    RK_MPI_VENC_ReleaseStream(ptsThumbCfg->photo_venc_chn, &stThumbFrame);
  else
    RKADK_LOGE("RK_MPI_VENC_GetStream[%d] timeout[%x]", ptsThumbCfg->photo_venc_chn, ret);

  RK_MPI_VENC_ResetChn(pstPhotoCfg->venc_chn);
  RK_MPI_VENC_ResetChn(ptsThumbCfg->photo_venc_chn);

  while (pHandle->bGetJpeg) {
    ret = RK_MPI_VENC_GetStream(pstPhotoCfg->venc_chn, &stFrame, 1000);
    if (ret == RK_SUCCESS) {
      RKADK_LOGD("Photo success, seq = %d, len = %d", stFrame.u32Seq, stFrame.pstPack->u32Len);

      pu8JpgData = (RKADK_U8 *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
      memset(&stData, 0, sizeof(RKADK_PHOTO_RECV_DATA_S));

      ret = RK_MPI_VENC_GetStream(ptsThumbCfg->photo_venc_chn, &stThumbFrame, 1000);
      if (ret == RK_SUCCESS) {
        stData.u32DataLen = ThumbnailPhotoData(pu8JpgData, stFrame.pstPack->u32Len, stThumbFrame, pu8Photo);
        stData.pu8DataBuf = pu8Photo;
        stData.u32CamId = pHandle->u32CamId;
        pHandle->pDataRecvFn(&stData);

        ret = RK_MPI_VENC_ReleaseStream(ptsThumbCfg->photo_venc_chn, &stThumbFrame);
        if (ret != RK_SUCCESS)
          RKADK_LOGE("RK_MPI_VENC_ReleaseStream failed[%x]", ret);

        RK_MPI_VENC_ResetChn(ptsThumbCfg->photo_venc_chn);
      } else {
        stData.pu8DataBuf = pu8JpgData;
        stData.u32DataLen = stFrame.pstPack->u32Len;
        stData.u32CamId = pHandle->u32CamId;
        pHandle->pDataRecvFn(&stData);
      }

      ret = RK_MPI_VENC_ReleaseStream(pstPhotoCfg->venc_chn, &stFrame);
      if (ret != RK_SUCCESS)
        RKADK_LOGE("RK_MPI_VENC_ReleaseStream failed[%x]", ret);

      RK_MPI_VENC_ResetChn(pstPhotoCfg->venc_chn);
      pHandle->u32PhotoCnt -= 1;
    }
  }

  if (pu8Photo)
    munmap(pu8Photo, u32PhotoLen);

  RKADK_LOGD("Exit get jpeg thread");
  return NULL;
}

static void RKADK_PHOTO_SetVencAttr(RKADK_PHOTO_THUMB_ATTR_S stThumbAttr,
                                    RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg,
                                    RKADK_PARAM_SENSOR_CFG_S *pstSensorCfg,
                                    VENC_CHN_ATTR_S *pstVencAttr) {
  VENC_ATTR_JPEG_S *pstAttrJpege = &(pstVencAttr->stVencAttr.stAttrJpege);

  memset(pstVencAttr, 0, sizeof(VENC_CHN_ATTR_S));
  pstVencAttr->stVencAttr.enType = RK_VIDEO_ID_JPEG;
  pstVencAttr->stVencAttr.enPixelFormat =
      pstPhotoCfg->vi_attr.stChnAttr.enPixelFormat;
  pstVencAttr->stVencAttr.u32MaxPicWidth = pstSensorCfg->max_width;
  pstVencAttr->stVencAttr.u32MaxPicHeight = pstSensorCfg->max_height;
  pstVencAttr->stVencAttr.u32PicWidth = pstPhotoCfg->image_width;
  pstVencAttr->stVencAttr.u32PicHeight = pstPhotoCfg->image_height;
  pstVencAttr->stVencAttr.u32VirWidth = pstPhotoCfg->image_width;
  pstVencAttr->stVencAttr.u32VirHeight = pstPhotoCfg->image_height;
  pstVencAttr->stVencAttr.u32StreamBufCnt = 1;
  pstVencAttr->stVencAttr.u32BufSize =
      pstSensorCfg->max_width * pstSensorCfg->max_height;

  pstAttrJpege->bSupportDCF = (RK_BOOL)stThumbAttr.bSupportDCF;
  pstAttrJpege->stMPFCfg.u8LargeThumbNailNum =
      stThumbAttr.stMPFAttr.sCfg.u8LargeThumbNum;
  if (pstAttrJpege->stMPFCfg.u8LargeThumbNailNum >
      RKADK_MPF_LARGE_THUMB_NUM_MAX)
    pstAttrJpege->stMPFCfg.u8LargeThumbNailNum = RKADK_MPF_LARGE_THUMB_NUM_MAX;

  switch (stThumbAttr.stMPFAttr.eMode) {
  case RKADK_PHOTO_MPF_SINGLE:
    pstAttrJpege->enReceiveMode = VENC_PIC_RECEIVE_SINGLE;
    pstAttrJpege->stMPFCfg.astLargeThumbNailSize[0].u32Width =
        UPALIGNTO(stThumbAttr.stMPFAttr.sCfg.astLargeThumbSize[0].u32Width, 4);
    pstAttrJpege->stMPFCfg.astLargeThumbNailSize[0].u32Height =
        UPALIGNTO(stThumbAttr.stMPFAttr.sCfg.astLargeThumbSize[0].u32Height, 2);
    break;
  case RKADK_PHOTO_MPF_MULTI:
    pstAttrJpege->enReceiveMode = VENC_PIC_RECEIVE_MULTI;
    for (int i = 0; i < pstAttrJpege->stMPFCfg.u8LargeThumbNailNum; i++) {
      pstAttrJpege->stMPFCfg.astLargeThumbNailSize[i].u32Width = UPALIGNTO(
          stThumbAttr.stMPFAttr.sCfg.astLargeThumbSize[i].u32Width, 4);
      pstAttrJpege->stMPFCfg.astLargeThumbNailSize[i].u32Height = UPALIGNTO(
          stThumbAttr.stMPFAttr.sCfg.astLargeThumbSize[i].u32Height, 2);
    }
    break;
  default:
    pstAttrJpege->enReceiveMode = VENC_PIC_RECEIVE_BUTT;
    break;
  }
}

static void RKADK_PHOTO_CreateVencCombo(RKADK_S32 s32ChnId,
                                        VENC_CHN_ATTR_S *pstVencChnAttr,
                                        RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg) {
  VENC_RECV_PIC_PARAM_S stRecvParam;
  VENC_CHN_BUF_WRAP_S stVencChnBufWrap;
  VENC_CHN_REF_BUF_SHARE_S stVencChnRefBufShare;
  VENC_COMBO_ATTR_S stComboAttr;
  VENC_JPEG_PARAM_S stJpegParam;
  memset(&stRecvParam, 0, sizeof(VENC_RECV_PIC_PARAM_S));
  memset(&stVencChnBufWrap, 0, sizeof(VENC_CHN_BUF_WRAP_S));
  memset(&stVencChnRefBufShare, 0, sizeof(VENC_CHN_REF_BUF_SHARE_S));
  memset(&stComboAttr, 0, sizeof(VENC_COMBO_ATTR_S));
  memset(&stJpegParam, 0, sizeof(stJpegParam));

  RK_MPI_VENC_CreateChn(s32ChnId, pstVencChnAttr);

  stVencChnBufWrap.bEnable = RK_TRUE;
  RK_MPI_VENC_SetChnBufWrapAttr(s32ChnId, &stVencChnBufWrap);

  stVencChnRefBufShare.bEnable = RK_TRUE;
  RK_MPI_VENC_SetChnRefBufShareAttr(s32ChnId, &stVencChnRefBufShare);

  stRecvParam.s32RecvPicNum = 1;
  RK_MPI_VENC_StartRecvFrame(s32ChnId, &stRecvParam);

  stComboAttr.bEnable = RK_TRUE;
  stComboAttr.s32ChnId = pstPhotoCfg->combo_venc_chn;
  RK_MPI_VENC_SetComboAttr(s32ChnId, &stComboAttr);

  stJpegParam.u32Qfactor = pstPhotoCfg->qfactor;
  RK_MPI_VENC_SetJpegParam(s32ChnId, &stJpegParam);
}

static void RKADK_PHOTO_SetVideoChn(RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg,
                                    RKADK_U32 u32CamId, MPP_CHN_S *pstViChn,
                                    MPP_CHN_S *pstVencChn, MPP_CHN_S *pstSrcVpssChn,
                                    MPP_CHN_S *pstDstVpssChn) {
  pstViChn->enModId = RK_ID_VI;
  pstViChn->s32DevId = u32CamId;
  pstViChn->s32ChnId = pstPhotoCfg->vi_attr.u32ViChn;

  pstSrcVpssChn->enModId = RK_ID_VPSS;
  pstSrcVpssChn->s32DevId = pstPhotoCfg->vpss_grp;
  pstSrcVpssChn->s32ChnId = pstPhotoCfg->vpss_chn;

  pstDstVpssChn->enModId = RK_ID_VPSS;
  pstDstVpssChn->s32DevId = pstPhotoCfg->vpss_grp;
  pstDstVpssChn->s32ChnId = 0; //When vpss is dst, chn is equal to 0

  pstVencChn->enModId = RK_ID_VENC;
  pstVencChn->s32DevId = 0;
  pstVencChn->s32ChnId = pstPhotoCfg->venc_chn;
}

static bool RKADK_PHOTO_IsUseVpss(RKADK_U32 u32CamId,
                                 RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg) {
  bool bUseVpss = false;
  RKADK_U32 u32ViWidth = pstPhotoCfg->vi_attr.stChnAttr.stSize.u32Width;
  RKADK_U32 u32ViHeight = pstPhotoCfg->vi_attr.stChnAttr.stSize.u32Height;

  RKADK_PARAM_SENSOR_CFG_S *pstSensorCfg = RKADK_PARAM_GetSensorCfg(u32CamId);
  if (!pstSensorCfg) {
    RKADK_LOGE("RKADK_PARAM_GetSensorCfg failed");
    return false;
  }

  if (pstPhotoCfg->image_width != u32ViWidth ||
      pstPhotoCfg->image_height != u32ViHeight) {
    RKADK_LOGD("In[%d, %d], Out[%d, %d]", u32ViWidth, u32ViHeight,
               pstPhotoCfg->image_width, pstPhotoCfg->image_height);
    bUseVpss = true;
  }

#ifdef RV1106_1103
  //usp vpss switch resolution
  if (!pstSensorCfg->used_isp) {
    if (pstPhotoCfg->switch_res)
      bUseVpss = true;
  }
#endif

#ifndef RV1106_1103
  if (pstPhotoCfg->vi_attr.stChnAttr.enPixelFormat == RK_FMT_YUV422SP)
    bUseVpss = true;
#endif

  return bUseVpss;
}

static void RKADK_PHOTO_ResetAttr(RKADK_PARAM_SENSOR_CFG_S *pstSensorCfg,
                                  RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg,
                                  VENC_CHN_ATTR_S *pstVencAttr,
                                  VI_CHN_ATTR_S *pstViAttr,
                                  VPSS_CHN_ATTR_S *pstVpssAttr) {
  pstVencAttr->stVencAttr.u32PicWidth = pstPhotoCfg->image_width;
  pstVencAttr->stVencAttr.u32PicHeight = pstPhotoCfg->image_height;
  pstVencAttr->stVencAttr.u32VirWidth = pstPhotoCfg->image_width;
  pstVencAttr->stVencAttr.u32VirHeight = pstPhotoCfg->image_height;

  pstViAttr->stIspOpt.stMaxSize.u32Width = pstSensorCfg->max_width;
  pstViAttr->stIspOpt.stMaxSize.u32Height = pstSensorCfg->max_height;
  pstViAttr->stSize.u32Width = pstPhotoCfg->image_width;
  pstViAttr->stSize.u32Height = pstPhotoCfg->image_height;

  pstVpssAttr->u32Width = pstPhotoCfg->image_width;
  pstVpssAttr->u32Height = pstPhotoCfg->image_height;
}

RKADK_S32 RKADK_PHOTO_Init(RKADK_PHOTO_ATTR_S *pstPhotoAttr, RKADK_MW_PTR *ppHandle) {
  int ret;
  bool bSysInit = false;
  char name[256];
  MPP_CHN_S stViChn, stVencChn, stSrcVpssChn, stDstVpssChn;
  VENC_CHN_ATTR_S stVencAttr;
  RKADK_PARAM_THUMB_CFG_S *ptsThumbCfg = NULL;
  RKADK_PARAM_SENSOR_CFG_S *pstSensorCfg = NULL;
  RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg = NULL;
  VPSS_GRP_ATTR_S stGrpAttr;
  VPSS_CHN_ATTR_S stChnAttr;
  RKADK_THUMB_MODULE_E enThumbModule = RKADK_THUMB_MODULE_PHOTO;
  RKADK_PHOTO_HANDLE_S *pHandle = NULL;

  RKADK_CHECK_POINTER(pstPhotoAttr, RKADK_FAILURE);
  RKADK_CHECK_CAMERAID(pstPhotoAttr->u32CamId, RKADK_FAILURE);

  if (*ppHandle) {
    RKADK_LOGE("Photo[%d] has been initialized", pstPhotoAttr->u32CamId);
    return -1;
  }

  RKADK_LOGI("Photo[%d] Init...", pstPhotoAttr->u32CamId);

  pHandle = (RKADK_PHOTO_HANDLE_S *)malloc(sizeof(RKADK_PHOTO_HANDLE_S));
  if (!pHandle) {
    RKADK_LOGE("malloc photo handle failed");
    return -1;
  }
  memset(pHandle, 0, sizeof(RKADK_PHOTO_HANDLE_S));

  pHandle->u32CamId = pstPhotoAttr->u32CamId;
  pHandle->pDataRecvFn = pstPhotoAttr->pfnPhotoDataProc;

  pstPhotoCfg = RKADK_PARAM_GetPhotoCfg(pstPhotoAttr->u32CamId);
  if (!pstPhotoCfg) {
    RKADK_LOGE("RKADK_PARAM_GetPhotoCfg failed");
    return -1;
  }

  ptsThumbCfg = RKADK_PARAM_GetThumbCfg(pstPhotoAttr->u32CamId);
  if (!ptsThumbCfg) {
    RKADK_LOGE("RKADK_PARAM_GetThumbCfg failed");
    return -1;
  }

  pstSensorCfg = RKADK_PARAM_GetSensorCfg(pstPhotoAttr->u32CamId);
  if (!pstSensorCfg) {
    RKADK_LOGE("RKADK_PARAM_GetSensorCfg failed");
    return -1;
  }

  bSysInit = RKADK_MPI_SYS_CHECK();
  if (!bSysInit) {
    RKADK_LOGE("System is not initialized");
    return -1;
  }

  RKADK_PHOTO_SetVideoChn(pstPhotoCfg, pstPhotoAttr->u32CamId, &stViChn, &stVencChn,
                     &stSrcVpssChn, &stDstVpssChn);
  RKADK_PHOTO_SetVencAttr(pstPhotoAttr->stThumbAttr, pstPhotoCfg,
                          pstSensorCfg, &stVencAttr);

  // Create VI
  pHandle->u32ViChn = pstPhotoCfg->vi_attr.u32ViChn;
  ret = RKADK_MPI_VI_Init(pstPhotoAttr->u32CamId, stViChn.s32ChnId,
                          &(pstPhotoCfg->vi_attr.stChnAttr));
  if (ret) {
    RKADK_LOGE("RKADK_MPI_VI_Init failed[%x]", ret);
    return ret;
  }

  pHandle->bUseVpss = RKADK_PHOTO_IsUseVpss(pstPhotoAttr->u32CamId, pstPhotoCfg);
  // Create VPSS
  if (pHandle->bUseVpss) {
    memset(&stGrpAttr, 0, sizeof(VPSS_GRP_ATTR_S));
    memset(&stChnAttr, 0, sizeof(VPSS_CHN_ATTR_S));

    stGrpAttr.u32MaxW = pstSensorCfg->max_width;
    stGrpAttr.u32MaxH = pstSensorCfg->max_height;
    stGrpAttr.enPixelFormat = pstPhotoCfg->vi_attr.stChnAttr.enPixelFormat;
    stGrpAttr.enCompressMode = COMPRESS_MODE_NONE;
    stGrpAttr.stFrameRate.s32SrcFrameRate = -1;
    stGrpAttr.stFrameRate.s32DstFrameRate = -1;
    stChnAttr.enChnMode = VPSS_CHN_MODE_USER;
    stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
    stChnAttr.enDynamicRange = DYNAMIC_RANGE_SDR8;
    stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
    stChnAttr.stFrameRate.s32SrcFrameRate = -1;
    stChnAttr.stFrameRate.s32DstFrameRate = -1;
    stChnAttr.u32Width = pstSensorCfg->max_width;
    stChnAttr.u32Height = pstSensorCfg->max_height;
    stChnAttr.u32Depth = 0;
    stChnAttr.u32FrameBufCnt = 1;

    ret = RKADK_MPI_VPSS_Init(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn,
                              &stGrpAttr, &stChnAttr);
    if (ret) {
      RKADK_LOGE("RKADK_MPI_VPSS_Init vpss_grp[%d] vpss_chn[%d] falied[%x]",
                  pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, ret);
      RKADK_MPI_VI_DeInit(pstPhotoAttr->u32CamId, pstPhotoCfg->vi_attr.u32ViChn);
      RKADK_MPI_VPSS_DeInit(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn);
      return ret;
    }

    ret = RK_MPI_VPSS_GetChnAttr(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, &stChnAttr);
    if (ret) {
      RKADK_LOGE("RK_MPI_VPSS_GetChnAttr vpss_grp[%d] vpss_chn[%d] falied[%x]",
                  pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, ret);
      RKADK_MPI_VI_DeInit(pstPhotoAttr->u32CamId, pstPhotoCfg->vi_attr.u32ViChn);
      RKADK_MPI_VPSS_DeInit(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn);
      return ret;
    }

    stChnAttr.u32Width = pstPhotoCfg->image_width;
    stChnAttr.u32Height = pstPhotoCfg->image_height;
    ret = RK_MPI_VPSS_SetChnAttr(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, &stChnAttr);
    if (ret) {
      RKADK_LOGE("RK_MPI_VPSS_SetChnAttr vpss_grp[%d] vpss_chn[%d] falied[%x]",
                  pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, ret);
      RKADK_MPI_VI_DeInit(pstPhotoAttr->u32CamId, pstPhotoCfg->vi_attr.u32ViChn);
      RKADK_MPI_VPSS_DeInit(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn);
      return ret;
    }
  }

  // Create VENC
  if (pstPhotoCfg->enable_combo) {
    RKADK_LOGE("Select combo mode");
    RKADK_PHOTO_CreateVencCombo(stVencChn.s32ChnId, &stVencAttr,
                                pstPhotoCfg);
  } else {
    ret = RK_MPI_VENC_CreateChn(stVencChn.s32ChnId, &stVencAttr);
    if (ret) {
      RKADK_LOGE("Create Venc failed[%x]", ret);
      goto failed;
    }

    VENC_CHN_REF_BUF_SHARE_S stVencChnRefBufShare;
    memset(&stVencChnRefBufShare, 0, sizeof(VENC_CHN_REF_BUF_SHARE_S));
    stVencChnRefBufShare.bEnable = RK_TRUE;
    RK_MPI_VENC_SetChnRefBufShareAttr(stVencChn.s32ChnId, &stVencChnRefBufShare);

    VENC_JPEG_PARAM_S stJpegParam;
    memset(&stJpegParam, 0, sizeof(VENC_JPEG_PARAM_S));
    stJpegParam.u32Qfactor = pstPhotoCfg->qfactor;
    RK_MPI_VENC_SetJpegParam(stVencChn.s32ChnId, &stJpegParam);

    // must, for no streams callback running failed
    VENC_RECV_PIC_PARAM_S stRecvParam;
    stRecvParam.s32RecvPicNum = 1;
    ret = RK_MPI_VENC_StartRecvFrame(stVencChn.s32ChnId, &stRecvParam);
    if (ret) {
      RKADK_LOGE("RK_MPI_VENC_StartRecvFrame failed[%x]", ret);
      goto failed;
    }
  }

  ret = ThumbnailInit(pstPhotoAttr->u32CamId, enThumbModule, ptsThumbCfg);
  if (ret) {
    RKADK_LOGI("Thumbnail venc [%d] Init fail [%d]",
                ptsThumbCfg->photo_venc_chn, ret);
    goto failed;
  }
#ifndef THUMB_NORMAL
  ThumbnailChnBind(stVencChn.s32ChnId, ptsThumbCfg->photo_venc_chn);
#endif

  //if use isp, set mirror/flip using aiq
  if (!pstSensorCfg->used_isp) {
    RKADK_STREAM_TYPE_E enStrmType = RKADK_STREAM_TYPE_SNAP;
    if (pstSensorCfg->mirror)
      RKADK_MEDIA_ToggleVencMirror(pstPhotoAttr->u32CamId, enStrmType, pstSensorCfg->mirror);
    if (pstSensorCfg->flip)
      RKADK_MEDIA_ToggleVencFlip(pstPhotoAttr->u32CamId, enStrmType, pstSensorCfg->flip);
  }

  if (pHandle->bUseVpss) {
    // VPSS Bind VENC
    ret = RKADK_MPI_SYS_Bind(&stSrcVpssChn, &stVencChn);
    if (ret) {
      RKADK_LOGE("Bind VPSS[%d] to VENC[%d] failed[%x]", stSrcVpssChn.s32ChnId,
                 stVencChn.s32ChnId, ret);
      goto failed;
    }

    // VI Bind VPSS
    ret = RKADK_MPI_SYS_Bind(&stViChn, &stDstVpssChn);
    if (ret) {
      RKADK_LOGE("Bind VI[%d] to VPSS[%d] failed[%x]", stViChn.s32ChnId,
                 stDstVpssChn.s32DevId, ret);
      RKADK_MPI_SYS_UnBind(&stSrcVpssChn, &stVencChn);
      goto failed;
    }
  } else {
    // VI Bind VENC
    if (!pstPhotoCfg->enable_combo) {
      ret = RKADK_MPI_SYS_Bind(&stViChn, &stVencChn);
      if (ret) {
        RKADK_LOGE("Bind VI[%d] to VENC[%d] failed[%x]", stViChn.s32ChnId,
                    stVencChn.s32ChnId, ret);
        goto failed;
      }
    }
  }

  pHandle->bGetJpeg = true;
  ret = pthread_create(&pHandle->tid, NULL, RKADK_PHOTO_GetJpeg, pHandle);
  if (ret) {
    RKADK_LOGE("Create get jpg(%d) thread failed [%d]", pstPhotoAttr->u32CamId,
               ret);
    goto failed;
  }
  snprintf(name, sizeof(name), "PhotoGetJpeg_%d", stVencChn.s32ChnId);
  pthread_setname_np(pHandle->tid, name);

  *ppHandle = (RKADK_MW_PTR)pHandle;
  RKADK_LOGI("Photo[%d] Init End...", pstPhotoAttr->u32CamId);
  return 0;

failed:
  RKADK_LOGE("failed");
  RK_MPI_VENC_DestroyChn(stVencChn.s32ChnId);

  pHandle->bGetJpeg = false;
  if (pHandle->tid) {
    ret = pthread_join(pHandle->tid, NULL);
    if (ret)
      RKADK_LOGE("Exit get jpeg thread failed!");
    pHandle->tid = 0;
  }

  if (pHandle->bUseVpss)
    RKADK_MPI_VPSS_DeInit(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn);

  RKADK_MPI_VI_DeInit(pstPhotoAttr->u32CamId, stViChn.s32ChnId);

  if (pHandle)
    free(pHandle);

  return ret;
}

RKADK_S32 RKADK_PHOTO_DeInit(RKADK_MW_PTR pHandle) {
  int ret;
  MPP_CHN_S stViChn, stVencChn, stSrcVpssChn, stDstVpssChn;
  RKADK_PHOTO_HANDLE_S *pstHandle;

  RKADK_CHECK_POINTER(pHandle, RKADK_FAILURE);
  pstHandle = (RKADK_PHOTO_HANDLE_S *)pHandle;
  RKADK_CHECK_CAMERAID(pstHandle->u32CamId, RKADK_FAILURE);

  RKADK_LOGI("Photo[%d] DeInit...", pstHandle->u32CamId);

  RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg =
      RKADK_PARAM_GetPhotoCfg(pstHandle->u32CamId);
  if (!pstPhotoCfg) {
    RKADK_LOGE("RKADK_PARAM_GetPhotoCfg failed");
    return -1;
  }

  RKADK_PARAM_THUMB_CFG_S *ptsThumbCfg =
      RKADK_PARAM_GetThumbCfg(pstHandle->u32CamId);
  if (!ptsThumbCfg) {
    RKADK_LOGE("RKADK_PARAM_GetThumbCfg failed");
    return -1;
  }

  RKADK_PHOTO_SetVideoChn(pstPhotoCfg, pstHandle->u32CamId, &stViChn, &stVencChn,
                     &stSrcVpssChn, &stDstVpssChn);
  stViChn.s32ChnId = pstHandle->u32ViChn;

  ThumbnailDeInit(pstHandle->u32CamId, RKADK_THUMB_MODULE_PHOTO,
                  ptsThumbCfg);

  pstHandle->bGetJpeg = false;

#if 1
  // The current version cannot be forced to exit
  ret = RK_MPI_VENC_StopRecvFrame(stVencChn.s32ChnId);
  if (ret) {
    RKADK_LOGE("StopRecvFrame VENC[%d] failed[%d]", stVencChn.s32ChnId, ret);
    return ret;
  }
#else
  VENC_RECV_PIC_PARAM_S stRecvParam;
  stRecvParam.s32RecvPicNum = 1;
  ret = RK_MPI_VENC_StartRecvFrame(stVencChn.s32ChnId, &stRecvParam);
  if (ret) {
    RKADK_LOGE("RK_MPI_VENC_StartRecvFrame failed[%x]", ret);
    return ret;
  }
#endif

  if (pstHandle->tid) {
    ret = pthread_join(pstHandle->tid, NULL);
    if (ret)
      RKADK_LOGE("Exit get jpeg thread failed!");
    pstHandle->tid = 0;
  }

  if (pstHandle->bUseVpss) {
    // VPSS UnBind VENC
    ret = RKADK_MPI_SYS_UnBind(&stSrcVpssChn, &stVencChn);
    if (ret) {
      RKADK_LOGE("UnBind VPSS[%d] to VENC[%d] failed[%d]", stSrcVpssChn.s32ChnId,
                 stVencChn.s32ChnId, ret);
      return ret;
    }

    // VI UnBind VPSS
    ret = RKADK_MPI_SYS_UnBind(&stViChn, &stDstVpssChn);
    if (ret) {
      RKADK_LOGE("UnBind VI[%d] to VPSS[%d] failed[%d]", stViChn.s32ChnId,
                 stSrcVpssChn.s32ChnId, ret);
      return ret;
    }
  } else {
    if (!pstPhotoCfg->enable_combo) {
      // VI UnBind VENC
      ret = RKADK_MPI_SYS_UnBind(&stViChn, &stVencChn);
      if (ret) {
        RKADK_LOGE("UnBind VI[%d] to VENC[%d] failed[%d]", stViChn.s32ChnId,
                  stVencChn.s32ChnId, ret);
        return ret;
      }
    }
  }

  // Destory VENC
  ret = RK_MPI_VENC_DestroyChn(stVencChn.s32ChnId);
  if (ret) {
    RKADK_LOGE("Destory VENC[%d] failed[%d]", stVencChn.s32ChnId, ret);
    return ret;
  }

  // Destory VPSS
  if (pstHandle->bUseVpss) {
    ret = RKADK_MPI_VPSS_DeInit(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn);
    if (ret) {
      RKADK_LOGE("DeInit VPSS[%d] failed[%d]", pstPhotoCfg->vpss_chn, ret);
      return ret;
    }
  }

  // Destory VI
  ret = RKADK_MPI_VI_DeInit(pstHandle->u32CamId, stViChn.s32ChnId);
  if (ret) {
    RKADK_LOGE("RKADK_MPI_VI_DeInit failed[%d]", ret);
    return ret;
  }

  pstHandle->pDataRecvFn = NULL;
  RKADK_LOGI("Photo[%d] DeInit End...", pstHandle->u32CamId);

  if (pHandle) {
    free(pHandle);
    pHandle = NULL;
  }

  return 0;
}

RKADK_S32 RKADK_PHOTO_TakePhoto(RKADK_MW_PTR pHandle, RKADK_TAKE_PHOTO_ATTR_S *pstAttr) {
  VENC_RECV_PIC_PARAM_S stRecvParam;
  RKADK_PHOTO_HANDLE_S *pstHandle;
  int ret = 0;

  RKADK_CHECK_POINTER(pHandle, RKADK_FAILURE);
  pstHandle = (RKADK_PHOTO_HANDLE_S *)pHandle;
  RKADK_CHECK_CAMERAID(pstHandle->u32CamId, RKADK_FAILURE);

  RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg =
      RKADK_PARAM_GetPhotoCfg(pstHandle->u32CamId);
  if (!pstPhotoCfg) {
    RKADK_LOGE("RKADK_PARAM_GetPhotoCfg failed");
    return -1;
  }

  if (pstAttr->enPhotoType == RKADK_PHOTO_TYPE_LAPSE) {
    // TODO
    RKADK_LOGI("nonsupport photo type = %d", pstAttr->enPhotoType);
    return -1;
  }

  memset(&stRecvParam, 0, sizeof(VENC_RECV_PIC_PARAM_S));
  if (pstAttr->enPhotoType == RKADK_PHOTO_TYPE_SINGLE)
    stRecvParam.s32RecvPicNum = 1;
  else
    stRecvParam.s32RecvPicNum = pstAttr->unPhotoTypeAttr.stMultipleAttr.s32Count;

  pstHandle->u32PhotoCnt = stRecvParam.s32RecvPicNum;
  RKADK_LOGI("Photo[%d] Take photo number = %d", pstHandle->u32CamId, pstHandle->u32PhotoCnt);

#ifndef THUMB_NORMAL
  ret = RK_MPI_VENC_StartRecvFrame(pstPhotoCfg->venc_chn, &stRecvParam);
#else
  RKADK_PARAM_THUMB_CFG_S *ptsThumbCfg = RKADK_PARAM_GetThumbCfg(pstHandle->u32CamId);
  if (!ptsThumbCfg) {
    RKADK_LOGE("RKADK_PARAM_GetThumbCfg failed");
    return -1;
  }
  ret = RK_MPI_VENC_StartRecvFrame(pstPhotoCfg->venc_chn, &stRecvParam);
  ret |= RK_MPI_VENC_StartRecvFrame(ptsThumbCfg->photo_venc_chn, &stRecvParam);
  if(ret) {
    RKADK_LOGE("Take photo failed [%x]", ret);
    return ret;
  }
#endif

  return ret;
}

RKADK_S32 RKADK_PHOTO_Reset(RKADK_MW_PTR *pHandle) {
  int ret;
  bool bPhoto;
  RKADK_PARAM_PHOTO_CFG_S *pstPhotoCfg = NULL;
  RKADK_PARAM_SENSOR_CFG_S *pstSensorCfg = NULL;
  MPP_CHN_S stViChn, stVencChn, stSrcVpssChn, stDstVpssChn;
  VENC_CHN_ATTR_S stVencAttr;
  VI_CHN_ATTR_S stViAttr;
  VPSS_CHN_ATTR_S stVpssAttr;
  RKADK_PHOTO_HANDLE_S *pstHandle;

  RKADK_CHECK_POINTER(*pHandle, RKADK_FAILURE);
  pstHandle = (RKADK_PHOTO_HANDLE_S *)*pHandle;
  RKADK_CHECK_CAMERAID(pstHandle->u32CamId, RKADK_FAILURE);

#ifndef RV1106_1103
  RKADK_LOGE("rv1126/1109 nonsupport dynamic setting resolution, please recreate!");
  return -1;
#endif

  RKADK_LOGI("Photo[%d] Reset start...", pstHandle->u32CamId);

  pstPhotoCfg = RKADK_PARAM_GetPhotoCfg(pstHandle->u32CamId);
  if (!pstPhotoCfg) {
    RKADK_LOGE("RKADK_PARAM_GetPhotoCfg failed");
    return -1;
  }

  pstSensorCfg = RKADK_PARAM_GetSensorCfg(pstHandle->u32CamId);
  if (!pstSensorCfg) {
    RKADK_LOGE("RKADK_PARAM_GetSensorCfg failed");
    return -1;
  }

  if (pstPhotoCfg->enable_combo) {
    RKADK_LOGE("Photo combo venc [%d], not support reset",
                pstPhotoCfg->combo_venc_chn);
    return -1;
  }

  RKADK_PHOTO_SetVideoChn(pstPhotoCfg, pstHandle->u32CamId, &stViChn, &stVencChn,
                     &stSrcVpssChn, &stDstVpssChn);
  stViChn.s32ChnId = pstHandle->u32ViChn;

  memset(&stVencAttr, 0, sizeof(VENC_CHN_ATTR_S));
  memset(&stViAttr, 0, sizeof(VI_CHN_ATTR_S));
  memset(&stVpssAttr, 0, sizeof(VPSS_CHN_ATTR_S));

  ret = RK_MPI_VI_GetChnAttr(pstHandle->u32CamId, stViChn.s32ChnId, &stViAttr);
  if (ret != RK_SUCCESS) {
    RKADK_LOGE("Photo get vi[%d] attr failed[%x]", stViChn.s32ChnId, ret);
    return -1;
  }

  ret = RK_MPI_VENC_GetChnAttr(stVencChn.s32ChnId, &stVencAttr);
  if (ret != RK_SUCCESS) {
    RKADK_LOGE("Photo get venc[%d] attr failed[%x]", stVencChn.s32ChnId, ret);
    return -1;
  }

  if (pstHandle->bUseVpss) {
    ret = RK_MPI_VPSS_GetChnAttr(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, &stVpssAttr);
    if (ret) {
      RKADK_LOGE("Photo get vpss grp[%d] chn[%d] attr failed[%x]",
                  pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, ret);
      return -1;
    }
  }

  bPhoto = RKADK_MEDIA_CompareResolution(&stVencAttr,
                                  pstPhotoCfg->image_width,
                                  pstPhotoCfg->image_height);
  if (!bPhoto) {
    RKADK_LOGE("Photo dose not reset venc attr");
    return -1;
  }

  RKADK_PHOTO_ResetAttr(pstSensorCfg, pstPhotoCfg,
                        &stVencAttr, &stViAttr, &stVpssAttr);

  if (pstHandle->bUseVpss) {
    // VPSS UnBind VENC
    ret = RKADK_MPI_SYS_UnBind(&stSrcVpssChn, &stVencChn);
    if (ret) {
      RKADK_LOGE("UnBind VPSS[%d] to VENC[%d] failed[%x]", stSrcVpssChn.s32ChnId,
                 stVencChn.s32ChnId, ret);
      return -1;
    }
  } else {
    ret = RKADK_MPI_SYS_UnBind(&stViChn, &stVencChn);
    if (ret != RK_SUCCESS) {
      RKADK_LOGE("Photo VI UnBind VENC [%d %d]fail %x", stViChn.s32ChnId,
                  stVencChn.s32ChnId, ret);
      return -1;
    }
  }

  ret = RK_MPI_VENC_SetChnAttr(stVencChn.s32ChnId, &stVencAttr);
  if (ret != RK_SUCCESS) {
    RKADK_LOGE("Photo set venc[%d] attr failed %x",
                stVencChn.s32ChnId, ret);
    return -1;
  }

  if (pstHandle->bUseVpss) {
    ret = RK_MPI_VPSS_SetChnAttr(pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, &stVpssAttr);
    if (ret) {
      RKADK_LOGE("Photo set vpss grp[%d] chn[%d] attr falied[%x]",
                  pstPhotoCfg->vpss_grp, pstPhotoCfg->vpss_chn, ret);
      return -1;
    }

    ret = RKADK_MPI_SYS_Bind(&stSrcVpssChn, &stVencChn);
    if (ret) {
      RKADK_LOGE("Photo VPSS[%d] Bind VENC[%d] failed[%x]", stSrcVpssChn.s32ChnId,
                 stVencChn.s32ChnId, ret);
      return -1;
    }
  } else {
    ret = RK_MPI_VI_SetChnAttr(pstHandle->u32CamId, stViChn.s32ChnId,
                              &stViAttr);
    if (ret != RK_SUCCESS) {
      RKADK_LOGE("Photo set VI[%d] attr failed %x", stViChn.s32ChnId, ret);
      return -1;
    }

    ret = RKADK_MPI_SYS_Bind(&stViChn, &stVencChn);
    if (ret != RK_SUCCESS) {
      RKADK_LOGE("Photo VI Bind VENC [%d %d] fail %x",stViChn.s32ChnId,
                  stVencChn.s32ChnId, ret);
      return -1;
    }
  }

  RKADK_LOGI("Photo[%d] Reset end...", pstHandle->u32CamId);
  return 0;
}

RKADK_S32 RKADK_PHOTO_GetJpgResolution(RKADK_CHAR *pcFileName, RKADK_PHOTO_DATA_ATTR_S *pstDataAttr) {
  RKADK_U32 cur = 0;

  if (pstDataAttr->pu8Buf[0] != 0xFF || pstDataAttr->pu8Buf[1] != 0xD8) {
    RKADK_LOGD("Invalid jpeg data");
    return -1;
  }

  cur += 2;
  while(cur + 4 + 4 < pstDataAttr->u32BufSize) {
    if (pstDataAttr->pu8Buf[cur] != 0xFF) {
      RKADK_LOGE("Bad Jpg file, 0xFF expected at offset 0x%x", cur);
      break;
    }

    if (pstDataAttr->pu8Buf[cur + 1] == 0xC0 || pstDataAttr->pu8Buf[cur + 1] == 0xC2) {
      cur += 5;
      pstDataAttr->u32Height = bswap_16(*(RKADK_U16 *) (pstDataAttr->pu8Buf + cur));
      cur += 2;
      pstDataAttr->u32Width = bswap_16(*(RKADK_U16 *) (pstDataAttr->pu8Buf + cur));
      RKADK_LOGD("%s w*h[%d, %d]", pcFileName, pstDataAttr->u32Width, pstDataAttr->u32Height);
      return 0;
    }

    cur += 2;
    cur += bswap_16(*(RKADK_U16 *) (pstDataAttr->pu8Buf + cur));
  }

  return -1;
}

#ifndef RV1106_1103
static RKADK_S32 RKADK_PHOTO_VdecFree(void *opaque) {
  RKADK_LOGD("vdec free: %p", opaque);
  if (opaque) {
    free(opaque);
    opaque = NULL;
  }
  return 0;
}
#endif

static RKADK_S32 RKADK_PHOTO_JpgDecode(RKADK_THUMB_ATTR_S *pstSrcThmAttr,
                                       RKADK_THUMB_ATTR_S *pstDstThmAttr, bool *bFree,
                                       RKADK_S32 s32VdecChnID, RKADK_S32 s32VpssGrp,
                                       RKADK_S32 s32VpssChn) {
#ifndef RV1106_1103
  int ret = 0, deinitRet = 0;
  VDEC_CHN_ATTR_S stAttr;
  VDEC_CHN_PARAM_S stVdecParam;
  MB_BLK jpgMbBlk = RK_NULL;
  MB_EXT_CONFIG_S stMbExtConfig;
  VDEC_STREAM_S stStream;
  VIDEO_FRAME_INFO_S sFrame = {0};
  RK_U8 *pVdecData = RK_NULL;
  RK_U64 VdecDataLen = 0;
  VPSS_GRP_ATTR_S stGrpAttr;
  VPSS_CHN_ATTR_S stChnAttr;
  MPP_CHN_S stVdecChn, stVpssChn;
  RKADK_U32 u32MaxW, u32MaxH;

  if (pstSrcThmAttr->pu8Buf[0] != 0xFF || pstSrcThmAttr->pu8Buf[1] != 0xD8) {
    RKADK_LOGD("Invalid jpeg thumbnail data");
    *bFree = true;
    return -1;
  }

  memset(&stAttr, 0, sizeof(VDEC_CHN_ATTR_S));
  memset(&stVdecParam, 0, sizeof(VDEC_CHN_PARAM_S));
  memset(&stMbExtConfig, 0, sizeof(MB_EXT_CONFIG_S));
  memset(&stStream, 0, sizeof(VDEC_STREAM_S));

  stVdecChn.enModId = RK_ID_VDEC;
  stVdecChn.s32DevId = 0;
  stVdecChn.s32ChnId = s32VdecChnID;

  stVpssChn.enModId = RK_ID_VPSS;
  stVpssChn.s32DevId = s32VpssGrp;
  stVpssChn.s32ChnId = s32VpssChn;

  stAttr.enMode = VIDEO_MODE_FRAME;
  stAttr.enType = RK_VIDEO_ID_JPEG;
  stAttr.u32PicWidth = pstSrcThmAttr->u32Width;
  stAttr.u32PicHeight = pstSrcThmAttr->u32Height;
  stAttr.u32FrameBufCnt = 3;
  stAttr.u32StreamBufCnt = 2;
  ret = RK_MPI_VDEC_CreateChn(s32VdecChnID, &stAttr);
  if (ret != RK_SUCCESS) {
    RK_LOGE("create vdec[%d] failed[%x]", s32VdecChnID, ret);
    *bFree = true;
    return ret;
  }

  stVdecParam.enType = RK_VIDEO_ID_JPEG;
  stVdecParam.stVdecPictureParam.enPixelFormat = RK_FMT_YUV420SP;
  ret = RK_MPI_VDEC_SetChnParam(s32VdecChnID, &stVdecParam);
  if (ret != RK_SUCCESS) {
    RK_LOGE("set vdec chn[%d] param failed[%x]", s32VdecChnID, ret);
    *bFree = true;
    goto exit;
  }

  //Create VPSS
  memset(&stGrpAttr, 0, sizeof(VPSS_GRP_ATTR_S));
  memset(&stChnAttr, 0, sizeof(VPSS_CHN_ATTR_S));

  u32MaxW = pstSrcThmAttr->u32Width > pstDstThmAttr->u32Width ?
    pstSrcThmAttr->u32Width : pstDstThmAttr->u32Width;
  u32MaxH = pstSrcThmAttr->u32Height > pstDstThmAttr->u32Height ?
    pstSrcThmAttr->u32Height : pstDstThmAttr->u32Height;

  stGrpAttr.u32MaxW = u32MaxW;
  stGrpAttr.u32MaxH = u32MaxH;
  stGrpAttr.enPixelFormat = RK_FMT_YUV420SP;;
  stGrpAttr.enCompressMode = COMPRESS_MODE_NONE;
  stGrpAttr.stFrameRate.s32SrcFrameRate = -1;
  stGrpAttr.stFrameRate.s32DstFrameRate = -1;
  stChnAttr.enChnMode = VPSS_CHN_MODE_USER;
  stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
  stChnAttr.enDynamicRange = DYNAMIC_RANGE_SDR8;
  stChnAttr.enPixelFormat = ThumbToRKPixFmt(pstDstThmAttr->enType);
  stChnAttr.stFrameRate.s32SrcFrameRate = -1;
  stChnAttr.stFrameRate.s32DstFrameRate = -1;
  stChnAttr.u32Width = pstDstThmAttr->u32Width;
  stChnAttr.u32Height = pstDstThmAttr->u32Height;
  stChnAttr.u32Depth = 1;

  ret = RKADK_MPI_VPSS_Init(stVpssChn.s32DevId, stVpssChn.s32ChnId,
                            &stGrpAttr, &stChnAttr);
  if (ret) {
    RKADK_LOGE("RKADK_MPI_VPSS_Init vpss_grp[%d] vpss_chn[%d] falied[%x]",
                stVpssChn.s32DevId, stVpssChn.s32ChnId, ret);
    *bFree = true;
    goto exit;
  }

  //vdec bind vpss
  ret = RK_MPI_SYS_Bind(&stVdecChn, &stVpssChn);
  if (ret) {
    RKADK_LOGE("Bind VDEC[%d] to VPSS[%d, %d] failed[%x]", s32VdecChnID,
               stVpssChn.s32DevId, stVpssChn.s32ChnId, ret);
    *bFree = true;
    goto exit;
  }

  //decode
  ret = RK_MPI_VDEC_StartRecvStream(s32VdecChnID);
  if (ret != RK_SUCCESS) {
    RK_LOGE("start recv vdec[%d] failed[%x]", s32VdecChnID, ret);
    *bFree = true;
    goto exit;
  }

  stMbExtConfig.pFreeCB = RKADK_PHOTO_VdecFree;
  stMbExtConfig.pOpaque = pstSrcThmAttr->pu8Buf;
  stMbExtConfig.pu8VirAddr = pstSrcThmAttr->pu8Buf;
  stMbExtConfig.u64Size = pstSrcThmAttr->u32BufSize;
  ret = RK_MPI_SYS_CreateMB(&jpgMbBlk, &stMbExtConfig);
  if (ret) {
    RKADK_LOGE("Create vdec[%d] MB failed[%d]", s32VdecChnID, ret);
    *bFree = true;
    goto exit;
  }

  stStream.u64PTS = 0;
  stStream.pMbBlk = jpgMbBlk;
  stStream.u32Len = pstSrcThmAttr->u32BufSize;
  stStream.bEndOfStream = RK_TRUE;
  stStream.bEndOfFrame = RK_TRUE;
  stStream.bBypassMbBlk = RK_TRUE;
  ret = RK_MPI_VDEC_SendStream(s32VdecChnID, &stStream, -1);
  if(ret) {
    RKADK_LOGE("Send vdec[%d] stream failed[%d]", s32VdecChnID, ret);
    goto exit;
  }

  //get decode frame
  memset(&sFrame, 0, sizeof(VIDEO_FRAME_INFO_S));
  ret = RK_MPI_VPSS_GetChnFrame(stVpssChn.s32DevId, stVpssChn.s32ChnId, &sFrame, -1);
  if(ret) {
    RKADK_LOGE("Get vpss[%d] frame failed[%d]", s32VdecChnID, ret);
    goto exit;
  }

  pVdecData = (RK_U8 *)RK_MPI_MB_Handle2VirAddr(sFrame.stVFrame.pMbBlk);
  VdecDataLen = RK_MPI_MB_GetSize(sFrame.stVFrame.pMbBlk);
  RKADK_LOGD("vdec data[%p, %lld], w*h[%d, %d]", pVdecData, VdecDataLen, sFrame.stVFrame.u32Width, sFrame.stVFrame.u32Height);
  RK_MPI_SYS_MmzFlushCache(sFrame.stVFrame.pMbBlk, RK_TRUE);

  if (!pstDstThmAttr->pu8Buf) {
    pstDstThmAttr->pu8Buf = (RKADK_U8 *)malloc(VdecDataLen);
    if (!pstDstThmAttr->pu8Buf) {
      RKADK_LOGE("malloc thumbnail buffer failed, VdecDataLen: %lld", VdecDataLen);
      ret = -1;
      goto exit;
    }
    RKADK_LOGD("malloc thumbnail buffer[%p, %lld]", pstDstThmAttr->pu8Buf, VdecDataLen);

    pstDstThmAttr->u32BufSize = (RKADK_U32)VdecDataLen;
  } else {
    if (pstDstThmAttr->u32BufSize < VdecDataLen)
      RKADK_LOGW("buffer size[%d] < thm data size[%lld]",
                 pstDstThmAttr->u32BufSize, VdecDataLen);
    else
      pstDstThmAttr->u32BufSize = VdecDataLen;
  }

  memcpy(pstDstThmAttr->pu8Buf, pVdecData, pstDstThmAttr->u32BufSize);
  RK_MPI_VPSS_ReleaseChnFrame(stVpssChn.s32DevId, stVpssChn.s32ChnId, &sFrame);

exit:
  deinitRet = RK_MPI_SYS_UnBind(&stVdecChn, &stVpssChn);
  if (deinitRet)
    RKADK_LOGE("UnBind VDEC[%d] to VPSS[%d, %d] failed[%x]", s32VdecChnID,
               stVpssChn.s32DevId, stVpssChn.s32ChnId, ret);

  deinitRet = RKADK_MPI_VPSS_DeInit(stVpssChn.s32DevId, stVpssChn.s32ChnId);
  if (deinitRet)
    RKADK_LOGE("RKADK_MPI_VPSS_DeInit[%d, %d] failed[%d]", stVpssChn.s32DevId, stVpssChn.s32ChnId, deinitRet);

  RK_MPI_VDEC_StopRecvStream(s32VdecChnID);
  deinitRet = RK_MPI_VDEC_DestroyChn(s32VdecChnID);
  if (deinitRet)
    RKADK_LOGE("RK_MPI_VDEC_DestroyChn[%d] failed[%d]", s32VdecChnID, deinitRet);

  if(jpgMbBlk)
    RK_MPI_MB_ReleaseMB(jpgMbBlk);

  return ret;
#else
  RKADK_LOGI("Chip nonsupport vdec");
  *bFree = true;
  return -1;
#endif
}

static RKADK_S32 RKADK_PHOTO_BuildInThm(FILE *fd,
                                        RKADK_THUMB_ATTR_S *pstThumbAttr) {

  char tag[JPG_THUMB_TAG_LEN];
  RKADK_U32 u32Size, u32totalSize;

  // offset: 4btye tag
  if (fseek(fd, -JPG_THUMB_TAG_LEN, SEEK_END)) {
    RKADK_LOGE("seek file failed");
    return -1;
  }

  // read thm tag
  if (fread(tag, JPG_THUMB_TAG_LEN, 1, fd) != 1) {
    RKADK_LOGE("read jpg thumb tag failed");
    return -1;
  }

  if (tag[0] == 't' || tag[1] == 'h' || tag[2] == 'm') {
    RKADK_LOGD("already exist thm[%d] tag, cover", tag[3]);

    // offset: 4btye tag + 4btye size
    if (fseek(fd, -(JPG_THUMB_TAG_LEN + 4), SEEK_CUR)) {
      RKADK_LOGE("seek file failed");
      return -1;
    }

    // read thm size
    if (fread(&u32Size, 4, 1, fd) != 1) {
      RKADK_LOGE("read jpg thumb tag failed");
      return -1;
    }

    u32totalSize = pstThumbAttr->u32BufSize + 16;
    if (u32totalSize < u32Size)
      u32Size = u32totalSize;

    // offset: thm data size + 4byte thm size
    if (fseek(fd, -(u32Size + 4), SEEK_CUR)) {
      RKADK_LOGE("seek file failed");
      return -1;
    }
  }

  if (fwrite(pstThumbAttr->pu8Buf, pstThumbAttr->u32BufSize, 1, fd) != 1) {
    RKADK_LOGE("write thm data failed");
    return -1;
  }

  if (fwrite((char *)&pstThumbAttr->u32Width, 4, 1, fd) != 1) {
    RKADK_LOGE("write thm width failed");
    return -1;
  }

  if (fwrite((char *)&pstThumbAttr->u32Height, 4, 1, fd) != 1) {
    RKADK_LOGE("write thm height failed");
    return -1;
  }

  if (fwrite((char *)&pstThumbAttr->u32VirWidth, 4, 1, fd) != 1) {
    RKADK_LOGE("write thm virtual width failed");
    return -1;
  }

  if (fwrite((char *)&pstThumbAttr->u32VirHeight, 4, 1, fd) != 1) {
    RKADK_LOGE("write thm virtual height failed");
    return -1;
  }

  // 16: 4bytes width + 4bytes height + 4bytes VirWidth + 4bytes VirHeight
  u32Size = pstThumbAttr->u32BufSize + 16;
  if (fwrite((char *)&u32Size, sizeof(RKADK_U32), 1, fd) != 1) {
    RKADK_LOGE("write thm len failed");
    return -1;
  }

  tag[0] = 't';
  tag[1] = 'h';
  tag[2] = 'm';
  tag[3] = pstThumbAttr->enType;

  if (fwrite(tag, JPG_THUMB_TAG_LEN, 1, fd) != 1) {
    RKADK_LOGE("write thm tag failed");
    return -1;
  }

  RKADK_LOGD("done");
  return 0;
}

static RKADK_S32 RKADK_PHOTO_GetThmInFile(FILE *fd,
                                          RKADK_THUMB_ATTR_S *pstThumbAttr) {
  int ret = -1;
  bool bMallocBuf = false;
  char tag[JPG_THUMB_TAG_LEN];
  RKADK_U32 u32Size = 0;

  if (pstThumbAttr->enType == RKADK_THUMB_TYPE_JPEG)
    return -1;

  // seek to file end
  if (fseek(fd, 0, SEEK_END)) {
    RKADK_LOGE("seek file end failed");
    return -1;
  }

  if (!pstThumbAttr->pu8Buf)
    bMallocBuf = true;

  while (1) {
    // offset: 4btye tag
    if (fseek(fd, -JPG_THUMB_TAG_LEN, SEEK_CUR)) {
      RKADK_LOGE("seek file failed");
      break;
    }

    // read thm tag
    if (fread(tag, JPG_THUMB_TAG_LEN, 1, fd) != 1) {
      RKADK_LOGE("read jpg thumb tag failed");
      break;
    }

    if (tag[2] == 0xFF && tag[3] == 0xD9) {
      RKADK_LOGD("read jpg EOF tag(0xFFD9)");
      break;
    }

    if (tag[0] != 't' || tag[1] != 'h' || tag[2] != 'm') {
      RKADK_LOGD("can't read thm[%d] tag", pstThumbAttr->enType);
      break;
    }

    RKADK_LOGD("tag[0] = %d, %c", tag[0], tag[0]);
    RKADK_LOGD("tag[1] = %d, %c", tag[1], tag[1]);
    RKADK_LOGD("tag[2] = %d, %c", tag[2], tag[2]);
    RKADK_LOGD("tag[3] = %d", tag[3]);
    RKADK_LOGD("pstThumbAttr->enType = %d", pstThumbAttr->enType);

    // offset: 4btye tag + 4btye size
    if (fseek(fd, -(JPG_THUMB_TAG_LEN + 4), SEEK_CUR)) {
      RKADK_LOGE("seek file failed");
      break;
    }

    // read thm size
    if (fread(&u32Size, 4, 1, fd) != 1) {
      RKADK_LOGE("read jpg thumb tag failed");
      break;
    }
    RKADK_LOGD("u32Size = %d", u32Size);

    if (tag[3] == pstThumbAttr->enType) {
      // 16: 4bytes width + 4bytes height + 4bytes VirWidth + 4bytes VirHeight
      RKADK_U32 u32DataLen = u32Size - 16;

      // offset: thm data size + 4byte thm size
      if (fseek(fd, -(u32Size + 4), SEEK_CUR)) {
        RKADK_LOGE("seek file failed");
        break;
      }

      if (bMallocBuf) {
        pstThumbAttr->pu8Buf = (RKADK_U8 *)malloc(u32DataLen);
        if (!pstThumbAttr->pu8Buf) {
          RKADK_LOGE("malloc thumbnail buffer[%d] failed", u32DataLen);
          break;
        }
        RKADK_LOGD("malloc thumbnail buffer[%p], u32DataLen[%d]",
                   pstThumbAttr->pu8Buf, u32DataLen);

        pstThumbAttr->u32BufSize = u32DataLen;
      } else {
        if (u32DataLen > pstThumbAttr->u32BufSize)
          RKADK_LOGW("buffer size[%d] < thumbnail data len[%d]",
                     pstThumbAttr->u32BufSize, u32DataLen);
        else
          pstThumbAttr->u32BufSize = u32DataLen;
      }

      // read thm data
      if (fread(pstThumbAttr->pu8Buf, pstThumbAttr->u32BufSize, 1, fd) != 1) {
        RKADK_LOGE("read jpg thumb data failed");
        break;
      }

      // seek the remain data
      if (u32DataLen > pstThumbAttr->u32BufSize) {
        if (fseek(fd, u32DataLen - pstThumbAttr->u32BufSize, SEEK_CUR)) {
          RKADK_LOGE("seek remain data failed");
          break;
        }
      }

      if (fread(&(pstThumbAttr->u32Width), 4, 1, fd) != 1) {
        RKADK_LOGE("read jpg thumb width failed");
        break;
      }

      if (fread(&(pstThumbAttr->u32Height), 4, 1, fd) != 1) {
        RKADK_LOGE("read jpg thumb height failed");
        break;
      }

      if (fread(&(pstThumbAttr->u32VirWidth), 4, 1, fd) != 1) {
        RKADK_LOGE("read jpg thumb virtual width failed");
        break;
      }

      if (fread(&(pstThumbAttr->u32VirHeight), 4, 1, fd) != 1) {
        RKADK_LOGE("read jpg thumb virtual height failed");
        break;
      }

      ret = 0;
      RKADK_LOGD("[%d, %d, %d, %d]", pstThumbAttr->u32Width,
                 pstThumbAttr->u32Height, pstThumbAttr->u32VirWidth,
                 pstThumbAttr->u32VirHeight);
      RKADK_LOGD("done");
      break;
    } else {
      if (fseek(fd, -(u32Size + 4), SEEK_CUR)) {
        RKADK_LOGE("seek failed");
        break;
      }
    }
  }

  if (ret) {
    if (fseek(fd, 0, SEEK_SET)) {
      RKADK_LOGE("seek jpg file header failed");
      ret = 0;
    }

    if (bMallocBuf)
      RKADK_PHOTO_ThumbBufFree(pstThumbAttr);
  }

  return ret;
}

static RKADK_S32 RKADK_PHOTO_GetJpgThm(FILE *fd, RKADK_CHAR *pszFileName,
                                   RKADK_THUMB_ATTR_S *pstThumbAttr) {
  int ret = -1, i;
  RKADK_U16 u16ExifLen;
  RKADK_U8 *pFile;
  RKADK_S64 len = 0, cur = 0, exif_end = 0;

  if (fseek(fd, 0, SEEK_END) || (len = ftell(fd)) == -1 ||
      fseek(fd, 0, SEEK_SET)) {
    RKADK_LOGE("seek %s failed", pszFileName);
    return -1;
  }

  pFile = (RKADK_U8 *)mmap(NULL, len, PROT_READ, MAP_SHARED, fileno(fd), 0);
  if (pFile == MAP_FAILED) {
    RKADK_LOGE("mmap %s failed, errno: %d", pszFileName, errno);
    return -1;
  }

  while (cur + 4 + 4 < len) {
    if (pFile[cur] != 0xFF) {
      RKADK_LOGE("Bad Jpg file, 0xFF expected at offset 0x%llx", cur);
      goto exit;
    }

    if (pFile[cur + 1] == 0xD8 || pFile[cur + 1] == 0xD9) {
      cur += 2;
    } else if (pFile[cur + 1] == 0xE1) {
      int _tmp;
      _tmp = cur + 1 + 2 + 1;
      if (pFile[_tmp + 0] == 'E' && pFile[_tmp + 1] == 'x' &&
          pFile[_tmp + 2] == 'i' && pFile[_tmp + 3] == 'f') {
        /* Found the 0xFFE1 (EXIF) */
        cur += 2;
        break;
      }
    }

    cur += 2;
    cur += bswap_16(*(RKADK_U16 *) (pFile + cur));
  }

  /* Instead of parsing Exif, searching 0xFFD8 */
  u16ExifLen = bswap_16(*(RKADK_U16 *) (pFile + cur));

  if (u16ExifLen + cur >= len) {
    RKADK_LOGE("Bad Jpg file, Exif len exceed at offset 0x%llx", cur);
    goto exit;
  }

  exif_end = cur + u16ExifLen;
  for (i = 2; i < u16ExifLen; i++) {
    if (pFile[cur + i] != 0xFF || pFile[cur + i + 1] != 0xD8)
      continue;

    cur += i;
    /* Found the thumbnail */
    break;
  }

  /* pFile[cur, exif_end) is the thumbnail */
  if (!pstThumbAttr->pu8Buf) {
    pstThumbAttr->pu8Buf = (RKADK_U8 *)malloc(exif_end - cur);
    if (!pstThumbAttr->pu8Buf) {
      RKADK_LOGE("malloc jpg thumb buffer failed, len = %lld", exif_end - cur);
      goto exit;
    }

    pstThumbAttr->u32BufSize = exif_end - cur;
    RKADK_LOGD("malloc jpg thumb buffer[%p, %d]", pstThumbAttr->pu8Buf, pstThumbAttr->u32BufSize);
  } else {
    if ((int)pstThumbAttr->u32BufSize < (exif_end - cur))
        RKADK_LOGW("buffer size[%d] < thm data size[%lld]",
                   pstThumbAttr->u32BufSize, exif_end - cur);
    else
      pstThumbAttr->u32BufSize = exif_end - cur;
  }

  memcpy(pstThumbAttr->pu8Buf, pFile + cur, pstThumbAttr->u32BufSize);
  ret = RKADK_SUCCESS;

exit:
  munmap(pFile, len);
  return ret;
}

static RKADK_S32 RKADK_PHOTO_GetThumb(RKADK_U32 u32CamId,
                                      RKADK_CHAR *pszFileName,
                                      RKADK_JPG_THUMB_TYPE_E eThmType,
                                      RKADK_THUMB_ATTR_S *pstThumbAttr) {
  FILE *fd = NULL;
  RKADK_S32 ret = -1, result;
  RKADK_THUMB_ATTR_S stTmpThmAttr;
  RKADK_THUMB_ATTR_S *pstThmAttr = NULL;
  struct stat stStatBuf;
  struct utimbuf stTimebuf;
  bool bFree = false;

  RKADK_PARAM_THUMB_CFG_S *ptsThumbCfg = RKADK_PARAM_GetThumbCfg(u32CamId);
  if (!ptsThumbCfg) {
    RKADK_LOGE("RKADK_PARAM_GetThumbCfg failed");
    return -1;
  }

  if (!pstThumbAttr->u32Width || !pstThumbAttr->u32Height) {
    pstThumbAttr->u32Width = UPALIGNTO(ptsThumbCfg->thumb_width, 4);
    pstThumbAttr->u32Height = UPALIGNTO(ptsThumbCfg->thumb_height, 2);
  }

  if (!pstThumbAttr->u32VirWidth || !pstThumbAttr->u32VirHeight) {
    pstThumbAttr->u32VirWidth = pstThumbAttr->u32Width;
    pstThumbAttr->u32VirHeight = pstThumbAttr->u32Height;
  }

  fd = fopen(pszFileName, "r+");
  if (!fd) {
    RKADK_LOGE("open %s failed", pszFileName);
    return -1;
  }

  memset(&stTimebuf, 0, sizeof(struct utimbuf));
  result = stat(pszFileName, &stStatBuf);
  if (result) {
    RKADK_LOGW("stat[%s] failed[%d]", pszFileName, result);
  } else {
    stTimebuf.actime = stStatBuf.st_atime;
    stTimebuf.modtime = stStatBuf.st_mtime;
  }

  ret = RKADK_PHOTO_GetThmInFile(fd, pstThumbAttr);
  if (!ret)
    goto exit;

  memset(&stTmpThmAttr, 0, sizeof(RKADK_THUMB_ATTR_S));
  if (pstThumbAttr->enType == RKADK_THUMB_TYPE_JPEG)
    pstThmAttr = pstThumbAttr;
  else
    pstThmAttr = &stTmpThmAttr;

  ret = RKADK_PHOTO_GetJpgThm(fd, pszFileName, pstThmAttr);
  if (ret) {
    RKADK_LOGE("Get Jpg thumbnail failed");
    goto exit;
  }

  if (pstThumbAttr->enType == RKADK_THUMB_TYPE_JPEG)
    goto exit;

  if (RKADK_PHOTO_GetJpgResolution(pszFileName, &stTmpThmAttr)) {
    RKADK_LOGE("get %s jpg thumb resolution failed, use default", pszFileName);
    stTmpThmAttr.u32Width = ptsThumbCfg->thumb_width;
    stTmpThmAttr.u32VirWidth = stTmpThmAttr.u32Width;
    stTmpThmAttr.u32Height = ptsThumbCfg->thumb_height;
    stTmpThmAttr.u32VirHeight = stTmpThmAttr.u32Height;
  }

  ret = RKADK_PHOTO_JpgDecode(&stTmpThmAttr, pstThumbAttr, &bFree, VDEC_THM_CHN,
                              VDEC_THM_VPSS_GRP, VDEC_THM_VPSS_CHN);
  if (!ret) {
    if (RKADK_PHOTO_BuildInThm(fd, pstThumbAttr))
      RKADK_LOGE("RKADK_PHOTO_BuildInThm failed");
  }

exit:
  if (fd)
    fclose(fd);

  if (ret)
    RKADK_PHOTO_ThumbBufFree(pstThumbAttr);

  if (bFree)
    RKADK_PHOTO_ThumbBufFree(&stTmpThmAttr);

  if (stTimebuf.actime != 0 && stTimebuf.modtime != 0) {
    result = utime(pszFileName, &stTimebuf);
    if (result)
      RKADK_LOGW("utime[%s] failed[%d]", pszFileName, result);
  }

  return ret;
}

RKADK_S32 RKADK_PHOTO_GetThmInJpg(RKADK_U32 u32CamId,
                                  RKADK_CHAR *pszFileName,
                                  RKADK_JPG_THUMB_TYPE_E eThmType,
                                  RKADK_U8 *pu8Buf, RKADK_U32 *pu32Size) {
  int ret;
  RKADK_THUMB_ATTR_S stThumbAttr;

  RKADK_CHECK_POINTER(pszFileName, RKADK_FAILURE);
  RKADK_CHECK_POINTER(pu8Buf, RKADK_FAILURE);

  stThumbAttr.u32Width = 0;
  stThumbAttr.u32Height = 0;
  stThumbAttr.u32VirWidth = 0;
  stThumbAttr.u32VirHeight = 0;
  stThumbAttr.enType = RKADK_THUMB_TYPE_JPEG;
  stThumbAttr.pu8Buf = pu8Buf;
  stThumbAttr.u32BufSize = *pu32Size;

  ret = RKADK_PHOTO_GetThumb(u32CamId, pszFileName, eThmType, &stThumbAttr);
  *pu32Size = stThumbAttr.u32BufSize;

  return ret;
}

RKADK_S32 RKADK_PHOTO_ThumbBufFree(RKADK_THUMB_ATTR_S *pstThumbAttr) {
  return RKADK_MEDIA_FrameFree((RKADK_FRAME_ATTR_S *)pstThumbAttr);
}

RKADK_S32 RKADK_PHOTO_GetThmInJpgEx(RKADK_U32 u32CamId, RKADK_CHAR *pszFileName,
                                    RKADK_JPG_THUMB_TYPE_E eThmType,
                                    RKADK_THUMB_ATTR_S *pstThumbAttr) {
  int ret;

  RKADK_CHECK_POINTER(pszFileName, RKADK_FAILURE);
  RKADK_CHECK_POINTER(pstThumbAttr, RKADK_FAILURE);

  ret = RKADK_PHOTO_GetThumb(u32CamId, pszFileName, eThmType, pstThumbAttr);
  if (ret)
    RKADK_PHOTO_ThumbBufFree(pstThumbAttr);

  return ret;
}

RKADK_S32 RKADK_PHOTO_GetData(RKADK_CHAR *pcFileName,
                              RKADK_PHOTO_DATA_ATTR_S *pstDataAttr) {
  int ret = -1;
  RKADK_S32 s32ReadSize = 0, s32DataSize = 0;
  RKADK_THUMB_ATTR_S stSrcDateAttr;
  bool bFree = false;

  RKADK_CHECK_POINTER(pcFileName, RKADK_FAILURE);
  RKADK_CHECK_POINTER(pstDataAttr, RKADK_FAILURE);

  if (pstDataAttr->enType == RKADK_THUMB_TYPE_JPEG) {
    RKADK_LOGE("Invalid type = %d", pstDataAttr->enType);
    return -1;
  }

  FILE *fd = fopen(pcFileName, "rb");
  if (!fd) {
    RKADK_LOGE("Could not open %s", pcFileName);
    return -1;
  }

  if (fseek(fd, 0, SEEK_END) || (s32DataSize = ftell(fd)) == -1 ||
      fseek(fd, 0, SEEK_SET)) {
    RKADK_LOGE("get %s size failed", pcFileName);
    goto exit;
  }

  memset(&stSrcDateAttr, 0, sizeof(RKADK_THUMB_ATTR_S));
  stSrcDateAttr.enType = RKADK_THUMB_TYPE_JPEG;
  stSrcDateAttr.pu8Buf = (RKADK_U8 *)malloc(s32DataSize);
  if (!stSrcDateAttr.pu8Buf) {
    RKADK_LOGE("malloc failed, len: %d", s32DataSize);
    goto exit;
  }
  RKADK_LOGD("malloc jpg buffer[%p, %d]", stSrcDateAttr.pu8Buf, s32DataSize);

  memset(stSrcDateAttr.pu8Buf, 0, s32DataSize);
  s32ReadSize = fread(stSrcDateAttr.pu8Buf, 1, s32DataSize, fd);
  if (s32ReadSize != s32DataSize)
    RKADK_LOGW("u32ReadSize[%d] != u32DataSize[%d]", s32ReadSize, s32DataSize);

  stSrcDateAttr.u32BufSize = s32ReadSize;
  if (RKADK_PHOTO_GetJpgResolution(pcFileName, &stSrcDateAttr)) {
    RKADK_LOGE("get %s jpg thumb resolution failed", pcFileName);
    goto exit;
  }

  if (!pstDataAttr->u32Width || !pstDataAttr->u32Height) {
    RKADK_LOGD("use default resolution[%d, %d]", stSrcDateAttr.u32Width, stSrcDateAttr.u32Height);
    pstDataAttr->u32Width = stSrcDateAttr.u32Width;
    pstDataAttr->u32VirWidth = pstDataAttr->u32Width;
    pstDataAttr->u32Height = stSrcDateAttr.u32Height;
    pstDataAttr->u32VirHeight = pstDataAttr->u32Height;
  }

  ret = RKADK_PHOTO_JpgDecode(&stSrcDateAttr, (RKADK_THUMB_ATTR_S *)pstDataAttr,
                              &bFree, VDEC_GET_DATA_CHN, VDEC_GET_DATA_VPSS_GRP,
                              VDEC_GET_DATA_VPSS_CHN);

exit:
  if (fd)
    fclose(fd);

  if (bFree)
    RKADK_PHOTO_FreeData(&stSrcDateAttr);

  if (ret)
    RKADK_PHOTO_FreeData(pstDataAttr);

  return ret;
}

RKADK_S32 RKADK_PHOTO_FreeData(RKADK_PHOTO_DATA_ATTR_S *pstDataAttr) {
  return RKADK_MEDIA_FrameFree((RKADK_FRAME_ATTR_S *)pstDataAttr);
}
