/*
 * Copyright (C) 2014 Atmel
 *		      Bo Shen <voice.shen@atmel.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#include <common.h>
#include <asm/io.h>
#include <asm/arch/at91_common.h>
#include <asm/arch/at91_rstc.h>
#include <asm/arch/atmel_mpddrc.h>
#include <asm/arch/gpio.h>
#include <asm/arch/clk.h>
#include <asm/arch/sama5d3_smc.h>
#include <asm/arch/sama5d4.h>
#include <atmel_hlcdc.h>
#include <debug_uart.h>
#include <lcd.h>
#include <nand.h>
#include <version.h>

DECLARE_GLOBAL_DATA_PTR;

#ifdef CONFIG_NAND_ATMEL
static void sama5d4_xplained_nand_hw_init(void)
{
	struct at91_smc *smc = (struct at91_smc *)ATMEL_BASE_SMC;

	at91_periph_clk_enable(ATMEL_ID_SMC);

	/* Configure SMC CS3 for NAND */
	writel(AT91_SMC_SETUP_NWE(1) | AT91_SMC_SETUP_NCS_WR(1) |
	       AT91_SMC_SETUP_NRD(1) | AT91_SMC_SETUP_NCS_RD(1),
	       &smc->cs[3].setup);
	writel(AT91_SMC_PULSE_NWE(2) | AT91_SMC_PULSE_NCS_WR(3) |
	       AT91_SMC_PULSE_NRD(2) | AT91_SMC_PULSE_NCS_RD(3),
	       &smc->cs[3].pulse);
	writel(AT91_SMC_CYCLE_NWE(5) | AT91_SMC_CYCLE_NRD(5),
	       &smc->cs[3].cycle);
	writel(AT91_SMC_TIMINGS_TCLR(2) | AT91_SMC_TIMINGS_TADL(7) |
	       AT91_SMC_TIMINGS_TAR(2)  | AT91_SMC_TIMINGS_TRR(3)   |
	       AT91_SMC_TIMINGS_TWB(7)  | AT91_SMC_TIMINGS_RBNSEL(3)|
	       AT91_SMC_TIMINGS_NFSEL(1), &smc->cs[3].timings);
	writel(AT91_SMC_MODE_RM_NRD | AT91_SMC_MODE_WM_NWE |
	       AT91_SMC_MODE_EXNW_DISABLE |
	       AT91_SMC_MODE_DBW_8 |
	       AT91_SMC_MODE_TDF_CYCLE(3),
	       &smc->cs[3].mode);

	at91_pio3_set_a_periph(AT91_PIO_PORTC, 5, 0);	/* D0 */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 6, 0);	/* D1 */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 7, 0);	/* D2 */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 8, 0);	/* D3 */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 9, 0);	/* D4 */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 10, 0);	/* D5 */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 11, 0);	/* D6 */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 12, 0);	/* D7 */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 13, 0);	/* RE */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 14, 0);	/* WE */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 15, 1);	/* NCS */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 16, 1);	/* RDY */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 17, 1);	/* ALE */
	at91_pio3_set_a_periph(AT91_PIO_PORTC, 18, 1);	/* CLE */
}
#endif

#ifdef CONFIG_CMD_USB
static void sama5d4_xplained_usb_hw_init(void)
{
	at91_set_pio_output(AT91_PIO_PORTE, 11, 1);
	at91_set_pio_output(AT91_PIO_PORTE, 14, 1);
}
#endif

#ifdef CONFIG_LCD
vidinfo_t panel_info = {
	.vl_col = 480,
	.vl_row = 272,
	.vl_clk = 9000000,
	.vl_bpix = LCD_BPP,
	.vl_tft = 1,
	.vl_hsync_len = 41,
	.vl_left_margin = 2,
	.vl_right_margin = 2,
	.vl_vsync_len = 11,
	.vl_upper_margin = 2,
	.vl_lower_margin = 2,
	.mmio = ATMEL_BASE_LCDC,
};

/* No power up/down pin for the LCD pannel */
void lcd_enable(void)	{ /* Empty! */ }
void lcd_disable(void)	{ /* Empty! */ }

