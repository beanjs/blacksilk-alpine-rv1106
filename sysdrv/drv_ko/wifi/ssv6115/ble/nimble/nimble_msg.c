/*
 * Copyright (c) 2021 iComm-semi Ltd.
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/**
 * @file fmac_msg_tx.c
 * @brief TX function definitions
 */


/*******************************************************************************
 *         Include Files
 ******************************************************************************/
#include <linux/version.h>
#include <linux/types.h>

#include "fmac/lmac_types.h"
#include "fmac/fmac.h"
#include "ipc_msg.h"
#include "hci/drv_hci_ops.h"
#include "nimble_msg.h"
#include "ssv_debug.h"

/*******************************************************************************
 *         Local Defines
 ******************************************************************************/


/*******************************************************************************
 *         Local Enumerations
 ******************************************************************************/


/*******************************************************************************
 *         Local Structures
 ******************************************************************************/


/*******************************************************************************
 *         Global Variables
 ******************************************************************************/

/*******************************************************************************
 *         Local Variables
 ******************************************************************************/

/*******************************************************************************
 *         Local Functions
 ******************************************************************************/

static int ssv_ble_drv_hci_tx(struct ssv_nimble_softc *snc, struct sk_buff *skb, int txqid, bool force_trigger, u32 tx_flags)
{
    if ((NULL == snc->hci_priv) || (NULL == snc->hci_ops->hci_tx))
        return -1;

    return snc->hci_ops->hci_tx(snc->hci_priv, skb, txqid, force_trigger, tx_flags);
}

static int ssv_ble_private_msg_to_hci(struct ssv_nimble_softc *snc, u8 *msg_buffer, u32 msg_len)
{
    struct sk_buff *skb = NULL;
    struct tx_bmu_desc *tx_bmu_hdr = NULL;
    struct sdio_hdr *sdio_hdr = NULL;
    struct txdesc_api *txdec_hdr = NULL;
    u16 headroom =  SSV_TX_HDR_SIZE;
    u16 frame_len = headroom + msg_len;
    u32 frame_oft = 0;

    if(1)
    {
        skb = __dev_alloc_skb(frame_len, GFP_KERNEL); 
        if (NULL == skb)
        {
            SSV_LOG_DBG("%s(): Can't alloc skb.\n", __FUNCTION__);
            return -1;
        }
        skb_put(skb, frame_len);
        memset((void *)skb->data, 0, skb->len);

        /* |                                                                | 
        * |<----------         send to HCI               ----------------->|
        * |                                                                | 
        * +-------------+----------+------------+--------------------------+ 
        * | tx_bmu_desc | sdio_hdr | txdesc_api |     MSDU Frame           |
        * +-------------+----------+------------+--------------------------+ 
        *  
        * |<--- skb->data
        * |<------------------------  skb->len --------------------------->| 
        * | 
        *
        */

        /* add tx header and payload */
        //build tx_bmu_hdr
        tx_bmu_hdr = (struct tx_bmu_desc *)(skb->data);
        ssv_build_tx_bmu_header(tx_bmu_hdr, frame_len);
        frame_oft += sizeof(struct tx_bmu_desc);

        //build sdio_hdr
        sdio_hdr =(struct sdio_hdr*)(skb->data+frame_oft);
        sdio_hdr->type = E_IPC_TYPE_PRIV_MSG;
        sdio_hdr->len = frame_len;
        sdio_hdr->queue_idx = 0;
        sdio_hdr->reserved = 0;
        frame_oft += sizeof(struct sdio_hdr);

        //build "empty" txdec_api_hdr
        txdec_hdr = (struct txdesc_api*)(skb->data+frame_oft);
        frame_oft += sizeof(struct txdesc_api);

        //copy msg payload
        memcpy((void *)(skb->data+frame_oft), msg_buffer, msg_len);

    }
#ifdef CONFIG_HWIF_AND_HCI
    return ssv_ble_drv_hci_tx(snc, skb, SSV_SW_TXQ_ID_WIFI_CMD, true, 0);
#else
    dev_kfree_skb_any(skb);
    return 0;
#endif
}
void ssv_ble_api_send(struct ssv_nimble_softc *snc, char *buf, u16 buflen)
{
    ST_IPC_PRIV_MSG *msg = NULL;
    u32 msg_total_len = 0;
    
    msg_total_len = (u32)(sizeof(ST_IPC_PRIV_MSG) + buflen);
    msg = kzalloc(msg_total_len+1, GFP_KERNEL);

    if (!msg) {
        SSV_LOG_DBG("%s(): Fail to alloc cmd buffer.\n", __FUNCTION__);
        return; 
    }
    
    // set msg id
    msg->msgid = E_IPC_PRIV_MSG_TYPE_NIMBLE_OPS;
    msg->msglen = buflen;
    memcpy((u8 *)&msg->data[0], (u8 *)buf, buflen);

    if (0 > ssv_ble_private_msg_to_hci(snc, (u8*)msg, msg_total_len)) {
        SSV_LOG_DBG("Fail to send private command\n");
    }

    kfree(msg);
}

int ssv_nimble_event(void *app_param, struct sk_buff *skb)
{
    //struct ssv_nimble_softc *snc = (struct ssv_nimble_softc *)app_param;
    struct rx_info *rx_info = NULL;
    u32 *rx_desc = (u32 *)&skb->data[0];
    u8 pkt_type = (u8)((*rx_desc) & 0xFF);
    //u16 real_pkt_len = (u16)((*rx_desc) >> 8);

    skb_pull(skb, 4); //Remove HWIF header(4-bytes).
    rx_info = (struct rx_info *)skb->data;
    skb_pull(skb, sizeof(struct rx_info)); //Remove HW RX information(84-bytes).
    skb_pull(skb, RX_BUF_HEADROOM_SIZE); //Remove SW RX headroom(24-bytes).

    if (E_IPC_TYPE_PRIV_MSG == pkt_type) {
        ST_IPC_PRIV_MSG *msg = (ST_IPC_PRIV_MSG *)skb->data;

        switch(msg->msgid)
        {
            case E_IPC_PRIV_MSG_TYPE_NIMBLE_EVT:
            {
                int ssv_ctl_from_ssv_nimble(char *pData, int len);
                ssv_ctl_from_ssv_nimble((char *)msg->data, (int)msg->msglen);
                dev_kfree_skb_any(skb);
                return 0;
            }
            default:
            {
                goto unknown_msg;
            }
        }
    }

unknown_msg:
    skb_push(skb, RX_BUF_HEADROOM_SIZE); //recovery SW RX headroom(24-bytes).
    skb_push(skb, sizeof(struct rx_info)); //recovery HW RX information(84-bytes).
    skb_push(skb, 4); //recovery HWIF header(4-bytes).
    return -1;
}
