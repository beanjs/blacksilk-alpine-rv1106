/*
 * Copyright (c) 2022 Rockchip, Inc. All Rights Reserved.
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
#include "rkadk_log.h"
#include "rkadk_param.h"
#include "rkadk_media_comm.h"
#include "rkadk_player.h"
#include "rkadk_demuxer.h"
#include "rkadk_audio_decoder.h"
#include "rk_debug.h"
#include "rk_defines.h"
#include <math.h>
#include "rk_comm_vdec.h"
#include "rk_mpi_ao.h"
#include "rk_mpi_mb.h"
#include "rk_mpi_sys.h"
#include "rkdemuxer.h"
#include <stdbool.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/poll.h>
#include <sys/types.h>
#include <fcntl.h>

typedef enum {
  RKADK_PLAYER_PAUSE_FALSE = 0x0,
  RKADK_PLAYER_PAUSE_START,
} RKADK_PLAYER_PAUSE_STATUS_E;

typedef enum {
  RKADK_PLAYER_SEEK_FALSE = 0x0,
  RKADK_PLAYER_SEEK_WAIT,
  RKADK_PLAYER_SEEK_START,
  RKADK_PLAYER_SEEK_SEND,
} RKADK_PLAYER_SEEK_STATUS_E;

typedef struct {
  const RKADK_CHAR *srcFileUri;
  const RKADK_CHAR *dstFilePath;
  RKADK_U32   srcWidth;
  RKADK_U32   srcHeight;
  RKADK_U32   chnIndex;
  RKADK_U32   chNum;
  RKADK_U32   inputMode;
  RKADK_CODEC_TYPE_E eCodecType;
  RKADK_U32   compressMode;
  RKADK_U32   frameBufferCnt;
  RKADK_U32   extraDataSize;
  RKADK_U32   readSize;
  RKADK_S32   chnFd;
  MB_POOL     pool;
  RKADK_S32   outputPixFmt;
  RKADK_BOOL  bEnableDei;
  RKADK_BOOL  bEnableColmv;
} RKADK_PLAYER_VDEC_CTX_S;

typedef struct {
  RKADK_S32  enIntfSync;
  RKADK_U32  u32Width;
  RKADK_U32  u32Height;
} VO_Timing_S;

typedef struct {
  RKADK_U32 u32FrameBufferCnt;
  COMPRESS_MODE_E enCompressMode;
} VDEC_CFG_S;

typedef struct {
  RKADK_U32 u32Screen0VoLayer;
  RKADK_U32 u32Screen1VoLayer;

  RKADK_U32 u32Screen0Rows;
  RKADK_U32 u32Screen1Rows;
  RK_BOOL bDoubleScreen;
} VO_CFG_S;

typedef struct {
  RKADK_U32 mode;
  VO_INTF_SYNC_E enIntfSync;
} VO_MODE_S;

typedef struct {
  RKADK_U32 u32VoLay;
  RKADK_U32 u32VoDev;
  RKADK_U32 u32VoChn;
  RKADK_VO_INTF_TYPE_E  enIntfType;
  RKADK_VO_INTF_SYNC_E  enIntfSync;
  RKADK_U32  x;
  RKADK_U32  y;
  RKADK_U32  dispWidth;
  RKADK_U32  dispHeight;
  RKADK_U32  imgeWidth;
  RKADK_U32  imageHeight;
  PIXEL_FORMAT_E pixFormat;
  RKADK_U32  dispFrmRt;
  MIRROR_E    enMirror;
  ROTATION_E  enRotation;
} RKADK_PLAYER_VO_CTX_S;

typedef struct {
  RKADK_S32      chnNum;
  RKADK_S32      sampleRate;
  RKADK_S32      channel;
  RKADK_CODEC_TYPE_E eCodecType;
  RKADK_S32      decMode;
  RK_BOOL        bBlock;
  RKADK_S32      chnIndex;
  RKADK_S32      clrChnBuf;
} RKADK_PLAYER_ADEC_CTX_S;

typedef struct {
  const RKADK_CHAR *dstFilePath;
  RKADK_BOOL bopenChannelFlag;
  RKADK_S32 chnNum;
  RKADK_S32 sampleRate;
  RKADK_S32 reSmpSampleRate;
  RKADK_S32 channel;
  RKADK_S32 deviceChannel;
  RKADK_S32 bitWidth;
  RKADK_S32 devId;
  RKADK_S32 periodCount;
  RKADK_S32 periodSize;
  RKADK_CHAR cardName[RKADK_BUFFER_LEN];
  RKADK_S32 chnIndex;
  RKADK_S32 setVolume;
  RKADK_S32 setMute;
  RKADK_S32 setFadeRate;
  RKADK_S32 setTrackMode;
  RKADK_S32 getVolume;
  RKADK_S32 getMute;
  RKADK_S32 getTrackMode;
  RKADK_S32 queryChnStat;
  RKADK_S32 pauseResumeChn;
  RKADK_S32 saveFile;
  RKADK_S32 queryFileStat;
  RKADK_S32 clrChnBuf;
  RKADK_S32 clrPubAttr;
  RKADK_S32 getPubAttr;
  RKADK_S32 openFlag;
} RKADK_PLAYER_AO_CTX_S;

typedef struct {
  pthread_t tidEof;
  pthread_t tidVideoSend;
  pthread_t tidAudioSend;
  pthread_t tidAudioCommand;
} RKADK_PLAYER_THREAD_PARAM_S;

typedef struct {
  RKADK_CHAR pFilePath[RKADK_PATH_LEN];

  RKADK_BOOL bEnableVideo;
  RKADK_BOOL bVideoExist;
  RKADK_S64 videoTimeStamp;
  RKADK_PLAYER_VDEC_CTX_S stVdecCtx;
  RKADK_PLAYER_VO_CTX_S stVoCtx;
  pthread_mutex_t PauseVideoMutex;
  RKADK_BOOL bEnableBlackBackground;

  RKADK_BOOL bEnableAudio;
  RKADK_BOOL bAudioExist;
  RKADK_PLAYER_ADEC_CTX_S stAdecCtx;
  RKADK_PLAYER_AO_CTX_S stAoCtx;
  pthread_mutex_t WavMutex;
  pthread_cond_t WavCond;
  pthread_mutex_t PauseAudioMutex;

  RKADK_BOOL bIsRtsp;

  RKADK_VOID *pDemuxerCfg;
  RKADK_DEMUXER_PARAM_S stDemuxerParam;
  RKADK_S8 demuxerFlag;

  RKADK_BOOL bStopFlag;
  RKADK_BOOL bWavEofFlag;
  RKADK_BOOL bAudioStopFlag;
  RKADK_BOOL bGetPtsFlag;
  RKADK_PLAYER_PAUSE_STATUS_E enPauseStatus;
  RKADK_PLAYER_SEEK_STATUS_E enSeekStatus;
  RKADK_S64 seekTimeStamp;
  RKADK_U32 duration;
  RKADK_S64 positionTimeStamp;
  RKADK_PLAYER_THREAD_PARAM_S stThreadParam;
  RKADK_PLAYER_EVENT_FN pfnPlayerCallback;
} RKADK_PLAYER_HANDLE_S;

static RKADK_S32 VdecCtxInit(RKADK_PLAYER_VDEC_CTX_S *pstVdecCtx) {
  memset(pstVdecCtx, 0, sizeof(RKADK_PLAYER_VDEC_CTX_S));

  pstVdecCtx->inputMode = VIDEO_MODE_FRAME;
  pstVdecCtx->compressMode = COMPRESS_MODE_NONE;

  pstVdecCtx->frameBufferCnt = 3;
  pstVdecCtx->readSize = 1024;
  pstVdecCtx->chNum = 1;
  pstVdecCtx->chnIndex = 0;
  pstVdecCtx->bEnableColmv = RKADK_TRUE;
  pstVdecCtx->outputPixFmt = (RKADK_S32)RK_FMT_YUV420SP;
  pstVdecCtx->eCodecType = RKADK_CODEC_TYPE_H264;
  pstVdecCtx->srcWidth = 320;
  pstVdecCtx->srcHeight = 240;

  return RKADK_SUCCESS;
}

static RKADK_S32 CreateVdec(RKADK_PLAYER_VDEC_CTX_S *pstVdecCtx) {
  RKADK_S32 ret = RKADK_SUCCESS;
  VDEC_CHN_ATTR_S stAttr;
  VDEC_CHN_PARAM_S stVdecParam;
  VDEC_PIC_BUF_ATTR_S stVdecPicBufAttr;
  MB_PIC_CAL_S stMbPicCalResult;
  VDEC_MOD_PARAM_S stModParam;

  memset(&stAttr, 0, sizeof(VDEC_CHN_ATTR_S));
  memset(&stVdecParam, 0, sizeof(VDEC_CHN_PARAM_S));
  memset(&stModParam, 0, sizeof(VDEC_MOD_PARAM_S));
  memset(&stVdecPicBufAttr, 0, sizeof(VDEC_PIC_BUF_ATTR_S));
  memset(&stMbPicCalResult, 0, sizeof(MB_PIC_CAL_S));

  RKADK_LOGI("found video width %d height %d pixfmt %d",
              pstVdecCtx->srcWidth, pstVdecCtx->srcHeight, pstVdecCtx->outputPixFmt);

  stVdecPicBufAttr.enCodecType = RKADK_MEDIA_GetRkCodecType(pstVdecCtx->eCodecType);
  stVdecPicBufAttr.stPicBufAttr.u32Width = pstVdecCtx->srcWidth;
  stVdecPicBufAttr.stPicBufAttr.u32Height = pstVdecCtx->srcHeight;
  stVdecPicBufAttr.stPicBufAttr.enPixelFormat = (PIXEL_FORMAT_E)pstVdecCtx->outputPixFmt;
  stVdecPicBufAttr.stPicBufAttr.enCompMode = (COMPRESS_MODE_E)pstVdecCtx->compressMode;
  ret = RK_MPI_CAL_VDEC_GetPicBufferSize(&stVdecPicBufAttr, &stMbPicCalResult);
  if (ret != RK_SUCCESS) {
    RKADK_LOGE("get picture buffer size failed. err 0x%X", ret);
    return ret;
  }

  stAttr.enMode = VIDEO_MODE_FRAME;
  stAttr.enType = RKADK_MEDIA_GetRkCodecType(pstVdecCtx->eCodecType);
  stAttr.u32PicWidth = pstVdecCtx->srcWidth;
  stAttr.u32PicHeight = pstVdecCtx->srcHeight;
  if (pstVdecCtx->bEnableDei) {
    // iep must remain 5 buffers for deinterlace
    stAttr.u32FrameBufCnt = pstVdecCtx->frameBufferCnt + 5;
  } else
    stAttr.u32FrameBufCnt = pstVdecCtx->frameBufferCnt;

  stAttr.u32StreamBufCnt = MAX_STREAM_CNT;
  /*
    * if decode 10bit stream, need specify the u32FrameBufSize,
    * other conditions can be set to 0, calculated internally.
    */
  stAttr.u32FrameBufSize = stMbPicCalResult.u32MBSize;

  if (!pstVdecCtx->bEnableColmv)
    stAttr.stVdecVideoAttr.bTemporalMvpEnable = RK_FALSE;

  ret = RK_MPI_VDEC_CreateChn(pstVdecCtx->chnIndex, &stAttr);
  if (ret != RK_SUCCESS) {
    RKADK_LOGE("create %d vdec failed! ", pstVdecCtx->chnIndex);
    return ret;
  }

  stVdecParam.stVdecVideoParam.enCompressMode = (COMPRESS_MODE_E)pstVdecCtx->compressMode;

  if (pstVdecCtx->bEnableDei)
    stVdecParam.stVdecVideoParam.bDeiEn = (RK_BOOL)pstVdecCtx->bEnableDei;

  // it is only effective to disable MV when decoding sequence output
  if (!pstVdecCtx->bEnableColmv)
    stVdecParam.stVdecVideoParam.enOutputOrder = VIDEO_OUTPUT_ORDER_DEC;

  ret = RK_MPI_VDEC_SetChnParam(pstVdecCtx->chnIndex, &stVdecParam);
  if (ret != RK_SUCCESS) {
    RKADK_LOGE("set chn %d param failed %X! ", pstVdecCtx->chnIndex, ret);
    return ret;
  }

  pstVdecCtx->chnFd = RK_MPI_VDEC_GetFd(pstVdecCtx->chnIndex);
  if (pstVdecCtx->chnFd <= 0) {
    RKADK_LOGE("get fd chn %d failed %d", pstVdecCtx->chnIndex, pstVdecCtx->chnFd);
    return RKADK_FAILURE;
  }

  return RKADK_SUCCESS;
}