unsigned int has_lcdc(void)
{
	return 1;
}

static void sama5d4_xplained_lcd_hw_init(void)
{
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 24, 0);	/* LCDPWM */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 25, 0);	/* LCDDISP */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 26, 0);	/* LCDVSYNC */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 27, 0);	/* LCDHSYNC */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 28, 0);	/* LCDDOTCK */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 29, 0);	/* LCDDEN */

	at91_pio3_set_a_periph(AT91_PIO_PORTA,  0, 0);	/* LCDD0 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA,  1, 0);	/* LCDD1 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA,  2, 0);	/* LCDD2 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA,  3, 0);	/* LCDD3 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA,  4, 0);	/* LCDD4 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA,  5, 0);	/* LCDD5 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA,  6, 0);	/* LCDD6 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA,  7, 0);	/* LCDD7 */

	at91_pio3_set_a_periph(AT91_PIO_PORTA,  8, 0);	/* LCDD9 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA,  9, 0);	/* LCDD8 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 10, 0);	/* LCDD10 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 11, 0);	/* LCDD11 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 12, 0);	/* LCDD12 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 13, 0);	/* LCDD13 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 14, 0);	/* LCDD14 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 15, 0);	/* LCDD15 */

	at91_pio3_set_a_periph(AT91_PIO_PORTA, 16, 0);	/* LCDD16 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 17, 0);	/* LCDD17 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 18, 0);	/* LCDD18 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 19, 0);	/* LCDD19 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 20, 0);	/* LCDD20 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 21, 0);	/* LCDD21 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 22, 0);	/* LCDD22 */
	at91_pio3_set_a_periph(AT91_PIO_PORTA, 23, 0);	/* LCDD23 */

	/* Enable clock */
	at91_periph_clk_enable(ATMEL_ID_LCDC);
}

#ifdef CONFIG_LCD_INFO
void lcd_show_board_info(void)
{
	ulong dram_size, nand_size;
	int i;
	char temp[32];

	lcd_printf("%s\n", U_BOOT_VERSION);
	lcd_printf("2014 ATMEL Corp\n");
	lcd_printf("%s CPU at %s MHz\n", get_cpu_name(),
		   strmhz(temp, get_cpu_clk_rate()));

	dram_size = 0;
	for (i = 0; i < CONFIG_NR_DRAM_BANKS; i++)
		dram_size += gd->bd->bi_dram[i].size;

	nand_size = 0;
#ifdef CONFIG_NAND_ATMEL
	for (i = 0; i < CONFIG_SYS_MAX_NAND_DEVICE; i++)
		nand_size += get_nand_dev_by_index(i)->size;
#endif
	lcd_printf("%ld MB SDRAM, %ld MB NAND\n",
		   dram_size >> 20, nand_size >> 20);
}
#endif /* CONFIG_LCD_INFO */

#endif /* CONFIG_LCD */

#ifdef CONFIG_DEBUG_UART_BOARD_INIT
static void sama5d4_xplained_serial3_hw_init(void)
{
	at91_pio3_set_b_periph(AT91_PIO_PORTE, 17, 1);	/* TXD3 */
	at91_pio3_set_b_periph(AT91_PIO_PORTE, 16, 0);	/* RXD3 */

	/* Enable clock */
	at91_periph_clk_enable(ATMEL_ID_USART3);
}

void board_debug_uart_init(void)
{
	sama5d4_xplained_serial3_hw_init();
}
#endif

#ifdef CONFIG_BOARD_EARLY_INIT_F
int board_early_init_f(void)
{
#ifdef CONFIG_DEBUG_UART
	debug_uart_init();
#endif
	return 0;
}
#endif

int board_init(void)
{
	/* adress of boot parameters */
	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;

#ifdef CONFIG_NAND_ATMEL
	sama5d4_xplained_nand_hw_init();
#endif
#ifdef CONFIG_LCD
	sama5d4_xplained_lcd_hw_init();
#endif
#ifdef CONFIG_CMD_USB
	sama5d4_xplained_usb_hw_init();
#endif

	return 0;
}

