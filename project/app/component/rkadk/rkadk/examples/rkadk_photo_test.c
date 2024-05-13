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

#include "rkadk_common.h"
#include "rkadk_media_comm.h"
#include "rkadk_log.h"
#include "rkadk_param.h"
#include "rkadk_photo.h"
#include "rkadk_osd.h"
#include "isp/sample_isp.h"
#include <getopt.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

extern int optind;
extern char *optarg;

static bool is_quit = false;
static RKADK_CHAR optstr[] = "a:I:p:m:o:W:H:h";

#define IQ_FILE_PATH "/etc/iqfiles"

static void print_usage(const RKADK_CHAR *name) {
  printf("usage example:\n");
  printf("\t%s [-a /etc/iqfiles] [-I 0] [-t NV12]\n", name);
  printf("\t-a: enable aiq with dirpath provided, eg:-a "
         "/oem/etc/iqfiles/, Default /etc/iqfiles,"
         "without this option aiq should run in other application\n");
  printf("\t-I: camera id, Default 0\n");
  printf("\t-p: param ini directory path, Default:/data/rkadk\n");
  printf("\t-o: osd file, ARGB8888 fmt, Default:NULL\n");
  printf("\t-W: osd width, Default:0\n");
  printf("\t-H: osd height, Default:0\n");
  printf("\t-m: multiple sensors, Default:0, options: 1(all isp sensors), 2(isp+ahd sensors)\n");
}

static void sigterm_handler(int sig) {
  fprintf(stderr, "signal %d\n", sig);
  is_quit = true;
}

static void PhotoDataRecv(RKADK_PHOTO_RECV_DATA_S *pstData) {
  static RKADK_U32 photoId = 0;
  char jpegPath[128];
  FILE *file = NULL;

  if (!pstData || !pstData->pu8DataBuf) {
    RKADK_LOGE("Invalid photo data");
    return;
  }

  memset(jpegPath, 0, 128);
  sprintf(jpegPath, "/tmp/PhotoTest_%d.jpeg", photoId);
  file = fopen(jpegPath, "w");
  if (!file) {
    RKADK_LOGE("Create jpeg file(%s) failed", jpegPath);
    return;
  }

  RKADK_LOGD("save u32CamId[%d] jpeg to %s", pstData->u32CamId, jpegPath);

  fwrite(pstData->pu8DataBuf, 1, pstData->u32DataLen, file);
  fclose(file);

#if 0
  RKADK_PHOTO_DATA_ATTR_S stDataAttr;
  memset(&stDataAttr, 0, sizeof(RKADK_PHOTO_DATA_ATTR_S));
  stDataAttr.enType = RKADK_THUMB_TYPE_BGRA8888;
  stDataAttr.u32Width = 1280;
  stDataAttr.u32Height = 720;
  stDataAttr.u32VirWidth = 1280;
  stDataAttr.u32VirHeight = 720;

  if (!RKADK_PHOTO_GetData(jpegPath, &stDataAttr)) {
    RKADK_LOGD("[%d, %d, %d, %d], u32BufSize: %d", stDataAttr.u32Width,
               stDataAttr.u32Height, stDataAttr.u32VirWidth,
               stDataAttr.u32VirHeight, stDataAttr.u32BufSize);

    memset(jpegPath, 0, 128);
    sprintf(jpegPath, "/tmp/PhotoTest_%d.bgra8888", photoId);
    file = fopen(jpegPath, "w");
    if (!file) {
      RKADK_LOGE("Create jpeg file(%s) failed", jpegPath);
    } else {
      fwrite(stDataAttr.pu8Buf, 1, stDataAttr.u32BufSize, file);
      fclose(file);
      RKADK_LOGD("save %s done", jpegPath);
    }

    RKADK_PHOTO_FreeData(&stDataAttr);
  }
#endif

  photoId++;
  if (photoId > 10)
    photoId = 0;
}