static RKADK_S32 DestroyVdec(RKADK_PLAYER_VDEC_CTX_S *ctx) {
  RKADK_S32 ret = 0;
  ret = RK_MPI_VDEC_StopRecvStream(ctx->chnIndex);
  if (ret) {
    RKADK_LOGE("stop Vdec stream failed, ret = %X\n", ret);
    return RKADK_FAILURE;
  }

  if (ctx->chnFd > 0) {
    ret = RK_MPI_VDEC_CloseFd(ctx->chnIndex);
    if (ret) {
      RKADK_LOGE("close Vdec fd failed, ret = %X\n", ret);
      return RKADK_FAILURE;
    }
  }

  ret = RK_MPI_VDEC_DestroyChn(ctx->chnIndex);
  if (ret) {
    RKADK_LOGE("destroy Vdec channel failed, ret = %X\n", ret);
    return RKADK_FAILURE;
  }

  return RKADK_SUCCESS;
}

static RKADK_S32 RKADK_PLAYER_SetVoCtx(RKADK_PLAYER_VO_CTX_S *pstVoCtx, RKADK_PLAYER_FRAME_INFO_S *pstFrameInfo) {
  memset(pstVoCtx, 0, sizeof(RKADK_PLAYER_VO_CTX_S));

  pstVoCtx->u32VoDev = pstFrameInfo->u32VoDev;
  pstVoCtx->u32VoLay = pstFrameInfo->u32VoLay;
  pstVoCtx->u32VoChn = pstFrameInfo->u32VoChn;
  pstVoCtx->x = pstFrameInfo->u32FrmInfoX;
  pstVoCtx->y = pstFrameInfo->u32FrmInfoY;
  pstVoCtx->dispWidth = pstFrameInfo->u32DispWidth;
  pstVoCtx->dispHeight = pstFrameInfo->u32DispHeight;
  pstVoCtx->imgeWidth = pstFrameInfo->u32ImgWidth;
  pstVoCtx->imageHeight = pstFrameInfo->u32ImgHeight;
  pstVoCtx->dispFrmRt = pstFrameInfo->stSyncInfo.u16FrameRate;
  pstVoCtx->enIntfType = pstFrameInfo->u32EnIntfType;

  switch (pstFrameInfo->u32VoFormat) {
    case VO_FORMAT_RGB888:
      pstVoCtx->pixFormat = RK_FMT_RGB888;
      break;
    case VO_FORMAT_NV12:
      pstVoCtx->pixFormat = RK_FMT_YUV420SP;
      break;
    default:
      RKADK_LOGW("unsupport pix format: %d, use default(%d)", pstVoCtx->pixFormat, RK_FMT_RGB888);
      pstVoCtx->pixFormat = RK_FMT_RGB888;
  }

  pstVoCtx->enIntfSync = pstFrameInfo->enIntfSync;
  if (pstVoCtx->enIntfSync >= RKADK_VO_OUTPUT_BUTT) {
    RKADK_LOGE("IntfSync(%d) if unsupport", pstVoCtx->enIntfSync);
    return RKADK_FAILURE;
  }

  if (pstFrameInfo->bMirror && !pstFrameInfo->bFlip)
    pstVoCtx->enMirror = MIRROR_HORIZONTAL;
  else if (pstFrameInfo->bFlip && !pstFrameInfo->bMirror)
    pstVoCtx->enMirror = MIRROR_VERTICAL;
  else if (pstFrameInfo->bMirror && pstFrameInfo->bFlip)
    pstVoCtx->enMirror = MIRROR_BOTH;
  else
    pstVoCtx->enMirror = MIRROR_NONE;

  pstVoCtx->enRotation = (ROTATION_E)pstFrameInfo->u32Rotation;
  return RKADK_SUCCESS;
}

static RKADK_S32 AdecCtxInit(RKADK_PLAYER_ADEC_CTX_S *pstAdecCtx) {
  memset(pstAdecCtx, 0, sizeof(RKADK_PLAYER_ADEC_CTX_S));

  pstAdecCtx->chnIndex = PLAYER_ADEC_CHN;
  pstAdecCtx->sampleRate = 16000;
  pstAdecCtx->channel = 2;
  pstAdecCtx->decMode = ADEC_MODE_STREAM;
  pstAdecCtx->eCodecType = RKADK_CODEC_TYPE_MP3;
  pstAdecCtx->bBlock = RK_TRUE;
  return RKADK_SUCCESS;
}

static RKADK_S32 CreateAdec(RKADK_PLAYER_ADEC_CTX_S *pstAdecCtx) {
  RKADK_S32 ret = 0;
  ADEC_CHN_ATTR_S pstChnAttr;
  memset(&pstChnAttr, 0, sizeof(ADEC_CHN_ATTR_S));
  pstChnAttr.stCodecAttr.enType = RKADK_MEDIA_GetRkCodecType(pstAdecCtx->eCodecType);
  pstChnAttr.stCodecAttr.u32Channels = pstAdecCtx->channel;
  pstChnAttr.stCodecAttr.u32SampleRate = pstAdecCtx->sampleRate;
  pstChnAttr.stCodecAttr.u32BitPerCodedSample = 4;

  pstChnAttr.enType = RKADK_MEDIA_GetRkCodecType(pstAdecCtx->eCodecType);
  pstChnAttr.enMode = (ADEC_MODE_E)pstAdecCtx->decMode;
  pstChnAttr.u32BufCount = 4;
  pstChnAttr.u32BufSize = 50 * 1024;

  ret = RK_MPI_ADEC_CreateChn(pstAdecCtx->chnIndex, &pstChnAttr);
  if (ret)
    RKADK_LOGE("create adec chn %d err:0x%X\n", pstAdecCtx->chnIndex, ret);

  return ret;
}

static RKADK_S32 AoCtxInit(RKADK_PLAYER_AO_CTX_S *pstAoCtx) {
  RKADK_PARAM_AUDIO_CFG_S *pstAudioParam = RKADK_PARAM_GetAudioCfg();
  if (!pstAudioParam) {
    RKADK_LOGE("RKADK_PARAM_GetAudioCfg failed");
    return RKADK_FAILURE;
  }

  memset(pstAoCtx, 0, sizeof(RKADK_PLAYER_AO_CTX_S));

  pstAoCtx->dstFilePath     = RKADK_NULL;
  pstAoCtx->chnNum          = 1;
  pstAoCtx->sampleRate      = AUDIO_SAMPLE_RATE;
  pstAoCtx->reSmpSampleRate = 0;
  pstAoCtx->deviceChannel   = AUDIO_DEVICE_CHANNEL;
  pstAoCtx->channel         = 2;
  pstAoCtx->bitWidth        = AUDIO_BIT_WIDTH;
  pstAoCtx->periodCount     = 4;
  pstAoCtx->periodSize      = 1024;
  memcpy(pstAoCtx->cardName, pstAudioParam->ao_audio_node,
         strlen(pstAudioParam->ao_audio_node));
  pstAoCtx->devId           = 0;
  pstAoCtx->chnIndex        = PLAYER_AO_CHN;
  pstAoCtx->setVolume       = 100;
  pstAoCtx->setMute         = 0;
  pstAoCtx->setTrackMode    = 0;
  pstAoCtx->setFadeRate     = 0;
  pstAoCtx->getVolume       = 1;
  pstAoCtx->getMute         = 0;
  pstAoCtx->getTrackMode    = 0;
  pstAoCtx->queryChnStat    = 0;
  pstAoCtx->pauseResumeChn  = 0;
  pstAoCtx->saveFile        = 0;
  pstAoCtx->queryFileStat   = 0;
  pstAoCtx->clrChnBuf       = 0;
  pstAoCtx->clrPubAttr      = 0;
  pstAoCtx->getPubAttr      = 0;
  return RKADK_SUCCESS;
}

static RKADK_VOID QueryAoFlowGraphStat(AUDIO_DEV aoDevId, AO_CHN aoChn) {
  RKADK_S32 ret = 0;
  AO_CHN_STATE_S pstStat;
  memset(&pstStat, 0, sizeof(AO_CHN_STATE_S));
  ret = RK_MPI_AO_QueryChnStat(aoDevId, aoChn, &pstStat);
  if (ret == RKADK_SUCCESS) {
    RKADK_LOGI("query ao flow status:");
    RKADK_LOGI("total number of channel buffer : %d", pstStat.u32ChnTotalNum);
    RKADK_LOGI("free number of channel buffer : %d", pstStat.u32ChnFreeNum);
    RKADK_LOGI("busy number of channel buffer : %d", pstStat.u32ChnBusyNum);
  }
}

static AUDIO_SOUND_MODE_E FindSoundMode(RKADK_S32 ch) {
  AUDIO_SOUND_MODE_E channel = AUDIO_SOUND_MODE_BUTT;
  switch (ch) {
    case 1:
      channel = AUDIO_SOUND_MODE_MONO;
      break;
    case 2:
      channel = AUDIO_SOUND_MODE_STEREO;
      break;
    default:
      RKADK_LOGE("channel = %d not support", ch);
      return AUDIO_SOUND_MODE_BUTT;
  }

  return channel;
}

static AUDIO_BIT_WIDTH_E FindBitWidth(RKADK_S32 bit) {
  AUDIO_BIT_WIDTH_E bitWidth = AUDIO_BIT_WIDTH_BUTT;
  switch (bit) {
    case 8:
      bitWidth = AUDIO_BIT_WIDTH_8;
      break;
    case 16:
      bitWidth = AUDIO_BIT_WIDTH_16;
      break;
    case 24:
      bitWidth = AUDIO_BIT_WIDTH_24;
      break;
    default:
      RKADK_LOGE("bitwidth(%d) not support", bit);
      return AUDIO_BIT_WIDTH_BUTT;
  }

  return bitWidth;
}

