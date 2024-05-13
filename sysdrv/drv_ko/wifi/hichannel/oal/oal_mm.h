/*
 * Copyright (c) Hisilicon Technologies Co., Ltd. 2020-2020. All rights reserved.
 * Description: oal_mm.h ��ͷ�ļ�
 * Author: Hisilicon
 * Create: 2020-09-03
 */
#ifndef __OAL_MM_H__
#define __OAL_MM_H__

/* ͷ�ļ����� */
#include <linux/slab.h>
#include <linux/hardirq.h>
#include <linux/vmalloc.h>

#include "hi_types_base.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/* �궨�� */
#define OAL_GFP_KERNEL                          GFP_KERNEL
#define OAL_GFP_ATOMIC                          GFP_ATOMIC

/* inline �������� */
/*****************************************************************************
 ��������  : �������̬���ڴ�ռ䣬�����0������Linux����ϵͳ���ԣ�
             ��Ҫ�����ж������ĺ��ں������ĵĲ�ͬ���(GFP_KERNEL��GFP_ATOMIC)��
 �������  : ul_size: alloc mem size
 �� �� ֵ  : alloc mem addr
*****************************************************************************/
static inline hi_void* oal_memalloc(hi_u32 ul_size)
{
    hi_s32   l_flags = GFP_KERNEL;
    hi_void   *puc_mem_space = HI_NULL;

    /* ��˯�߻����жϳ����б�־��ΪGFP_ATOMIC */
    if (in_interrupt() || irqs_disabled()) {
        l_flags = GFP_ATOMIC;
    }

    puc_mem_space = kmalloc(ul_size, l_flags);
    if (puc_mem_space == HI_NULL) {
        return HI_NULL;
    }

    return puc_mem_space;
}

static inline hi_void* oal_kzalloc(hi_u32 ul_size, hi_s32 l_flags)
{
    return kzalloc(ul_size, l_flags);
}

static inline hi_void*  oal_vmalloc(hi_u32 ul_size)
{
    return vmalloc(ul_size);
}

/*****************************************************************************
 ��������  : �ͷź���̬���ڴ�ռ䡣
*****************************************************************************/
static inline hi_void  oal_free(const hi_void *p_buf)
{
    kfree(p_buf);
}

static inline hi_void  oal_vfree(hi_void *p_buf)
{
    vfree(p_buf);
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif /* end of oal_mm.h */

