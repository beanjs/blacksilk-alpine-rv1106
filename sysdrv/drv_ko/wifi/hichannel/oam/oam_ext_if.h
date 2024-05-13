/*
 * Copyright (c) Hisilicon Technologies Co., Ltd. 2020-2020. All rights reserved.
 * Description: Oam external public interface header file.
 * Author: Hisilicon
 * Create: 2020-08-04
 */

#ifndef __OAM_EXT_IF_H__
#define __OAM_EXT_IF_H__

/*****************************************************************************
  1 ����ͷ�ļ�����
*****************************************************************************/
#include "oal_util.h"
#include "oam_main.h"
#include "oam_log.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define OAM_PRINT_FORMAT_LENGTH     256     /* ά���ַ�����󻺴������� */

/*****************************************************************************
  2 �궨��
*****************************************************************************/
#define oam_info_log0(fmt) \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_INFO, 0, (fmt), 0, 0, 0, 0)
#define oam_info_log1(fmt, p1) \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_INFO, 1, (fmt), (hi_u32)(p1), 0, 0, 0)
#define oam_info_log2(fmt, p1, p2) \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_INFO, 2, (fmt), (hi_u32)(p1), (hi_u32)(p2), 0, 0)
#define oam_info_log3(fmt, p1, p2, p3) \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_INFO, 3, (fmt), (hi_u32)(p1), (hi_u32)(p2), (hi_u32)(p3), 0)
#define oam_info_log4(fmt, p1, p2, p3, p4) \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_INFO, 4, (fmt), (hi_u32)(p1), (hi_u32)(p2), (hi_u32)(p3), \
            (hi_u32)(p4))


#define oam_warning_log0(fmt)                   \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_WARNING, 0, (fmt), 0, 0, 0, 0)
#define oam_warning_log1(fmt, p1)               \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_WARNING, 1, (fmt), (hi_u32)(p1), 0, 0, 0)
#define oam_warning_log2(fmt, p1, p2)           \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_WARNING, 2, (fmt), (hi_u32)(p1), (hi_u32)(p2), 0, 0)
#define oam_warning_log3(fmt, p1, p2, p3)       \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_WARNING, 3, (fmt), (hi_u32)(p1), (hi_u32)(p2), (hi_u32)(p3), 0)
#define oam_warning_log4(fmt, p1, p2, p3, p4)   \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_WARNING, 4, (fmt), (hi_u32)(p1), (hi_u32)(p2), (hi_u32)(p3), \
            (hi_u32)(p4))

#define oam_error_log0(fmt)                     \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_ERROR, 0, (fmt), 0, 0, 0, 0)
#define oam_error_log1(fmt, p1)                 \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_ERROR, 1, (fmt), (hi_u32)(p1), 0, 0, 0)
#define oam_error_log2(fmt, p1, p2)             \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_ERROR, 2, (fmt), (hi_u32)(p1), (hi_u32)(p2), 0, 0)
#define oam_error_log3(fmt, p1, p2, p3)         \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_ERROR, 3, (fmt), (hi_u32)(p1), (hi_u32)(p2), (hi_u32)(p3), 0)
#define oam_error_log4(fmt, p1, p2, p3, p4)     \
    oal_print_nlogs(hi_strrchr(__FILE__, '/'), __FUNCTION__, (hi_u16)__LINE__, OAL_RET_ADDR, \
        OAM_LOG_LEVEL_ERROR, 4, (fmt), (hi_u32)(p1), (hi_u32)(p2), (hi_u32)(p3), \
            (hi_u32)(p4))

#define HI_DIAG_PRINTF dprintf

/*****************************************************************************
  6 ENUM����
*****************************************************************************/
/* ��־���� */
typedef enum {
    OAM_LOG_LEVEL_ERROR     =    1,       /* ERROR�����ӡ */
    OAM_LOG_LEVEL_WARNING,                /* WARNING�����ӡ */
    OAM_LOG_LEVEL_INFO,                   /* INFO�����ӡ */

    OAM_LOG_LEVEL_BUTT
}oam_log_level_enum;
typedef hi_u8 oam_log_level_enum_uint8;

#ifdef __cplusplus
#if __cplusplus
    }
#endif
#endif

#endif /* end of oam_ext_if.h */