static RKADK_S32 OpenDeviceAo(RKADK_PLAYER_AO_CTX_S *ctx) {
  RKADK_S32 ret = 0;
  AUDIO_DEV aoDevId = ctx->devId;
  AUDIO_SOUND_MODE_E soundMode;
  AIO_ATTR_S aoAttr;
  memset(&aoAttr, 0, sizeof(AIO_ATTR_S));

  if (strlen(ctx->cardName)) {
    snprintf((RKADK_CHAR *)(aoAttr.u8CardName),
              sizeof(aoAttr.u8CardName), "%s", ctx->cardName);
  }

  aoAttr.soundCard.channels = ctx->deviceChannel;
  aoAttr.soundCard.sampleRate = ctx->sampleRate;
  aoAttr.soundCard.bitWidth = AUDIO_BIT_WIDTH_16;

  AUDIO_BIT_WIDTH_E bitWidth = FindBitWidth(ctx->bitWidth);
  if (bitWidth == AUDIO_BIT_WIDTH_BUTT) {
    RKADK_LOGE("audio bitWidth unsupport, bitWidth = %d", bitWidth);
    return RKADK_FAILURE;
  }

  aoAttr.enBitwidth = bitWidth;
  aoAttr.enSamplerate = (AUDIO_SAMPLE_RATE_E)ctx->reSmpSampleRate;
  soundMode = FindSoundMode(ctx->channel);
  if (soundMode == AUDIO_SOUND_MODE_BUTT) {
    RKADK_LOGE("audio soundMode unsupport, soundMode = %d", soundMode);
    return RKADK_FAILURE;
  }

  aoAttr.enSoundmode = soundMode;
  aoAttr.u32FrmNum = ctx->periodCount;
  aoAttr.u32PtNumPerFrm = ctx->periodSize;

  aoAttr.u32EXFlag = 0;
  aoAttr.u32ChnCnt = 2;
  ret = RK_MPI_AO_SetPubAttr(aoDevId, &aoAttr);
  if (ret != 0) {
    RKADK_LOGE("RK_MPI_AO_SetPubAttr fail, ret = %X", ret);
    return RKADK_FAILURE;
  }

  ret = RK_MPI_AO_Enable(aoDevId);
  if (ret != 0) {
    RKADK_LOGE("RK_MPI_AO_Enable fail, ret = %X", ret);
    return RKADK_FAILURE;
  }

  ctx->openFlag = 1;
  return RKADK_SUCCESS;
}

static RKADK_S32 InitMpiAO(RKADK_PLAYER_AO_CTX_S *params) {
  RKADK_S32 result;

  result = RK_MPI_AO_EnableChn(params->devId, params->chnIndex);
  if (result != 0) {
    RKADK_LOGE("ao enable channel fail, aoChn = %d, reason = %X", params->chnIndex, result);
    return RKADK_FAILURE;
  }

  // set sample rate of input data
  result = RK_MPI_AO_EnableReSmp(params->devId, params->chnIndex,
                                (AUDIO_SAMPLE_RATE_E)params->reSmpSampleRate);
  if (result != 0) {
    RKADK_LOGE("ao enable channel fail, reason = %X, aoChn = %d", result, params->chnIndex);
    return RKADK_FAILURE;
  }

  params->bopenChannelFlag = RKADK_TRUE;
  return RKADK_SUCCESS;
}

static RKADK_S32 DeInitMpiAO(AUDIO_DEV aoDevId, AO_CHN aoChn, RKADK_BOOL *openFlag) {
  if (*openFlag) {
    RKADK_S32 result = RK_MPI_AO_DisableReSmp(aoDevId, aoChn);
    if (result != 0) {
      RKADK_LOGE("ao disable resample fail, reason = %X", result);
      return RKADK_FAILURE;
    }

    result = RK_MPI_AO_DisableChn(aoDevId, aoChn);
    if (result != 0) {
      RKADK_LOGE("ao disable channel fail, reason = %X", result);
      return RKADK_FAILURE;
    }

    *openFlag = RKADK_FALSE;
  }

  return RKADK_SUCCESS;
}

static RKADK_S32 CloseDeviceAO(RKADK_PLAYER_AO_CTX_S *ctx) {
  AUDIO_DEV aoDevId = ctx->devId;
  if (ctx->openFlag == 1) {
    RKADK_S32 result = RK_MPI_AO_Disable(aoDevId);
    if (result != 0) {
      RKADK_LOGE("ao disable fail, reason = %X", result);
      return RKADK_FAILURE;
    }
    ctx->openFlag = 0;
  }

  return RKADK_SUCCESS;
}

static RKADK_S32 SetAoChannelMode(AUDIO_DEV aoDevId, AO_CHN aoChn) {
  RKADK_S32 result = 0;
  AO_CHN_PARAM_S pstParams;
  memset(&pstParams, 0, sizeof(AO_CHN_PARAM_S));
  //aoChn0 output left channel,  aoChn1 output right channel,
  if (aoChn == 0)
    pstParams.enMode = AUDIO_CHN_MODE_LEFT;
  else if (aoChn == 1)
    pstParams.enMode = AUDIO_CHN_MODE_RIGHT;

  result = RK_MPI_AO_SetChnParams(aoDevId, aoChn, &pstParams);
  if (result != RKADK_SUCCESS) {
    RKADK_LOGE("ao set channel params, aoChn = %d", aoChn);
    return RKADK_FAILURE;
  }

  return RKADK_SUCCESS;
}

static RKADK_S32 VdecPollEvent(RKADK_S32 timeoutMsec, RKADK_S32 fd) {
  RKADK_S32 num_fds = 1;
  struct pollfd pollFds[num_fds];
  RKADK_S32 ret = 0;

  RK_ASSERT(fd > 0);
  memset(pollFds, 0, sizeof(pollFds));
  pollFds[0].fd = fd;
  pollFds[0].events = (POLLPRI | POLLIN | POLLERR | POLLNVAL | POLLHUP);

  ret = poll(pollFds, num_fds, timeoutMsec);
  if (ret > 0 && (pollFds[0].revents & (POLLERR | POLLNVAL | POLLHUP))) {
    RKADK_LOGE("fd:%d polled error", fd);
    return -1;
  }

  return ret;
}

static RKADK_VOID* SendVideoDataThread(RKADK_VOID *ptr) {
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)ptr;
  VIDEO_FRAME_INFO_S sFrame;
  VIDEO_FRAME_INFO_S tFrame;
  RK_U8 *lastFrame = RK_NULL;
  struct timespec t_begin, t_end;
  RKADK_S32 ret = 0;
  RKADK_S32 flagGetTframe = 0;
  RKADK_S32 voSendTime = 0, frameTime = 0, costtime = 0;

  if (pstPlayer->stDemuxerParam.videoAvgFrameRate <= 0) {
    RKADK_LOGE("video frame rate(%d) is out of range",
                pstPlayer->stDemuxerParam.videoAvgFrameRate);
    return RKADK_NULL;
  }

  frameTime = 1000000 / pstPlayer->stDemuxerParam.videoAvgFrameRate;
  memset(&sFrame, 0, sizeof(VIDEO_FRAME_INFO_S));
  memset(&tFrame, 0, sizeof(VIDEO_FRAME_INFO_S));

  pstPlayer->bGetPtsFlag = RKADK_TRUE;
  while (1) {
    if (pstPlayer->enPauseStatus != RKADK_PLAYER_PAUSE_START) {
      if (pstPlayer->stVdecCtx.chnFd > 0) {
        ret = VdecPollEvent(MAX_TIME_OUT_MS, pstPlayer->stVdecCtx.chnFd);
        if (ret < 0)
          continue;
      }

      ret = RK_MPI_VDEC_GetFrame(pstPlayer->stVdecCtx.chnIndex, &sFrame, MAX_TIME_OUT_MS);
      if (ret == 0) {
        if (pstPlayer->bEnableBlackBackground) {
          if (!flagGetTframe) {
            memcpy(&tFrame, &sFrame, sizeof(VIDEO_FRAME_INFO_S));
            flagGetTframe = 1;
          }
        }
        if ((sFrame.stVFrame.u32FrameFlag & (RKADK_U32)FRAME_FLAG_SNAP_END) == (RKADK_U32)FRAME_FLAG_SNAP_END) {
          if (pstPlayer->bEnableBlackBackground) {
            memcpy(&sFrame, &tFrame, sizeof(VIDEO_FRAME_INFO_S));
            lastFrame = (RK_U8 *)RK_MPI_MB_Handle2VirAddr(sFrame.stVFrame.pMbBlk);

            if (sFrame.stVFrame.enPixelFormat == RK_FMT_YUV420P) {
              memset(lastFrame, 0, sFrame.stVFrame.u32VirWidth * sFrame.stVFrame.u32VirHeight);
              lastFrame += sFrame.stVFrame.u32VirWidth * sFrame.stVFrame.u32VirHeight;
              memset(lastFrame, 128, sFrame.stVFrame.u32VirWidth * sFrame.stVFrame.u32VirHeight / 2);
              ret = RK_MPI_SYS_MmzFlushCache(sFrame.stVFrame.pMbBlk, false);
              if (ret != 0)
                RKADK_LOGE("sys mmz flush cache fail , %x.", ret);

              ret = RK_MPI_VO_SendFrame(pstPlayer->stVoCtx.u32VoLay, pstPlayer->stVoCtx.u32VoChn, &sFrame, -1);
              if (ret != 0)
                RKADK_LOGE("black backgound send fail, %x.", ret);
            }
          }
          RK_MPI_VDEC_ReleaseFrame(pstPlayer->stVdecCtx.chnIndex, &sFrame);

          RKADK_LOGI("chn %d reach eos frame.", pstPlayer->stVdecCtx.chnIndex);
          break;
        }

        if (!pstPlayer->bStopFlag) {
          if (pstPlayer->stVoCtx.u32VoLay >= 0) {
            if (!pstPlayer->bAudioExist)
              pstPlayer->positionTimeStamp = sFrame.stVFrame.u64PTS;

            clock_gettime(CLOCK_MONOTONIC, &t_end);

            if (pstPlayer->videoTimeStamp >= 0) {
              costtime = (t_end.tv_sec - t_begin.tv_sec) * 1000000 + (t_end.tv_nsec - t_begin.tv_nsec) / 1000;
              if ((RKADK_S64)sFrame.stVFrame.u64PTS - pstPlayer->videoTimeStamp > (RKADK_S64)costtime) {
                voSendTime = sFrame.stVFrame.u64PTS - pstPlayer->videoTimeStamp - costtime;

                if (!pstPlayer->bIsRtsp)
                  usleep(voSendTime);
              }
              voSendTime = frameTime;
            } else {
              voSendTime = frameTime;
            }
            pstPlayer->videoTimeStamp = sFrame.stVFrame.u64PTS;
            ret = RK_MPI_SYS_MmzFlushCache(sFrame.stVFrame.pMbBlk, false);
            if (ret != 0)
              RKADK_LOGE("sys mmz flush cache fail , %x.", ret);
            ret = RK_MPI_VO_SendFrame(pstPlayer->stVoCtx.u32VoLay, pstPlayer->stVoCtx.u32VoChn, &sFrame, -1);
            clock_gettime(CLOCK_MONOTONIC, &t_begin);

            if (!pstPlayer->bIsRtsp)
              usleep(voSendTime);
          }
        }

        RK_MPI_VDEC_ReleaseFrame(pstPlayer->stVdecCtx.chnIndex, &sFrame);
      } else {
        if ((sFrame.stVFrame.u32FrameFlag & (RKADK_U32)FRAME_FLAG_SNAP_END) == (RKADK_U32)FRAME_FLAG_SNAP_END) {
          RK_MPI_VDEC_ReleaseFrame(pstPlayer->stVdecCtx.chnIndex, &sFrame);
          RKADK_LOGI("chn %d reach eos frame.", pstPlayer->stVdecCtx.chnIndex);
          break;
        }
      }
    } else {
      usleep(1000);
    }
  }

  RKADK_LOGI("Exit send vo thread");
  return RKADK_NULL;
}