int main(int argc, char *argv[]) {
  int c, ret, inCmd = 0;
  RKADK_U32 u32CamId = 0;
  RKADK_PHOTO_ATTR_S stPhotoAttr;
  RKADK_TAKE_PHOTO_ATTR_S stTakePhotoAttr;
  const char *iniPath = NULL;
  char path[RKADK_PATH_LEN];
  char sensorPath[RKADK_MAX_SENSOR_CNT][RKADK_PATH_LEN];
  RKADK_MW_PTR pHandle = NULL, pHandle1 = NULL;
  RKADK_BOOL bMultiCam = RKADK_FALSE;
  RKADK_BOOL bMultiSensor = RK_FALSE;
  char *osdfile = NULL;
  RKADK_U32 u32OsdWidth = 0, u32OsdHeight = 0;
  RKADK_OSD_ATTR_S OsdAttr;
  RKADK_OSD_STREAM_ATTR_S OsdStreamAttr;
  RKADK_U32 u32OsdId = 0;

#ifdef RKAIQ
  RKADK_PARAM_FPS_S stFps;
  RKADK_CHAR *pIqfilesPath = IQ_FILE_PATH;
  const char *tmp_optarg = optarg;
#endif

  while ((c = getopt(argc, argv, optstr)) != -1) {
    switch (c) {
#ifdef RKAIQ
    case 'a':
      if (!optarg && NULL != argv[optind] && '-' != argv[optind][0]) {
        tmp_optarg = argv[optind++];
      }

      if (tmp_optarg)
        pIqfilesPath = (char *)tmp_optarg;
      break;
#endif
    case 'I':
      u32CamId = atoi(optarg);
      break;
    case 'p':
      iniPath = optarg;
      RKADK_LOGD("iniPath: %s", iniPath);
      break;
    case 'm':
      inCmd = atoi(optarg);
      if (inCmd == 1) {
        bMultiCam = RKADK_TRUE;
        bMultiSensor = RKADK_TRUE;
      } else if (inCmd == 2)
        bMultiSensor = RKADK_TRUE;
      break;
    case 'o':
      osdfile = optarg;
      break;
    case 'W':
      u32OsdWidth = atoi(optarg);
      break;
    case 'H':
      u32OsdHeight = atoi(optarg);
      break;
    case 'h':
    default:
      print_usage(argv[0]);
      optind = 0;
      return 0;
    }
  }
  optind = 0;

  if (bMultiSensor)
    u32CamId = 0;

  RKADK_LOGD("#camera id: %d, bMultiCam: %d, bMultiSensor: %d", u32CamId, bMultiCam, bMultiSensor);
  RKADK_LOGD("osdfile: %s, width: %d, height: %d", osdfile, u32OsdWidth, u32OsdHeight);

  RKADK_MPI_SYS_Init();

  if (iniPath) {
    memset(path, 0, RKADK_PATH_LEN);
    memset(sensorPath, 0, RKADK_MAX_SENSOR_CNT * RKADK_PATH_LEN);
    sprintf(path, "%s/rkadk_setting.ini", iniPath);
    for (int i = 0; i < RKADK_MAX_SENSOR_CNT; i++)
      sprintf(sensorPath[i], "%s/rkadk_setting_sensor_%d.ini", iniPath, i);

    /*
    lg:
      char *sPath[] = {"/data/rkadk/rkadk_setting_sensor_0.ini",
      "/data/rkadk/rkadk_setting_sensor_1.ini", NULL};
    */
    char *sPath[] = {sensorPath[0], sensorPath[1], NULL};

    RKADK_PARAM_Init(path, sPath);
  } else {
    RKADK_PARAM_Init(NULL, NULL);
  }

photo:
#ifdef RKAIQ
  stFps.enStreamType = RKADK_STREAM_TYPE_SENSOR;
  ret = RKADK_PARAM_GetCamParam(u32CamId, RKADK_PARAM_TYPE_FPS, &stFps);
  if (ret) {
    RKADK_LOGE("RKADK_PARAM_GetCamParam u32CamId[%d] fps failed", u32CamId);
    return -1;
  }

  rk_aiq_working_mode_t hdr_mode = RK_AIQ_WORKING_MODE_NORMAL;
  SAMPLE_ISP_Start(u32CamId, hdr_mode, bMultiCam, pIqfilesPath, stFps.u32Framerate);

  if (bMultiCam) {
    ret = RKADK_PARAM_GetCamParam(1, RKADK_PARAM_TYPE_FPS, &stFps);
    if (ret) {
      RKADK_LOGE("RKADK_PARAM_GetCamParam u32CamId[1] fps failed");
      SAMPLE_ISP_Stop(u32CamId);
      return -1;
    }

    SAMPLE_ISP_Start(1, hdr_mode, bMultiCam, pIqfilesPath, stFps.u32Framerate);
  }
#endif

  memset(&stTakePhotoAttr, 0, sizeof(RKADK_TAKE_PHOTO_ATTR_S));
  stTakePhotoAttr.enPhotoType = RKADK_PHOTO_TYPE_SINGLE;

  memset(&stPhotoAttr, 0, sizeof(RKADK_PHOTO_ATTR_S));

  stPhotoAttr.u32CamId = u32CamId;
  stPhotoAttr.pfnPhotoDataProc = PhotoDataRecv;
  stPhotoAttr.stThumbAttr.bSupportDCF = RKADK_FALSE;
  stPhotoAttr.stThumbAttr.stMPFAttr.eMode = RKADK_PHOTO_MPF_SINGLE;
  stPhotoAttr.stThumbAttr.stMPFAttr.sCfg.u8LargeThumbNum = 1;
  stPhotoAttr.stThumbAttr.stMPFAttr.sCfg.astLargeThumbSize[0].u32Width = 320;
  stPhotoAttr.stThumbAttr.stMPFAttr.sCfg.astLargeThumbSize[0].u32Height = 180;

  ret = RKADK_PHOTO_Init(&stPhotoAttr, &pHandle);
  if (ret) {
    RKADK_LOGE("RKADK_PHOTO_Init u32CamId[%d] failed[%d]", u32CamId, ret);
#ifdef RKAIQ
    SAMPLE_ISP_Stop(u32CamId);

    if (bMultiCam)
      SAMPLE_ISP_Stop(1);
#endif
    return -1;
  }

  if (bMultiSensor) {
    stPhotoAttr.u32CamId = 1;
    ret = RKADK_PHOTO_Init(&stPhotoAttr, &pHandle1);
    if (ret) {
      RKADK_LOGE("RKADK_PHOTO_Init u32CamId[1] failed[%d]", ret);
      RKADK_PHOTO_DeInit(pHandle);
#ifdef RKAIQ
      SAMPLE_ISP_Stop(u32CamId);
      if (bMultiCam)
        SAMPLE_ISP_Stop(1);
#endif
    return -1;
    }
  }

  if (osdfile && u32OsdWidth && u32OsdHeight) {
    memset(&OsdAttr, 0, sizeof(RKADK_OSD_ATTR_S));
    memset(&OsdStreamAttr, 0, sizeof(RKADK_OSD_STREAM_ATTR_S));
    OsdAttr.Format = RKADK_FMT_ARGB8888;
    OsdAttr.Width = u32OsdWidth;
    OsdAttr.Height = u32OsdHeight;
    OsdAttr.pData = malloc(OsdAttr.Height * OsdAttr.Width * 4);

#ifdef RV1106_1103
    OsdAttr.enOsdType = RKADK_OSD_TYPE_NORMAL;
#else
    OsdAttr.enOsdType = RKADK_OSD_TYPE_EXTRA;
#endif

    OsdStreamAttr.Origin_X = 0;
    OsdStreamAttr.Origin_Y = 0;
    OsdStreamAttr.bEnableShow = RKADK_TRUE;
    OsdStreamAttr.enOsdType = OsdAttr.enOsdType;

    RKADK_OSD_Init(u32OsdId, &OsdAttr);
    RKADK_OSD_AttachToStream(u32OsdId, u32CamId, RKADK_STREAM_TYPE_SNAP, &OsdStreamAttr);

    FILE *fp = fopen(osdfile, "rw");
    if (!fp) {
      RKADK_LOGD("open osd file fail");
    } else {
      RKADK_LOGD("open osd file success");
      fread((RKADK_U8 *)OsdAttr.pData, OsdAttr.Width * OsdAttr.Height * 4, 1, fp);
      fclose(fp);
      RKADK_OSD_UpdateBitMap(u32OsdId, &OsdAttr);
    }
  }

  signal(SIGINT, sigterm_handler);

  char cmd[64];
  printf("\n#Usage: input 'quit' to exit programe!\n"
         "peress any other key to capture one picture to file\n");

  RKADK_PARAM_RES_E type;
  while (!is_quit) {
    fgets(cmd, sizeof(cmd), stdin);
    if (strstr(cmd, "quit") || is_quit) {
      RKADK_LOGD("#Get 'quit' cmd!");
      break;
    } else if (strstr(cmd, "1080")) {
      type = RKADK_RES_1080P;
      RKADK_PARAM_SetCamParam(u32CamId, RKADK_PARAM_TYPE_PHOTO_RES, &type);
      ret = RKADK_PHOTO_Reset(&pHandle);
      if (ret < 0) {
#ifndef RV1106_1103
        RKADK_PHOTO_DeInit(pHandle);
#ifdef RKAIQ
        SAMPLE_ISP_Stop(u32CamId);
#endif
        pHandle = NULL;
        goto photo;
#endif
      }
    } else if (strstr(cmd, "720")) {
      type = RKADK_RES_720P;
      RKADK_PARAM_SetCamParam(u32CamId, RKADK_PARAM_TYPE_PHOTO_RES, &type);
      ret = RKADK_PHOTO_Reset(&pHandle);
      if (ret < 0) {
#ifndef RV1106_1103
        RKADK_PHOTO_DeInit(pHandle);
#ifdef RKAIQ
        SAMPLE_ISP_Stop(u32CamId);
#endif
        pHandle = NULL;
        goto photo;
#endif
      }
    } else if (strstr(cmd, "1620")) {
      type = RKADK_RES_1620P;
      RKADK_PARAM_SetCamParam(u32CamId, RKADK_PARAM_TYPE_PHOTO_RES, &type);
      ret = RKADK_PHOTO_Reset(&pHandle);
      if (ret < 0) {
#ifndef RV1106_1103
        RKADK_PHOTO_DeInit(pHandle);
#ifdef RKAIQ
        SAMPLE_ISP_Stop(u32CamId);
#endif
        pHandle = NULL;
        goto photo;
#endif
      }
    } else if (strstr(cmd, "1296")) {
      type = RKADK_RES_1296P;
      RKADK_PARAM_SetCamParam(u32CamId, RKADK_PARAM_TYPE_PHOTO_RES, &type);
      ret = RKADK_PHOTO_Reset(&pHandle);
      if (ret < 0) {
#ifndef RV1106_1103
        RKADK_PHOTO_DeInit(pHandle);
#ifdef RKAIQ
        SAMPLE_ISP_Stop(u32CamId);
#endif
        pHandle = NULL;
        goto photo;
#endif
      }
    }

    if (RKADK_PHOTO_TakePhoto(pHandle, &stTakePhotoAttr)) {
      RKADK_LOGE("RKADK_PHOTO_TakePhoto u32CamId[%d] failed", u32CamId);
      break;
    }

    if (bMultiSensor) {
      if (RKADK_PHOTO_TakePhoto(pHandle1, &stTakePhotoAttr)) {
        RKADK_LOGE("RKADK_PHOTO_TakePhoto u32CamId[1] failed");
        break;
      }
    }

    usleep(500000);
  }

  if (osdfile) {
    RKADK_OSD_DettachFromStream(u32OsdId, u32CamId, RKADK_STREAM_TYPE_SNAP);
    RKADK_OSD_Deinit(u32OsdId);
    free(OsdAttr.pData);
  }

  RKADK_PHOTO_DeInit(pHandle);

  if (bMultiSensor)
    RKADK_PHOTO_DeInit(pHandle1);

#ifdef RKAIQ
  SAMPLE_ISP_Stop(u32CamId);

  if (bMultiCam)
    SAMPLE_ISP_Stop(1);
#endif
  RKADK_MPI_SYS_Exit();
  return 0;
}
