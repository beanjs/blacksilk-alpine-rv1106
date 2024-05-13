/*
 * Copyright 2021 Rockchip Electronics Co. LTD
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <pthread.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <time.h>
#include <unistd.h>

#include "sample_comm.h"

typedef struct _rkMpiCtx {
	SAMPLE_VI_CTX_S vi[6];
} SAMPLE_MPI_CTX_S;

static bool quit = false;
static void sigterm_handler(int sig) {
	fprintf(stderr, "signal %d\n", sig);
	quit = true;
}

static RK_CHAR optstr[] = "?::a::f:w:h:c:o:n:l:m:i:";
static const struct option long_options[] = {
    {"aiq", optional_argument, NULL, 'a'},
    {"pixel_format", optional_argument, NULL, 'f'},
    {"width", required_argument, NULL, 'w'},
    {"height", required_argument, NULL, 'h'},
    {"chn_id", required_argument, NULL, 'c'},
    {"output_path", required_argument, NULL, 'o'},
    {"camera_num", required_argument, NULL, 'n'},
    {"loop_count", required_argument, NULL, 'l'},
    {"hdr_mode", required_argument, NULL, 'h' + 'm'},
    {"ispLaunchMode", required_argument, NULL, 'i'},
    {"help", optional_argument, NULL, '?'},
    {NULL, 0, NULL, 0},
};

/******************************************************************************
 * function : show usage
 ******************************************************************************/
static void print_usage(const RK_CHAR *name) {
	printf("usage example:\n");
	printf("\t%s -w 1920 -h 1080 -a /etc/iqfiles/ -n 2 -l 10 -o /data/\n", name);
#if (defined RKAIQ)
	printf("\t-a | --aiq: enable aiq with dirpath provided, eg:-a /etc/iqfiles/, "
	       "set dirpath empty to using path by default, without this option aiq "
	       "should run in other application\n");
#endif
	printf("\t-f | --pixel_format: camera Format, Default nv12, "
	       "Value:nv12,nv16,uyvy,rgb565,xbgr8888.\n");
	printf("\t-w | --width: camera width, Default 1920\n");
	printf("\t-h | --height: camera height, Default 1080\n");
	printf("\t-c | --chn_id: channel id, default: 0\n");
	printf("\t-o | --output_path: vi output file path, Default NULL\n");
	printf("\t-n | --camera_num: camera number, Default 2\n");
	printf("\t-l | --loop_count: loop count, Default -1\n");
	printf("\t-i | --ispLaunchMode : 0: single cam init, 1: camera group init. default: "
	       "1\n");
	printf("\t--hdr_mode: set hdr mode, 0: normal 1: HDR2, 2: HDR3, Default: 0\n");
}

/******************************************************************************
 * function : vi thread
 ******************************************************************************/