static RKADK_VOID* SendAudioDataThread(RKADK_VOID *ptr) {
  RKADK_S32 ret = 0;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)ptr;
  RKADK_S32 s32MilliSec = -1, result = 0, size = 0;
  AUDIO_FRAME_INFO_S stFrmInfo;

  memset(&stFrmInfo, 0, sizeof(AUDIO_FRAME_INFO_S));

  #ifdef WRITE_DECODER_FILE
  FILE *fp = RKADK_NULL;
  RKADK_CHAR name[128] = {0};
  mkdir("tmp", 0777);
  snprintf(name, sizeof(name), "/tmp/audio_out.pcm");

  fp = fopen(name, "wb");
  if (fp == RKADK_NULL) {
    RKADK_LOGE("can't open output file %s\n", name);
    return NULL;
  }
  #endif

  pstPlayer->bGetPtsFlag = RKADK_TRUE;
  while (1) {
    ret = RK_MPI_ADEC_GetFrame(pstPlayer->stAdecCtx.chnIndex, &stFrmInfo, pstPlayer->stAdecCtx.bBlock);
    if (!ret) {
      size = stFrmInfo.pstFrame->u32Len;
      if (!pstPlayer->bStopFlag) {
        if (size > 0)
          pstPlayer->positionTimeStamp = stFrmInfo.pstFrame->u64TimeStamp;
        result = RK_MPI_AO_SendFrame(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex, stFrmInfo.pstFrame, s32MilliSec);
        if (result < 0) {
          RKADK_LOGE("send frame fail, result = %X, TimeStamp = %lld, s32MilliSec = %d",
                      result, stFrmInfo.pstFrame->u64TimeStamp, s32MilliSec);
        }
      }

      #ifdef WRITE_DECODER_FILE
      MB_BLK bBlk = stFrmInfo.pstFrame->pMbBlk;
      RK_VOID *pstFrame = RK_MPI_MB_Handle2VirAddr(bBlk);
      fwrite(pstFrame, 1, size, fp);
      #endif

      RK_MPI_ADEC_ReleaseFrame(pstPlayer->stAdecCtx.chnIndex, &stFrmInfo);

      if (size <= 0) {
        if (!pstPlayer->bStopFlag)
          RKADK_LOGI("audio data send eof");

        break;
      }
    } else {
      RKADK_LOGE("adec stop");
      break;
    }

    if (pstPlayer->stAdecCtx.clrChnBuf) {
      RKADK_LOGI("adec clear chn(%d) buf", pstPlayer->stAdecCtx.chnIndex);
      RK_MPI_ADEC_ClearChnBuf(pstPlayer->stAdecCtx.chnIndex);
      pstPlayer->stAdecCtx.clrChnBuf = 0;
    }
  }

  #ifdef WRITE_DECODER_FILE
  if (fp)
    fclose(fp);
  #endif

  if (!pstPlayer->bStopFlag)
    RK_MPI_AO_WaitEos(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex, s32MilliSec);

  RKADK_LOGI("Exit send ao thread");
  return RKADK_NULL;
}

static RKADK_VOID* CommandThread(RKADK_VOID * ptr) {
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)ptr;
  RKADK_PARAM_COMM_CFG_S *pstCommCfg = NULL;
  pstCommCfg = RKADK_PARAM_GetCommCfg();
  if (!pstCommCfg) {
    RKADK_LOGE("RKADK_PARAM_GetCommCfg failed");
    return NULL;
  }

  {
    AUDIO_FADE_S aFade;
    aFade.bFade = RK_FALSE;
    aFade.enFadeOutRate = (AUDIO_FADE_RATE_E)pstPlayer->stAoCtx.setFadeRate;
    aFade.enFadeInRate = (AUDIO_FADE_RATE_E)pstPlayer->stAoCtx.setFadeRate;
    RK_BOOL mute = (pstPlayer->stAoCtx.setMute == 0) ? RK_FALSE : RK_TRUE;
    RK_MPI_AO_SetMute(pstPlayer->stAoCtx.devId, mute, &aFade);
    RK_MPI_AO_SetVolume(pstPlayer->stAoCtx.devId, pstCommCfg->speaker_volume);
  }

  if (pstPlayer->stAoCtx.getVolume) {
    RKADK_S32 volume = 0;
    RK_MPI_AO_GetVolume(pstPlayer->stAoCtx.devId, &volume);
    RKADK_LOGI("info : get volume = %d", volume);
    pstPlayer->stAoCtx.getVolume = 0;
  }

  if (pstPlayer->stAoCtx.getMute) {
    RK_BOOL mute = RK_FALSE;
    AUDIO_FADE_S fade;
    RK_MPI_AO_GetMute(pstPlayer->stAoCtx.devId, &mute, &fade);
    RKADK_LOGI("info : is mute = %d", mute);
    pstPlayer->stAoCtx.getMute = 0;
  }

  if (pstPlayer->stAoCtx.getTrackMode) {
    AUDIO_TRACK_MODE_E trackMode;
    RK_MPI_AO_GetTrackMode(pstPlayer->stAoCtx.devId, &trackMode);
    RKADK_LOGI("info : get track mode = %d", trackMode);
    pstPlayer->stAoCtx.getTrackMode = 0;
  }

  if (pstPlayer->stAoCtx.queryChnStat) {
    QueryAoFlowGraphStat(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex);
    pstPlayer->stAoCtx.queryChnStat = 0;
  }

  if (pstPlayer->stAoCtx.saveFile) {
    AUDIO_SAVE_FILE_INFO_S saveFile;
    memset(&saveFile, 0, sizeof(AUDIO_SAVE_FILE_INFO_S));
    if (pstPlayer->stAoCtx.dstFilePath) {
      saveFile.bCfg = RK_TRUE;
      saveFile.u32FileSize = 1024 * 1024;
      snprintf(saveFile.aFileName, sizeof(saveFile.aFileName), "%s", "ao_save_file.bin");
      snprintf(saveFile.aFilePath, sizeof(saveFile.aFilePath), "%s", pstPlayer->stAoCtx.dstFilePath);
    }
    RK_MPI_AO_SaveFile(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex, &saveFile);
    pstPlayer->stAoCtx.saveFile = 0;
  }

  if (pstPlayer->stAoCtx.queryFileStat) {
    AUDIO_FILE_STATUS_S fileStat;
    RK_MPI_AO_QueryFileStatus(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex, &fileStat);
    RKADK_LOGI("info : query save file status = %d", fileStat.bSaving);
    pstPlayer->stAoCtx.queryFileStat = 0;
  }

  if (pstPlayer->stAoCtx.pauseResumeChn) {
    usleep(500 * 1000);
    RK_MPI_AO_PauseChn(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex);
    RKADK_LOGI("AO pause");
    usleep(1000 * 1000);
    RK_MPI_AO_ResumeChn(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex);
    RKADK_LOGI("AO resume");
    pstPlayer->stAoCtx.pauseResumeChn = 0;
  }

  if (pstPlayer->stAoCtx.clrChnBuf) {
    RK_MPI_AO_ClearChnBuf(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex);
    pstPlayer->stAoCtx.clrChnBuf = 0;
  }

  if (pstPlayer->stAoCtx.clrPubAttr) {
    RK_MPI_AO_ClrPubAttr(pstPlayer->stAoCtx.devId);
    pstPlayer->stAoCtx.clrPubAttr = 0;
  }

  if (pstPlayer->stAoCtx.getPubAttr) {
    AIO_ATTR_S pstAttr;
    RK_MPI_AO_GetPubAttr(pstPlayer->stAoCtx.devId, &pstAttr);
    RKADK_LOGI("input stream rate = %d", pstAttr.enSamplerate);
    RKADK_LOGI("input stream sound mode = %d", pstAttr.enSoundmode);
    RKADK_LOGI("open sound card rate = %d", pstAttr.soundCard.sampleRate);
    RKADK_LOGI("open sound card channel = %d", pstAttr.soundCard.channels);
    pstPlayer->stAoCtx.getPubAttr = 0;
  }

  return RKADK_NULL;
}

static RKADK_S32 BufferFree(RKADK_VOID *opaque) {
  if (opaque) {
    free(opaque);
    opaque = NULL;
  }

  return 0;
}

static RKADK_VOID DoPullDemuxerVideoPacket(RKADK_VOID* pHandle) {
  DemuxerPacket *pstDemuxerPacket = (DemuxerPacket *)pHandle;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pstDemuxerPacket->ptr;
  RKADK_S32 ret = 0;
  VDEC_STREAM_S stStream;
  MB_BLK buffer = RKADK_NULL;
  MB_EXT_CONFIG_S stMbExtConfig;

  if (!pstPlayer->enSeekStatus || pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_SEND
      || (pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT && pstDemuxerPacket->s8EofFlag)
      || (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_START
      && pstDemuxerPacket->s8SpecialFlag && pstDemuxerPacket->s64Pts >= pstPlayer->seekTimeStamp)) {

    if (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_START) {
      pstPlayer->seekTimeStamp = pstDemuxerPacket->s64Pts;
      pstPlayer->enSeekStatus = RKADK_PLAYER_SEEK_SEND;
    }

    memset(&stMbExtConfig, 0, sizeof(MB_EXT_CONFIG_S));
    stMbExtConfig.pFreeCB = BufferFree;
    stMbExtConfig.pOpaque = (RKADK_VOID *)pstDemuxerPacket->s8PacketData;
    stMbExtConfig.pu8VirAddr = (RK_U8 *)pstDemuxerPacket->s8PacketData;
    stMbExtConfig.u64Size = pstDemuxerPacket->s32PacketSize;

    RK_MPI_SYS_CreateMB(&buffer, &stMbExtConfig);

    stStream.u64PTS = pstDemuxerPacket->s64Pts;
    stStream.pMbBlk = buffer;
    stStream.u32Len = pstDemuxerPacket->s32PacketSize;
    stStream.bEndOfStream = pstDemuxerPacket->s8EofFlag ? RK_TRUE : RK_FALSE;
    stStream.bEndOfFrame = pstDemuxerPacket->s8EofFlag ? RK_TRUE : RK_FALSE;
    stStream.bBypassMbBlk = RK_TRUE;

__RETRY:
    ret = RK_MPI_VDEC_SendStream(pstPlayer->stVdecCtx.chnIndex, &stStream, -1);
    if (ret < 0) {
      if (pstPlayer->bStopFlag) {
        RK_MPI_MB_ReleaseMB(stStream.pMbBlk);
        return;
      }

      usleep(1000llu);
      goto  __RETRY;
    } else {
      RK_MPI_MB_ReleaseMB(stStream.pMbBlk);
    }
  } else {
    if (pstDemuxerPacket->s8PacketData) {
      free(pstDemuxerPacket->s8PacketData);
      pstDemuxerPacket->s8PacketData = NULL;
    }
  }

  return;
}

static RKADK_VOID DoPullDemuxerAudioPacket(RKADK_VOID* pHandle) {
  RKADK_S32 ret = 0;
  MB_EXT_CONFIG_S stExtConfig;
  DemuxerPacket *pstDemuxerPacket = (DemuxerPacket *)pHandle;
  AUDIO_STREAM_S stAudioStream;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pstDemuxerPacket->ptr;

   if (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_WAIT) {
    if (pstDemuxerPacket->s8PacketData) {
      free(pstDemuxerPacket->s8PacketData);
      pstDemuxerPacket->s8PacketData = NULL;
    }

    return;
  } else if (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_START) {
    while(pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_SEND || !pstPlayer->enSeekStatus)
      usleep(1000);

    if (pstDemuxerPacket->s8PacketData) {
      free(pstDemuxerPacket->s8PacketData);
      pstDemuxerPacket->s8PacketData = NULL;
    }
  } else if (pstDemuxerPacket->s8EofFlag) {
    if (pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT) {
      RK_MPI_ADEC_SendEndOfStream(pstPlayer->stAdecCtx.chnIndex, RK_FALSE);
      pstPlayer->bAudioStopFlag = RKADK_TRUE;
      if (!pstPlayer->bStopFlag)
        RKADK_LOGI("read eos packet, now send eos packet!");
    }
  } else if (!pstPlayer->enSeekStatus || (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_SEND
             && pstDemuxerPacket->s64Pts >= pstPlayer->seekTimeStamp)) {
    stAudioStream.u32Len = pstDemuxerPacket->s32PacketSize;
    stAudioStream.u64TimeStamp = pstDemuxerPacket->s64Pts;
    stAudioStream.u32Seq = pstDemuxerPacket->s32Series;
    stAudioStream.bBypassMbBlk = RK_TRUE;

    memset(&stExtConfig, 0, sizeof(MB_EXT_CONFIG_S));
    stExtConfig.pFreeCB = BufferFree;
    stExtConfig.pOpaque = (RKADK_VOID *)pstDemuxerPacket->s8PacketData;
    stExtConfig.pu8VirAddr = (RK_U8*)pstDemuxerPacket->s8PacketData;
    stExtConfig.u64Size    = pstDemuxerPacket->s32PacketSize;
    RK_MPI_SYS_CreateMB(&(stAudioStream.pMbBlk), &stExtConfig);

__RETRY:
    ret = RK_MPI_ADEC_SendStream(pstPlayer->stAdecCtx.chnIndex, &stAudioStream, pstPlayer->stAdecCtx.bBlock);
    if (ret != RK_SUCCESS) {
      RKADK_LOGE("fail to send adec stream.");
      goto __RETRY;
    }

    RK_MPI_MB_ReleaseMB(stAudioStream.pMbBlk);
  } else {
    if (pstDemuxerPacket->s8PacketData) {
      free(pstDemuxerPacket->s8PacketData);
      pstDemuxerPacket->s8PacketData = NULL;
    }
  }

  return;
}

