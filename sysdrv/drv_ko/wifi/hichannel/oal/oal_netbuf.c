/*
 * Copyright (c) Hisilicon Technologies Co., Ltd. 2020-2020. All rights reserved.
 * Description: oal_netbuff.c.
 * Author: Hisilicon
 * Create: 2020-08-04
 */
/*****************************************************************************
  1 ͷ�ļ�����
*****************************************************************************/
#include "oal_netbuf.h"
#include "oam_ext_if.h"
#include "oal_util.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/*****************************************************************************
  3 ����ʵ��
*****************************************************************************/
/*****************************************************************************
 ��������  : ��netbu_head��β������netbuf
*****************************************************************************/
hi_u32 oal_netbuf_concat(oal_netbuf_stru* netbuf_head, oal_netbuf_stru* netbuf)
{
     /* �жϿռ��Ƿ��㹻 */
    if (((hi_u32)netbuf_head->end - (hi_u32)netbuf_head->tail) < netbuf->len) {
        oal_netbuf_free(netbuf);
        oam_error_log3("oal_netbuf_concat::no enough space: end:%d, tail:%d, len:%d.",
            netbuf_head->end, netbuf_head->tail, netbuf->len);
        return HI_FAIL;
    }
    if (memcpy_s(skb_tail_pointer(netbuf_head), netbuf->len, netbuf->data, netbuf->len) != EOK) {
        oam_error_log0("oal_netbuf_concat:: memcpy_s failed");
        oal_netbuf_free(netbuf);
        return HI_FAIL;
    }

    skb_put(netbuf_head, netbuf->len);
    oal_netbuf_free(netbuf);
    return HI_SUCCESS;
}

/*****************************************************************************
 ��������  : �ж�ipv4 tcp�����Ƿ�Ϊtcp ack
*****************************************************************************/
hi_u8 oal_netbuf_is_tcp_ack(oal_ip_header_stru  *ip_hdr)
{
    oal_tcp_header_stru    *tcp_hdr = HI_NULL;
    hi_u32                 ip_pkt_len;
    hi_u32                 ip_hdr_len;
    hi_u32                 tcp_hdr_len;

    tcp_hdr     = (oal_tcp_header_stru *)(ip_hdr + 1);
    ip_pkt_len   = oal_net2host_short(ip_hdr->us_tot_len);
    ip_hdr_len   = (oal_low_half_byte(ip_hdr->us_ihl)) << 2;   /* 2: ����2λ */
    tcp_hdr_len  = (oal_high_half_byte(tcp_hdr->offset)) << 2; /* 2: ����2λ */
    if (tcp_hdr_len + ip_hdr_len == ip_pkt_len) {
        return HI_TRUE;
    }

    return HI_FALSE;
}

/*****************************************************************************
 ��������  : Ϊnetbuf�����ڴ�
 �������  : ul_size: �����ڴ�Ĵ�С
             l_reserve: data��ָ��ͷ֮��ҪԤ���ĳ���
             ul_align: ��Ҫ���ֽڶ���
 �� �� ֵ  : �ɹ����ؽṹ��ָ�룻ʧ�ܷ���OAL_PTR_NULL
*****************************************************************************/
oal_netbuf_stru* oal_netbuf_alloc(hi_u32 ul_size, hi_u32 l_reserve, hi_u32 l_align)
{
    oal_netbuf_stru *pst_netbuf = HI_NULL;
    hi_u32       ul_offset;

    /* ��֤data���ֵ�size�������ֽڶ����С��Ԥ�������Ĵ�С */
    if (l_align) {
        ul_size += (l_align - 1);
    }

    if (NET_SKB_PAD < 64) {                         /* net skb pad less than 64 */
        pst_netbuf = dev_alloc_skb(ul_size + 32);   /* Ԥ��32�ֽڸ�ͷ��ʹ���������� */
    } else {
        pst_netbuf = dev_alloc_skb(ul_size);
    }

    if (oal_unlikely(pst_netbuf == HI_NULL)) {
        return HI_NULL;
    }

    if (NET_SKB_PAD < 64) {                         /* net skb pad less than 64 */
        skb_reserve(pst_netbuf, l_reserve + 32);    /* Ԥ��32�ֽڸ�ͷ��ʹ���������� */
    } else {
        skb_reserve(pst_netbuf, l_reserve);
    }

    if (l_align) {
        /* ����Ϊ����ʹ4�ֽڶ����ƫ���� */
        ul_offset = (hi_u32)(((unsigned long)pst_netbuf->data) % (unsigned long)l_align);
        if (ul_offset) {
            skb_reserve(pst_netbuf, l_align - ul_offset);
        }
    }

    return pst_netbuf;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

