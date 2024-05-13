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

#ifndef __RKADK_RTSP_H__
#define __RKADK_RTSP_H__

#ifdef __cplusplus
extern "C" {
#endif

#include "rkadk_common.h"

RKADK_S32 RKADK_RTSP_Init(RKADK_U32 u32CamId, RKADK_U32 port, const char *path,
                          RKADK_MW_PTR *ppHandle);

RKADK_S32 RKADK_RTSP_DeInit(RKADK_MW_PTR pHandle);

RKADK_S32 RKADK_RTSP_Start(RKADK_MW_PTR pHandle);

RKADK_S32 RKADK_RTSP_Stop(RKADK_MW_PTR pHandle);

#ifdef __cplusplus
}
#endif
#endif