static RKADK_VOID DoPullDemuxerWavPacket(RKADK_VOID* pHandle) {
  RKADK_S32 ret = 0;
  MB_EXT_CONFIG_S stMbExtConfig;
  RKADK_S32 s32MilliSec = -1;
  DemuxerPacket *pstDemuxerPacket = (DemuxerPacket *)pHandle;
  AUDIO_FRAME_S frame;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pstDemuxerPacket->ptr;
  pstPlayer->bGetPtsFlag = RKADK_TRUE;
  if (!pstPlayer->bStopFlag) {
    if (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_WAIT) {
      if (pstDemuxerPacket->s8PacketData) {
        free(pstDemuxerPacket->s8PacketData);
        pstDemuxerPacket->s8PacketData = NULL;
      }

      return;
    } else if (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_START) {
      while(pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_SEND || !pstPlayer->enSeekStatus)
        usleep(1000);

      if (pstDemuxerPacket->s8PacketData) {
        free(pstDemuxerPacket->s8PacketData);
        pstDemuxerPacket->s8PacketData = NULL;
      }
    } else if (!pstPlayer->enSeekStatus || pstDemuxerPacket->s8EofFlag || (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_SEND
               && (pstDemuxerPacket->s64Pts >= pstPlayer->seekTimeStamp))) {

      if (!pstDemuxerPacket->s8EofFlag)
        pstPlayer->positionTimeStamp = pstDemuxerPacket->s64Pts;

      frame.u32Len = pstDemuxerPacket->s32PacketSize;
      frame.u64TimeStamp = pstDemuxerPacket->s64Pts;
      frame.enBitWidth = FindBitWidth(pstPlayer->stAoCtx.bitWidth);
      frame.enSoundMode = FindSoundMode(pstPlayer->stDemuxerParam.audioChannels);
      frame.bBypassMbBlk = RK_FALSE;

      memset(&stMbExtConfig, 0, sizeof(stMbExtConfig));
      stMbExtConfig.pOpaque = (RKADK_VOID *)pstDemuxerPacket->s8PacketData;
      stMbExtConfig.pu8VirAddr = (RK_U8*)pstDemuxerPacket->s8PacketData;
      stMbExtConfig.u64Size = pstDemuxerPacket->s32PacketSize;
      RK_MPI_SYS_CreateMB(&(frame.pMbBlk), &stMbExtConfig);

__RETRY:
      ret = RK_MPI_AO_SendFrame(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex, &frame, s32MilliSec);
      if (ret < 0) {
        RK_LOGE("send frame fail, ret = %d, TimeStamp = %lld, s32MilliSec = %d",
                  ret, frame.u64TimeStamp, s32MilliSec);
        goto __RETRY;
      }

      RK_MPI_MB_ReleaseMB(frame.pMbBlk);
      if (pstDemuxerPacket->s8PacketData) {
        free(pstDemuxerPacket->s8PacketData);
        pstDemuxerPacket->s8PacketData = NULL;
      }

      if (pstDemuxerPacket->s32PacketSize <= 0) {
        if (pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT) {
          pstPlayer->bWavEofFlag = RKADK_TRUE;
          RK_MPI_AO_WaitEos(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex, s32MilliSec);
          pthread_mutex_lock(&pstPlayer->WavMutex);
          if (pstPlayer->bAudioStopFlag == RKADK_TRUE) {
            if (!pstPlayer->bStopFlag)
              RKADK_LOGI("read eos packet, now send eos packet!");
            pthread_cond_signal(&pstPlayer->WavCond);
          } else
            pstPlayer->bAudioStopFlag = RKADK_TRUE;

          pthread_mutex_unlock(&pstPlayer->WavMutex);
        }
      }
    }
  }

  return;
}

static RKADK_S32 RKADK_PLAYER_CreateVO(RKADK_PLAYER_HANDLE_S *pstPlayer, RKADK_PLAYER_FRAME_INFO_S *pstFrameInfo) {
  RKADK_CHECK_POINTER(pstPlayer, RKADK_FAILURE);
  RKADK_S32 ret = 0;
  VO_VIDEO_LAYER_ATTR_S    stLayerAttr;
  VO_PUB_ATTR_S            stPubAttr;
  VO_CHN_ATTR_S stChnAttr;

  memset(&stPubAttr, 0, sizeof(VO_PUB_ATTR_S));
  memset(&stChnAttr, 0, sizeof(VO_CHN_ATTR_S));
  memset(&stLayerAttr, 0, sizeof(VO_VIDEO_LAYER_ATTR_S));

  stPubAttr.enIntfType = RKADK_MEDIA_GetRkVoIntfTpye(pstPlayer->stVoCtx.enIntfType);
  stPubAttr.enIntfSync = VO_OUTPUT_DEFAULT;

  stLayerAttr.enPixFormat = pstPlayer->stVoCtx.pixFormat;
  stLayerAttr.u32DispFrmRt = pstPlayer->stVoCtx.dispFrmRt;
  if (pstFrameInfo->enVoSpliceMode == SPLICE_MODE_BYPASS) {
    stLayerAttr.stDispRect.s32X = pstPlayer->stVoCtx.x;
    stLayerAttr.stDispRect.s32Y = pstPlayer->stVoCtx.y;
    stLayerAttr.stDispRect.u32Width = pstPlayer->stVoCtx.dispWidth;
    stLayerAttr.stDispRect.u32Height = pstPlayer->stVoCtx.dispHeight;
  }

  stChnAttr.stRect.s32X = pstPlayer->stVoCtx.x;
  stChnAttr.stRect.s32Y = pstPlayer->stVoCtx.y;
  stChnAttr.stRect.u32Width = pstPlayer->stVoCtx.dispWidth;
  stChnAttr.stRect.u32Height = pstPlayer->stVoCtx.dispHeight;
  stChnAttr.u32FgAlpha = 255;
  stChnAttr.u32BgAlpha = 0;
  stChnAttr.enMirror = pstPlayer->stVoCtx.enMirror;
  stChnAttr.enRotation = pstPlayer->stVoCtx.enRotation;
  stChnAttr.u32Priority = 1;
  RKADK_LOGE("rect: [%d %d %d %d]",
            stChnAttr.stRect.s32X, stChnAttr.stRect.s32Y = pstPlayer->stVoCtx.y,
            stChnAttr.stRect.u32Width, stChnAttr.stRect.u32Height);

  ret = RKADK_MPI_VO_Init(pstPlayer->stVoCtx.u32VoLay, pstPlayer->stVoCtx.u32VoDev,
                        pstPlayer->stVoCtx.u32VoChn, &stPubAttr, &stLayerAttr, &stChnAttr,
                        pstFrameInfo->enVoSpliceMode);
  if (ret) {
    RKADK_LOGE("RKADK_MPI_Vo_Init failed, ret = %x", ret);
    return ret;
  }

  return RKADK_SUCCESS;
}

static RKADK_S32 RKADK_PLAYER_DestroyVO (RKADK_PLAYER_HANDLE_S *pstPlayer) {
  RKADK_CHECK_POINTER(pstPlayer, RKADK_FAILURE);
  RKADK_S32 ret = 0;

  ret = RKADK_MPI_VO_DeInit(pstPlayer->stVoCtx.u32VoLay, pstPlayer->stVoCtx.u32VoDev,
                        pstPlayer->stVoCtx.u32VoChn);
  if (ret != RKADK_SUCCESS) {
    RKADK_LOGE("RK_MPI_VO_DisableChn failed, ret = %X\n", ret);
    return RKADK_FAILURE;
  }

  return RKADK_SUCCESS;
}

RKADK_S32 RKADK_PLAYER_Create(RKADK_MW_PTR *pPlayer,
                              RKADK_PLAYER_CFG_S *pstPlayCfg) {
  RKADK_DEMUXER_INPUT_S stDemuxerInput;
  bool bSysInit = false;
  RKADK_PLAYER_HANDLE_S *pstPlayer = NULL;

  RKADK_CHECK_POINTER(pstPlayCfg, RKADK_FAILURE);

  if (*pPlayer) {
    RKADK_LOGE("player has been created");
    return RKADK_FAILURE;
  }

  bSysInit = RKADK_MPI_SYS_CHECK();
  if (!bSysInit) {
    RKADK_LOGE("System is not initialized");
    return RKADK_FAILURE;
  }

  RKADK_LOGI("Create Player[%d, %d] Start...", pstPlayCfg->bEnableVideo,
             pstPlayCfg->bEnableAudio);

  if (pstPlayCfg->bEnableVideo == RKADK_FALSE && pstPlayCfg->bEnableAudio == RKADK_FALSE) {
    RKADK_LOGE("bEnableVideo and bEnableAudio are not enable");
    return RKADK_FAILURE;
  }

  pstPlayer = (RKADK_PLAYER_HANDLE_S *)malloc(sizeof(RKADK_PLAYER_HANDLE_S));
  if (!pstPlayer) {
    RKADK_LOGE("malloc pstPlayer failed");
    return RKADK_FAILURE;
  }

  memset(pstPlayer, 0, sizeof(RKADK_PLAYER_HANDLE_S));
  pstPlayer->pfnPlayerCallback = pstPlayCfg->pfnPlayerCallback;
  pstPlayer->bEnableVideo = pstPlayCfg->bEnableVideo;
  pstPlayer->bEnableAudio = pstPlayCfg->bEnableAudio;
  pstPlayer->bEnableBlackBackground = pstPlayCfg->bEnableBlackBackground;

  stDemuxerInput.ptr = (RKADK_VOID *)pstPlayer;
  stDemuxerInput.readModeFlag = DEMUXER_TYPE_PASSIVE;
  stDemuxerInput.videoEnableFlag = pstPlayer->bEnableVideo;
  stDemuxerInput.audioEnableFlag = pstPlayer->bEnableAudio;
  stDemuxerInput.transport = pstPlayCfg->stRtspCfg.transport;
  if (RKADK_DEMUXER_Create(&pstPlayer->pDemuxerCfg, &stDemuxerInput)) {
    RKADK_LOGE("RKADK_DEMUXER_Create failed");
    goto __FAILED;
  }

  if (pstPlayer->bEnableVideo) {
    if (VdecCtxInit(&pstPlayer->stVdecCtx)) {
      RKADK_LOGE("Create VDEC ctx failed");
      goto __FAILED;
    }

    if (RKADK_PLAYER_SetVoCtx(&(pstPlayer->stVoCtx), &pstPlayCfg->stFrmInfo)) {
      RKADK_LOGE("Create VO ctx failed");
      goto __FAILED;
    }

    if (RKADK_PLAYER_CreateVO(pstPlayer, &pstPlayCfg->stFrmInfo)) {
      RKADK_LOGE("Create VO failed");
      goto __FAILED;
    }
  }

  if (pstPlayer->bEnableAudio) {
    if (RKADK_AUDIO_DECODER_Register(RKADK_CODEC_TYPE_MP3)) {
      RKADK_LOGE("register mp3 failed");
      goto __FAILED;
    }

    if (AdecCtxInit(&pstPlayer->stAdecCtx)) {
      RKADK_LOGE("Create ADEC ctx failed");
      goto __FAILED;
    }

    if(AoCtxInit(&pstPlayer->stAoCtx)) {
      RKADK_LOGE("Create AO ctx failed");
      goto __FAILED;
    }
  }

  pthread_mutex_init(&(pstPlayer->WavMutex), NULL);
  pthread_cond_init(&(pstPlayer->WavCond), NULL);
  pthread_mutex_init(&(pstPlayer->PauseVideoMutex), NULL);
  pthread_mutex_init(&(pstPlayer->PauseAudioMutex), NULL);
  RKADK_LOGI("Create Player[%d, %d] End...", pstPlayCfg->bEnableVideo,
             pstPlayCfg->bEnableAudio);
  *pPlayer = (RKADK_MW_PTR)pstPlayer;
  return RKADK_SUCCESS;

__FAILED:
  if (pstPlayer->bEnableVideo)
    RKADK_PLAYER_DestroyVO(pstPlayer);

  if (pstPlayer->pfnPlayerCallback != NULL)
    pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_ERROR, NULL);

  if (pstPlayer)
    free(pstPlayer);

  return RKADK_FAILURE;
}

