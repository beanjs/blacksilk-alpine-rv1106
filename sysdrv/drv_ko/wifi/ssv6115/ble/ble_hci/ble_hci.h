/*
 * Copyright (c) 2022 iComm-semi Ltd.
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
/*
 * BLE HCI declarations
 */

#ifndef __BLE_HCI_H__
#define __BLE_HCI_H__

/*******************************************************************************
 *         Include Files
 ******************************************************************************/




/*******************************************************************************
 *         Defines
 ******************************************************************************/

/*******************************************************************************
 *         Enumerations
 ******************************************************************************/

/*******************************************************************************
 *         Structures
 ******************************************************************************/
/**
* struct ssv_ble_hci_softc - hold the whole BLE HCI driver data structure.
*
*/
struct ssv_ble_softc {
    struct device               *dev;
    struct hci_dev              *hdev;
    void                        *hci_priv;
    struct ssv6xxx_hci_ops      *hci_ops;
    struct sk_buff_head         ble_tx_queue;
    u8                          maddr[6];
};



/*******************************************************************************
 *         Variables
 ******************************************************************************/


/*******************************************************************************
 *         Functions
 ******************************************************************************/



#endif /* __BLE_HCI_H__ */