static void *vi_get_stream(void *pArgs) {
	SAMPLE_VI_CTX_S *ctx = (SAMPLE_VI_CTX_S *)(pArgs);
	RK_S32 s32Ret = RK_FAILURE;
	char name[256] = {0};
	FILE *fp = RK_NULL;
	void *pData = RK_NULL;
	RK_S32 loopCount = 0;

	if (ctx->dstFilePath) {
		snprintf(name, sizeof(name), "/%s/vi_%d.bin", ctx->dstFilePath, ctx->s32DevId);
		fp = fopen(name, "wb");
		if (fp == RK_NULL) {
			printf("chn %d can't open %s file !\n", ctx->s32DevId, ctx->dstFilePath);
			quit = true;
			return RK_NULL;
		}
	}

	while (!quit) {
		s32Ret = SAMPLE_COMM_VI_GetChnFrame(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {
			if (ctx->stViFrame.stVFrame.u64PrivateData <= 0) {
				// SAMPLE_COMM_VI_ReleaseChnFrame(ctx);
				// continue;
			}
			// exit when complete
			if (ctx->s32loopCount > 0) {
				if (loopCount >= ctx->s32loopCount) {
					SAMPLE_COMM_VI_ReleaseChnFrame(ctx);
					quit = true;
					break;
				}
			}

			if (fp) {
				fwrite(pData, 1, ctx->stViFrame.stVFrame.u64PrivateData, fp);
				fflush(fp);
			}

			printf(
			    "SAMPLE_COMM_VI_GetChnFrame DevId %d ok:data %p size:%llu loop:%d seq:%d "
			    "pts:%lld ms\n",
			    ctx->s32DevId, pData, ctx->stViFrame.stVFrame.u64PrivateData, loopCount,
			    ctx->stViFrame.stVFrame.u32TimeRef,
			    ctx->stViFrame.stVFrame.u64PTS / 1000);

			SAMPLE_COMM_VI_ReleaseChnFrame(ctx);
			loopCount++;
		}
		usleep(1000);
	}

	if (fp)
		fclose(fp);

	return RK_NULL;
}

/******************************************************************************
 * function    : main()
 * Description : main
 ******************************************************************************/
int main(int argc, char *argv[]) {
	SAMPLE_MPI_CTX_S *ctx;
	int video_width = 1920;
	int video_height = 1080;
	RK_CHAR *pOutPath = NULL;
	RK_S32 s32Ret = RK_FAILURE;
	RK_S32 i;
	RK_S32 s32CamNum = 2;
	RK_S32 s32CamGroupId = 0;
	RK_S32 s32ChnId = 0;
	RK_S32 s32loopCnt = -1;
	PIXEL_FORMAT_E PixelFormat = RK_FMT_YUV420SP;
	COMPRESS_MODE_E CompressMode = COMPRESS_MODE_NONE;
	rk_aiq_working_mode_t hdr_mode = RK_AIQ_WORKING_MODE_NORMAL;
	RK_BOOL bIfIspGroupInit = RK_TRUE;
	pthread_t vi_thread_id[6];

	if (argc < 2) {
		print_usage(argv[0]);
		return 0;
	}

	ctx = (SAMPLE_MPI_CTX_S *)(malloc(sizeof(SAMPLE_MPI_CTX_S)));
	memset(ctx, 0, sizeof(SAMPLE_MPI_CTX_S));

	signal(SIGINT, sigterm_handler);

#if (defined RKAIQ)
	RK_BOOL bMultictx = RK_FALSE;
#endif
	int c;
	char *iq_file_dir = NULL;
	while ((c = getopt_long(argc, argv, optstr, long_options, NULL)) != -1) {
		const char *tmp_optarg = optarg;
		switch (c) {
		case 'a':
			if (!optarg && NULL != argv[optind] && '-' != argv[optind][0]) {
				tmp_optarg = argv[optind++];
			}
			if (tmp_optarg) {
				iq_file_dir = (char *)tmp_optarg;
			} else {
				iq_file_dir = NULL;
			}
			break;
		case 'f':
			if (!strcmp(optarg, "nv12")) {
				PixelFormat = RK_FMT_YUV420SP;
			} else if (!strcmp(optarg, "nv16")) {
				PixelFormat = RK_FMT_YUV422SP;
			} else if (!strcmp(optarg, "uyvy")) {
				PixelFormat = RK_FMT_YUV422_UYVY;
			}
#if defined(RV1106)
			else if (!strcmp(optarg, "rgb565")) {
				PixelFormat = RK_FMT_RGB565;
				s32ChnId = 1;
			} else if (!strcmp(optarg, "xbgr8888")) {
				PixelFormat = RK_FMT_XBGR8888;
				s32ChnId = 1;
			}
#endif
			else {
				RK_LOGE("this pixel_format is not supported in the sample");
				print_usage(argv[0]);
				goto __FAILED2;
			}
			break;
		case 'w':
			video_width = atoi(optarg);
			break;
		case 'h':
			video_height = atoi(optarg);
			break;
		case 'c':
			s32ChnId = atoi(optarg);
			break;
		case 'o':
			pOutPath = optarg;
			break;
		case 'n':
			s32CamNum = atoi(optarg);
			break;
		case 'l':
			s32loopCnt = atoi(optarg);
			break;
		case 'i':
			bIfIspGroupInit = atoi(optarg);
			break;
		case 'h' + 'm':
			if (atoi(optarg) == 0) {
				hdr_mode = RK_AIQ_WORKING_MODE_NORMAL;
			} else if (atoi(optarg) == 1) {
				hdr_mode = RK_AIQ_WORKING_MODE_ISP_HDR2;
			} else if (atoi(optarg) == 2) {
				hdr_mode = RK_AIQ_WORKING_MODE_ISP_HDR3;
			} else {
				RK_LOGE("input hdr_mode is not support(error)");
				print_usage(argv[0]);
				goto __FAILED2;
			}
			break;
		case '?':
		default:
			print_usage(argv[0]);
			return 0;
		}
	}

	printf("#CameraNum: %d\n", s32CamNum);
	printf("#Output Path: %s\n", pOutPath);
	printf("#IQ Path: %s\n", iq_file_dir);
	if (iq_file_dir) {
#if (defined RKAIQ)
		printf("#Rkaiq XML DirPath: %s\n", iq_file_dir);
		printf("#bMultictx: %d\n\n", bMultictx);
		if (!bIfIspGroupInit) {
			for (RK_S32 i = 0; i < s32CamNum; i++) {
				s32Ret = SAMPLE_COMM_ISP_Init(i, hdr_mode, bMultictx, iq_file_dir);
				s32Ret |= SAMPLE_COMM_ISP_Run(i);
				if (s32Ret != RK_SUCCESS) {
					RK_LOGE("ISP init failure camid:%d", i);
					return RK_FAILURE;
				}
			}
		} else {
#ifdef RKAIQ_GRP
			rk_aiq_camgroup_instance_cfg_t camgroup_cfg;
			memset(&camgroup_cfg, 0, sizeof(camgroup_cfg));
			camgroup_cfg.sns_num = s32CamNum;
			camgroup_cfg.config_file_dir = iq_file_dir;
			s32Ret = SAMPLE_COMM_ISP_CamGroup_Init(s32CamGroupId, hdr_mode, bMultictx, 0,
			                                       RK_NULL, &camgroup_cfg);
			if (s32Ret != RK_SUCCESS) {
				RK_LOGE("SAMPLE_COMM_ISP_CamGroup_Init failure:%#X", s32Ret);
				return RK_FAILURE;
			}
#endif
		}
#endif
	}

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		goto __FAILED;
	}

	// Init VI
	for (i = 0; i < s32CamNum; i++) {
		ctx->vi[i].u32Width = video_width;
		ctx->vi[i].u32Height = video_height;
		ctx->vi[i].s32DevId = i;
		ctx->vi[i].u32PipeId = ctx->vi[i].s32DevId;
		ctx->vi[i].s32ChnId = s32ChnId;
		ctx->vi[i].bIfIspGroupInit = bIfIspGroupInit;
#ifdef RV1126
		ctx->vi[i].bIfIspGroupInit = RK_FALSE;
#endif
		ctx->vi[i].stChnAttr.stIspOpt.u32BufCount = 2;
		ctx->vi[i].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
		ctx->vi[i].stChnAttr.u32Depth = 1;
		ctx->vi[i].stChnAttr.enPixelFormat = PixelFormat;
		ctx->vi[i].stChnAttr.enCompressMode = CompressMode;
		ctx->vi[i].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
		ctx->vi[i].stChnAttr.stFrameRate.s32DstFrameRate = -1;
		ctx->vi[i].dstFilePath = pOutPath;
		ctx->vi[i].s32loopCount = s32loopCnt;
		SAMPLE_COMM_VI_CreateChn(&ctx->vi[i]);
	}

	for (i = 0; i < s32CamNum && ctx->vi[i].bIfIspGroupInit; i++) {
		s32Ret = RK_MPI_VI_StartPipe(ctx->vi[i].u32PipeId);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_StartPipe failure:$#X pipe:%d", s32Ret,
			        ctx->vi[i].u32PipeId);
			goto __FAILED;
		}
	}

	for (i = 0; i < s32CamNum; i++) {
		pthread_create(&vi_thread_id[i], 0, vi_get_stream, (void *)(&ctx->vi[i]));
	}

	printf("%s initial finish\n", __func__);

	while (!quit) {
		sleep(1);
	}

	printf("%s exit!\n", __func__);

	for (i = 0; i < s32CamNum; i++) {
		pthread_join(vi_thread_id[i], NULL);
	}

	for (i = 0; i < s32CamNum && ctx->vi[i].bIfIspGroupInit; i++) {
		s32Ret = RK_MPI_VI_StopPipe(ctx->vi[i].u32PipeId);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_StopPipe failure:$#X pipe:%d", s32Ret,
			        ctx->vi[i].u32PipeId);
		}
	}

	// Destroy VI
	for (i = 0; i < s32CamNum; i++) {
		SAMPLE_COMM_VI_DestroyChn(&ctx->vi[i]);
	}
__FAILED:
	RK_MPI_SYS_Exit();
	if (iq_file_dir) {
#if (defined RKAIQ)
		if (bIfIspGroupInit == RK_FALSE) {
			for (RK_S32 i = 0; i < s32CamNum; i++) {
				s32Ret = SAMPLE_COMM_ISP_Stop(i);
				if (s32Ret != RK_SUCCESS) {
					RK_LOGE("SAMPLE_COMM_ISP_Stop failure:%#X", s32Ret);
					return s32Ret;
				}
			}
		} else {
#ifdef RKAIQ_GRP
			s32Ret = SAMPLE_COMM_ISP_CamGroup_Stop(s32CamGroupId);
			if (s32Ret != RK_SUCCESS) {
				RK_LOGE("SAMPLE_COMM_ISP_CamGroup_Stop failure:%#X", s32Ret);
				return s32Ret;
			}
#endif
		}
#endif
	}
__FAILED2:
	if (ctx) {
		free(ctx);
		ctx = RK_NULL;
	}

	return 0;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