RKADK_S32 RKADK_PLAYER_Destroy(RKADK_MW_PTR pPlayer) {
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  RKADK_S32 ret = 0;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;
  RKADK_LOGI("Destory Player Start...");
  if (pstPlayer->bStopFlag != RKADK_TRUE)
    ret = RKADK_PLAYER_Stop(pPlayer);

  if (pstPlayer->bEnableVideo == RKADK_TRUE)
    ret |= RKADK_PLAYER_DestroyVO(pstPlayer);

  if (RKADK_AUDIO_DECODER_UnRegister(RKADK_CODEC_TYPE_MP3))
    RKADK_LOGE("unregister mp3 failed");

  if (pstPlayer->pDemuxerCfg)
    RKADK_DEMUXER_Destroy(&pstPlayer->pDemuxerCfg);

  pthread_mutex_destroy(&(pstPlayer->WavMutex));
  pthread_cond_destroy(&(pstPlayer->WavCond));
  pthread_mutex_destroy(&(pstPlayer->PauseVideoMutex));
  pthread_mutex_destroy(&(pstPlayer->PauseAudioMutex));

  if (pstPlayer)
    free(pstPlayer);

  if (!ret)
    RKADK_LOGI("Destory Player End...");

  return ret;
}

RKADK_S32 RKADK_PLAYER_SetDataSource(RKADK_MW_PTR pPlayer,
                                     const RKADK_CHAR *pszfilePath) {
  const char *suffix = NULL;

  RKADK_CHECK_POINTER(pszfilePath, RKADK_FAILURE);
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);

  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;
  RKADK_CODEC_TYPE_E eAudioCodecType = RKADK_CODEC_TYPE_BUTT;

  if ((strlen(pszfilePath) <= 0) || (strlen(pszfilePath) >= RKADK_PATH_LEN)) {
    RKADK_LOGE("The length(%d) of the file name is unreasonable", strlen(pszfilePath));
    if (pstPlayer->pfnPlayerCallback != NULL)
      pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_ERROR, NULL);
    return RKADK_FAILURE;
  }

  pstPlayer->bVideoExist = RKADK_FALSE;
  pstPlayer->bStopFlag = RKADK_FALSE;
  pstPlayer->bAudioStopFlag = RKADK_FALSE;
  pstPlayer->bAudioExist = RKADK_FALSE;
  pstPlayer->videoTimeStamp = -1;

  if (pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT) {
    memset(pstPlayer->pFilePath, 0, RKADK_PATH_LEN);
    memcpy(pstPlayer->pFilePath, pszfilePath, strlen(pszfilePath));
  }

  if (strstr(pszfilePath, "rtsp://"))
    pstPlayer->bIsRtsp = RKADK_TRUE;
  else
    suffix = strrchr(pszfilePath, '.');

  if (!suffix && !pstPlayer->bIsRtsp) {
    RKADK_LOGD("Non-file format or rtsp: %s", pszfilePath);
    return RKADK_FAILURE;
  }

  if((suffix && !strcmp(suffix, ".mp4")) || pstPlayer->bIsRtsp) {
    pstPlayer->demuxerFlag = MIX_VIDEO_FLAG;
    pstPlayer->stDemuxerParam.pstReadPacketCallback.pfnReadVideoPacketCallback = DoPullDemuxerVideoPacket;
    pstPlayer->stDemuxerParam.pstReadPacketCallback.pfnReadAudioPacketCallback = DoPullDemuxerAudioPacket;
    if (RKADK_DEMUXER_GetParam(pstPlayer->pDemuxerCfg, pszfilePath, &pstPlayer->stDemuxerParam)) {
      RKADK_LOGE("RKADK_DEMUXER_GetParam failed");
      goto __FAILED;
    }

    if (pstPlayer->bEnableVideo == RKADK_TRUE) {
      if (pstPlayer->stDemuxerParam.pVideoCodec != NULL) {
        pstPlayer->bVideoExist = RKADK_TRUE;

        if (strcmp(pstPlayer->stDemuxerParam.pVideoCodec, "h264") && strcmp(pstPlayer->stDemuxerParam.pVideoCodec, "h265")) {
          RKADK_LOGE("Unsupported video format(%s)", pstPlayer->stDemuxerParam.pVideoCodec);
          goto __FAILED;
        }

        if (pstPlayer->stDemuxerParam.videoWidth <= 0 || pstPlayer->stDemuxerParam.videoHeigh <= 0) {
          RKADK_LOGE("error: videoWidth = %d\n, videoHeigh = %d\n", pstPlayer->stDemuxerParam.videoWidth,
                      pstPlayer->stDemuxerParam.videoHeigh);
          goto __FAILED;
        }

        if (!strcmp(pstPlayer->stDemuxerParam.pVideoCodec, "h264")) {
          pstPlayer->stVdecCtx.eCodecType = RKADK_CODEC_TYPE_H264;
        } else if (!strcmp(pstPlayer->stDemuxerParam.pVideoCodec, "h265")) {
#ifdef RV1106_1103
          RKADK_LOGE("1106 nonsupport h265");
          goto __FAILED;
#else
          pstPlayer->stVdecCtx.eCodecType = RKADK_CODEC_TYPE_H265;
#endif
        }

        pstPlayer->stVdecCtx.srcWidth = pstPlayer->stDemuxerParam.videoWidth;
        pstPlayer->stVdecCtx.srcHeight = pstPlayer->stDemuxerParam.videoHeigh;

        if (pstPlayer->stDemuxerParam.VideoFormat == DEMUXER_VIDEO_YUV420SP_10BIT)
          pstPlayer->stVdecCtx.outputPixFmt = RK_FMT_YUV420SP_10BIT;
        else
          pstPlayer->stVdecCtx.outputPixFmt = RK_FMT_YUV420SP;
      } else if (pstPlayer->bEnableAudio == RKADK_FALSE) {
        RKADK_LOGE("Video does not exist and audio exists but cannot be played");
        goto __FAILED;
      }
    } else
      RKADK_LOGW("video is unable");

    if (pstPlayer->bEnableAudio == RKADK_TRUE) {
      if (pstPlayer->stDemuxerParam.pAudioCodec != NULL) {
        if (!strcmp(pstPlayer->stDemuxerParam.pAudioCodec, "mp3"))
          eAudioCodecType = RKADK_CODEC_TYPE_MP3;
        else if (!strcmp(pstPlayer->stDemuxerParam.pAudioCodec, "wav"))
          eAudioCodecType = RKADK_CODEC_TYPE_PCM;
        else if (!strcmp(pstPlayer->stDemuxerParam.pAudioCodec, "pcm_alaw"))
          eAudioCodecType = RKADK_CODEC_TYPE_G711A;
        else {
          RKADK_LOGE("Unsupported audio format(%s)", pstPlayer->stDemuxerParam.pAudioCodec);
          goto __FAILED;
        }

        pstPlayer->bAudioExist = RKADK_TRUE;
        pstPlayer->stAdecCtx.sampleRate = pstPlayer->stDemuxerParam.audioSampleRate;
        pstPlayer->stAdecCtx.channel = pstPlayer->stDemuxerParam.audioChannels;
        pstPlayer->stAdecCtx.eCodecType = eAudioCodecType;
        pstPlayer->stAoCtx.reSmpSampleRate = pstPlayer->stDemuxerParam.audioSampleRate;

        if (pstPlayer->stDemuxerParam.audioFormat == 0)
          pstPlayer->stAoCtx.bitWidth = 8;
        else if (pstPlayer->stDemuxerParam.audioFormat == 1)
          pstPlayer->stAoCtx.bitWidth = 16;
        else {
          RKADK_LOGE("AO create failed, audioFormat = %d", pstPlayer->stDemuxerParam.audioFormat);
          goto __FAILED;
        }

        if (pstPlayer->stDemuxerParam.audioChannels <= 0 ||
            pstPlayer->stDemuxerParam.audioSampleRate <= 0) {
          RKADK_LOGE("AO create failed, channel = %d, reSmpSampleRate = %d",
                      pstPlayer->stDemuxerParam.audioChannels, pstPlayer->stDemuxerParam.audioSampleRate);
        }
      } else if (pstPlayer->bEnableVideo == RKADK_FALSE) {
        RKADK_LOGE("Audio does not exist, and video exists but cannot be played");
        goto __FAILED;
      }
    } else
      RKADK_LOGW("audio is unable");
  } else if (suffix && (!strcmp(suffix, ".h264") || !strcmp(suffix, ".h265"))) {
    if (!pstPlayer->bEnableVideo) {
      RKADK_LOGE("video is unable");
      goto __FAILED;
    }

    if (!strcmp(suffix, ".h264")) {
      pstPlayer->stVdecCtx.eCodecType = RKADK_CODEC_TYPE_H264;
    } else if (!strcmp(suffix, ".h265")) {
#ifdef RV1106_1103
      RKADK_LOGE("1106 nonsupport h265");
      goto __FAILED;
#else
      pstPlayer->stVdecCtx.eCodecType = RKADK_CODEC_TYPE_H265;
#endif
    }

    pstPlayer->demuxerFlag = VIDEO_FLAG;
    pstPlayer->stDemuxerParam.pstReadPacketCallback.pfnReadVideoPacketCallback = DoPullDemuxerVideoPacket;
    pstPlayer->stDemuxerParam.pstReadPacketCallback.pfnReadAudioPacketCallback = DoPullDemuxerAudioPacket;
    if (RKADK_DEMUXER_GetParam(pstPlayer->pDemuxerCfg, pszfilePath, &pstPlayer->stDemuxerParam)) {
      RKADK_LOGE("RKADK_DEMUXER_GetParam failed");
      goto __FAILED;
    }

    if (pstPlayer->stDemuxerParam.pVideoCodec != NULL) {
      pstPlayer->bVideoExist = RKADK_TRUE;

      if (strcmp(pstPlayer->stDemuxerParam.pVideoCodec, "h264")) {
        RKADK_LOGE("Unsupported video format(%s)", pstPlayer->stDemuxerParam.pVideoCodec);
        goto __FAILED;
      }

      if (pstPlayer->stDemuxerParam.videoWidth <= 0 || pstPlayer->stDemuxerParam.videoHeigh <= 0) {
        RKADK_LOGE("error: videoWidth = %d\n, videoHeigh = %d\n", pstPlayer->stDemuxerParam.videoWidth,
                    pstPlayer->stDemuxerParam.videoHeigh);
        goto __FAILED;
      }

      pstPlayer->stVdecCtx.srcWidth = pstPlayer->stDemuxerParam.videoWidth;
      pstPlayer->stVdecCtx.srcHeight = pstPlayer->stDemuxerParam.videoHeigh;

      if (pstPlayer->stDemuxerParam.VideoFormat == DEMUXER_VIDEO_YUV420SP_10BIT)
        pstPlayer->stVdecCtx.outputPixFmt = RK_FMT_YUV420SP_10BIT;
      else
        pstPlayer->stVdecCtx.outputPixFmt = RK_FMT_YUV420SP;
    } else if (pstPlayer->bEnableAudio == RKADK_FALSE) {
      RKADK_LOGE("Video does not exist and audio exists but cannot be played");
      goto __FAILED;
    }
  } else if (suffix && (!strcmp(suffix, ".mp3") || !strcmp(suffix, ".wav"))) {
    if (!pstPlayer->bEnableAudio) {
      RKADK_LOGE("audio is unable");
      goto __FAILED;
    }

    pstPlayer->demuxerFlag = AUDIO_FLAG;

    pstPlayer->stDemuxerParam.pstReadPacketCallback.pfnReadVideoPacketCallback = DoPullDemuxerVideoPacket;
    if (!strcmp(suffix, ".wav"))
      pstPlayer->stDemuxerParam.pstReadPacketCallback.pfnReadAudioPacketCallback = DoPullDemuxerWavPacket;
    else
      pstPlayer->stDemuxerParam.pstReadPacketCallback.pfnReadAudioPacketCallback = DoPullDemuxerAudioPacket;

    if (RKADK_DEMUXER_GetParam(pstPlayer->pDemuxerCfg, pszfilePath, &pstPlayer->stDemuxerParam)) {
      RKADK_LOGE("RKADK_DEMUXER_GetParam failed");
      goto __FAILED;
    }

    if (pstPlayer->stDemuxerParam.pAudioCodec != NULL) {
      if (!strcmp(pstPlayer->stDemuxerParam.pAudioCodec, "mp3"))
        eAudioCodecType = RKADK_CODEC_TYPE_MP3;
      else if (!strcmp(pstPlayer->stDemuxerParam.pAudioCodec, "wav"))
        eAudioCodecType = RKADK_CODEC_TYPE_PCM;
        else if (!strcmp(pstPlayer->stDemuxerParam.pAudioCodec, "pcm_alaw"))
          eAudioCodecType = RKADK_CODEC_TYPE_G711A;
      else {
        RKADK_LOGE("Unsupported audio format(%s)", pstPlayer->stDemuxerParam.pAudioCodec);
        goto __FAILED;
      }

      pstPlayer->bAudioExist = RKADK_TRUE;

      pstPlayer->stAdecCtx.sampleRate = pstPlayer->stDemuxerParam.audioSampleRate;
      pstPlayer->stAdecCtx.channel = pstPlayer->stDemuxerParam.audioChannels;
      pstPlayer->stAdecCtx.eCodecType = eAudioCodecType;
      pstPlayer->stAoCtx.reSmpSampleRate = pstPlayer->stDemuxerParam.audioSampleRate;

      if (pstPlayer->stDemuxerParam.audioFormat == 0)
        pstPlayer->stAoCtx.bitWidth = 8;
      else if (pstPlayer->stDemuxerParam.audioFormat == 1)
        pstPlayer->stAoCtx.bitWidth = 16;
      else {
        RKADK_LOGE("AO create failed, audioFormat = %d", pstPlayer->stDemuxerParam.audioFormat);
        goto __FAILED;
      }

      if (pstPlayer->stDemuxerParam.audioChannels <= 0 ||
          pstPlayer->stDemuxerParam.audioSampleRate <= 0) {
        RKADK_LOGE("AO create failed, channel = %d, reSmpSampleRate = %d",
                    pstPlayer->stDemuxerParam.audioChannels, pstPlayer->stDemuxerParam.audioSampleRate);
      }
    }
  } else {
    RKADK_LOGE("Unsupported file format(%s)", pszfilePath);
    goto __FAILED;
  }

  return RKADK_SUCCESS;