int dram_init(void)
{
	gd->ram_size = get_ram_size((void *)CONFIG_SYS_SDRAM_BASE,
				    CONFIG_SYS_SDRAM_SIZE);
	return 0;
}

/* SPL */
#ifdef CONFIG_SPL_BUILD
void spl_board_init(void)
{
#if CONFIG_SYS_USE_NANDFLASH
	sama5d4_xplained_nand_hw_init();
#endif
}

static void ddr2_conf(struct atmel_mpddrc_config *ddr2)
{
	ddr2->md = (ATMEL_MPDDRC_MD_DBW_32_BITS | ATMEL_MPDDRC_MD_DDR2_SDRAM);

	ddr2->cr = (ATMEL_MPDDRC_CR_NC_COL_10 |
		    ATMEL_MPDDRC_CR_NR_ROW_14 |
		    ATMEL_MPDDRC_CR_CAS_DDR_CAS3 |
		    ATMEL_MPDDRC_CR_NB_8BANKS |
		    ATMEL_MPDDRC_CR_NDQS_DISABLED |
		    ATMEL_MPDDRC_CR_DECOD_INTERLEAVED |
		    ATMEL_MPDDRC_CR_UNAL_SUPPORTED);

	ddr2->rtr = 0x2b0;

	ddr2->tpr0 = (8 << ATMEL_MPDDRC_TPR0_TRAS_OFFSET |
		      3 << ATMEL_MPDDRC_TPR0_TRCD_OFFSET |
		      3 << ATMEL_MPDDRC_TPR0_TWR_OFFSET |
		      10 << ATMEL_MPDDRC_TPR0_TRC_OFFSET |
		      3 << ATMEL_MPDDRC_TPR0_TRP_OFFSET |
		      2 << ATMEL_MPDDRC_TPR0_TRRD_OFFSET |
		      2 << ATMEL_MPDDRC_TPR0_TWTR_OFFSET |
		      2 << ATMEL_MPDDRC_TPR0_TMRD_OFFSET);

	ddr2->tpr1 = (2 << ATMEL_MPDDRC_TPR1_TXP_OFFSET |
		      200 << ATMEL_MPDDRC_TPR1_TXSRD_OFFSET |
		      25 << ATMEL_MPDDRC_TPR1_TXSNR_OFFSET |
		      23 << ATMEL_MPDDRC_TPR1_TRFC_OFFSET);

	ddr2->tpr2 = (7 << ATMEL_MPDDRC_TPR2_TFAW_OFFSET |
		      2 << ATMEL_MPDDRC_TPR2_TRTP_OFFSET |
		      3 << ATMEL_MPDDRC_TPR2_TRPA_OFFSET |
		      2 << ATMEL_MPDDRC_TPR2_TXARDS_OFFSET |
		      8 << ATMEL_MPDDRC_TPR2_TXARD_OFFSET);
}

void mem_init(void)
{
	struct atmel_mpddrc_config ddr2;

	ddr2_conf(&ddr2);

	/* Enable MPDDR clock */
	at91_periph_clk_enable(ATMEL_ID_MPDDRC);
	at91_system_clk_enable(AT91_PMC_DDR);

	/* DDRAM2 Controller initialize */
	ddr2_init(ATMEL_BASE_MPDDRC, ATMEL_BASE_DDRCS, &ddr2);
}

void at91_pmc_init(void)
{
	u32 tmp;

	tmp = AT91_PMC_PLLAR_29 |
	      AT91_PMC_PLLXR_PLLCOUNT(0x3f) |
	      AT91_PMC_PLLXR_MUL(87) |
	      AT91_PMC_PLLXR_DIV(1);
	at91_plla_init(tmp);

	at91_pllicpr_init(AT91_PMC_IPLL_PLLA(0x0));

	tmp = AT91_PMC_MCKR_H32MXDIV |
	      AT91_PMC_MCKR_PLLADIV_2 |
	      AT91_PMC_MCKR_MDIV_3 |
	      AT91_PMC_MCKR_CSS_PLLA;
	at91_mck_init(tmp);
}
#endif