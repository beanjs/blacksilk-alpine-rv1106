/*
 * Copyright (c) Hisilicon Technologies Co., Ltd. 2020-2020. All rights reserved.
 * Description: oal timer.
 * Author: Hisilicon
 * Create: 2020-08-04
 */

#ifndef __OAL_TIMER_H__
#define __OAL_TIMER_H__

/* ͷ�ļ����� */
#include <linux/timer.h>
#include "hcc_host.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/* �궨�� */
typedef struct timer_list              oal_timer_list_stru;

//typedef void (*oal_timer_func)(unsigned long);
typedef void (*oal_timer_func)(struct timer_list  *);

/*****************************************************************************
  10 ��������
*****************************************************************************/
/*****************************************************************************
 ��������  : ��ʼ����ʱ��
 �������  : pst_timer: ��ʱ���ṹ��ָ��
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void  oal_timer_init(oal_timer_list_stru *pst_timer, unsigned long ul_delay,
    oal_timer_func p_func, unsigned long ui_arg)
{
    //init_timer(pst_timer);
    //pst_timer->expires = jiffies + msecs_to_jiffies(ul_delay);
    //pst_timer->function = p_func;
    //pst_timer->data = ui_arg;

    timer_setup(pst_timer,p_func,0);
    pst_timer->expires = jiffies + msecs_to_jiffies(ul_delay);

}

/*****************************************************************************
 ��������  : ɾ����ʱ��
 �������  : pst_timer: ��ʱ���ṹ��ָ��
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_s32  oal_timer_delete(oal_timer_list_stru *pst_timer)
{
    return del_timer(pst_timer);
}

/*****************************************************************************
 ��������  : ͬ��ɾ����ʱ�������ڶ��
 �������  : pst_timer: ��ʱ���ṹ��ָ��
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_s32  oal_timer_delete_sync(oal_timer_list_stru *pst_timer)
{
    return del_timer_sync(pst_timer);
}

/*****************************************************************************
 ��������  : ���ʱ��
 �������  : pst_timer: ��ʱ���ṹ��ָ��
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void  oal_timer_add(oal_timer_list_stru *pst_timer)
{
    add_timer(pst_timer);
}

/*****************************************************************************
 ��������  : ������ʱ��
 �������  : pst_timer: �ṹ��ָ��
             ui_expires: ����������¼�
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_s32  oal_timer_start(oal_timer_list_stru *pst_timer, unsigned long ui_delay)
{
    return mod_timer(pst_timer, (jiffies + msecs_to_jiffies(ui_delay)));
}

/*****************************************************************************
 ��������  : ָ��cpu,������ʱ��,����ʱtimerҪ���ڷǼ���״̬���߻�����
 �������  : pst_timer: �ṹ��ָ��
             ui_expires: ����������¼�
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void  oal_timer_start_on(oal_timer_list_stru *pst_timer, unsigned long ui_delay, hi_s32 cpu)
{
    pst_timer->expires = jiffies + msecs_to_jiffies(ui_delay);
    add_timer_on(pst_timer, cpu);
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif /* end of oal_timer.h */