__FAILED:
  pstPlayer->bStopFlag = RKADK_FALSE;
  pstPlayer->bAudioStopFlag = RKADK_FALSE;
  pstPlayer->bAudioExist = RKADK_FALSE;
  memset(pstPlayer->pFilePath, 0, RKADK_PATH_LEN);
  if (pstPlayer->pfnPlayerCallback != NULL)
    pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_ERROR, NULL);

  return RKADK_FAILURE;
}

RKADK_S32 RKADK_PLAYER_Prepare(RKADK_MW_PTR pPlayer) {
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;

  if (pstPlayer->bVideoExist) {
    if (pstPlayer->bIsRtsp)
      pstPlayer->stVdecCtx.frameBufferCnt = 8;
    else
      pstPlayer->stVdecCtx.frameBufferCnt = 3;

    if (CreateVdec(&pstPlayer->stVdecCtx)) {
      RKADK_LOGE("Vdec set param failed");
      goto __FAILED;
    }
  } else
    RKADK_LOGE("fail to find video stream in input file");

  if (pstPlayer->bAudioExist) {
    if (pstPlayer->stAdecCtx.eCodecType != RKADK_CODEC_TYPE_PCM) {
      if (CreateAdec(&pstPlayer->stAdecCtx)) {
        RKADK_LOGE("set Adec ctx failed");
        goto __FAILED;
      }
    }
  }

  if (pstPlayer->pfnPlayerCallback != NULL && pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT)
    pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_PREPARED, NULL);

  return RKADK_SUCCESS;
__FAILED:
  if (pstPlayer->pfnPlayerCallback != NULL)
    pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_ERROR, NULL);

  return RKADK_FAILURE;
}

RKADK_VOID *EventEOF(RKADK_VOID *arg) {
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)arg;

  if (pstPlayer->bVideoExist || pstPlayer->demuxerFlag == VIDEO_FLAG)
    pthread_create(&pstPlayer->stThreadParam.tidVideoSend, RKADK_NULL, SendVideoDataThread, arg);

  if (pstPlayer->bAudioExist) {
    if (pstPlayer->stAdecCtx.eCodecType != RKADK_CODEC_TYPE_PCM)
      pthread_create(&pstPlayer->stThreadParam.tidAudioSend, RKADK_NULL, SendAudioDataThread, arg);

    pthread_create(&pstPlayer->stThreadParam.tidAudioCommand, RKADK_NULL, CommandThread, arg);
  }

  if (pstPlayer->stThreadParam.tidVideoSend) {
    pthread_join(pstPlayer->stThreadParam.tidVideoSend, RKADK_NULL);
    pstPlayer->stThreadParam.tidVideoSend = 0;
  }

  if (pstPlayer->stThreadParam.tidAudioSend) {
    pthread_join(pstPlayer->stThreadParam.tidAudioSend, RKADK_NULL);
    pstPlayer->stThreadParam.tidAudioSend = 0;
  }

  if (pstPlayer->stThreadParam.tidAudioCommand) {
    pthread_join(pstPlayer->stThreadParam.tidAudioCommand, RKADK_NULL);
    pstPlayer->stThreadParam.tidAudioCommand = 0;
  }

  pthread_mutex_lock(&pstPlayer->WavMutex);
  if (!pstPlayer->bStopFlag && pstPlayer->bAudioExist
      && pstPlayer->stAdecCtx.eCodecType == RKADK_CODEC_TYPE_PCM
      && pstPlayer->bAudioStopFlag == RKADK_FALSE) {
    pstPlayer->bAudioStopFlag = RKADK_TRUE;
    pthread_cond_wait(&pstPlayer->WavCond, &pstPlayer->WavMutex);
  }
  pthread_mutex_unlock(&pstPlayer->WavMutex);

  if (pstPlayer->duration != 0 && !pstPlayer->bStopFlag)
    pstPlayer->positionTimeStamp = (RKADK_S64)(pstPlayer->duration * 1000);

  if (pstPlayer->pfnPlayerCallback != NULL && !pstPlayer->bStopFlag)
    pstPlayer->pfnPlayerCallback(arg, RKADK_PLAYER_EVENT_EOF, NULL);

  return NULL;
}

RKADK_S32 RKADK_PLAYER_Play(RKADK_MW_PTR pPlayer) {
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;
  RKADK_S32 ret = 0;

  if (pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT)
    pthread_mutex_lock(&pstPlayer->PauseAudioMutex);

  if (pstPlayer->enPauseStatus == RKADK_PLAYER_PAUSE_START && pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT) {
    pstPlayer->enPauseStatus = RKADK_PLAYER_PAUSE_FALSE;

    if (pstPlayer->bAudioExist) {
      ret = RK_MPI_AO_ResumeChn(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex);
      if (ret != RKADK_SUCCESS) {
        RKADK_LOGE("RK_MPI_AO_ResumeChn failed, ret = %X\n", ret);
        return RKADK_FAILURE;
      }
    }
  } else {
    if (pstPlayer->demuxerFlag == MIX_VIDEO_FLAG || pstPlayer->demuxerFlag == VIDEO_FLAG) {
      if (pstPlayer->bVideoExist == RKADK_TRUE) {
        ret = RK_MPI_VDEC_StartRecvStream(pstPlayer->stVdecCtx.chnIndex);
        if (ret != RK_SUCCESS) {
          RKADK_LOGE("start recv chn %d failed %X! ", pstPlayer->stVdecCtx.chnIndex, ret);
          goto __FAILED;
        }
      }
    }

    if (pstPlayer->demuxerFlag == MIX_VIDEO_FLAG || pstPlayer->demuxerFlag == AUDIO_FLAG) {
      if (pstPlayer->bAudioExist == RKADK_TRUE) {
        pstPlayer->stAoCtx.channel = pstPlayer->stAdecCtx.channel;
        if (OpenDeviceAo(&pstPlayer->stAoCtx) != RKADK_SUCCESS) {
          goto __FAILED;
        }

        pstPlayer->stAoCtx.chnIndex = 0;
        if (USE_AO_MIXER)
          SetAoChannelMode(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex);

        if (pstPlayer->stAdecCtx.channel >= 2)
          pstPlayer->stAoCtx.setTrackMode = AUDIO_TRACK_NORMAL;
        else if (pstPlayer->stAdecCtx.channel == 1)
          pstPlayer->stAoCtx.setTrackMode = AUDIO_TRACK_OUT_STEREO;
        else {
          RKADK_LOGE("illegal input channel count, channel = %d! ", pstPlayer->stAdecCtx.channel);
          goto __FAILED;
        }

        ret = RK_MPI_AO_SetTrackMode(pstPlayer->stAoCtx.devId, (AUDIO_TRACK_MODE_E)pstPlayer->stAoCtx.setTrackMode);
        if (ret != 0) {
            RK_LOGE("ao set track mode fail, aoChn = %d, reason = %x", pstPlayer->stAoCtx.devId, ret);
            goto __FAILED;
        }

        if (InitMpiAO(&pstPlayer->stAoCtx) != RKADK_SUCCESS) {
          RKADK_LOGE("InitMpiAO failed");
          goto __FAILED;
        }
      }
    }

    if (pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT) {
      ret = RKADK_DEMUXER_ReadPacketStart(pstPlayer->pDemuxerCfg, 0);
      if (ret != 0) {
        RKADK_LOGE("RKADK_DEMUXER_ReadPacketStart failed");
        goto __FAILED;
      }

      pthread_create(&pstPlayer->stThreadParam.tidEof, 0, EventEOF, pPlayer);
    }
  }

  if (pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT)
    pthread_mutex_unlock(&pstPlayer->PauseAudioMutex);

  if (pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT) {
    if (pstPlayer->pfnPlayerCallback != NULL)
      pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_PLAY, NULL);
  }

  return RKADK_SUCCESS;

