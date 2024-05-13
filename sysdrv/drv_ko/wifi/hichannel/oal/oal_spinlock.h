/*
 * Copyright (c) Hisilicon Technologies Co., Ltd. 2020-2020. All rights reserved.
 * Description: oal_spinlock.h ��ͷ�ļ�
 * Author: Hisilicon
 * Create: 2020-08-04
 */

#ifndef __OAL_SPINLOCK_H__
#define __OAL_SPINLOCK_H__

/*****************************************************************************
  1 ����ͷ�ļ�����
*****************************************************************************/
#include <linux/spinlock.h>

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/*****************************************************************************
  2 �궨��
*****************************************************************************/
typedef spinlock_t oal_spinlock;

#define OAL_SPIN_LOCK_MAGIC_TAG (0xdead4ead)
typedef struct _oal_spin_lock_stru_ {
#ifdef CONFIG_SPIN_LOCK_MAGIC_DEBUG
    hi_u32  magic;
    hi_u32  reserved;
#endif
    spinlock_t  lock;
} oal_spin_lock_stru;

#ifdef CONFIG_SPIN_LOCK_MAGIC_DEBUG
#define oal_define_spinlock(x)   oal_spin_lock_stru x = {   \
                                                        .magic = OAL_SPIN_LOCK_MAGIC_TAG,  \
                                                        .lock = __SPIN_LOCK_UNLOCKED(x)}
#else
#define oal_define_spinlock(x)   oal_spin_lock_stru x = {   \
                                                        .lock = __SPIN_LOCK_UNLOCKED(x)}
#endif

/* ����ָ�룬����ָ����Ҫ�����������ĵĺ��� */
typedef hi_u32(*oal_irqlocked_func)(hi_void *);

/* inline �������� */
/*****************************************************************************
 ��������  : ��������ʼ����������������Ϊ1��δ��״̬����
 �������  : *pst_lock: ���ĵ�ַ
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void  oal_spin_lock_init(oal_spin_lock_stru *pst_lock)
{
    spin_lock_init(&pst_lock->lock);
#ifdef CONFIG_SPIN_LOCK_MAGIC_DEBUG
    pst_lock->magic = OAL_SPIN_LOCK_MAGIC_TAG;
#endif
}
#define SPIN_LOCK_CONSTANT (32)
static inline hi_void  oal_spin_lock_magic_bug(oal_spin_lock_stru *pst_lock)
{
#ifdef CONFIG_SPIN_LOCK_MAGIC_DEBUG
    if (oal_unlikely((hi_u32)OAL_SPIN_LOCK_MAGIC_TAG != pst_lock->magic)) {
#ifdef CONFIG_PRINTK
        /* spinlock never init or memory overwrite */
        printk(KERN_EMERG "[E]SPIN_LOCK_BUG: spinlock:%p on CPU#%d, %s,magic:%08x should be %08x\n", pst_lock,
               raw_smp_processor_id(), current->comm, pst_lock->magic, OAL_SPIN_LOCK_MAGIC_TAG);
        print_hex_dump(KERN_EMERG, "spinlock_magic: ", DUMP_PREFIX_ADDRESS, 16, 1,  /* 16:hex */
                       (hi_u8 *)((uintptr_t)pst_lock - SPIN_LOCK_CONSTANT),
                       SPIN_LOCK_CONSTANT + sizeof(oal_spin_lock_stru) + SPIN_LOCK_CONSTANT, true);
        printk(KERN_EMERG"\n");
#endif
    }
#else
    hi_unref_param(pst_lock);
#endif
}

/*****************************************************************************
 ��������  : �����������ж��Լ��ں��̵߳Ⱥ���̬�����Ļ����µļ������������
             �ܹ�������������������Ϸ��أ������������������ֱ��������
             ���ı������ͷţ���ʱ��������������ء�
 �������  : *pst_lock:��������ַ
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void  oal_spin_lock(oal_spin_lock_stru *pst_lock)
{
    oal_spin_lock_magic_bug(pst_lock);
    spin_lock(&pst_lock->lock);
}

/*****************************************************************************
 ��������  : Spinlock���ں��̵߳Ⱥ���̬�����Ļ����µĽ���������
 �������  : *pst_lock:��������ַ
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void  oal_spin_unlock(oal_spin_lock_stru *pst_lock)
{
    oal_spin_lock_magic_bug(pst_lock);
    spin_unlock(&pst_lock->lock);
}

/*****************************************************************************
 ��������  : �����������ж��Լ��ں��̵߳Ⱥ���̬�����Ļ����µļ������������
             �ܹ�������������������Ϸ��أ������������������ֱ��������
             ���ı������ͷţ���ʱ��������������ء�
 �������  : pst_lock:��������ַ
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void oal_spin_lock_bh(oal_spin_lock_stru *pst_lock)
{
    oal_spin_lock_magic_bug(pst_lock);
    spin_lock_bh(&pst_lock->lock);
}

/*****************************************************************************
 ��������  : Spinlock�����ж��Լ��ں��̵߳Ⱥ���̬�����Ļ����µĽ���������
 �������  : ��
 �������  : ��
 �� �� ֵ  : hi_void
*****************************************************************************/
static inline hi_void oal_spin_unlock_bh(oal_spin_lock_stru *pst_lock)
{
    oal_spin_lock_magic_bug(pst_lock);
    spin_unlock_bh(&pst_lock->lock);
}

/*****************************************************************************
 ��������  : �����������ͬʱ��ñ����־�Ĵ�����ֵ������ʧЧ�����жϡ�
 �������  : *pst_lock:��������ַ
             pui_flags:��־�Ĵ���
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void  oal_spin_lock_irq_save(oal_spin_lock_stru *pst_lock, unsigned long *pui_flags)
{
    oal_spin_lock_magic_bug(pst_lock);
    spin_lock_irqsave(&pst_lock->lock, *pui_flags);
}

/*****************************************************************************
 ��������  : �ͷ���������ͬʱ���ָ���־�Ĵ�����ֵ���ָ������жϡ�����oal_sp-
             in_lock_irq���ʹ��
 �������  : *pst_lock:��������ַ
             pui_flags:��־�Ĵ���
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_void  oal_spin_unlock_irq_restore(oal_spin_lock_stru *pst_lock, unsigned long *pui_flags)
{
    oal_spin_lock_magic_bug(pst_lock);
    spin_unlock_irqrestore(&pst_lock->lock, *pui_flags);
}

/*****************************************************************************
 ��������  : ��ȡ���������ر��жϣ�ִ��ĳ������������֮���ٴ��жϣ��ͷ���
             ������
 �������  : *pst_lock:��������ַ
             func������ָ���ַ
             *p_arg����������
             *pui_flags: �жϱ�־�Ĵ���
 �������  : ��
 �� �� ֵ  :
*****************************************************************************/
static inline hi_u32  oal_spin_lock_irq_exec(oal_spin_lock_stru *pst_lock, oal_irqlocked_func func,
    hi_void *p_arg, unsigned long *pui_flags)
{
    hi_u32  ul_rslt;

    spin_lock_irqsave(&pst_lock->lock, *pui_flags);
    ul_rslt = func(p_arg);
    spin_unlock_irqrestore(&pst_lock->lock, *pui_flags);

    return ul_rslt;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif /* end of oal_spinlock.h */

