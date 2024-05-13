/*
 * Copyright (c) Hisilicon Technologies Co., Ltd. 2020-2020. All rights reserved.
 * Description: Header file for oam_main.c.
 * Author: Hisilicon
 * Create: 2020-08-04
 */

#ifndef __OAM_MAIN_H__
#define __OAM_MAIN_H__

/*****************************************************************************
  1 ����ͷ�ļ�����
*****************************************************************************/
#include "oam_ext_if.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif
/*****************************************************************************
  2 �궨��
*****************************************************************************/
#define OAM_BEACON_HDR_LEN              24
#define OAM_TIMER_MAX_LEN               36
#define OAM_PRINT_CRLF_NUM              20              /* ������з��ĸ��� */

#define OAM_FEATURE_NAME_ABBR_LEN       12              /* ����������д��󳤶� */

#define DEV_OM_FRAME_DELIMITER          0x7e
#define DEV_OM_MSG_TYPE_LOG             1

/*****************************************************************************
  10 ��������
*****************************************************************************/
hi_s32 oam_main_init(hi_void);
hi_void oam_main_exit(hi_void);
hi_u32 oam_get_log_level(hi_void);

#ifdef __cplusplus
#if __cplusplus
    }
#endif
#endif

#endif /* end of oam_main */