__FAILED:
  if (pstPlayer->pfnPlayerCallback != NULL)
    pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_ERROR, NULL);
  return RKADK_FAILURE;
}

RKADK_S32 RKADK_PLAYER_Stop(RKADK_MW_PTR pPlayer) {
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  RKADK_S32 ret = 0, ret1 = 0, seekFlag = RKADK_PLAYER_SEEK_FALSE;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;

  if (pstPlayer->enSeekStatus == RKADK_PLAYER_SEEK_WAIT)
    seekFlag = RKADK_PLAYER_SEEK_WAIT;

  if (pstPlayer->bStopFlag != RKADK_TRUE) {
    pstPlayer->bStopFlag = RKADK_TRUE;
    pstPlayer->enSeekStatus = RKADK_PLAYER_SEEK_FALSE;
    pstPlayer->seekTimeStamp = 0;

    if (pstPlayer->enPauseStatus == RKADK_PLAYER_PAUSE_START) {
      if (pstPlayer->bVideoExist) {
          ret = RK_MPI_VO_ResumeChn(pstPlayer->stVoCtx.u32VoLay, pstPlayer->stVoCtx.u32VoChn);
          if (ret != RKADK_SUCCESS) {
            RKADK_LOGE("RK_MPI_VO_ResumeChn failed, ret = %X\n", ret);
            return RKADK_FAILURE;
          }
      }

      if (pstPlayer->bAudioExist) {
        ret = RK_MPI_AO_ResumeChn(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex);
        if (ret) {
          RKADK_LOGE("RK_MPI_AO_ResumeChn failed(%X)", ret);
          ret1 |= RKADK_FAILURE;
        }
      }
    }

    pstPlayer->bGetPtsFlag = RKADK_FALSE;
    if (seekFlag != RKADK_PLAYER_SEEK_WAIT)
      pstPlayer->positionTimeStamp = 0;
    pstPlayer->enPauseStatus = RKADK_PLAYER_PAUSE_FALSE;
    RKADK_DEMUXER_ReadPacketStop(pstPlayer->pDemuxerCfg);
    if (pstPlayer->bAudioExist == RKADK_TRUE && pstPlayer->stAdecCtx.eCodecType != RKADK_CODEC_TYPE_PCM
        && !pstPlayer->bAudioStopFlag) {
          RK_MPI_ADEC_SendEndOfStream(pstPlayer->stAdecCtx.chnIndex, RK_FALSE);
        }

    if (pstPlayer->stThreadParam.tidEof) {
      if (pstPlayer->bWavEofFlag != RKADK_TRUE && pstPlayer->bAudioExist && pstPlayer->stAdecCtx.eCodecType == RKADK_CODEC_TYPE_PCM) {
        pthread_mutex_lock(&pstPlayer->WavMutex);
        pthread_cond_signal(&pstPlayer->WavCond);
        pthread_mutex_unlock(&pstPlayer->WavMutex);
        pthread_join(pstPlayer->stThreadParam.tidEof, RKADK_NULL);
        pstPlayer->stThreadParam.tidEof = 0;
      } else {
        pthread_join(pstPlayer->stThreadParam.tidEof, RKADK_NULL);
        pstPlayer->stThreadParam.tidEof = 0;
      }
    }

    if (pstPlayer->bVideoExist == RKADK_TRUE || pstPlayer->demuxerFlag == VIDEO_FLAG) {
        if (DestroyVdec(&pstPlayer->stVdecCtx))
          ret1 |= RKADK_FAILURE;
    }

    if (pstPlayer->bAudioExist == RKADK_TRUE) {
      if (pstPlayer->stAdecCtx.eCodecType != RKADK_CODEC_TYPE_PCM) {
        ret = RK_MPI_ADEC_DestroyChn(pstPlayer->stAdecCtx.chnIndex);
        if (ret) {
          RKADK_LOGE("destory Adec channel failed(%X)", ret);
          ret1 |= RKADK_FAILURE;
        }
      }

      if (DeInitMpiAO(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex,
                      &pstPlayer->stAoCtx.bopenChannelFlag)) {
        RKADK_LOGE("destory Ao channel failed");
        ret1 |= RKADK_FAILURE;
      }

      if (CloseDeviceAO(&pstPlayer->stAoCtx)) {
        RKADK_LOGE("destory Ao failed");
        ret1 |= RKADK_FAILURE;
      }
    }
  }

  if (pstPlayer->pfnPlayerCallback != NULL) {
    if (!ret1 && seekFlag != RKADK_PLAYER_SEEK_WAIT)
      pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_STOPPED, NULL);
    else if (ret1)
      pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_ERROR, NULL);
  }

  return ret1;
}

RKADK_S32 RKADK_PLAYER_Pause(RKADK_MW_PTR pPlayer) {
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  RKADK_S32 ret = 0;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;

  pthread_mutex_lock(&pstPlayer->PauseAudioMutex);
  pstPlayer->enPauseStatus = RKADK_PLAYER_PAUSE_START;

  if (pstPlayer->bAudioExist) {
    ret = RK_MPI_AO_PauseChn(pstPlayer->stAoCtx.devId, pstPlayer->stAoCtx.chnIndex);
    if (ret != RKADK_SUCCESS) {
      RKADK_LOGE("RK_MPI_AO_PauseChn failed, ret = %X\n", ret);
      return RKADK_FAILURE;
    }
  }
  pthread_mutex_unlock(&pstPlayer->PauseAudioMutex);

  if (pstPlayer->pfnPlayerCallback != NULL && pstPlayer->enSeekStatus != RKADK_PLAYER_SEEK_WAIT)
    pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_PAUSED, NULL);

  return RKADK_SUCCESS;
}

RKADK_S32 RKADK_PLAYER_Seek(RKADK_MW_PTR pPlayer, RKADK_S64 s64TimeInMs) {
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  RKADK_S32 ret = 0, tmpPauseFlag = RKADK_PLAYER_PAUSE_FALSE;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;
  RKADK_S64 maxSeekTimeInMs = (RKADK_S64)pow(2, 63) / 1000;

  if (strstr(pstPlayer->pFilePath, "rtsp://")) {
    RKADK_LOGI("Nonsupport rtsp seek");
    return -1;
  }

  if (s64TimeInMs > maxSeekTimeInMs) {
    RKADK_LOGE("s64TimeInMs(%lld) is out of range", s64TimeInMs);
    goto __FAILED;
  }

  if (pstPlayer->enPauseStatus == RKADK_PLAYER_PAUSE_START)
    tmpPauseFlag = RKADK_PLAYER_PAUSE_START;

  pstPlayer->enSeekStatus = RKADK_PLAYER_SEEK_WAIT;
  if (pstPlayer->bStopFlag != RKADK_TRUE)
    RKADK_PLAYER_Stop(pPlayer);

  pstPlayer->enSeekStatus = RKADK_PLAYER_SEEK_WAIT;
  RKADK_PLAYER_SetDataSource(pstPlayer, pstPlayer->pFilePath);
  RKADK_PLAYER_Prepare(pstPlayer);
  pstPlayer->seekTimeStamp = s64TimeInMs * 1000;
  RKADK_PLAYER_Play(pstPlayer);

  pstPlayer->bStopFlag = RKADK_FALSE;
  ret = RKADK_DEMUXER_ReadPacketStart(pstPlayer->pDemuxerCfg, pstPlayer->seekTimeStamp);
  if (ret != 0) {
    RKADK_LOGE("RKADK_DEMUXER_ReadPacketStart failed");
    goto __FAILED;
  }

  pthread_create(&pstPlayer->stThreadParam.tidEof, 0, EventEOF, pPlayer);
  if (tmpPauseFlag == RKADK_PLAYER_PAUSE_START) {
    RKADK_PLAYER_Pause(pstPlayer);
  }

  if (pstPlayer->bVideoExist) {
    pstPlayer->enSeekStatus = RKADK_PLAYER_SEEK_START;
  }

  if (pstPlayer->bAudioExist) {
    if (!pstPlayer->bVideoExist)
      pstPlayer->enSeekStatus = RKADK_PLAYER_SEEK_SEND;
  }

  if (pstPlayer->pfnPlayerCallback != NULL)
    pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_SEEK_END, NULL);

  return RKADK_SUCCESS;

__FAILED:
  if (pstPlayer->pfnPlayerCallback != NULL)
    pstPlayer->pfnPlayerCallback(pPlayer, RKADK_PLAYER_EVENT_ERROR, NULL);

  return RKADK_FAILURE;
}

RKADK_S32 RKADK_PLAYER_GetPlayStatus(RKADK_MW_PTR pPlayer,
                                     RKADK_PLAYER_STATE_E *penState) {
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  RKADK_CHECK_POINTER(penState, RKADK_FAILURE);
  RKADK_LOGE("GetPlayStatus unsupport");
  return RKADK_FAILURE;
}

RKADK_S32 RKADK_PLAYER_GetDuration(RKADK_MW_PTR pPlayer, RKADK_U32 *pDuration) {
  RKADK_CHECK_POINTER(pDuration, RKADK_FAILURE);
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  void *demuxerCfg;
  RKADK_DEMUXER_INPUT_S demuxerInput;
  RKADK_DEMUXER_PARAM_S demuxerParam;
  RKADK_S64 vDuration = 0, aDuration = 0;
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;

  if (strlen(pstPlayer->pFilePath) == 0) {
    RKADK_LOGE("RKADK_PLAYER_GetDuration failed, file is NULL");
    return -1;
  }

  if (strstr(pstPlayer->pFilePath, "rtsp://")) {
    RKADK_LOGI("Nonsupport get rtsp duration");
    return -1;
  }

  demuxerInput.ptr = RK_NULL;
  demuxerInput.readModeFlag = DEMUXER_TYPE_ACTIVE;
  demuxerInput.videoEnableFlag = pstPlayer->bEnableVideo;
  demuxerInput.audioEnableFlag = pstPlayer->bEnableAudio;
  demuxerParam.pstReadPacketCallback.pfnReadVideoPacketCallback = NULL;
  demuxerParam.pstReadPacketCallback.pfnReadAudioPacketCallback = NULL;

  if (RKADK_DEMUXER_Create(&demuxerCfg, &demuxerInput)) {
    RKADK_LOGE("RKADK_DEMUXER_Create failed");
    return RKADK_FAILURE;
  }

  if (RKADK_DEMUXER_GetParam(demuxerCfg, pstPlayer->pFilePath, &demuxerParam)) {
    RKADK_LOGE("RKADK_DEMUXER_GetParam failed");
    goto __FAILED;
  }

  if (pstPlayer->bVideoExist) {
    if (RKADK_DEMUXER_ReadVideoDuration(demuxerCfg, &vDuration))
      goto __FAILED;

    *pDuration = vDuration / 1000;
  }

  if (!pstPlayer->bVideoExist && pstPlayer->bAudioExist) {
    if (RKADK_DEMUXER_ReadAudioDuration(demuxerCfg, &aDuration))
      goto __FAILED;

    *pDuration = aDuration / 1000;
  }

  pstPlayer->duration = *pDuration;
  RKADK_DEMUXER_Destroy(&demuxerCfg);
  return RKADK_SUCCESS;

__FAILED:
  RKADK_DEMUXER_Destroy(&demuxerCfg);
  return RKADK_FAILURE;
}

RKADK_S64 RKADK_PLAYER_GetCurrentPosition(RKADK_MW_PTR pPlayer) {
  RKADK_CHECK_POINTER(pPlayer, RKADK_FAILURE);
  RKADK_PLAYER_HANDLE_S *pstPlayer = (RKADK_PLAYER_HANDLE_S *)pPlayer;
  RKADK_S64 duration = 0;
  if (pstPlayer->bGetPtsFlag) {
    duration = pstPlayer->positionTimeStamp / 1000;
    return duration;
  } else
    return RKADK_FAILURE;
}
