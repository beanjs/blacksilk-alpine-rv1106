	.arch armv7-a
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 2
	.file	"mpp_enc_impl.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_hal_task_pkt_len, %function
check_hal_task_pkt_len:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r5, r1
	ldr	r4, [r0, #48]
	ldr	r0, [r0, #28]
	bl	mpp_packet_get_length
	cmp	r4, r0
	beq	.L1
	strd	r4, r0, [sp]
	mov	r3, r5
	movs	r2, #181
	ldr	r1, .L3
	ldr	r0, .L3+4
	bl	printk
.L1:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.word	.LC0
	.fnend
	.size	check_hal_task_pkt_len, .-check_hal_task_pkt_len
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_frm_pkt, %function
mpp_enc_check_frm_pkt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movs	r3, #0
	str	r3, [r0, #392]
	mov	r4, r0
	ldr	r3, [r0, #372]
	cbz	r3, .L6
.L10:
	ldr	r0, [r4, #368]
	cbnz	r0, .L7
.L8:
	mov	r0, #-1
	b	.L5
.L6:
	add	r0, r0, #372
	bl	mpp_packet_new
	cmp	r0, #0
	beq	.L10
.L5:
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L7:
	bl	mpp_frame_get_pts
	mov	r6, r0
	ldr	r0, [r4, #368]
	mov	r7, r1
	bl	mpp_frame_get_dts
	mov	r8, r0
	ldr	r0, [r4, #368]
	mov	r9, r1
	bl	mpp_frame_get_buffer
	mov	r5, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_hor_stride
	mov	r10, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_ver_stride
	ldr	r3, [r4, #620]
	cmp	r3, r10
	bne	.L11
	ldr	r3, [r4, #624]
	cmp	r3, r0
	beq	.L12
.L11:
	movw	r1, #1159
	ldr	r0, .L18
	bl	printk
.L12:
	mov	r2, r6
	mov	r3, r7
	ldr	r0, [r4, #372]
	strd	r6, [r4, #384]
	str	r5, [r4, #392]
	bl	mpp_packet_set_pts
	ldr	r0, [r4, #372]
	mov	r2, r8
	mov	r3, r9
	bl	mpp_packet_set_dts
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_eos
	cbz	r0, .L13
	ldr	r0, [r4, #372]
	bl	mpp_packet_set_eos
.L14:
	ldr	r3, [r4, #368]
	cmp	r3, #0
	beq	.L8
	ldr	r0, [r4, #392]
	clz	r0, r0
	lsrs	r0, r0, #5
	rsbs	r0, r0, #0
	b	.L5
.L13:
	ldr	r0, [r4, #372]
	bl	mpp_packet_clr_eos
	b	.L14
.L19:
	.align	2
.L18:
	.word	.LC1
	.fnend
	.size	mpp_enc_check_frm_pkt, .-mpp_enc_check_frm_pkt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_two_pass, %function
mpp_enc_proc_two_pass:
	.fnstart
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	.pad #140
	sub	sp, sp, #140
	ldr	r0, [r0, #460]
	mov	r7, r1
	bl	mpp_enc_refs_next_frm_is_intra
	mov	r5, r0
	cmp	r0, #0
	beq	.L20
	ldrd	r2, [r4, #216]
	add	r1, r4, #224
	add	r0, sp, #32
	add	r5, r4, #64
	strd	r2, [sp, #24]
	movs	r2, #104
	bl	memcpy
	ldr	r3, [r7, #68]
	ldr	r10, [r7, #48]
	ldrd	fp, r8, [r4, #4]
	mov	r0, r10
	str	r3, [sp, #12]
	ldr	r3, [r7, #64]
	str	r3, [sp, #20]
	bl	mpp_packet_get_length
	ldr	r3, .L70
	ldr	r3, [r3]
	lsls	r6, r3, #26
	str	r0, [sp, #16]
	bpl	.L22
	ldrh	r3, [r4, #222]
	movw	r2, #1329
	ldr	r1, .L70+4
	ldr	r0, .L70+8
	bl	printk
.L22:
	movs	r2, #104
	add	r1, r4, #496
	add	r0, r4, #224
	bl	memcpy
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L23
	ldrh	r3, [r4, #222]
	movw	r2, #1332
	ldr	r1, .L70+4
	ldr	r0, .L70+12
	bl	printk
.L23:
	mov	r1, r5
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_get_cpb_pass1
	ldr	r3, [r9]
	lsls	r5, r3, #15
	bpl	.L24
	ldrh	r3, [r4, #78]
	movw	r2, #1335
	ldr	r1, .L70+4
	ldr	r0, .L70+16
	bl	printk
.L24:
	add	r6, r7, #20
	mov	r0, fp
	mov	r1, r6
	bl	enc_impl_proc_dpb
	mov	r5, r0
	cbz	r0, .L25
	str	r0, [sp]
	mov	r3, #1336
	ldr	r0, .L70+20
	mov	r2, r4
	mov	r1, r3
.L69:
	bl	printk
.L21:
.L20:
	mov	r0, r5
	add	sp, sp, #140
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L25:
	ldr	r3, [r9]
	lsls	r0, r3, #26
	bpl	.L27
	ldrh	r3, [r4, #222]
	movw	r2, #1338
	ldr	r1, .L70+4
	ldr	r0, .L70+24
	bl	printk
.L27:
	mov	r1, r6
	mov	r0, fp
	bl	enc_impl_proc_hal
	mov	r5, r0
	cbz	r0, .L28
	movw	r3, #1339
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+28
	b	.L69
.L28:
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L29
	ldrh	r3, [r4, #222]
	movw	r2, #1341
	ldr	r1, .L70+4
	ldr	r0, .L70+32
	bl	printk
.L29:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_get_task
	mov	r5, r0
	cbz	r0, .L30
	movw	r3, #1342
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+36
	b	.L69
.L30:
	ldr	r3, [r9]
	lsls	r1, r3, #26
	bpl	.L31
	ldrh	r3, [r4, #222]
	mov	r2, #1344
	ldr	r1, .L70+4
	ldr	r0, .L70+40
	bl	printk
.L31:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_gen_regs
	mov	r5, r0
	cbz	r0, .L32
	movw	r3, #1345
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+44
	b	.L69
.L32:
	ldr	r3, [r9]
	lsls	r2, r3, #26
	bpl	.L33
	ldrh	r3, [r4, #222]
	movw	r2, #1347
	ldr	r1, .L70+4
	ldr	r0, .L70+48
	bl	printk
.L33:
	movs	r2, #0
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_start
	mov	r5, r0
	cbz	r0, .L34
	movw	r3, #1349
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+52
	b	.L69
.L34:
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L35
	ldrh	r3, [r4, #222]
	movw	r2, #1351
	ldr	r1, .L70+4
	ldr	r0, .L70+56
	bl	printk
.L35:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_wait
	mov	r5, r0
	cbz	r0, .L36
	mov	r3, #1352
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+60
	b	.L69
.L36:
	mov	r2, r0
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_ret_task
	mov	r5, r0
	cbz	r0, .L37
	movw	r3, #1356
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+64
	b	.L69
.L37:
	ldr	r1, [sp, #16]
	mov	r0, r10
	bl	mpp_packet_set_length
	add	r0, r4, #224
	ldr	r3, [sp, #20]
	add	r1, sp, #32
	str	r3, [r7, #64]
	ldr	r3, [sp, #12]
	str	r3, [r7, #68]
	ldrd	r2, [sp, #24]
	strd	r2, [r4, #216]
	movs	r2, #104
	bl	memcpy
	ldr	r3, [r9]
	lsls	r3, r3, #26
	bpl	.L20
	ldrh	r3, [r4, #222]
	movw	r2, #1366
	ldr	r1, .L70+4
	ldr	r0, .L70+68
	bl	printk
	b	.L20
.L71:
	.align	2
.L70:
	.word	mpp_enc_debug
	.word	.LANCHOR0+23
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.fnend
	.size	mpp_enc_proc_two_pass, .-mpp_enc_proc_two_pass
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	update_rc_cfg_log.constprop.1, %function
update_rc_cfg_log.constprop.1:
	.fnstart
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
	.save {r1, r2, r3}
	push	{r0, r1, r2, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #12
	mov	r5, r0
	ldrd	r4, r6, [r0, #444]
	add	r3, sp, #32
	ldr	r0, [r0, #436]
	subs	r1, r6, r4
	ldr	r2, .L74
	add	r0, r0, r4
	str	r3, [sp, #4]
	bl	vsnprintf
	add	r4, r4, r0
	cmp	r6, r4
	bgt	.L73
	mov	r2, #924
	ldr	r1, .L74+4
	ldr	r0, .L74+8
	bl	printk
.L73:
	str	r4, [r5, #444]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, lr}
	add	sp, sp, #12
	bx	lr
.L75:
	.align	2
.L74:
	.word	.LC18
	.word	.LANCHOR0+45
	.word	.LC19
	.fnend
	.size	update_rc_cfg_log.constprop.1, .-update_rc_cfg_log.constprop.1
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_terminate_task, %function
mpp_enc_terminate_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0, #368]
	mov	r5, r1
	cbz	r3, .L77
	add	r0, r0, #368
	bl	mpp_frame_deinit
	movs	r3, #0
	str	r3, [r4, #368]
.L77:
	ldr	r0, [r4, #372]
	cbz	r0, .L78
	movs	r1, #0
	bl	mpp_packet_set_length
	movw	r3, #10788
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #372
	bl	mpp_packet_deinit
.L78:
	ldrb	r2, [r4, #416]	@ zero_extendqisi2
	movs	r3, #0
	strd	r3, r3, [r4, #368]
	strd	r3, r3, [r4, #392]
	and	r2, r2, #1
	str	r2, [r4, #416]
	str	r3, [r5, #8]
	pop	{r3, r4, r5, pc}
	.fnend
	.size	mpp_enc_terminate_task, .-mpp_enc_terminate_task
	.global	__aeabi_idiv
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_comb_end_jpeg, %function
mpp_enc_comb_end_jpeg:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r5, [r0, #456]
	mov	r4, r0
	ldr	r6, [r0, #8]
	add	r7, r0, #64
	str	r1, [sp, #28]
	bl	get_mpidev_ops
	ldrd	r2, r3, [r5, #64]
	add	r1, r5, #20
	ldr	r8, .L135+40
	subs	r3, r3, r2
	movs	r2, #0
	str	r3, [r5, #68]
	mov	r9, r0
	mov	r0, r6
	bl	mpp_enc_hal_ret_task
	mov	r6, r0
	cmp	r0, #0
	beq	.L86
	str	r0, [sp]
	movw	r3, #1886
	ldr	r0, .L135
	mov	r2, r4
	mov	r1, r3
.L133:
	bl	printk
	ldr	r3, [r4, #52]
	movs	r1, #0
	ldr	r0, [r4, #372]
	adds	r3, r3, #1
	str	r3, [r4, #52]
	bl	mpp_packet_set_length
	movw	r3, #10788
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #372
	bl	mpp_packet_deinit
.L96:
	ldr	r3, [r4, #372]
	ldr	r2, [sp, #28]
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r4, #372]
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L97
	ldrd	r2, [r4, #384]
	ldr	r1, .L135+4
	ldr	r0, .L135+8
	strd	r2, [sp]
	movw	r2, #1934
	ldrh	r3, [r4, #222]
	bl	printk
.L97:
	ldr	r3, [r4, #368]
	cbz	r3, .L98
	add	r0, r4, #368
	bl	mpp_frame_deinit
.L98:
	ldrb	r2, [r4, #416]	@ zero_extendqisi2
	movs	r3, #0
	mov	r0, r6
	strd	r3, r3, [r4, #368]
	strd	r3, r3, [r4, #392]
	and	r2, r2, #1
	str	r2, [r4, #416]
	str	r3, [r5, #8]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L86:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_hal_end
	mov	r6, r0
	cbz	r0, .L88
	movw	r3, #1887
	str	r0, [sp]
.L134:
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L135+12
	b	.L133
.L88:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L89
	ldrh	r3, [r4, #222]
	mov	r2, #1888
	ldr	r1, .L135+4
	ldr	r0, .L135+16
	bl	printk
.L89:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_hal_end
	mov	r6, r0
	cbz	r0, .L90
	str	r0, [sp]
	movw	r3, #1889
	b	.L134
.L90:
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L91
	ldrh	r3, [r4, #222]
	movw	r2, #1890
	ldr	r1, .L135+4
	ldr	r0, .L135+20
	bl	printk
.L91:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_frm_end
	mov	r6, r0
	cbz	r0, .L92
	movw	r3, #1891
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L135+24
	b	.L133
.L92:
	ldr	r2, [r4, #364]
	movw	r3, #10784
	str	r2, [r4, r3]
	bl	mpp_time
	ldr	r3, [r4, #48]
	adds	r3, r3, #1
	str	r3, [r4, #48]
	strd	r0, [r4, #32]
	cmp	r9, #0
	beq	.L93
	ldr	r3, [r9, #24]
	cbz	r3, .L93
	ldr	r0, [r5, #72]
	bl	mpp_frame_get_dts
	mov	r6, r0
	ldr	r0, [r5, #72]
	mov	r7, r1
	bl	mpp_frame_get_pts
	movs	r3, #1
	mov	r2, r6
	strd	r0, [sp]
	movw	r0, #10788
	str	r3, [sp, #8]
	mov	r3, r7
	ldr	r1, [r9, #24]
	ldr	r0, [r4, r0]
	blx	r1
.L93:
	ldr	r3, [r4, #12]
	cbz	r3, .L94
	ldrd	r2, [r4, #24]
	strd	r2, [sp, #16]
	orrs	r3, r2, r3
	beq	.L94
	ldrd	r6, [r4, #32]
	orrs	r3, r6, r7
	beq	.L94
	ldr	r3, [sp, #16]
	movs	r1, #0
	ldr	r0, .L135+28
	subs	r10, r6, r3
	ldr	r3, [sp, #20]
	sbc	fp, r7, r3
	cmp	r0, r10
	sbcs	r3, r1, fp
	bge	.L94
	ldr	r0, .L135+32
	mov	r2, r10
	ldr	r3, [r4, #48]
	asrs	r2, r2, #31
	smull	r0, r1, r10, r0
	movw	r0, #10000
	muls	r0, r3, r0
	rsb	r1, r2, r1, asr #6
	bl	__aeabi_idiv
	movw	r3, #5324
	str	r0, [r4, r3]
	movs	r3, #0
	strd	r6, [r4, #24]
	str	r3, [r4, #48]
.L94:
	ldrh	r3, [r4, #220]
	ldr	r0, [r4, #372]
	and	r3, r3, #251
	strh	r3, [r4, #220]	@ movhi
	ldr	r1, [r5, #68]
	bl	mpp_packet_set_length
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	lsls	r2, r3, #27
	bpl	.L95
	movs	r1, #16
	ldr	r0, [r4, #372]
	bl	mpp_packet_set_flag
.L95:
	ldrb	r1, [r4, #217]	@ zero_extendqisi2
	ldr	r0, [r4, #372]
	lsrs	r1, r1, #4
	bl	mpp_packet_set_temporal_id
	movw	r3, #10788
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	mov	r6, r0
	cmp	r0, #0
	beq	.L96
	movw	r2, #1922
	ldr	r1, .L135+4
	ldr	r0, .L135+36
	movs	r6, #0
	bl	printk
	b	.L96
.L136:
	.align	2
.L135:
	.word	.LC16
	.word	.LANCHOR0+63
	.word	.LC24
	.word	.LC20
	.word	.LC14
	.word	.LC21
	.word	.LC22
	.word	999999
	.word	274877907
	.word	.LC23
	.word	mpp_enc_debug
	.fnend
	.size	mpp_enc_comb_end_jpeg, .-mpp_enc_comb_end_jpeg
	.align	1
	.global	mpp_enc_proc_rc_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_rc_cfg, %function
mpp_enc_proc_rc_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, [r1]
	.pad #236
	sub	sp, sp, #236
	mov	r5, r1
	cmp	r6, #0
	beq	.L180
	mov	r1, r0
	movs	r2, #200
	add	r0, sp, #32
	bl	memcpy
	ldrd	r8, r3, [r4, #112]
	lsls	r7, r6, #31
	ldrd	r9, r10, [r4, #128]
	ldr	fp, [r4, #140]
	str	r3, [sp, #16]
	ldr	r3, [r4, #120]
	str	r3, [sp, #20]
	ldr	r3, [r4, #124]
	str	r3, [sp, #24]
	ldr	r3, [r4, #136]
	str	r3, [sp, #28]
	itt	mi
	ldrmi	r3, [r5, #4]
	strmi	r3, [r4, #4]
	lsls	r0, r6, #30
	itt	mi
	ldrmi	r3, [r5, #8]
	strmi	r3, [r4, #8]
	lsls	r1, r6, #29
	bpl	.L141
	ldr	r3, [r5, #12]
	str	r3, [r4, #12]
	ldr	r3, [r5, #16]
	str	r3, [r4, #16]
	ldr	r3, [r5, #20]
	str	r3, [r4, #20]
.L141:
	lsls	r2, r6, #26
	bpl	.L142
	ldr	r3, [r5, #24]
	str	r3, [r4, #24]
	ldr	r3, [r5, #28]
	str	r3, [r4, #28]
	ldr	r3, [r5, #32]
	str	r3, [r4, #32]
.L142:
	lsls	r3, r6, #25
	bpl	.L143
	ldr	r3, [r5, #36]
	str	r3, [r4, #36]
	ldr	r3, [r5, #40]
	str	r3, [r4, #40]
	ldr	r3, [r5, #44]
	str	r3, [r4, #44]
.L143:
	lsls	r7, r6, #24
	itt	mi
	ldrmi	r3, [r5, #48]
	strmi	r3, [r4, #48]
	lsls	r0, r6, #22
	itt	mi
	ldrmi	r3, [r5, #56]
	strmi	r3, [r4, #56]
	lsls	r1, r6, #21
	bpl	.L146
	ldr	r3, [r5, #64]
	str	r3, [r4, #64]
	ldr	r3, [r5, #68]
	str	r3, [r4, #68]
	ldr	r3, [r5, #72]
	str	r3, [r4, #72]
.L146:
	ands	r7, r6, #16384
	beq	.L147
	ldr	r2, [r5, #88]
	cmp	r2, #1
	bls	.L182
	movs	r3, #2
	movw	r1, #373
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L257
	mvn	r7, #5
	bl	printk
.L148:
	ldr	r3, [r5, #88]
	str	r3, [r4, #88]
.L147:
	lsls	r2, r6, #16
	bpl	.L149
	ldr	r2, [r5, #76]
	cmp	r2, #2
	bls	.L150
	movs	r3, #3
	mov	r1, #384
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L257+4
	mvn	r7, #5
	bl	printk
.L150:
	ldr	r3, [r5, #76]
	str	r3, [r4, #76]
	ldr	r3, [r5, #80]
	str	r3, [r4, #80]
	ldr	r3, [r5, #84]
	str	r3, [r4, #84]
.L149:
	lsls	r3, r6, #7
	bpl	.L151
	ldr	r2, [r5, #92]
	str	r2, [r4, #92]
	ldr	r3, [r5, #96]
	str	r3, [r4, #96]
	cbz	r2, .L151
	cmp	r3, #35
	bls	.L151
	movs	r3, #35
	movs	r2, #0
	movw	r1, #397
	ldr	r0, .L257+8
	bl	printk
	mvn	r7, #5
.L151:
	lsls	r0, r6, #20
	itt	mi
	ldrmi	r3, [r5, #100]
	strmi	r3, [r4, #100]
	lsls	r1, r6, #19
	itt	mi
	ldrmi	r3, [r5, #104]
	strmi	r3, [r4, #104]
	lsls	r2, r6, #18
	itt	mi
	ldrmi	r3, [r5, #108]
	strmi	r3, [r4, #108]
	lsls	r3, r6, #15
	itt	mi
	ldrmi	r3, [r5, #112]
	strmi	r3, [r4, #112]
	lsls	r0, r6, #14
	itttt	mi
	ldrmi	r3, [r5, #124]
	strmi	r3, [r4, #124]
	ldrmi	r3, [r5, #116]
	strmi	r3, [r4, #116]
	lsls	r1, r6, #13
	itttt	mi
	ldrmi	r3, [r5, #128]
	strmi	r3, [r4, #128]
	ldrmi	r3, [r5, #120]
	strmi	r3, [r4, #120]
	lsls	r2, r6, #12
	itt	mi
	ldrmi	r3, [r5, #132]
	strmi	r3, [r4, #132]
	lsls	r3, r6, #11
	itt	mi
	ldrmi	r3, [r5, #136]
	strmi	r3, [r4, #136]
	lsls	r0, r6, #10
	itt	mi
	ldrmi	r3, [r5, #140]
	strmi	r3, [r4, #140]
	lsls	r1, r6, #4
	bpl	.L161
	ldr	r3, [r5, #144]
	str	r3, [r4, #144]
	ldr	r3, [r5, #148]
	str	r3, [r4, #148]
	ldr	r3, [r5, #152]
	str	r3, [r4, #152]
	ldr	r3, [r5, #156]
	str	r3, [r4, #156]
	ldr	r3, [r5, #160]
	str	r3, [r4, #160]
.L161:
	lsls	r2, r6, #6
	bpl	.L162
	ldr	r3, [r5, #164]
	add	r2, r4, #168
	add	r1, r5, #184
	str	r3, [r4, #164]
	add	r3, r5, #168
.L163:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L163
	add	r3, r5, #184
	add	r2, r4, #184
	add	r1, r5, #200
.L164:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L164
.L162:
	lsls	r3, r6, #5
	itt	mi
	ldrmi	r3, [r5, #60]
	strmi	r3, [r4, #60]
	ldr	r3, [r4, #4]
	cmp	r3, #3
	bls	.L166
	ldr	r2, [r5, #4]
	mov	r1, #456
	ldr	r0, .L257+12
	mvn	r7, #5
	bl	printk
.L166:
	ldr	r2, [r4, #8]
	cmp	r2, #6
	bls	.L167
	movw	r1, #461
	ldr	r0, .L257+16
	bl	printk
	mvn	r7, #5
.L167:
	ldr	r3, [r4, #4]
	cmp	r3, #2
	beq	.L168
	ldrd	r2, r0, [r4, #12]
	mvn	lr, #1024
	ldr	r1, .L257+20
	add	r5, r2, lr
	ldr	r3, [r4, #20]
	cmp	r5, r1
	bhi	.L169
	mvn	ip, #1024
	add	r5, r0, ip
	cmp	r5, r1
	bhi	.L169
	mvn	r5, #1024
	adds	r5, r3, r5
	cmp	r5, r1
	bls	.L168
.L169:
	str	r0, [sp]
	movw	r1, #473
	ldr	r0, .L257+24
	mvn	r7, #5
	bl	printk
.L168:
	ldrd	r0, r3, [r4, #124]
	ldr	r2, [r4, #112]
	cmp	r3, #0
	ldrd	r5, r3, [r4, #116]
	it	le
	strle	r0, [r4, #128]
	cmp	r3, #0
	ldr	r3, [r4, #128]
	it	le
	strle	r5, [r4, #120]
	cmp	r0, #0
	ldr	r1, [r4, #120]
	blt	.L172
	cmp	r5, #0
	blt	.L172
	cmp	r5, r0
	blt	.L172
	cmp	r3, #0
	blt	.L172
	cmp	r1, #0
	blt	.L172
	cmp	r1, r3
	blt	.L172
	cmp	r2, #0
	ble	.L173
	cmp	r1, r2
	blt	.L172
	cmp	r3, r2
	ble	.L173
.L172:
	strd	r0, r5, [sp, #4]
	str	r1, [sp]
	movw	r1, #489
	ldr	r0, .L257+28
	bl	printk
	str	r8, [r4, #112]
	str	r9, [r4, #128]
	mov	r2, r8
	movw	r1, #499
	ldr	r0, .L257+32
	ldr	r3, [sp, #20]
	str	r3, [r4, #120]
	ldr	r3, [sp, #24]
	str	r3, [r4, #124]
	ldr	r3, [sp, #16]
	str	r3, [r4, #116]
	str	r3, [sp, #8]
	ldr	r3, [sp, #24]
	str	r3, [sp, #4]
	ldr	r3, [sp, #20]
	str	r3, [sp]
	mov	r3, r9
	bl	printk
.L173:
	ldr	r2, [r4, #136]
	cmp	r2, #0
	bge	.L174
	ldr	r3, [sp, #28]
	movw	r1, #503
	ldr	r0, .L257+36
	bl	printk
	ldr	r3, [sp, #28]
	str	r3, [r4, #136]
.L174:
	ldr	r2, [r4, #140]
	cmp	r2, #0
	bge	.L175
	mov	r3, fp
	mov	r1, #508
	ldr	r0, .L257+40
	bl	printk
	str	fp, [r4, #140]
.L175:
	ldr	r2, [r4, #132]
	cmp	r2, #0
	bge	.L176
	mov	r3, r10
	movw	r1, #513
	ldr	r0, .L257+44
	bl	printk
	str	r10, [r4, #132]
.L176:
	ldr	r2, [r4, #60]
	cmp	r2, #60
	ble	.L177
	movw	r1, #518
	ldr	r0, .L257+48
	bl	printk
.L177:
	ldr	r3, [r4]
	orrs	r6, r6, r3
	str	r6, [r4]
	cbz	r7, .L178
	mov	r2, #524
	ldr	r1, .L257+52
	ldr	r0, .L257+56
	bl	printk
	movs	r2, #200
	mov	r0, r4
	add	r1, sp, #32
	bl	memcpy
.L137:
	mov	r0, r7
	add	sp, sp, #236
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L182:
	movs	r7, #0
	b	.L148
.L178:
	ldr	r3, [r4, #48]
	movw	r1, #529
	ldr	r2, [r4, #12]
	ldr	r0, .L257+60
	str	r3, [sp, #12]
	ldr	r3, [r4, #40]
	str	r3, [sp, #8]
	ldr	r3, [r4, #28]
	str	r3, [sp, #4]
	ldr	r3, [r4, #16]
	str	r3, [sp]
	ldr	r3, [r4, #20]
	bl	printk
	b	.L137
.L180:
	mov	r7, r6
	b	.L137
.L258:
	.align	2
.L257:
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	104856574
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LANCHOR0+85
	.word	.LC37
	.word	.LC38
	.fnend
	.size	mpp_enc_proc_rc_cfg, .-mpp_enc_proc_rc_cfg
	.align	1
	.global	mpp_enc_proc_hw_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_hw_cfg, %function
mpp_enc_proc_hw_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 272
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r6, [r1]
	.pad #272
	sub	sp, sp, #272
	mov	r4, r1
	cmp	r6, #0
	beq	.L274
	mov	r2, #268
	mov	r1, r0
	add	r0, sp, #4
	bl	memcpy
	lsls	r2, r6, #31
	itt	mi
	ldrmi	r3, [r4, #4]
	strmi	r3, [r5, #4]
	lsls	r3, r6, #30
	itt	mi
	ldrmi	r3, [r4, #8]
	strmi	r3, [r5, #8]
	lsls	r0, r6, #29
	bpl	.L263
	add	r3, r4, #12
	add	r2, r5, #12
	add	r1, r4, #76
.L264:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L264
.L263:
	lsls	r1, r6, #28
	bpl	.L265
	add	r3, r4, #76
	add	r2, r5, #76
	add	r1, r4, #140
.L266:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L266
.L265:
	lsls	r2, r6, #27
	bpl	.L267
	add	r3, r4, #140
	add	r2, r5, #140
	add	r1, r4, #204
.L268:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L268
.L267:
	lsls	r3, r6, #26
	bpl	.L269
	add	r3, r4, #204
	add	r2, r5, #204
	add	r4, r4, #268
.L270:
	ldr	r1, [r3], #4	@ unaligned
	cmp	r3, r4
	str	r1, [r2], #4	@ unaligned
	bne	.L270
.L269:
	ldrd	r3, r2, [r5, #4]
	cmp	r3, #0
	blt	.L271
	cmp	r2, #0
	bge	.L275
.L271:
	mov	r1, #568
	ldr	r0, .L301
	bl	printk
	mvn	r4, #5
.L272:
	ldr	r3, [r5]
	orrs	r6, r6, r3
	str	r6, [r5]
	cbz	r4, .L259
	movw	r2, #575
	ldr	r1, .L301+4
	ldr	r0, .L301+8
	bl	printk
	mov	r2, #268
	mov	r0, r5
	add	r1, sp, #4
	bl	memcpy
.L259:
	mov	r0, r4
	add	sp, sp, #272
	@ sp needed
	pop	{r4, r5, r6, pc}
.L275:
	movs	r4, #0
	b	.L272
.L274:
	mov	r4, r6
	b	.L259
.L302:
	.align	2
.L301:
	.word	.LC39
	.word	.LANCHOR0+105
	.word	.LC40
	.fnend
	.size	mpp_enc_proc_hw_cfg, .-mpp_enc_proc_hw_cfg
	.align	1
	.global	mpp_enc_unref_osd_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_unref_osd_buf, %function
mpp_enc_unref_osd_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	cbz	r0, .L316
	ldr	r3, [r0]
	cbz	r3, .L316
	ldr	r7, .L320
	mov	r5, r0
	ldr	r8, .L320+4
	movs	r6, #0
.L306:
	ldr	r3, [r4, #4]
	cmp	r6, r3
	bcc	.L309
.L316:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L309:
	ldr	r0, [r5, #136]
	cbz	r0, .L307
	mov	r2, r7
	mov	r1, r8
	bl	mpi_buf_unref_with_tag
.L307:
	ldr	r0, [r5, #88]
	cbz	r0, .L308
	mov	r2, r7
	mov	r1, r8
	bl	mpi_buf_unref_with_tag
.L308:
	adds	r6, r6, #1
	adds	r5, r5, #140
	b	.L306
.L321:
	.align	2
.L320:
	.word	.LANCHOR0+125
	.word	.LC41
	.fnend
	.size	mpp_enc_unref_osd_buf, .-mpp_enc_unref_osd_buf
	.align	1
	.global	mpp_enc_proc_export_osd_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_export_osd_buf, %function
mpp_enc_proc_export_osd_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #104
	sub	sp, sp, #104
	mov	r7, r0
	bl	get_mpibuf_ops
	movs	r2, #104
	movs	r1, #0
	mov	r5, r0
	mov	r0, sp
	bl	memset
	cbz	r5, .L323
	ldr	r3, [r5, #44]
	cbz	r3, .L323
	ldr	r9, .L337+8
	mov	r4, r7
	ldr	r10, .L337+12
	movs	r6, #0
.L324:
	ldr	r3, [r7, #4]
	cmp	r3, r6
	bhi	.L330
	movs	r0, #0
	b	.L322
.L323:
	movw	r2, #689
	ldr	r1, .L337
	ldr	r0, .L337+4
	bl	printk
	mov	r0, #-1
.L322:
	add	sp, sp, #104
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L330:
	ldr	r0, [r4, #132]
	cmp	r0, #0
	ble	.L326
	bl	dma_buf_get
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L327
	ldr	r3, [r5, #44]
	mov	r2, #-1
	mov	r1, sp
	blx	r3
	str	r0, [r4, #136]
	mov	r0, r8
	bl	dma_buf_put
.L326:
	ldr	r0, [r4, #84]
	cmp	r0, #0
	ble	.L328
	bl	dma_buf_get
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L329
	ldr	r3, [r5, #44]
	mov	r2, #-1
	mov	r1, sp
	blx	r3
	str	r0, [r4, #88]
	mov	r0, r8
	bl	dma_buf_put
.L328:
	adds	r6, r6, #1
	adds	r4, r4, #140
	b	.L324
.L327:
	ldr	r2, [r4, #132]
	mov	r1, #704
	mov	r0, r9
	bl	printk
	b	.L326
.L329:
	ldr	r2, [r4, #84]
	movw	r1, #715
	mov	r0, r10
	bl	printk
	b	.L328
.L338:
	.align	2
.L337:
	.word	.LANCHOR0+147
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.fnend
	.size	mpp_enc_proc_export_osd_buf, .-mpp_enc_proc_export_osd_buf
	.align	1
	.global	mpp_enc_proc_tune_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_tune_cfg, %function
mpp_enc_proc_tune_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r7, [r1]
	.pad #24
	sub	sp, sp, #24
	mov	r8, r1
	cmp	r7, #0
	beq	.L346
	ldm	r0, {r0, r1, r2}
	add	r5, sp, #12
	stm	r5, {r0, r1, r2}
	lsls	r2, r7, #31
	itt	mi
	ldrmi	r3, [r8, #4]
	strmi	r3, [r4, #4]
	ldr	r2, [r4, #4]
	cmp	r2, #1
	bls	.L347
	movs	r3, #1
	movw	r1, #735
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L357
	mvn	r6, #5
	bl	printk
.L342:
	lsls	r3, r7, #30
	itt	mi
	ldrmi	r3, [r8, #8]
	strmi	r3, [r4, #8]
	ldr	r3, [r4, #8]
	cmp	r3, #1
	bls	.L344
	movs	r3, #1
	movs	r2, #0
	movw	r1, #743
	ldr	r0, .L357+4
	bl	printk
	mvn	r6, #5
.L344:
	ldr	r3, [r4]
	orrs	r7, r7, r3
	str	r7, [r4]
	cbz	r6, .L339
	movw	r2, #750
	ldr	r1, .L357+8
	ldr	r0, .L357+12
	bl	printk
	ldm	r5, {r0, r1, r2}
	stm	r4, {r0, r1, r2}
.L339:
	mov	r0, r6
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L347:
	movs	r6, #0
	b	.L342
.L346:
	mov	r6, r7
	b	.L339
.L358:
	.align	2
.L357:
	.word	.LC45
	.word	.LC46
	.word	.LANCHOR0+175
	.word	.LC47
	.fnend
	.size	mpp_enc_proc_tune_cfg, .-mpp_enc_proc_tune_cfg
	.align	1
	.global	mpp_enc_proc_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_cfg, %function
mpp_enc_proc_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L492
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	cmp	r1, r3
	mov	r4, r0
	mov	r7, r1
	mov	r5, r2
	beq	.L360
	bhi	.L361
	subs	r3, r3, #6
	cmp	r1, r3
	beq	.L362
	bhi	.L363
	subs	r3, r3, #8
	cmp	r1, r3
	beq	.L364
	adds	r3, r3, #4
	cmp	r1, r3
	beq	.L365
.L366:
	mov	r2, r5
	mov	r1, r7
	b	.L485
.L363:
	ldr	r3, .L492+4
	cmp	r1, r3
	bcc	.L366
	ldrb	r3, [r0, #416]	@ zero_extendqisi2
	lsls	r6, r3, #31
	bmi	.L382
	ldr	r1, [r0, #404]
	ldr	r0, [r0, #4]
	bl	enc_impl_gen_hdr
	ldr	r0, [r4, #404]
	bl	mpp_packet_get_length
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r4, #416]
	str	r0, [r4, #412]
.L382:
	ldr	r3, .L492+8
	cmp	r7, r3
	bne	.L383
	movw	r1, #825
	ldr	r0, .L492+12
	bl	printk
	movw	r1, #826
	ldr	r0, .L492+16
	bl	printk
	ldr	r3, [r4, #404]
	str	r3, [r5]
.L384:
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r4, #416]
	b	.L483
.L361:
	ldr	r3, .L492+20
	cmp	r1, r3
	beq	.L368
	bhi	.L369
	ldr	r3, .L492+24
	cmp	r1, r3
	beq	.L370
	adds	r3, r3, #2
	cmp	r1, r3
	bne	.L366
	movs	r2, #136
	mov	r1, r5
	add	r0, r0, #4016
	bl	memcpy
	b	.L483
.L369:
	ldr	r3, .L492+28
	cmp	r1, r3
	beq	.L372
	adds	r3, r3, #253
	cmp	r1, r3
	beq	.L373
	subw	r3, r3, #767
	cmp	r1, r3
	bne	.L366
	movs	r3, #0
	str	r3, [sp]
	movw	r3, #5304
	ldr	r3, [r0, r3]
	str	r3, [sp, #4]
	ldr	r3, [r2]
	cbz	r3, .L390
	mov	r0, sp
	bl	mpp_enc_ref_cfg_init
.L390:
	ldr	r3, [sp, #4]
	cbnz	r3, .L391
	add	r0, sp, #4
	bl	mpp_enc_ref_cfg_init
	movw	r3, #5304
	ldr	r2, [sp, #4]
	str	r2, [r4, r3]
.L391:
	ldr	r1, [r5]
	cmp	r1, #5
	bhi	.L392
	tbh	[pc, r1, lsl #1]
.L394:
	.2byte	(.L397-.L394)/2
	.2byte	(.L396-.L394)/2
	.2byte	(.L396-.L394)/2
	.2byte	(.L396-.L394)/2
	.2byte	(.L395-.L394)/2
	.2byte	(.L393-.L394)/2
	.p2align 1
.L364:
	ldr	r6, [r2]
	mov	r1, #768
	ldr	r0, .L492+32
	bl	printk
	cbz	r6, .L375
	lsls	r3, r6, #31
	itt	mi
	ldrmi	r3, [r5, #4]
	strmi	r3, [r4, #604]
	movs	r3, #0
	str	r3, [r5]
.L375:
	ldr	r3, [r5, #104]
	cbz	r3, .L377
	add	r1, r5, #104
	add	r0, r4, #704
	bl	mpp_enc_proc_rc_cfg
	movs	r3, #0
	str	r3, [r5, #104]
.L377:
	ldr	r3, [r5, #304]
	cbz	r3, .L378
	add	r1, r5, #304
	add	r0, r4, #904
	bl	mpp_enc_proc_hw_cfg
	movs	r3, #0
	str	r3, [r5, #304]
.L378:
	movw	r6, #4708
	adds	r1, r5, r6
	ldr	r3, [r5, r6]
	cbz	r3, .L379
	add	r0, r4, #5280
	adds	r0, r0, #28
	bl	mpp_enc_proc_tune_cfg
	movs	r3, #0
	str	r3, [r5, r6]
.L379:
	ldr	r1, .L492+36
	mov	r2, r5
.L485:
	ldr	r0, [r4, #4]
	bl	enc_impl_proc_cfg
	b	.L486
.L365:
	cbnz	r2, .L381
.L483:
	movs	r6, #0
	b	.L380
.L381:
	mov	r1, r2
	add	r0, r0, #704
	bl	mpp_enc_proc_rc_cfg
.L486:
	mov	r6, r0
	b	.L380
.L362:
	ldr	r3, [r0, #468]
	adds	r3, r3, #1
	str	r3, [r0, #468]
	b	.L483
.L383:
	ldr	r1, [r4, #404]
	mov	r0, r5
	bl	mpp_packet_copy
	b	.L384
.L370:
	mov	r1, #836
	ldr	r0, .L492+40
	bl	printk
	b	.L483
.L368:
	cbz	r2, .L385
	ldr	r3, [r2]
	cmp	r3, #1
	bhi	.L386
	ldr	r2, .L492+44
	str	r3, [r0, #420]
	ldr	r2, [r2]
	lsls	r0, r2, #30
	bpl	.L483
	ldr	r1, .L492+48
	mov	r2, #844
	ldr	r0, .L492+52
.L490:
	bl	printk
	b	.L483
.L386:
	ldr	r1, .L492+48
	movw	r2, #846
	ldr	r0, .L492+56
.L487:
	bl	printk
.L484:
	mov	r6, #-1
.L380:
	ldr	r3, [r4, #1172]
	bic	r8, r7, #4
	sub	r2, r3, #8
	cmp	r2, #1
	bls	.L408
	ldr	r2, .L492+60
	cmp	r8, r2
	beq	.L430
	adds	r2, r2, #6
	cmp	r7, r2
	beq	.L430
	subs	r2, r2, #4
	cmp	r7, r2
	bne	.L410
	ldr	r3, [r5]
	tst	r3, #225
	beq	.L411
	movs	r3, #2
	b	.L409
.L385:
	movw	r2, #850
.L491:
	ldr	r1, .L492+48
	ldr	r0, .L492+64
.L489:
	bl	printk
	b	.L484
.L360:
	cbz	r2, .L388
	ldr	r3, [r2]
	cmp	r3, #2
	bhi	.L389
	ldr	r2, .L492+44
	str	r3, [r0, #424]
	ldr	r2, [r2]
	lsls	r1, r2, #30
	bpl	.L483
	mov	r2, #860
	ldr	r1, .L492+48
	ldr	r0, .L492+68
	b	.L490
.L389:
	movw	r2, #862
	ldr	r1, .L492+48
	ldr	r0, .L492+72
	b	.L487
.L388:
	movw	r2, #866
	b	.L491
.L397:
	bl	mpp_enc_ref_default
	str	r0, [sp]
.L398:
	ldr	r1, [sp]
	cmp	r1, #0
	beq	.L427
	ldr	r0, [sp, #4]
	bl	mpp_enc_ref_cfg_copy
	mov	r3, r0
	cbz	r0, .L400
	movw	r2, #646
	ldr	r1, .L492+76
	ldr	r0, .L492+80
	bl	printk
.L400:
	ldr	r1, [sp, #4]
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_set_cfg
	mov	r6, r0
	cbz	r0, .L401
	mov	r3, r0
	movw	r2, #650
	ldr	r1, .L492+76
	ldr	r0, .L492+84
	bl	printk
.L401:
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_update_hdr
	cbz	r0, .L402
	movs	r3, #0
	str	r3, [r4, #416]
.L402:
	ldr	r3, [r5]
	cbz	r3, .L399
	ldr	r3, [sp]
	cbz	r3, .L399
	mov	r0, sp
	bl	mpp_enc_ref_cfg_deinit
.L399:
	add	r2, r4, #5280
	add	r1, r5, #24
	mov	r3, r5
.L403:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L403
	b	.L380
.L493:
	.align	2
.L492:
	.word	3276815
	.word	3276813
	.word	3276814
	.word	.LC49
	.word	.LC50
	.word	3309569
	.word	3276817
	.word	3310595
	.word	.LC48
	.word	3276801
	.word	.LC51
	.word	mpp_enc_debug
	.word	.LANCHOR0+197
	.word	.LC52
	.word	.LC53
	.word	3276803
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LANCHOR0+214
	.word	.LC58
	.word	.LC59
.L396:
	ldr	r0, [sp]
	bl	mpi_enc_gen_ref_cfg
	b	.L398
.L395:
	mov	r1, r5
	ldr	r0, [sp]
	bl	mpi_enc_gen_smart_gop_ref_cfg
	b	.L398
.L393:
	mov	r1, r5
	ldr	r0, [sp]
	bl	mpi_enc_gen_hir_skip_ref
	b	.L398
.L392:
	mov	r1, #640
	ldr	r0, .L494
	bl	printk
	b	.L398
.L427:
	mov	r6, r1
	b	.L399
.L372:
	add	r6, r0, #4128
	adds	r6, r6, #24
	mov	r0, r6
	bl	mpp_enc_unref_osd_buf
	mov	r2, #1128
	mov	r1, r5
	mov	r0, r6
	bl	memcpy
	mov	r0, r6
	bl	mpp_enc_proc_export_osd_buf
	b	.L483
.L373:
	movw	r3, #6634
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	cbnz	r3, .L404
	movw	r1, #589
	ldr	r0, .L494+4
	bl	printk
	b	.L484
.L404:
	ldr	r6, [r2]
	movw	r3, #6633
	ldrb	r8, [r0, r3]	@ zero_extendqisi2
	cmp	r6, #1024
	and	r8, r8, #3
	bls	.L405
	mov	r2, r6
	mov	r1, #596
	ldr	r0, .L494+8
	b	.L489
.L405:
	mov	r3, sp
	bic	r3, r3, #8160
	add	r9, r0, r8, lsl #10
	bic	r3, r3, #31
	add	r9, r9, #6624
	ldr	r1, [r2, #4]
	ldr	r3, [r3, #8]
	add	r9, r9, #15
	.syntax unified
@ 157 "./include/linux/uaccess.h" 1
	.syntax unified
adds r2, r1, r6; sbcscc r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r2, r6
	cbnz	r3, .L406
	mov	r0, r9
	bl	arm_copy_from_user
	mov	r2, r0
.L406:
	cmp	r2, #0
	beq	.L407
	subs	r0, r6, r2
	movs	r1, #0
	add	r0, r0, r9
	mvn	r6, #13
	bl	memset
	b	.L380
.L410:
	ldr	r2, .L494+12
	cmp	r7, r2
	bne	.L412
	ldr	r2, [r4, #608]
	tst	r2, #21
	bne	.L432
	ldr	r2, [r4, #704]
	tst	r2, #225
	bne	.L433
	cmp	r3, #7
	beq	.L414
	ldr	r2, .L494+16
	cmp	r3, r2
	beq	.L414
.L408:
	ldr	r3, .L494+20
	cmp	r7, r3
	beq	.L411
	ldr	r3, .L494+24
	cmp	r7, r3
	beq	.L411
.L412:
	ldr	r3, .L494+28
	cmp	r7, r3
	beq	.L411
	sub	r3, r3, #33280
	cmp	r7, r3
	bne	.L481
.L416:
	ldr	r3, [r4, #608]
	tst	r3, #5
	beq	.L479
.L411:
	movs	r3, #1
	str	r3, [r4, #452]
	ldr	r3, .L494+20
	cmp	r7, r3
	beq	.L418
	ldr	r3, .L494+12
	cmp	r7, r3
	beq	.L418
.L421:
	ldr	r3, .L494+24
	cmp	r8, r3
	bne	.L482
.L424:
	movs	r3, #0
	str	r3, [r4, #56]
.L359:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L414:
	ldr	r3, [r4, #1176]
	cmp	r3, #0
	beq	.L416
	movs	r3, #5
	b	.L409
.L430:
	movs	r3, #1
.L409:
	ldr	r2, .L494+32
	mov	r1, #270
	ldr	r0, .L494+36
	add	r3, r2, r3, lsl #2
	ldr	r2, [r3, #236]
	bl	printk
	ldr	r3, [r4, #464]
	orr	r3, r3, #1
	str	r3, [r4, #464]
	movs	r3, #0
	str	r3, [r4, #416]
	b	.L408
.L432:
	movs	r3, #3
	b	.L409
.L433:
	movs	r3, #4
	b	.L409
.L479:
	ldr	r3, [r4, #704]
	bics	r3, r3, #2
	bne	.L411
	movw	r3, #5308
	ldr	r3, [r4, r3]
	lsls	r2, r3, #30
	bmi	.L411
.L422:
	ldr	r3, .L494+12
	cmp	r8, r3
	bne	.L421
	b	.L424
.L418:
	ldr	r3, [r4, #704]
	lsls	r3, r3, #24
	bpl	.L422
	ldr	r1, [r4, #752]
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_set_rc_igop
	b	.L422
.L482:
	ldr	r3, .L494+28
	cmp	r7, r3
.L488:
	bne	.L359
	b	.L424
.L407:
	ldr	r0, [r5]
	add	r1, r4, r8
	movw	r3, #6635
	add	r8, r8, #1
	strb	r0, [r1, r3]
	movw	r3, #6633
	movw	r1, #6634
	strb	r8, [r4, r3]
	ldrb	r3, [r4, r1]	@ zero_extendqisi2
	subs	r3, r3, #1
	strb	r3, [r4, r1]
	b	.L483
.L481:
	ldr	r3, .L494+24
	cmp	r8, r3
	b	.L488
.L495:
	.align	2
.L494:
	.word	.LC57
	.word	.LC60
	.word	.LC61
	.word	3276801
	.word	16777220
	.word	3276805
	.word	3276803
	.word	3310081
	.word	.LANCHOR0
	.word	.LC62
	.fnend
	.size	mpp_enc_proc_cfg, .-mpp_enc_proc_cfg
	.align	1
	.global	mpp_enc_proc_rc_update
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_rc_update, %function
mpp_enc_proc_rc_update:
	.fnstart
	@ args = 0, pretend = 0, frame = 264
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r5, [r0, #452]
	.pad #308
	sub	sp, sp, #308
	cmp	r5, #0
	beq	.L496
	ldr	r6, .L558
	ldr	r3, [r6]
	lsls	r1, r3, #26
	bpl	.L498
	movw	r2, #1094
	ldr	r1, .L558+4
	ldr	r0, .L558+8
	bl	printk
.L498:
	mov	r2, #260
	movs	r1, #0
	add	r0, sp, #44
	bl	memset
	ldrd	r9, r8, [r4, #732]
	movw	r3, #5304
	ldr	r7, [r4, r3]
	cmp	r8, #0
	beq	.L528
	mov	r1, r8
	mov	r0, r9
	bl	__aeabi_idiv
	mov	r1, r0
	cmp	r0, #0
	beq	.L529
.L499:
	ldr	r0, [r4, #752]
	bl	__aeabi_idiv
	lsls	r5, r0, #2
	cmp	r5, #8
	it	ge
	movge	r5, #8
.L500:
	ldr	r3, [r4, #612]
	str	r3, [sp, #44]
	ldr	r3, [r4, #616]
	str	r3, [sp, #48]
	ldr	r3, [r4, #708]
	cmp	r3, #1
	beq	.L503
	cbz	r3, .L502
	cmp	r3, #2
	it	ne
	movne	r3, #3
.L503:
	str	r3, [sp, #52]
.L502:
	ldr	r3, [r4, #728]
	add	ip, sp, #276
	ldr	lr, [r4, #744]
	str	r8, [sp, #64]
	strd	r3, r9, [sp, #56]
	add	r9, r4, #904
	ldr	r3, [r4, #740]
	str	lr, [sp, #72]
	str	r3, [sp, #68]
	ldr	r3, [r4, #748]
	str	r3, [sp, #76]
	ldr	r3, [r4, #752]
	str	r3, [sp, #84]
	ldr	r3, [r4, #804]
	str	r3, [sp, #108]
	ldr	r3, [r4, #808]
	str	r3, [sp, #112]
	ldr	r3, [r4, #812]
	str	r3, [sp, #116]
	ldr	r3, [r4, #852]
	str	r3, [sp, #164]
	ldr	r3, [r4, #848]
	str	r3, [sp, #168]
	ldr	r3, [r4, #860]
	str	r3, [sp, #172]
	ldr	r3, [r4, #856]
	str	r3, [sp, #176]
	ldr	r3, [r4, #864]
	str	r3, [sp, #180]
	ldr	r3, [r4, #716]
	str	r3, [sp, #96]
	ldr	r3, [r4, #720]
	str	r3, [sp, #100]
	ldr	r3, [r4, #724]
	str	r3, [sp, #92]
	add	r3, r4, #5312
	ldr	r3, [r3]
	str	r3, [sp, #296]
	movw	r3, #5316
	ldr	r3, [r4, r3]
	str	r3, [sp, #300]
	ldr	r3, [r4, #868]
	str	r3, [sp, #256]
	add	r3, r4, #888
	mov	r8, r3
.L505:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r9
	mov	r2, ip
	stmia	r2!, {r0, r1}
	mov	ip, r2
	bne	.L505
	add	r3, r4, #872
	add	ip, sp, #260
.L506:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r8
	mov	r2, ip
	stmia	r2!, {r0, r1}
	mov	ip, r2
	bne	.L506
	cmp	lr, #0
	bne	.L507
	mov	r1, #1012
	ldr	r3, .L558+12
	str	r1, [sp]
	ldr	r2, .L558+16
	ldr	r0, .L558+20
	bl	printk
.L507:
	ldr	r3, [r4, #764]
	cbz	r3, .L556
	cmp	r3, #60
	it	ge
	movge	r3, #60
	mov	r5, r3
.L556:
	cmp	r5, #1
	ldr	r3, [r4, #1172]
	it	lt
	movlt	r5, #1
	cmp	r3, #8
	str	r5, [sp, #104]
	beq	.L509
	bhi	.L510
	cmp	r3, #7
.L557:
	bne	.L512
.L511:
	ldr	r3, [r4, #816]
	ldr	r1, [r4, #820]
	ldr	r2, [r4, #828]
	str	r3, [sp, #136]
	ldr	r3, [r4, #824]
	str	r1, [sp, #140]
	cmp	r3, #0
	it	eq
	moveq	r3, r1
	str	r3, [sp, #148]
	ldr	r3, [r4, #832]
	str	r2, [sp, #144]
	cmp	r3, #0
	it	eq
	moveq	r3, r2
	str	r3, [sp, #152]
	ldr	r3, [r4, #840]
	str	r3, [sp, #156]
	ldr	r3, [r4, #844]
	str	r3, [sp, #160]
.L515:
	movs	r3, #0
	mov	r2, #256
	strd	r3, r3, [sp, #128]
	strd	r2, r3, [sp, #120]
	ldr	r3, [r4, #760]
	str	r3, [sp, #200]
	ldr	r3, [r4, #768]
	str	r3, [sp, #220]
	ldr	r3, [r4, #772]
	str	r3, [sp, #224]
	ldr	r3, [r4, #776]
	str	r3, [sp, #228]
	ldr	r3, [r4, #792]
	str	r3, [sp, #244]
	ldr	r3, [r4, #780]
	str	r3, [sp, #232]
	ldr	r3, [r4, #784]
	str	r3, [sp, #236]
	ldr	r3, [r4, #788]
	str	r3, [sp, #240]
	ldr	r3, [r4, #796]
	str	r3, [sp, #248]
	ldr	r3, [r4, #800]
	str	r3, [sp, #252]
	ldr	r5, [r7, #64]
	cbz	r5, .L517
	ldrd	r0, r1, [r4, #744]
	str	r5, [sp, #88]
	bl	__aeabi_idiv
	cmp	r5, r0
	blt	.L517
	ldr	r3, [sp, #84]
	cmp	r5, r3
	bge	.L517
	movs	r3, #1
	str	r3, [sp, #80]
	ldr	r3, [sp, #160]
	cbnz	r3, .L517
	movs	r3, #2
	str	r3, [sp, #160]
.L517:
	ldr	r3, [r4, #1172]
	ldr	r7, .L558+24
	cmp	r3, #7
	beq	.L519
	ldr	r2, .L558+28
	cmp	r3, r2
	bne	.L520
.L519:
	ldr	r2, .L558+32
	ldr	r3, .L558+36
	ldr	r0, [sp, #68]
	ldr	r1, [sp, #56]
	cmp	r1, #0
	ite	ne
	movne	r1, r3
	moveq	r1, r2
	cmp	r0, #0
	it	eq
	moveq	r3, r2
	ldr	r0, [sp, #88]
	ldr	r2, [sp, #52]
	str	r0, [sp, #36]
	ldr	r0, [sp, #84]
	add	r2, r7, r2, lsl #2
	ldr	r2, [r2, #308]
	str	r0, [sp, #32]
	ldr	r0, [sp, #76]
	str	r0, [sp, #28]
	ldr	r0, [sp, #72]
	strd	r3, r0, [sp, #20]
	ldr	r3, [sp, #64]
	ldr	r0, .L558+40
	str	r3, [sp, #16]
	ldr	r3, [sp, #60]
	strd	r1, r3, [sp, #8]
	movw	r1, #1079
	ldr	r3, [r4, #720]
	str	r3, [sp, #4]
	ldr	r3, [r4, #716]
	str	r3, [sp]
	ldr	r3, [r4, #724]
	bl	printk
.L520:
	movw	r3, #5340
	ldr	r3, [r4, r3]
	cbnz	r3, .L523
	add	r3, r4, #5344
	ldr	r3, [r3]
	cbz	r3, .L524
.L523:
	movs	r3, #1
	str	r3, [sp, #292]
.L524:
	add	r1, sp, #44
	ldr	r0, [r4, #60]
	bl	rc_update_usr_cfg
	movs	r3, #0
	str	r3, [r4, #704]
	str	r3, [r4, #608]
	ldr	r3, [r6]
	lsls	r3, r3, #26
	mov	r5, r0
	bpl	.L525
	movw	r2, #1106
	ldr	r1, .L558+4
	ldr	r0, .L558+44
	bl	printk
.L525:
	movs	r3, #0
	str	r3, [r4, #452]
	ldr	r3, [r4, #440]
	mov	r0, r4
	ldr	r2, [sp, #80]
	ldr	r1, .L558+48
	str	r3, [r4, #444]
	movw	r3, #5320
	str	r2, [r4, r3]
	ldr	r3, [sp, #156]
	ldr	r2, [sp, #52]
	str	r3, [sp, #32]
	ldr	r3, [sp, #148]
	add	r2, r7, r2, lsl #2
	ldr	r2, [r2, #308]
	str	r3, [sp, #28]
	ldr	r3, [sp, #152]
	str	r3, [sp, #24]
	ldr	r3, [sp, #140]
	b	.L559
.L560:
	.align	2
.L558:
	.word	mpp_enc_debug
	.word	.LANCHOR0+260
	.word	.LC65
	.word	.LANCHOR0+283
	.word	.LC66
	.word	.LC67
	.word	.LANCHOR0
	.word	16777220
	.word	.LC64
	.word	.LC63
	.word	.LC69
	.word	.LC70
	.word	.LC18
.L559:
	str	r3, [sp, #20]
	ldr	r3, [sp, #144]
	str	r3, [sp, #16]
	ldr	r3, [sp, #136]
	str	r3, [sp, #12]
	ldr	r3, [sp, #84]
	str	r3, [sp, #8]
	ldr	r3, [sp, #100]
	str	r3, [sp, #4]
	ldr	r3, [sp, #92]
	str	r3, [sp]
	ldr	r3, [sp, #96]
	bl	update_rc_cfg_log.constprop.1
.L496:
	mov	r0, r5
	add	sp, sp, #308
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L528:
	movs	r1, #1
	b	.L499
.L529:
	movs	r5, #8
	b	.L500
.L510:
	cmp	r3, #9
	beq	.L511
	ldr	r2, .L561
	cmp	r3, r2
	b	.L557
.L509:
	ldr	r3, [r4, #1184]
	ldr	r2, [r4, #1188]
	str	r3, [sp, #136]
	ldr	r3, [r4, #1192]
	str	r2, [sp, #140]
	strd	r3, r2, [sp, #144]
	str	r3, [sp, #152]
	b	.L515
.L512:
	movw	r2, #1039
	ldr	r1, .L561+4
	ldr	r0, .L561+8
	bl	printk
	b	.L515
.L562:
	.align	2
.L561:
	.word	16777220
	.word	.LANCHOR0+294
	.word	.LC68
	.fnend
	.size	mpp_enc_proc_rc_update, .-mpp_enc_proc_rc_update
	.align	1
	.global	mpp_enc_alloc_output_from_bufpool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_alloc_output_from_bufpool, %function
mpp_enc_alloc_output_from_bufpool:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #56
	sub	sp, sp, #56
	mov	r5, r0
	bl	mpp_enc_check_frm_pkt
	mov	r6, r0
	cmp	r0, #0
	bne	.L563
	mov	r1, r0
	ldr	r0, [r5, #372]
	bl	mpp_packet_set_length
	ldr	r8, [r5, #396]
	ldr	r7, .L597
	cmp	r8, #0
	bne	.L565
	ldr	r4, [r5, #612]
	ldr	r8, [r5, #372]
	adds	r4, r4, #15
	bic	r3, r4, #15
	ldr	r4, [r5, #616]
	adds	r4, r4, #15
	bic	r4, r4, #15
	muls	r4, r3, r4
	ldr	r3, [r5]
	cmp	r3, #8
	mov	r3, #0
	str	r3, [sp, #20]
	itt	eq
	addeq	r4, r4, r4, lsl #1
	lsreq	r4, r4, #1
	bl	get_mpibuf_ops
	mov	r9, r0
	cbnz	r4, .L567
	movw	r1, #1193
	ldr	r3, .L597+4
	str	r1, [sp]
	ldr	r2, .L597+8
	ldr	r0, .L597+12
	bl	printk
.L567:
	cmp	r9, #0
	beq	.L569
	movw	r10, #5364
	ldr	r3, [r5, r10]
	cbnz	r3, .L570
	ldr	r3, [r9, #52]
	cbz	r3, .L570
	movs	r1, #2
	mov	r0, r4
	blx	r3
	str	r0, [r5, r10]
.L570:
	movw	r3, #5364
	ldr	r0, [r5, r3]
	cbz	r0, .L569
	ldr	r3, [r9, #60]
	cbz	r3, .L569
	blx	r3
	movs	r2, #32
	movs	r1, #0
	mov	r10, r0
	add	r0, sp, #24
	bl	memset
	cmp	r10, #0
	beq	.L569
	ldr	r3, .L597+4
	add	r2, sp, #20
	add	r1, sp, #24
	movs	r0, #0
	str	r10, [sp, #36]
	str	r3, [sp]
	ldr	r3, .L597+16
	str	r4, [sp, #28]
	bl	mpp_buffer_import_with_tag
	ldr	r3, [r9, #16]
	cbz	r3, .L569
	mov	r0, r10
	blx	r3
.L569:
	ldr	r0, [sp, #20]
	cbnz	r0, .L576
	ldr	r9, .L597+4
	mov	r2, r4
	ldr	r3, .L597+16
	add	r1, sp, #20
	str	r9, [sp]
	bl	mpp_buffer_get_with_tag
	ldr	r3, [sp, #20]
	cbnz	r3, .L576
	movw	r1, #1217
	mov	r3, r9
	str	r1, [sp]
	ldr	r2, .L597+20
	ldr	r0, .L597+12
	bl	printk
.L576:
	ldr	r0, [sp, #20]
	add	r3, r8, #72
	ldr	r1, .L597+4
	movs	r4, #0
	str	r3, [r5, #396]
	str	r0, [r8, #72]
	bl	mpp_buffer_get_mpi_buf_id_with_caller
	ldr	r1, .L597+4
	str	r4, [r8, #84]
	str	r0, [r8, #76]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_size_with_caller
	ldr	r1, .L597+4
	str	r0, [r8, #96]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L597+4
	strd	r0, r0, [r8, #24]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_size_with_caller
	ldr	r2, [r7]
	lsls	r2, r2, #26
	ldr	r3, [sp, #20]
	strd	r0, r4, [r8, #32]
	str	r3, [r8, #68]
	bpl	.L563
	str	r3, [sp]
	movw	r2, #1231
	ldr	r3, [r5, #372]
	ldr	r1, .L597+24
	ldr	r0, .L597+28
	bl	printk
.L563:
	mov	r0, r6
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L565:
	ldr	r3, [r7]
	lsls	r3, r3, #26
	bpl	.L563
	ldr	r4, [r5, #372]
	mov	r0, r4
	bl	mpp_packet_get_pos
	mov	r7, r0
	ldr	r0, [r5, #372]
	bl	mpp_packet_get_length
	mov	r3, r4
	movw	r2, #1236
	ldr	r1, .L597+24
	strd	r7, r0, [sp, #4]
	str	r8, [sp]
	ldr	r0, .L597+32
	bl	printk
	b	.L563
.L598:
	.align	2
.L597:
	.word	mpp_enc_debug
	.word	.LANCHOR0+324
	.word	.LC71
	.word	.LC67
	.word	.LC41
	.word	.LC72
	.word	.LANCHOR0+358
	.word	.LC73
	.word	.LC74
	.fnend
	.size	mpp_enc_alloc_output_from_bufpool, .-mpp_enc_alloc_output_from_bufpool
	.align	1
	.global	mpp_enc_alloc_output_from_ringbuf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_alloc_output_from_ringbuf, %function
mpp_enc_alloc_output_from_ringbuf:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	movs	r3, #0
	ldr	r5, [r0, #612]
	mov	r4, r0
	str	r3, [sp, #12]
	adds	r5, r5, #15
	bic	r3, r5, #15
	ldr	r5, [r0, #616]
	adds	r5, r5, #15
	bic	r5, r5, #15
	muls	r5, r3, r5
	ldr	r3, [r0]
	ldrd	r6, r0, [r0, #456]
	cmp	r3, #8
	it	ne
	lsrne	r5, r5, #1
	bl	mpp_enc_refs_next_frm_is_intra
	cmp	r0, #0
	bne	.L611
	ldr	r6, [r6, #4]
	cmp	r6, #1
	beq	.L601
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_next_frm_is_kpfrm
	adds	r6, r0, #0
	it	ne
	movne	r6, #1
.L601:
	movw	r3, #10736
	ldr	r3, [r4, r3]
	cbz	r3, .L603
	ldr	r3, [r3, #28]
	cbnz	r3, .L603
	bl	get_vsm_ops
	cbnz	r0, .L603
	movw	r3, #10740
	ldr	r2, [r4, r3]
	cbnz	r2, .L605
	str	r5, [r4, r3]
.L605:
	ldr	r2, [r4, r3]
	cmp	r2, #16384
	it	cc
	movcc	r2, #16384
	addw	r2, r2, #4095
	bic	r2, r2, #4080
	bic	r2, r2, #15
	str	r2, [r4, r3]
	movw	r3, #10768
	ldr	r3, [r4, r3]
	ldr	r0, [r3, #12]
	cbz	r0, .L606
	str	r0, [sp, #12]
.L607:
	movw	r3, #10744
	ldr	r1, [sp, #12]
	ldr	r2, [r4, r3]
	movw	r3, #10736
	ldr	r0, [r4, r3]
	bl	ring_buf_init
.L603:
	movw	r3, #10788
	movw	r1, #10736
	ldr	r3, [r4, r3]
	movs	r2, #0
	add	r0, r4, #372
	str	r3, [sp]
	mov	r3, r6
	ldr	r1, [r4, r1]
	bl	mpp_packet_new_ring_buf
	cbz	r0, .L609
	adds	r3, r0, #3
	iteet	ne
	addne	r4, r4, #10752
	movweq	r2, #10748
	ldreq	r3, [r4, r2]
	ldrne	r3, [r4]
	itete	eq
	addeq	r3, r3, #1
	addne	r3, r3, #1
	streq	r3, [r4, r2]
	strne	r3, [r4]
	b	.L599
.L611:
	movs	r6, #1
	b	.L601
.L606:
	ldr	r3, .L616
	add	r1, sp, #12
	str	r3, [sp]
	ldr	r3, .L616+4
	bl	mpp_ring_buffer_get_with_tag
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L607
	movw	r1, #1275
	ldr	r0, .L616+8
	bl	printk
	mov	r0, #-1
.L599:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L609:
	ldr	r3, [r4, #372]
	mov	r0, r4
	adds	r3, r3, #72
	str	r3, [r4, #396]
	bl	mpp_enc_check_frm_pkt
	b	.L599
.L617:
	.align	2
.L616:
	.word	.LANCHOR0+392
	.word	.LC41
	.word	.LC75
	.fnend
	.size	mpp_enc_alloc_output_from_ringbuf, .-mpp_enc_alloc_output_from_ringbuf
	.align	1
	.global	mpp_enc_impl_alloc_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_alloc_task, %function
mpp_enc_impl_alloc_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r1, #124
	mov	r4, r0
	ldr	r0, .L621
	bl	mpp_osal_calloc
	str	r0, [r4, #456]
	cbz	r0, .L620
	bl	mpp_time
	strd	r0, [r4, #40]
	bl	mpp_time
	strd	r0, [r4, #24]
	bl	mpp_time
	strd	r0, [r4, #32]
	movs	r0, #0
.L618:
	pop	{r4, pc}
.L620:
	mov	r0, #-1
	b	.L618
.L622:
	.align	2
.L621:
	.word	.LANCHOR0+426
	.fnend
	.size	mpp_enc_impl_alloc_task, .-mpp_enc_impl_alloc_task
	.align	1
	.global	mpp_enc_impl_free_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_free_task, %function
mpp_enc_impl_free_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r1, [r0, #456]
	cbz	r1, .L624
	ldr	r0, .L628
	bl	mpp_osal_free
	movs	r3, #0
	str	r3, [r4, #456]
.L624:
	movs	r0, #0
	pop	{r4, pc}
.L629:
	.align	2
.L628:
	.word	.LANCHOR0+450
	.fnend
	.size	mpp_enc_impl_free_task, .-mpp_enc_impl_free_task
	.align	1
	.global	mpp_enc_impl_get_roi_osd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_get_roi_osd, %function
mpp_enc_impl_get_roi_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r3, [r0, #4016]
	mov	r5, r1
	cbz	r3, .L631
	add	r1, r0, #4016
	add	r0, r0, #5344
	movs	r2, #136
	adds	r0, r0, #24
	bl	memcpy
	movs	r3, #0
	str	r3, [r4, #4016]
.L631:
	movw	r6, #4152
	add	r8, r4, r6
	ldr	r3, [r4, r6]
	cbz	r3, .L632
	add	r7, r4, #5504
	mov	r0, r7
	bl	mpp_enc_unref_osd_buf
	mov	r2, #1128
	mov	r1, r8
	mov	r0, r7
	bl	memcpy
	movs	r3, #0
	str	r3, [r4, r6]
.L632:
	cbz	r5, .L634
	movw	r3, #5368
	adds	r1, r4, r3
	ldr	r3, [r4, r3]
	cbz	r3, .L635
	mov	r0, r5
	bl	mpp_frame_add_roi
.L635:
	add	r1, r4, #5504
	ldr	r3, [r1]
	cbz	r3, .L634
	mov	r0, r5
	bl	mpp_frame_add_osd
.L634:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	mpp_enc_impl_get_roi_osd, .-mpp_enc_impl_get_roi_osd
	.align	1
	.global	mpp_enc_impl_reg_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_reg_cfg, %function
mpp_enc_impl_reg_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, [r0, #456]
	.pad #52
	sub	sp, sp, #52
	mov	r8, r1
	add	r7, r0, #64
	add	r5, r6, #20
	ldrb	r3, [r6, #11]	@ zero_extendqisi2
	ands	r3, r3, #1
	beq	.L650
	ldr	r6, .L827
	ldr	r8, [r0, #8]
	ldr	r3, [r6]
	lsls	r0, r3, #31
	bpl	.L651
	movw	r2, #1547
	ldr	r1, .L827+4
	ldr	r0, .L827+8
	bl	printk
.L651:
	ldr	r3, [r4, #224]
	movs	r1, #0
	movs	r2, #104
	add	r0, r4, #224
	ldrd	fp, r10, [r4, #228]
	str	r3, [sp, #36]
	ldrd	r9, r3, [r4, #236]
	str	r3, [sp, #28]
	ldr	r3, [r4, #244]
	str	r3, [sp, #32]
	bl	memset
	strd	r10, r9, [r4, #232]
	ldr	r3, [sp, #36]
	strd	r3, fp, [r4, #224]
	ldr	r3, [sp, #28]
	str	r3, [r4, #240]
	ldr	r3, [sp, #32]
	str	r3, [r4, #244]
	ldr	r3, [r6]
	lsls	r1, r3, #26
	bpl	.L652
	ldrh	r3, [r4, #222]
	movw	r2, #1550
	ldr	r1, .L827+4
	ldr	r0, .L827+12
	bl	printk
.L652:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	enc_impl_proc_hal
	mov	r9, r0
	cbz	r0, .L653
	str	r0, [sp]
	movw	r3, #1551
	ldr	r0, .L827+16
	mov	r2, r4
	mov	r1, r3
.L826:
	bl	printk
	mov	r9, #0
	b	.L649
.L653:
	ldr	r3, [r6]
	lsls	r2, r3, #26
	bpl	.L655
	ldrh	r3, [r4, #222]
	movw	r2, #1553
	ldr	r1, .L827+4
	ldr	r0, .L827+20
	bl	printk
.L655:
	mov	r1, r5
	mov	r0, r8
	bl	mpp_enc_hal_get_task
	cbz	r0, .L656
	movw	r3, #1554
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L827+24
	bl	printk
.L649:
	mov	r0, r9
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L656:
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L657
	ldrh	r3, [r4, #222]
	movw	r2, #1556
	ldr	r1, .L827+4
	ldr	r0, .L827+28
	bl	printk
.L657:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_hal_start
	cbz	r0, .L658
	movw	r3, #1557
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L827+32
	b	.L826
.L658:
	ldr	r3, [r6]
	lsls	r7, r3, #26
	bpl	.L659
	ldrh	r3, [r4, #222]
	movw	r2, #1559
	ldr	r1, .L827+4
	ldr	r0, .L827+36
	bl	printk
.L659:
	mov	r1, r5
	mov	r0, r8
	bl	mpp_enc_hal_gen_regs
	mov	r9, r0
	cbz	r0, .L660
	mov	r3, #1560
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L827+40
	b	.L826
.L660:
	ldr	r3, [r6]
	lsls	r5, r3, #26
	bpl	.L661
	ldrb	r3, [r4, #221]	@ zero_extendqisi2
	movw	r2, #1563
	ldr	r1, .L827+4
	ldr	r0, .L827+44
	str	r3, [sp, #4]
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
.L661:
	ldr	r3, [r6]
	lsls	r4, r3, #31
	bpl	.L649
	movw	r2, #1564
	ldr	r1, .L827+4
	ldr	r0, .L827+48
	bl	printk
	b	.L649
.L650:
	strd	r1, r3, [r0, #368]
	cbz	r1, .L716
	mov	r0, r1
	bl	mpp_frame_get_hor_stride
	mov	r10, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_ver_stride
	mov	fp, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_width
	mov	r9, r0
	ldr	r0, [r4, #368]
	bl	mpp_frame_get_height
	ldr	r2, [r4, #656]
	bic	r2, r2, #2
	cmp	r2, #1
	it	eq
	moveq	r2, r9
	mov	r3, r0
	it	eq
	moveq	r9, r0
	ldrd	r0, ip, [r4, #620]
	it	eq
	moveq	r3, r2
	ldrd	r2, r1, [r4, #612]
	cmp	r10, r0
	bne	.L664
	cmp	fp, ip
	bne	.L664
	cmp	r2, r9
	bhi	.L664
	cmp	r1, r3
	bls	.L665
.L664:
	strd	r2, r1, [sp, #8]
	mov	r2, r9
	strd	r0, ip, [sp, #16]
	movw	r1, #1713
	strd	r10, fp, [sp]
	ldr	r0, .L827+52
	bl	printk
.L716:
	mov	r9, #-1
.L662:
	mov	r1, r6
	mov	r0, r4
	bl	mpp_enc_terminate_task
	b	.L649
.L665:
	mov	r0, r8
	bl	mpp_frame_get_idr_request
	cbz	r0, .L666
	ldr	r3, [r4, #464]
	orr	r3, r3, #1
	str	r3, [r4, #464]
	movs	r3, #0
	str	r3, [r4, #416]
.L666:
	movs	r2, #100
	movs	r1, #0
	mov	r0, r5
	add	r10, r4, #464
	bl	memset
	mov	r2, #304
	movs	r1, #0
	mov	r0, r7
	bl	memset
	ldr	r3, [r6, #4]
	adds	r2, r3, #1
	str	r2, [r6, #4]
	strh	r3, [r4, #222]	@ movhi
	movs	r3, #0
	strd	r7, r10, [r6, #24]
	str	r3, [r6, #80]
	ldr	r3, [r4, #368]
	str	r3, [r4, #360]
	ldr	r3, .L827
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #32
	beq	.L667
	ldrh	r3, [r4, #222]
	movw	r2, #1759
	ldr	r1, .L827+56
	ldr	r0, .L827+60
	bl	printk
.L667:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_frm_check_drop
	mov	r9, r0
	cbz	r0, .L668
	str	r0, [sp]
	mov	r3, #1760
	ldr	r0, .L827+64
	mov	r2, r4
	mov	r1, r3
.L824:
	bl	printk
	b	.L662
.L668:
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	orr	r3, r3, #16
	strb	r3, [r6, #8]
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L669
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	movw	r2, #1762
	ldr	r1, .L827+56
	and	r3, r3, #1
	ldr	r0, .L827+68
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
.L669:
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	lsls	r1, r3, #31
	bpl	.L670
	movs	r3, #0
	str	r3, [r6, #20]
	str	r3, [r6, #68]
	b	.L716
.L828:
	.align	2
.L827:
	.word	mpp_enc_debug
	.word	.LANCHOR0+473
	.word	.LC76
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC77
	.word	.LC78
	.word	.LC10
	.word	.LC11
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LANCHOR0+494
	.word	.LC82
	.word	.LC83
	.word	.LC84
.L670:
	ldr	r3, [r4, #464]
	cbz	r3, .L671
	mov	r1, r10
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_set_usr_cfg
.L671:
	movs	r3, #1
	mov	r0, r4
	str	r3, [r6, #20]
	bl	mpp_enc_alloc_output_from_ringbuf
	mov	r9, r0
	cmp	r0, #0
	bne	.L662
	ldr	r3, [r4, #368]
	str	r3, [r6, #72]
	ldr	r3, [r4, #392]
	str	r3, [r6, #76]
	ldr	r3, [r4, #372]
	str	r3, [r6, #48]
	ldr	r3, [r4, #396]
	str	r3, [r6, #52]
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	orr	r3, r3, #32
	strb	r3, [r6, #8]
	ldr	r3, [r4, #396]
	str	r3, [r6, #52]
	ldr	r3, [r4, #372]
	cbnz	r3, .L672
	movw	r1, #1788
	ldr	r3, .L829
	str	r1, [sp]
	ldr	r2, .L829+4
	ldr	r0, .L829+8
	bl	printk
.L672:
	ldr	r1, [r4, #368]
	mov	r0, r4
	bl	mpp_enc_impl_get_roi_osd
	ldr	r3, [r4, #56]
	cbnz	r3, .L673
	movs	r3, #1
	str	r3, [r4, #56]
.L673:
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bmi	.L674
	ldr	r1, [r4, #404]
	ldr	r0, [r4, #4]
	bl	enc_impl_gen_hdr
	ldr	r0, [r4, #404]
	bl	mpp_packet_get_length
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r4, #416]
	ldr	r3, [r8]
	lsls	r3, r3, #26
	str	r0, [r4, #412]
	bpl	.L675
	str	r0, [sp]
	movw	r2, #1804
	ldrh	r3, [r4, #222]
	ldr	r1, .L829+12
	ldr	r0, .L829+16
	bl	printk
.L675:
	ldr	r1, [r4, #404]
	ldr	r0, [r4, #372]
	bl	mpp_packet_append
	ldr	r3, [r4, #412]
	str	r3, [r6, #56]
	ldr	r3, [r6, #68]
	ldr	r2, [r4, #412]
	add	r3, r3, r2
	str	r3, [r6, #68]
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #8
	strb	r3, [r4, #416]
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L677
	movw	r2, #1811
	ldr	r1, .L829+12
	ldr	r0, .L829+20
	bl	printk
.L674:
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L677
	movw	r2, #1813
	ldr	r1, .L829+12
	ldr	r0, .L829+24
	bl	printk
.L677:
	ldr	r1, .L829+28
	mov	r0, r5
	bl	check_hal_task_pkt_len
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L679
	ldrh	r3, [r4, #222]
	movw	r2, #1817
	ldr	r1, .L829+12
	ldr	r0, .L829+32
	bl	printk
.L679:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	enc_impl_start
	mov	r9, r0
	cbz	r0, .L680
	movw	r3, #1818
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L829+36
	b	.L824
.L680:
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_stash
	ldrd	r10, r3, [r4, #4]
	ldr	fp, [r6, #48]
	str	r3, [sp, #32]
	movw	r3, #5348
	ldr	r3, [r4, r3]
	cbz	r3, .L681
	movw	r3, #10772
	ldr	r3, [r4, r3]
	str	r3, [r6, #84]
	movw	r3, #10776
	ldr	r3, [r4, r3]
	str	r3, [r6, #88]
	movw	r3, #10780
	ldr	r3, [r4, r3]
	str	r3, [r6, #92]
	movw	r3, #10784
	ldr	r3, [r4, r3]
	str	r3, [r6, #96]
.L681:
	movw	r3, #5340
	ldr	r3, [r4, r3]
	cbz	r3, .L682
.L685:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L684
	ldrh	r3, [r4, #222]
	movw	r2, #1406
	ldr	r1, .L829+40
	ldr	r0, .L829+44
	bl	printk
.L684:
	mov	r1, r7
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_get_cpb
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L687
	ldrh	r3, [r4, #78]
	movw	r2, #1410
	ldr	r1, .L829+40
	ldr	r0, .L829+48
	bl	printk
.L687:
	mov	r1, r5
	mov	r0, r10
	bl	enc_impl_proc_dpb
	mov	r9, r0
	cmp	r0, #0
	beq	.L688
	str	r0, [sp]
	movw	r3, #1411
	ldr	r0, .L829+52
	mov	r2, r4
	mov	r1, r3
.L825:
	bl	printk
	movw	r2, #10756
	ldr	r3, [r4, r2]
	adds	r3, r3, #1
	str	r3, [r4, r2]
	b	.L686
.L682:
	ldr	r3, [r4, #796]
	cmp	r3, #0
	beq	.L685
	add	r3, r4, #5344
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L685
	ldr	r3, [r4, #464]
	cmp	r3, #0
	bne	.L685
	mov	r1, r6
	mov	r0, r4
	bl	mpp_enc_proc_two_pass
	mov	r9, r0
	cmp	r0, #0
	beq	.L685
.L686:
	movw	r3, #1821
	str	r9, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L829+56
	b	.L824
.L830:
	.align	2
.L829:
	.word	.LANCHOR0+515
	.word	.LC85
	.word	.LC67
	.word	.LANCHOR0+494
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LANCHOR0+536
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC107
.L688:
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L715
	ldrh	r3, [r4, #78]
	movw	r2, #1413
	ldr	r1, .L831
	ldr	r0, .L831+4
	bl	printk
	ldr	r3, [r8]
	lsls	r3, r3, #15
	bpl	.L715
	ldrh	r3, [r4, #78]
	movw	r2, #1415
	ldr	r1, .L831
	ldr	r0, .L831+8
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
	ldr	r3, [r8]
	lsls	r0, r3, #15
	bpl	.L715
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	ubfx	r3, r3, #5, #1
	ldr	r1, .L831
	ubfx	r2, r2, #5, #1
	ldr	r0, .L831+12
	str	r2, [sp]
	movw	r2, #1417
	bl	printk
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L715
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #1
	ldr	r1, .L831
	ubfx	r2, r2, #4, #1
	ldr	r0, .L831+16
	str	r2, [sp]
	movw	r2, #1419
	bl	printk
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L715
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	ubfx	r3, r3, #6, #1
	ldr	r1, .L831
	ubfx	r2, r2, #6, #1
	ldr	r0, .L831+20
	str	r2, [sp]
	movw	r2, #1421
	bl	printk
	ldr	r3, [r8]
	lsls	r3, r3, #15
	bpl	.L715
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	ldr	r1, .L831
	lsrs	r3, r3, #7
	ldr	r0, .L831+24
	lsrs	r2, r2, #7
	str	r2, [sp]
	movw	r2, #1423
	bl	printk
	ldr	r3, [r8]
	lsls	r0, r3, #15
	bpl	.L715
	ldrb	r3, [r4, #217]	@ zero_extendqisi2
	ldrb	r2, [r4, #73]	@ zero_extendqisi2
	and	r3, r3, #15
	ldr	r1, .L831
	and	r2, r2, #15
	ldr	r0, .L831+28
	str	r2, [sp]
	movw	r2, #1425
	bl	printk
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L715
	ldrb	r3, [r4, #217]	@ zero_extendqisi2
	ldrb	r2, [r4, #73]	@ zero_extendqisi2
	ldr	r1, .L831
	lsrs	r3, r3, #4
	ldr	r0, .L831+32
	lsrs	r2, r2, #4
	str	r2, [sp]
	movw	r2, #1427
	bl	printk
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L715
	ldrh	r3, [r4, #78]
	movw	r2, #1429
	ldr	r1, .L831
	ldr	r0, .L831+36
	bl	printk
.L715:
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L698
	ldrh	r3, [r4, #222]
	movw	r2, #1431
	ldr	r1, .L831
	ldr	r0, .L831+40
	bl	printk
.L698:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_frm_start
	mov	r9, r0
	cbz	r0, .L699
	mov	r3, #1432
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L831+44
	b	.L825
.L699:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L700
	ldrh	r3, [r4, #222]
	movw	r2, #1433
	ldr	r1, .L831
	ldr	r0, .L831+48
	bl	printk
.L700:
	ldr	r3, [r4, #420]
	cmp	r3, #1
	bne	.L701
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	lsls	r1, r3, #27
	bpl	.L701
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	tst	r3, #14
	bne	.L701
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L702
	ldr	r3, [r4, #412]
	mov	r2, #1440
	ldr	r1, .L831
	ldr	r0, .L831+52
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
.L702:
	ldr	r1, [r4, #404]
	mov	r0, fp
	bl	mpp_packet_append
	ldr	r3, [r4, #412]
	str	r3, [r6, #56]
	ldr	r3, [r6, #68]
	ldr	r2, [r4, #412]
	add	r3, r3, r2
	str	r3, [r6, #68]
	ldrb	r3, [r4, #416]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #416]
.L701:
	ldr	r1, .L831+56
	mov	r0, r5
	bl	check_hal_task_pkt_len
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	lsls	r3, r3, #26
	bpl	.L703
	ldr	r3, [r4, #424]
	cbz	r3, .L703
	ldr	r3, [r4, #432]
	add	r2, sp, #44
	mov	r1, fp
	mov	r0, r10
	mov	r9, #0
	str	r9, [sp, #44]
	str	r3, [sp, #4]
	ldr	r3, [r4, #428]
	str	r3, [sp]
	ldr	r3, .L831+60
	bl	enc_impl_add_prefix
	ldr	r2, [r6, #60]
	ldr	r3, [r6, #68]
	mov	r0, r10
	ldr	r1, [sp, #44]
	add	r2, r2, r1
	add	r3, r3, r1
	str	r2, [r6, #60]
	mov	r1, fp
	str	r3, [r6, #68]
	add	r2, sp, #44
	ldr	r3, [r4, #444]
	str	r9, [sp, #44]
	str	r3, [sp, #4]
	ldr	r3, [r4, #436]
	str	r3, [sp]
	ldr	r3, .L831+64
	bl	enc_impl_add_prefix
	ldr	r2, [r6, #60]
	ldr	r3, [r6, #68]
	ldr	r1, [sp, #44]
	add	r2, r2, r1
	add	r3, r3, r1
	str	r2, [r6, #60]
	str	r3, [r6, #68]
.L703:
	movw	r3, #6634
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r2, #3
	bhi	.L707
	add	r9, r4, #6624
	adds	r3, r4, r3
	add	r9, r9, #8
	str	r3, [sp, #36]
.L704:
	ldrb	r3, [r9]	@ zero_extendqisi2
	mov	r1, fp
	and	r3, r3, #3
	str	r3, [sp, #28]
	movs	r3, #0
	str	r3, [sp, #44]
	ldr	r3, [sp, #28]
	adds	r2, r4, r3
	movw	r3, #6635
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	add	r2, sp, #44
	str	r3, [sp, #4]
	ldr	r3, [sp, #28]
	add	r3, r4, r3, lsl #10
	add	r3, r3, #6624
	adds	r3, r3, #15
	str	r3, [sp]
	ldr	r3, .L831+68
	ldr	r0, [r4, #4]
	bl	enc_impl_add_prefix
	ldr	r3, [r6, #68]
	ldr	r2, [r6, #60]
	ldr	r1, [sp, #44]
	add	r3, r3, r1
	str	r3, [r6, #68]
	ldr	r3, [sp, #36]
	add	r2, r2, r1
	str	r2, [r6, #60]
	ldr	r2, [sp, #36]
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r2]
	cmp	r3, #3
	ldr	r2, [sp, #28]
	add	r2, r2, #1
	strb	r2, [r9]
	bls	.L704
.L707:
	mov	r0, r5
	ldr	r1, .L831+72
	bl	check_hal_task_pkt_len
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L706
	ldrh	r3, [r4, #222]
	movw	r2, #1474
	ldr	r1, .L831
	ldr	r0, .L831+76
	bl	printk
.L706:
	mov	r1, r5
	mov	r0, r10
	bl	enc_impl_proc_hal
	mov	r9, r0
	cbz	r0, .L708
	movw	r3, #1475
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L831+80
	b	.L825
.L832:
	.align	2
.L831:
	.word	.LANCHOR0+536
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LANCHOR1
	.word	.LANCHOR1+16
	.word	.LANCHOR1+32
	.word	.LC106
	.word	.LC6
	.word	.LC7
.L708:
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L709
	ldrh	r3, [r4, #222]
	movw	r2, #1477
	ldr	r1, .L833
	ldr	r0, .L833+4
	bl	printk
.L709:
	mov	r1, r5
	ldr	r0, [sp, #32]
	bl	mpp_enc_hal_get_task
	mov	r9, r0
	cbz	r0, .L710
	movw	r3, #1478
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L833+8
	b	.L825
.L710:
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L711
	ldrh	r3, [r4, #222]
	mov	r2, #1480
	ldr	r1, .L833
	ldr	r0, .L833+12
	bl	printk
.L711:
	mov	r1, r7
	ldr	r0, [r4, #60]
	bl	rc_hal_start
	mov	r9, r0
	cbz	r0, .L712
	movw	r3, #1481
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L833+16
	b	.L825
.L712:
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L713
	ldrh	r3, [r4, #222]
	movw	r2, #1483
	ldr	r1, .L833
	ldr	r0, .L833+20
	bl	printk
.L713:
	mov	r1, r5
	ldr	r0, [sp, #32]
	bl	mpp_enc_hal_gen_regs
	mov	r9, r0
	cbz	r0, .L714
	movw	r3, #1484
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L833+24
	b	.L825
.L714:
	str	r0, [r4, #464]
	b	.L649
.L834:
	.align	2
.L833:
	.word	.LANCHOR0+536
	.word	.LC8
	.word	.LC9
	.word	.LC77
	.word	.LC78
	.word	.LC10
	.word	.LC11
	.fnend
	.size	mpp_enc_impl_reg_cfg, .-mpp_enc_impl_reg_cfg
	.align	1
	.global	mpp_enc_impl_hw_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_hw_start, %function
mpp_enc_impl_hw_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r7, [r0, #456]
	.pad #20
	sub	sp, sp, #20
	ldr	r8, [r0, #8]
	mov	r5, r1
	add	r9, r7, #20
	cbz	r1, .L843
	ldr	r6, [r1, #456]
	adds	r6, r6, #20
.L836:
	ldr	r3, .L856
	ldr	r3, [r3]
	lsls	r3, r3, #26
	bpl	.L837
	ldrh	r3, [r4, #222]
	movw	r2, #1849
	ldr	r1, .L856+4
	ldr	r0, .L856+8
	bl	printk
.L837:
	mov	r2, r6
	mov	r1, r9
	mov	r0, r8
	bl	mpp_enc_hal_start
	mov	r6, r0
	cbz	r0, .L838
	movw	r3, #1850
	str	r0, [sp]
	mov	r1, r3
	mov	r2, r4
	ldr	r0, .L856+12
	bl	printk
	mov	r1, r7
	mov	r0, r4
	bl	mpp_enc_terminate_task
	cbz	r5, .L839
	ldr	r1, [r5, #456]
	mov	r0, r5
	bl	mpp_enc_terminate_task
.L839:
	movw	r2, #10756
	ldr	r3, [r4, r2]
	adds	r3, r3, #1
	str	r3, [r4, r2]
.L835:
	mov	r0, r6
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L843:
	mov	r6, r1
	b	.L836
.L838:
	bl	get_mpidev_ops
	mov	r5, r0
	cmp	r0, #0
	beq	.L835
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L835
	ldr	r0, [r7, #72]
	bl	mpp_frame_get_dts
	movw	r3, #5340
	ldr	r3, [r4, r3]
	strd	r0, [sp, #8]
	cmp	r3, #0
	beq	.L835
	movw	r0, #10788
	ldr	r3, [r5, #32]
	add	r2, sp, #8
	mov	r1, r6
	ldr	r0, [r4, r0]
	blx	r3
	b	.L835
.L857:
	.align	2
.L856:
	.word	mpp_enc_debug
	.word	.LANCHOR0+555
	.word	.LC12
	.word	.LC13
	.fnend
	.size	mpp_enc_impl_hw_start, .-mpp_enc_impl_hw_start
	.align	1
	.global	mpp_enc_impl_int
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_int, %function
mpp_enc_impl_int:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #44
	sub	sp, sp, #44
	ldr	fp, [r0, #456]
	mov	r4, r0
	strd	r3, r2, [sp, #32]
	mov	r9, r1
	ldr	r5, [r0, #8]
	add	r8, fp, #20
	cmp	r1, #0
	beq	.L902
	ldr	r7, [r1, #456]
.L859:
	ldr	r3, .L1000
	ldr	r2, [r3]
	mov	r10, r3
	tst	r2, #32
	beq	.L860
	ldrh	r3, [r4, #222]
	movw	r2, #1961
	ldr	r1, .L1000+4
	ldr	r0, .L1000+8
	bl	printk
.L860:
	mov	r0, r5
	mov	r1, r8
	bl	mpp_enc_hal_wait
	mov	r5, r0
	cbnz	r0, .L861
	ldr	r3, [r4, #8]
	str	r3, [sp, #16]
	cbz	r7, .L862
	adds	r7, r7, #20
.L862:
	ldr	r3, [r10]
	lsls	r5, r3, #26
	bpl	.L863
	ldrh	r3, [r4, #222]
	mov	r2, #1504
	ldr	r1, .L1000+12
	ldr	r0, .L1000+16
	bl	printk
.L863:
	add	r6, r4, #64
	ldr	r0, [r4, #60]
	mov	r1, r6
	bl	rc_hal_end
	mov	r5, r0
	cmp	r0, #0
	beq	.L864
	str	r0, [sp]
	movw	r3, #1505
	ldr	r0, .L1000+20
	mov	r2, r4
	mov	r1, r3
.L996:
	bl	printk
.L861:
	ldr	r3, [r4, #52]
	movs	r1, #0
	ldr	r0, [r4, #372]
	adds	r3, r3, #1
	str	r3, [r4, #52]
	ldr	r3, [r4, #464]
	str	r1, [r4, #416]
	orr	r3, r3, #1
	str	r3, [r4, #464]
	bl	mpp_packet_set_length
	movw	r3, #10788
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #372
	bl	mpp_packet_deinit
.L895:
	ldr	r3, [r4, #372]
	ldr	r2, [sp, #36]
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r4, #372]
	ldr	r3, [r10]
	lsls	r2, r3, #26
	bpl	.L896
	ldrd	r2, [r4, #384]
	ldr	r1, .L1000+4
	ldr	r0, .L1000+24
	strd	r2, [sp]
	movw	r2, #2039
	ldrh	r3, [r4, #222]
	bl	printk
.L896:
	bl	get_mpidev_ops
	mov	r8, r0
	cbz	r0, .L897
	ldr	r3, [r0, #24]
	cbz	r3, .L897
	ldr	r0, [fp, #72]
	bl	mpp_frame_get_dts
	mov	r6, r0
	ldr	r0, [fp, #72]
	mov	r7, r1
	bl	mpp_frame_get_pts
	ldr	r3, [r4, #1172]
	mov	r2, r6
	cmp	r3, #8
	itet	ne
	ldrbne	r3, [r4, #216]	@ zero_extendqisi2
	moveq	r3, #1
	ubfxne	r3, r3, #4, #1
	strd	r0, [sp]
	movw	r0, #10788
	str	r3, [sp, #8]
	mov	r3, r7
	ldr	r1, [r8, #24]
	ldr	r0, [r4, r0]
	blx	r1
.L897:
	ldr	r3, [r4, #368]
	cbz	r3, .L899
	add	r0, r4, #368
	bl	mpp_frame_deinit
.L899:
	movw	r3, #5340
	ldr	r3, [r4, r3]
	cbnz	r3, .L900
	ldr	r3, [r4, #796]
	cbz	r3, .L900
	add	r3, r4, #5344
	ldr	r3, [r3]
	cbnz	r3, .L900
	movs	r2, #104
	add	r1, r4, #224
	add	r0, r4, #496
	bl	memcpy
.L900:
	ldrb	r2, [r4, #416]	@ zero_extendqisi2
	movs	r3, #0
	strd	r3, r3, [r4, #368]
	strd	r3, r3, [r4, #392]
	and	r2, r2, #1
	str	r2, [r4, #416]
	str	r3, [fp, #8]
	b	.L999
.L902:
	mov	r7, r1
	b	.L859
.L864:
	ldr	r3, [r10]
	lsls	r0, r3, #26
	bpl	.L865
	ldrh	r3, [r4, #222]
	movw	r2, #1507
	ldr	r1, .L1000+12
	ldr	r0, .L1000+28
	bl	printk
.L865:
	mov	r2, r7
	mov	r1, r8
	ldr	r0, [sp, #16]
	bl	mpp_enc_hal_ret_task
	mov	r5, r0
	cmp	r0, #0
	bne	.L861
	ldr	r3, [r10]
	lsls	r1, r3, #26
	bpl	.L866
	ldrh	r3, [r4, #222]
	mov	r2, #1512
	ldr	r1, .L1000+12
	ldr	r0, .L1000+32
	bl	printk
.L866:
	mov	r1, r6
	ldr	r0, [r4, #60]
	bl	rc_frm_check_reenc
	mov	r5, r0
	cmp	r0, #0
	beq	.L867
	movw	r3, #1513
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1000+36
	b	.L996
.L901:
	ldrb	r2, [r4, #221]	@ zero_extendqisi2
	ldr	r3, [r4, #760]
	cmp	r2, r3
	bcs	.L868
	ldrd	r1, r2, [fp, #64]
	ldr	r3, [r10]
	subs	r2, r2, r1
	strd	r5, r2, [fp, #64]
	ldrb	r2, [fp, #11]	@ zero_extendqisi2
	and	r3, r3, #32
	orr	r2, r2, #1
	strb	r2, [fp, #11]
	movw	r2, #5340
	ldr	r2, [r4, r2]
	cbnz	r2, .L869
	add	r2, r4, #5344
	ldr	r2, [r2]
	cbz	r2, .L870
.L869:
	cbz	r3, .L903
	mov	r2, #1976
	ldr	r1, .L1000+4
	ldr	r0, .L1000+40
	bl	printk
.L903:
	mov	r5, #-1
	b	.L861
.L1001:
	.align	2
.L1000:
	.word	mpp_enc_debug
	.word	.LANCHOR0+577
	.word	.LC14
	.word	.LANCHOR0+594
	.word	.LC108
	.word	.LC20
	.word	.LC24
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
.L870:
	cbz	r3, .L871
	ldrb	r3, [r4, #221]	@ zero_extendqisi2
	movw	r2, #1982
	ldr	r1, .L1002
	ldr	r0, .L1002+4
	str	r3, [sp, #4]
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	str	r3, [sp]
	ldrh	r3, [r4, #222]
	bl	printk
.L871:
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bpl	.L872
	ldr	r3, [r10]
	lsls	r3, r3, #31
	bpl	.L873
	movw	r2, #1579
	ldr	r1, .L1002+8
	ldr	r0, .L1002+12
	bl	printk
.L873:
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_rollback
	ldr	r3, [fp, #68]
	str	r3, [r4, #248]
	ldr	r3, [r4, #236]
	str	r3, [r4, #252]
	ldr	r3, [r10]
	lsls	r7, r3, #26
	bpl	.L874
	ldrh	r3, [r4, #222]
	movw	r2, #1585
	ldr	r1, .L1002+8
	ldr	r0, .L1002+16
	bl	printk
.L874:
	mov	r1, r6
	ldr	r0, [r4, #60]
	bl	rc_frm_end
	cmp	r0, #0
	beq	.L875
	movw	r3, #1586
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1002+20
	bl	printk
.L876:
	ldr	r3, [r10]
	lsls	r0, r3, #31
	bpl	.L877
	movw	r2, #1590
	ldr	r1, .L1002+8
	ldr	r0, .L1002+24
	bl	printk
.L877:
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	bfc	r3, #0, #1
	strb	r3, [fp, #11]
.L872:
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	lsls	r1, r3, #27
	bpl	.L878
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	tst	r3, #160
	bne	.L878
	add	r3, r4, #464
	str	r3, [sp, #16]
	ldr	r3, [r10]
	ldr	r7, [r4, #4]
	lsls	r2, r3, #31
	bpl	.L879
	movw	r2, #1605
	ldr	r1, .L1002+28
	ldr	r0, .L1002+12
	bl	printk
.L879:
	ldr	r3, [r4, #472]
	ldr	r0, [r4, #460]
	adds	r3, r3, #1
	str	r3, [r4, #472]
	ldr	r3, [r4, #464]
	orr	r3, r3, #2
	str	r3, [r4, #464]
	bl	mpp_enc_refs_rollback
	ldr	r0, [r4, #460]
	ldr	r1, [sp, #16]
	bl	mpp_enc_refs_set_usr_cfg
	ldr	r3, [r10]
	lsls	r3, r3, #26
	bpl	.L880
	ldrh	r3, [r4, #222]
	movw	r2, #1615
	ldr	r1, .L1002+28
	ldr	r0, .L1002+32
	bl	printk
.L880:
	mov	r1, r6
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_get_cpb
	ldr	r3, [r10]
	lsls	r0, r3, #15
	bpl	.L881
	ldrh	r3, [r4, #78]
	movw	r2, #1619
	ldr	r1, .L1002+28
	ldr	r0, .L1002+36
	bl	printk
.L881:
	mov	r1, r8
	mov	r0, r7
	bl	enc_impl_proc_dpb
	cbz	r0, .L882
	str	r0, [sp]
	movw	r3, #1620
	ldr	r0, .L1002+40
	mov	r2, r4
	mov	r1, r3
.L995:
	bl	printk
.L883:
	ldr	r3, [r10]
	lsls	r3, r3, #31
	bpl	.L888
	movw	r2, #1630
	ldr	r1, .L1002+28
	ldr	r0, .L1002+24
	bl	printk
.L888:
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	bfc	r3, #0, #1
	strb	r3, [fp, #11]
.L878:
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	lsls	r7, r3, #31
	bpl	.L868
.L999:
	cmp	r9, #0
	beq	.L858
	ldr	r1, [sp, #32]
	mov	r0, r9
	bl	mpp_enc_comb_end_jpeg
.L858:
	mov	r0, r5
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L875:
	ldr	r2, [r4, #364]
	movw	r3, #10784
	str	r2, [r4, r3]
	b	.L876
.L882:
	ldr	r3, [r10]
	lsls	r1, r3, #26
	bpl	.L884
	ldrh	r3, [r4, #222]
	movw	r2, #1622
	ldr	r1, .L1002+28
	ldr	r0, .L1002+44
	bl	printk
.L884:
	mov	r1, r8
	mov	r0, r7
	bl	enc_impl_sw_enc
	cbz	r0, .L885
	movw	r3, #1623
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1002+48
	b	.L995
.L885:
	ldr	r3, [r10]
	lsls	r2, r3, #26
	bpl	.L886
	ldrh	r3, [r4, #222]
	movw	r2, #1625
	ldr	r1, .L1002+28
	ldr	r0, .L1002+16
	bl	printk
.L886:
	mov	r1, r6
	ldr	r0, [r4, #60]
	bl	rc_frm_end
	cbz	r0, .L887
	movw	r3, #1626
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1002+20
	b	.L995
.L887:
	ldr	r2, [r4, #364]
	movw	r3, #10784
	str	r2, [r4, r3]
	b	.L883
.L891:
	ldr	r2, [r4, #364]
	movw	r3, #10784
	str	r2, [r4, r3]
	bl	mpp_time
	ldr	r3, [r4, #12]
	mov	r6, r0
	ldr	r0, [r4, #48]
	mov	r7, r1
	strd	r6, [r4, #32]
	add	ip, r0, #1
	str	ip, [r4, #48]
	cbz	r3, .L892
	ldrd	r2, [r4, #24]
	strd	r2, [sp, #16]
	orrs	r3, r2, r3
	beq	.L892
	orrs	r3, r6, r7
	beq	.L892
	ldr	r3, [sp, #16]
	ldr	r0, .L1002+52
	subs	r1, r6, r3
	ldr	r3, [sp, #20]
	str	r1, [sp, #24]
	sbc	r1, r7, r3
	str	r1, [sp, #28]
	ldrd	r2, [sp, #24]
	movs	r1, #0
	cmp	r0, r2
	sbcs	r3, r1, r3
	bge	.L892
	ldr	r3, [sp, #16]
	ldr	r0, .L1002+56
	subs	r2, r6, r3
	smull	r0, r1, r2, r0
	asrs	r2, r2, #31
	movw	r0, #10000
	mul	r0, r0, ip
	rsb	r1, r2, r1, asr #6
	bl	__aeabi_idiv
	movw	r3, #5324
	str	r0, [r4, r3]
	strd	r6, [r4, #24]
	str	r5, [r4, #48]
.L892:
	ldrh	r3, [r4, #220]
	ldr	r0, [r4, #372]
	and	r3, r3, #251
	strh	r3, [r4, #220]	@ movhi
	ldr	r1, [fp, #68]
	bl	mpp_packet_set_length
	ldrb	r3, [r4, #216]	@ zero_extendqisi2
	lsls	r1, r3, #27
	bpl	.L894
	movs	r1, #16
	ldr	r0, [r4, #372]
	bl	mpp_packet_set_flag
.L894:
	ldrb	r1, [r4, #217]	@ zero_extendqisi2
	ldr	r0, [r4, #372]
	lsrs	r1, r1, #4
	bl	mpp_packet_set_temporal_id
	movw	r3, #10788
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #372]
	bl	mpp_packet_ring_buf_put_used
	mov	r5, r0
	cmp	r0, #0
	beq	.L895
	movw	r2, #2029
	ldr	r1, .L1002
	ldr	r0, .L1002+60
	movs	r5, #0
	bl	printk
	b	.L895
.L1003:
	.align	2
.L1002:
	.word	.LANCHOR0+577
	.word	.LC79
	.word	.LANCHOR0+606
	.word	.LC76
	.word	.LC113
	.word	.LC22
	.word	.LC80
	.word	.LANCHOR0+625
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC114
	.word	.LC115
	.word	999999
	.word	274877907
	.word	.LC23
.L867:
	ldrb	r3, [r4, #220]	@ zero_extendqisi2
	lsls	r3, r3, #29
	bmi	.L901
.L868:
	ldr	r3, [r10]
	lsls	r0, r3, #26
	bpl	.L890
	ldrh	r3, [r4, #222]
	movw	r2, #1999
	ldr	r1, .L1004
	ldr	r0, .L1004+4
	bl	printk
.L890:
	mov	r1, r6
	ldr	r0, [r4, #60]
	bl	rc_frm_end
	mov	r5, r0
	cmp	r0, #0
	beq	.L891
	mov	r3, #2000
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1004+8
	b	.L996
.L1005:
	.align	2
.L1004:
	.word	.LANCHOR0+577
	.word	.LC21
	.word	.LC22
	.fnend
	.size	mpp_enc_impl_int, .-mpp_enc_impl_int
	.align	1
	.global	mpp_enc_impl_pkt_full_inc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_pkt_full_inc, %function
mpp_enc_impl_pkt_full_inc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r2, #10764
	ldr	r3, [r0, r2]
	adds	r3, r3, #1
	str	r3, [r0, r2]
	bx	lr
	.fnend
	.size	mpp_enc_impl_pkt_full_inc, .-mpp_enc_impl_pkt_full_inc
	.align	1
	.global	mpp_enc_impl_poc_debug_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_poc_debug_info, %function
mpp_enc_impl_poc_debug_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	ldr	r6, [r1, #456]
	.pad #52
	sub	sp, sp, #52
	ldr	r1, .L1016
	mov	r5, r0
	mov	r7, r2
	bl	seq_puts
	ldr	r3, .L1016+4
	mov	r0, r5
	ldr	r2, .L1016+8
	ldr	r1, .L1016+12
	str	r3, [sp, #36]
	ldr	r3, .L1016+16
	str	r3, [sp, #32]
	ldr	r3, .L1016+20
	str	r3, [sp, #28]
	ldr	r3, .L1016+24
	str	r3, [sp, #24]
	ldr	r3, .L1016+28
	str	r3, [sp, #20]
	ldr	r3, .L1016+32
	str	r3, [sp, #16]
	ldr	r3, .L1016+36
	str	r3, [sp, #12]
	ldr	r3, .L1016+40
	str	r3, [sp, #8]
	ldr	r3, .L1016+44
	str	r3, [sp, #4]
	ldr	r3, .L1016+48
	str	r3, [sp]
	ldr	r3, .L1016+52
	bl	seq_printf
	ldr	r0, [r4, #1172]
	ldrd	r8, r9, [r4, #612]
	bl	strof_coding_type
	movw	r3, #5320
	ldr	r6, [r6, #4]
	mov	r10, r0
	ldr	r0, [r4, r3]
	bl	strof_gop_mode
	add	r3, r4, #5344
	mov	r2, r7
	ldr	r1, .L1016+56
	ldr	r3, [r3]
	str	r3, [sp, #36]
	movw	r3, #5340
	ldr	r3, [r4, r3]
	str	r6, [sp, #12]
	ldr	r6, .L1016+60
	str	r3, [sp, #32]
	ldr	r3, [r4, #632]
	strd	r10, r6, [sp, #4]
	str	r9, [sp]
	str	r3, [sp, #28]
	ldr	r3, [r4, #628]
	str	r3, [sp, #24]
	movs	r3, #0
	strd	r0, r3, [sp, #16]
	mov	r3, r8
	mov	r0, r5
	bl	seq_printf
	ldrd	r0, r1, [r4, #732]
	bl	__aeabi_idiv
	mov	r8, r0
	ldrd	r0, r1, [r4, #744]
	bl	__aeabi_idiv
	ldr	r1, .L1016+64
	mov	r9, r0
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1016+68
	ldr	r1, .L1016+72
	mov	r0, r5
	ldr	r2, .L1016+8
	str	r3, [sp, #24]
	ldr	r3, .L1016+76
	str	r3, [sp, #20]
	ldr	r3, .L1016+80
	str	r3, [sp, #16]
	ldr	r3, .L1016+84
	str	r3, [sp, #12]
	ldr	r3, .L1016+88
	str	r3, [sp, #8]
	ldr	r3, .L1016+92
	str	r3, [sp, #4]
	ldr	r3, .L1016+96
	str	r3, [sp]
	ldr	r3, .L1016+100
	bl	seq_printf
	ldr	r2, [r4, #40]
	ldr	r0, [r4, #636]
	str	r2, [sp, #44]
	bl	strof_pixel_fmt
	movw	r3, #5324
	ldr	r3, [r4, r3]
	mov	fp, r0
	ldr	r0, [r4, #656]
	str	r3, [sp, #40]
	bl	strof_rotation
	mov	r10, r0
	ldr	r0, [r4, #660]
	bl	strof_bool
	ldr	r1, .L1016+104
	ldr	r3, [sp, #40]
	ldr	r2, [sp, #44]
	strd	r10, r0, [sp, #20]
	mov	r0, r5
	strd	fp, r3, [sp, #12]
	mov	r3, r6
	strd	r9, r2, [sp, #4]
	mov	r2, r7
	str	r8, [sp]
	movw	r8, #10736
	bl	seq_printf
	ldr	r3, [r4, r8]
	cmp	r3, #0
	beq	.L1008
	ldr	r1, .L1016+108
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1016+112
	ldr	r2, .L1016+8
	mov	r0, r5
	ldr	r1, .L1016+116
	str	r3, [sp, #20]
	ldr	r3, .L1016+120
	str	r3, [sp, #16]
	ldr	r3, .L1016+124
	str	r3, [sp, #12]
	ldr	r3, .L1016+128
	str	r3, [sp, #8]
	ldr	r3, .L1016+132
	str	r3, [sp, #4]
	ldr	r3, .L1016+136
	str	r3, [sp]
	ldr	r3, .L1016+140
	bl	seq_printf
	ldr	r2, [r4, r8]
	ldr	r1, .L1016+144
	mov	r0, r5
	ldr	r3, [r2, #36]
	str	r3, [sp, #20]
	ldr	r3, [r2, #40]
	str	r3, [sp, #16]
	ldr	r3, [r2, #32]
	str	r3, [sp, #12]
	ldr	r3, [r2, #8]
	str	r3, [sp, #8]
	ldr	r3, [r2, #12]
	str	r3, [sp, #4]
	ldr	r3, [r2]
	str	r3, [sp]
	ldr	r3, [r2, #4]
	mov	r2, r7
	bl	seq_printf
.L1008:
	ldr	r1, .L1016+148
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1016+152
	ldr	r2, .L1016+8
	mov	r0, r5
	ldr	r1, .L1016+156
	str	r3, [sp, #20]
	ldr	r3, .L1016+160
	str	r3, [sp, #16]
	ldr	r3, .L1016+164
	str	r3, [sp, #12]
	ldr	r3, .L1016+168
	str	r3, [sp, #8]
	ldr	r3, .L1016+172
	str	r3, [sp, #4]
	ldr	r3, .L1016+176
	str	r3, [sp]
	ldr	r3, .L1016+180
	bl	seq_printf
	movw	r2, #10764
	ldr	r2, [r4, r2]
	movw	r3, #5332
	ldr	r3, [r4, r3]
	mov	r0, r5
	ldr	r1, .L1016+184
	str	r2, [sp, #20]
	movw	r2, #10760
	ldr	r2, [r4, r2]
	str	r2, [sp, #16]
	movw	r2, #10756
	ldr	r2, [r4, r2]
	str	r2, [sp, #12]
	add	r2, r4, #10752
	ldr	r2, [r2]
	str	r2, [sp, #8]
	movw	r2, #10748
	ldr	r2, [r4, r2]
	str	r2, [sp, #4]
	movw	r2, #5336
	ldr	r2, [r4, r2]
	str	r2, [sp]
	mov	r2, r7
	bl	seq_printf
	ldr	r3, [r4, #4020]
	cbnz	r3, .L1009
.L1012:
	mov	r1, r7
	mov	r0, r5
	bl	mpp_show_session_info
	mov	r2, r7
	ldr	r1, [r4, #4]
	mov	r0, r5
	bl	enc_impl_proc_debug
	mov	r2, r7
	ldr	r1, [r4, #60]
	mov	r0, r5
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	rc_proc_show
.L1009:
	ldr	r1, .L1016+188
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1016+192
	ldr	r2, .L1016+8
	mov	r0, r5
	ldr	r1, .L1016+196
	mov	r8, #0
	ldr	r9, .L1016+224
	str	r3, [sp, #24]
	ldr	r3, .L1016+200
	str	r3, [sp, #20]
	ldr	r3, .L1016+204
	str	r3, [sp, #16]
	ldr	r3, .L1016+208
	str	r3, [sp, #12]
	ldr	r3, .L1016+212
	strd	r6, r3, [sp, #4]
	addw	r6, r4, #4024
	ldr	r3, .L1016+216
	str	r3, [sp]
	ldr	r3, .L1016+220
	bl	seq_printf
.L1010:
	ldr	r3, [r4, #4020]
	adds	r6, r6, #16
	cmp	r3, r8
	bls	.L1012
	ldrb	r3, [r6, #-1]	@ zero_extendqisi2
	mov	r2, r7
	mov	r1, r9
	mov	r0, r5
	str	r3, [sp, #24]
	ldrh	r3, [r6, #-8]
	str	r3, [sp, #20]
	ldrsh	r3, [r6, #-6]
	str	r3, [sp, #16]
	ldrh	r3, [r6, #-10]
	str	r3, [sp, #12]
	ldrh	r3, [r6, #-12]
	str	r3, [sp, #8]
	ldrh	r3, [r6, #-14]
	str	r3, [sp, #4]
	ldrh	r3, [r6, #-16]
	str	r3, [sp]
	mov	r3, r8
	bl	seq_printf
	add	r8, r8, #1
	b	.L1010
.L1017:
	.align	2
.L1016:
	.word	.LC116
	.word	.LC120
	.word	.LC118
	.word	.LC119
	.word	.LC121
	.word	.LC122
	.word	.LC123
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC117
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.word	.LC135
	.word	.LC134
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC133
	.word	.LC142
	.word	.LC143
	.word	.LC146
	.word	.LC145
	.word	.LC147
	.word	.LC148
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC144
	.word	.LC152
	.word	.LC153
	.word	.LC156
	.word	.LC155
	.word	.LC157
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC161
	.word	.LC154
	.word	.LC162
	.word	.LC163
	.word	.LC166
	.word	.LC165
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC170
	.word	.LC171
	.word	.LC164
	.word	.LC172
	.fnend
	.size	mpp_enc_impl_poc_debug_info, .-mpp_enc_impl_poc_debug_info
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.37042, %object
	.size	__func__.37042, 23
__func__.37042:
	.ascii	"check_hal_task_pkt_len\000"
	.type	__func__.37300, %object
	.size	__func__.37300, 22
__func__.37300:
	.ascii	"mpp_enc_proc_two_pass\000"
	.type	__func__.37185, %object
	.size	__func__.37185, 18
__func__.37185:
	.ascii	"update_rc_cfg_log\000"
	.type	__func__.37459, %object
	.size	__func__.37459, 22
__func__.37459:
	.ascii	"mpp_enc_comb_end_jpeg\000"
	.type	__func__.37084, %object
	.size	__func__.37084, 20
__func__.37084:
	.ascii	"mpp_enc_proc_rc_cfg\000"
	.type	__func__.37092, %object
	.size	__func__.37092, 20
__func__.37092:
	.ascii	"mpp_enc_proc_hw_cfg\000"
	.type	__FUNCTION__.37121, %object
	.size	__FUNCTION__.37121, 22
__FUNCTION__.37121:
	.ascii	"mpp_enc_unref_osd_buf\000"
	.type	__func__.37133, %object
	.size	__func__.37133, 28
__func__.37133:
	.ascii	"mpp_enc_proc_export_osd_buf\000"
	.type	__func__.37145, %object
	.size	__func__.37145, 22
__func__.37145:
	.ascii	"mpp_enc_proc_tune_cfg\000"
	.type	__func__.37166, %object
	.size	__func__.37166, 17
__func__.37166:
	.ascii	"mpp_enc_proc_cfg\000"
	.type	__func__.37115, %object
	.size	__func__.37115, 21
__func__.37115:
	.ascii	"mpp_enc_proc_ref_cfg\000"
	.space	1
	.type	resend_reason.37058, %object
	.size	resend_reason.37058, 24
resend_reason.37058:
	.word	.LC173
	.word	.LC174
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.type	__func__.37232, %object
	.size	__func__.37232, 23
__func__.37232:
	.ascii	"mpp_enc_proc_rc_update\000"
	.type	__FUNCTION__.37213, %object
	.size	__FUNCTION__.37213, 11
__FUNCTION__.37213:
	.ascii	"set_rc_cfg\000"
	.type	__func__.37223, %object
	.size	__func__.37223, 11
__func__.37223:
	.ascii	"set_rc_cfg\000"
	.space	3
	.type	name_of_rc_mode, %object
	.size	name_of_rc_mode, 16
name_of_rc_mode:
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.type	__FUNCTION__.37254, %object
	.size	__FUNCTION__.37254, 34
__FUNCTION__.37254:
	.ascii	"mpp_enc_alloc_output_from_bufpool\000"
	.type	__func__.37261, %object
	.size	__func__.37261, 34
__func__.37261:
	.ascii	"mpp_enc_alloc_output_from_bufpool\000"
	.type	__FUNCTION__.37277, %object
	.size	__FUNCTION__.37277, 34
__FUNCTION__.37277:
	.ascii	"mpp_enc_alloc_output_from_ringbuf\000"
	.type	__FUNCTION__.37387, %object
	.size	__FUNCTION__.37387, 24
__FUNCTION__.37387:
	.ascii	"mpp_enc_impl_alloc_task\000"
	.type	__FUNCTION__.37391, %object
	.size	__FUNCTION__.37391, 23
__FUNCTION__.37391:
	.ascii	"mpp_enc_impl_free_task\000"
	.type	__func__.37354, %object
	.size	__func__.37354, 21
__func__.37354:
	.ascii	"mpp_enc_reenc_simple\000"
	.type	__func__.37420, %object
	.size	__func__.37420, 21
__func__.37420:
	.ascii	"mpp_enc_impl_reg_cfg\000"
	.type	__FUNCTION__.37421, %object
	.size	__FUNCTION__.37421, 21
__FUNCTION__.37421:
	.ascii	"mpp_enc_impl_reg_cfg\000"
	.type	__func__.37319, %object
	.size	__func__.37319, 19
__func__.37319:
	.ascii	"mpp_enc_normal_cfg\000"
	.type	__func__.37440, %object
	.size	__func__.37440, 22
__func__.37440:
	.ascii	"mpp_enc_impl_hw_start\000"
	.type	__func__.37478, %object
	.size	__func__.37478, 17
__func__.37478:
	.ascii	"mpp_enc_impl_int\000"
	.type	__func__.37333, %object
	.size	__func__.37333, 12
__func__.37333:
	.ascii	"mpp_enc_end\000"
	.type	__func__.37365, %object
	.size	__func__.37365, 19
__func__.37365:
	.ascii	"mpp_enc_reenc_drop\000"
	.type	__func__.37378, %object
	.size	__func__.37378, 26
__func__.37378:
	.ascii	"mpp_enc_reenc_force_pskip\000"
	.data
	.set	.LANCHOR1,. + 0
	.type	uuid_version, %object
	.size	uuid_version, 16
uuid_version:
	.byte	61
	.byte	7
	.byte	109
	.byte	69
	.byte	115
	.byte	15
	.byte	65
	.byte	-88
	.byte	-79
	.byte	-60
	.byte	37
	.byte	-41
	.byte	-105
	.byte	107
	.byte	-15
	.byte	-84
	.type	uuid_rc_cfg, %object
	.size	uuid_rc_cfg, 16
uuid_rc_cfg:
	.byte	-41
	.byte	-36
	.byte	3
	.byte	-61
	.byte	-59
	.byte	111
	.byte	64
	.byte	-32
	.byte	-114
	.byte	-87
	.byte	23
	.byte	26
	.byte	-46
	.byte	-17
	.byte	94
	.byte	35
	.type	uuid_usr_data, %object
	.size	uuid_usr_data, 16
uuid_usr_data:
	.byte	-2
	.byte	57
	.byte	-84
	.byte	76
	.byte	74
	.byte	-114
	.byte	75
	.byte	75
	.byte	-123
	.byte	-39
	.byte	-78
	.byte	-94
	.byte	79
	.byte	-95
	.byte	25
	.byte	91
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: %s check failed: task length is not mat"
	.ascii	"ch to packet length %d vs %d\012\000"
.LC1:
	.ascii	"\0013%d: frame stride set equal cfg stride\000"
.LC2:
	.ascii	"\0016%s:%d: task %d two pass mode enter\012\000"
.LC3:
	.ascii	"\0016%s:%d: task %d enc proc dpb\012\000"
.LC4:
	.ascii	"\0016%s:%d: frm %d start **************************"
	.ascii	"*********\012\000"
.LC5:
	.ascii	"\0013%d: enc %p enc_impl_proc_dpb:%-4d failed retur"
	.ascii	"n %d\000"
.LC6:
	.ascii	"\0016%s:%d: task %d enc proc hal\012\000"
.LC7:
	.ascii	"\0013%d: enc %p enc_impl_proc_hal:%-4d failed retur"
	.ascii	"n %d\000"
.LC8:
	.ascii	"\0016%s:%d: task %d hal get task\012\000"
.LC9:
	.ascii	"\0013%d: enc %p mpp_enc_hal_get_task:%-4d failed re"
	.ascii	"turn %d\000"
.LC10:
	.ascii	"\0016%s:%d: task %d hal generate reg\012\000"
.LC11:
	.ascii	"\0013%d: enc %p mpp_enc_hal_gen_regs:%-4d failed re"
	.ascii	"turn %d\000"
.LC12:
	.ascii	"\0016%s:%d: task %d hal start\012\000"
.LC13:
	.ascii	"\0013%d: enc %p mpp_enc_hal_start:%-4d failed retur"
	.ascii	"n %d\000"
.LC14:
	.ascii	"\0016%s:%d: task %d hal wait\012\000"
.LC15:
	.ascii	"\0013%d: enc %p mpp_enc_hal_wait:%-4d failed return"
	.ascii	" %d\000"
.LC16:
	.ascii	"\0013%d: enc %p mpp_enc_hal_ret_task:%-4d failed re"
	.ascii	"turn %d\000"
.LC17:
	.ascii	"\0016%s:%d: task %d two pass mode leave\012\000"
.LC18:
	.ascii	"%s-b:%d[%d:%d]-g:%d-q:%d:[%d:%d]:[%d:%d]:%d\012\000"
.LC19:
	.ascii	"\0016%s:%d: rc cfg log is full\012\000"
.LC20:
	.ascii	"\0013%d: enc %p rc_hal_end:%-4d failed return %d\000"
.LC21:
	.ascii	"\0016%s:%d: task %d rc enc->frame end\012\000"
.LC22:
	.ascii	"\0013%d: enc %p rc_frm_end:%-4d failed return %d\000"
.LC23:
	.ascii	"\0013%s:%d: ring_buf_put_used fail \012\000"
.LC24:
	.ascii	"\0016%s:%d: task %d enqueue packet pts %lld\012\000"
.LC25:
	.ascii	"\0013%d: invalid rc_priority %d should be[%d, %d] \012"
	.ascii	"\000"
.LC26:
	.ascii	"\0013%d: invalid super_mode %d should be[%d, %d] \012"
	.ascii	"\000"
.LC27:
	.ascii	"\0013%d: invalid debre_strength should be[%d, %d] \012"
	.ascii	"\000"
.LC28:
	.ascii	"\0013%d: invalid rc mode %d should be RC_MODE_VBR o"
	.ascii	"r RC_MODE_CBR\012\000"
.LC29:
	.ascii	"\0013%d: invalid quality %d should be from QUALITY_"
	.ascii	"WORST to QUALITY_BEST\012\000"
.LC30:
	.ascii	"\0013%d: invalid bit per second %d [%d:%d] out of r"
	.ascii	"ange 1K~100M\012\000"
.LC31:
	.ascii	"\0013%d: invalid qp range: init %d i [%d:%d] p [%d:"
	.ascii	"%d]\012\000"
.LC32:
	.ascii	"\0013%d: restore qp range: init %d i [%d:%d] p [%d:"
	.ascii	"%d]\012\000"
.LC33:
	.ascii	"\0013%d: invalid qp delta ip %d restore to %d\012\000"
.LC34:
	.ascii	"\0013%d: invalid qp delta vi %d restore to %d\012\000"
.LC35:
	.ascii	"\0013%d: invalid qp max step %d restore to %d\012\000"
.LC36:
	.ascii	"\0013%d: warning: bitrate statistic time %d is larg"
	.ascii	"er than 60s\012\000"
.LC37:
	.ascii	"\0013%s:%d: failed to accept new rc config\012\000"
.LC38:
	.ascii	"\0016%d: MPP_ENC_SET_RC_CFG bps %d [%d : %d] fps [%"
	.ascii	"d:%d] gop %d\012\000"
.LC39:
	.ascii	"\0013%d: invalid hw qp delta row [%d:%d]\012\000"
.LC40:
	.ascii	"\0013%s:%d: failed to accept new hw config\012\000"
.LC41:
	.ascii	"mpp_enc\000"
.LC42:
	.ascii	"\0013%s:%d: mpibuf_ops get fail\000"
.LC43:
	.ascii	"\0013%d: osd buf dma_buf_get fd %d failed\012\000"
.LC44:
	.ascii	"\0013%d: osd inv buf dma_buf_get fd %d failed\012\000"
.LC45:
	.ascii	"\0013%d: invalid scene mode %d not in range [%d:%d]"
	.ascii	"\012\000"
.LC46:
	.ascii	"\0013%d: invalid motion static switch enable not in"
	.ascii	" range [%d : %d]\012\000"
.LC47:
	.ascii	"\0013%s:%d: failed to accept new tuning config\012\000"
.LC48:
	.ascii	"\0016%d: MPP_ENC_SET_CFG in \012\000"
.LC49:
	.ascii	"\0013%d: Please use MPP_ENC_GET_HDR_SYNC instead of"
	.ascii	" unsafe MPP_ENC_GET_EXTRA_INFO\012\000"
.LC50:
	.ascii	"\0013%d: NOTE: MPP_ENC_GET_HDR_SYNC needs MppPacket"
	.ascii	" input\012\000"
.LC51:
	.ascii	"\0016%d: deprecated MPP_ENC_PRE_ALLOC_BUFF control\012"
	.ascii	"\000"
.LC52:
	.ascii	"\0016%s:%d: header mode set to %d\012\000"
.LC53:
	.ascii	"\0013%s:%d: invalid header mode %d\012\000"
.LC54:
	.ascii	"\0013%s:%d: invalid NULL ptr on setting header mode"
	.ascii	"\012\000"
.LC55:
	.ascii	"\0016%s:%d: sei mode set to %d\012\000"
.LC56:
	.ascii	"\0013%s:%d: invalid sei mode %d\012\000"
.LC57:
	.ascii	"\0013%d: ref param_error\000"
.LC58:
	.ascii	"\0013%s:%d: failed to copy ref cfg ret %d\012\000"
.LC59:
	.ascii	"\0013%s:%d: failed to set ref cfg ret %d\012\000"
.LC60:
	.ascii	"\0013%d: user data is overflow\000"
.LC61:
	.ascii	"\0013%d: usr data is big then 1k byte len %d\000"
.LC62:
	.ascii	"\0016%d: send header for %s\012\000"
.LC63:
	.ascii	"flex\000"
.LC64:
	.ascii	"fix\000"
.LC65:
	.ascii	"\0016%s:%d: rc update cfg start\012\000"
.LC66:
	.ascii	"rc->fps_out_num\000"
.LC67:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC68:
	.ascii	"\0013%s:%d: unsupport coding type %d\012\000"
.LC69:
	.ascii	"\0016%d: mode %s bps [%d:%d:%d] fps %s [%d/%d] -> %"
	.ascii	"s [%d/%d] gop i [%d] v [%d]\012\000"
.LC70:
	.ascii	"\0016%s:%d: rc update cfg done\012\000"
.LC71:
	.ascii	"size\000"
.LC72:
	.ascii	"buffer\000"
.LC73:
	.ascii	"\0016%s:%d: create output pkt %p buf %p\012\000"
.LC74:
	.ascii	"\0016%s:%d: output to pkt %p buf %p pos %p length %"
	.ascii	"d\012\000"
.LC75:
	.ascii	"\0013%d: ring buf get mpp_buf fail \012\000"
.LC76:
	.ascii	"\0016%s:%d: enter\012\000"
.LC77:
	.ascii	"\0016%s:%d: task %d rc hal start\012\000"
.LC78:
	.ascii	"\0013%d: enc %p rc_hal_start:%-4d failed return %d\000"
.LC79:
	.ascii	"\0016%s:%d: task %d reenc %d times %d\012\000"
.LC80:
	.ascii	"\0016%s:%d: leave\012\000"
.LC81:
	.ascii	"\0016%d: frame info no equal set drop: frame [%d, %"
	.ascii	"d, %d, %d], prep [%d, %d, %d, %d]\000"
.LC82:
	.ascii	"\0016%s:%d: task seq idx %d start\012\000"
.LC83:
	.ascii	"\0013%d: enc %p rc_frm_check_drop:%-4d failed retur"
	.ascii	"n %d\000"
.LC84:
	.ascii	"\0016%s:%d: task %d drop %d\012\000"
.LC85:
	.ascii	"enc->packet\000"
.LC86:
	.ascii	"\0016%s:%d: task %d update header length %d\012\000"
.LC87:
	.ascii	"\0016%s:%d: added_by_change \012\000"
.LC88:
	.ascii	"\0016%s:%d: check_hal_task_pkt_len \012\000"
.LC89:
	.ascii	"gen_hdr and adding\000"
.LC90:
	.ascii	"\0016%s:%d: task %d enc start\012\000"
.LC91:
	.ascii	"\0013%d: enc %p enc_impl_start:%-4d failed return %"
	.ascii	"d\000"
.LC92:
	.ascii	"\0016%s:%d: frm %d compare\012\000"
.LC93:
	.ascii	"\0016%s:%d: seq_idx      %d vs %d\012\000"
.LC94:
	.ascii	"\0016%s:%d: is_idr       %d vs %d\012\000"
.LC95:
	.ascii	"\0016%s:%d: is_intra     %d vs %d\012\000"
.LC96:
	.ascii	"\0016%s:%d: is_non_ref   %d vs %d\012\000"
.LC97:
	.ascii	"\0016%s:%d: is_lt_ref    %d vs %d\012\000"
.LC98:
	.ascii	"\0016%s:%d: lt_idx       %d vs %d\012\000"
.LC99:
	.ascii	"\0016%s:%d: temporal_id  %d vs %d\012\000"
.LC100:
	.ascii	"\0016%s:%d: frm %d done  **************************"
	.ascii	"*********\012\000"
.LC101:
	.ascii	"\0016%s:%d: task %d rc frame start\012\000"
.LC102:
	.ascii	"\0013%d: enc %p rc_frm_start:%-4d failed return %d\000"
.LC103:
	.ascii	"\0016%s:%d: task %d rc frame start ok \012\000"
.LC104:
	.ascii	"\0016%s:%d: task %d IDR header length %d\012\000"
.LC105:
	.ascii	"header adding\000"
.LC106:
	.ascii	"user data adding\000"
.LC107:
	.ascii	"\0013%d: enc %p mpp_enc_normal_cfg:%-4d failed retu"
	.ascii	"rn %d\000"
.LC108:
	.ascii	"\0016%s:%d: task %d rc hal end\012\000"
.LC109:
	.ascii	"\0016%s:%d: task %d hal ret task\012\000"
.LC110:
	.ascii	"\0016%s:%d: task %d rc frame check reenc\012\000"
.LC111:
	.ascii	"\0013%d: enc %p rc_frm_check_reenc:%-4d failed retu"
	.ascii	"rn %d\000"
.LC112:
	.ascii	"\0016%s:%d: shared status can't reenc drop request "
	.ascii	"idr\012\000"
.LC113:
	.ascii	"\0016%s:%d: task %d rc frame end\012\000"
.LC114:
	.ascii	"\0016%s:%d: task %d enc sw enc start\012\000"
.LC115:
	.ascii	"\0013%d: enc %p enc_impl_sw_enc:%-4d failed return "
	.ascii	"%d\000"
.LC116:
	.ascii	"\012--------venc chn attr 1------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC117:
	.ascii	"Width\000"
.LC118:
	.ascii	"ID\000"
.LC119:
	.ascii	"%8s|%8s|%8s|%6s|%9s|%10s|%10s|%6s|%10s|%11s|%8s|%10"
	.ascii	"s\012\000"
.LC120:
	.ascii	"RefShare\000"
.LC121:
	.ascii	"Online\000"
.LC122:
	.ascii	"MaxHeight\000"
.LC123:
	.ascii	"MaxWidth\000"
.LC124:
	.ascii	"Prio\000"
.LC125:
	.ascii	"GopMode\000"
.LC126:
	.ascii	"Sequence\000"
.LC127:
	.ascii	"ByFrame\000"
.LC128:
	.ascii	"Type\000"
.LC129:
	.ascii	"Height\000"
.LC130:
	.ascii	"%8d|%8u|%8u|%6s|%9s|%10u|%10s|%6d|%10d|%11d|%8d|%10"
	.ascii	"d\012\000"
.LC131:
	.ascii	"y\000"
.LC132:
	.ascii	"\012--------venc chn attr 2------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC133:
	.ascii	"VeStr\000"
.LC134:
	.ascii	"%8s|%8s|%8s|%8s|%12s|%12s|%12s|%12s|%10s\012\000"
.LC135:
	.ascii	"mirror\000"
.LC136:
	.ascii	"rotation\000"
.LC137:
	.ascii	"RealFps*10\000"
.LC138:
	.ascii	"PixFmt\000"
.LC139:
	.ascii	"Timeref\000"
.LC140:
	.ascii	"TarFr\000"
.LC141:
	.ascii	"SrcFr\000"
.LC142:
	.ascii	"%8d|%8s|%8d|%8d|%12x|%12s|%12u|%12s|%10s\012\000"
.LC143:
	.ascii	"\012--------ring buf status------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC144:
	.ascii	"w_pos\000"
.LC145:
	.ascii	"%8s|%8s|%8s|%8s|%10s|%10s|%10s|%10s\012\000"
.LC146:
	.ascii	"l_r_pos\000"
.LC147:
	.ascii	"l_w_pos\000"
.LC148:
	.ascii	"min_size\000"
.LC149:
	.ascii	"total_len\000"
.LC150:
	.ascii	"usd_len\000"
.LC151:
	.ascii	"r_pos\000"
.LC152:
	.ascii	"%8d|%8d|%8d|%8d|%10d|%10d|%10d|%10d\012\000"
.LC153:
	.ascii	"\012--------hw status------------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC154:
	.ascii	"hw_run\000"
.LC155:
	.ascii	"%8s|%8s|%12s|%14s|%14s|%14s|%16s|%14s\012\000"
.LC156:
	.ascii	"pkt_full_cnt\000"
.LC157:
	.ascii	"start_fail_cnt\000"
.LC158:
	.ascii	"cfg_fail_cnt\000"
.LC159:
	.ascii	"ring_fail_cnt\000"
.LC160:
	.ascii	"pkt_fail_cnt\000"
.LC161:
	.ascii	"enc_status\000"
.LC162:
	.ascii	"%8d|%8d|%12d|%14u|%14u|%14u|%16u|%14u\012\000"
.LC163:
	.ascii	"\012--------venc roi attr -------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC164:
	.ascii	"roi\000"
.LC165:
	.ascii	"%8s|%8s|%8s|%8s|%8s|%8s|%8s|%8s|%8s\012\000"
.LC166:
	.ascii	"abs_qp\000"
.LC167:
	.ascii	"intra\000"
.LC168:
	.ascii	"quality\000"
.LC169:
	.ascii	"h\000"
.LC170:
	.ascii	"w\000"
.LC171:
	.ascii	"x\000"
.LC172:
	.ascii	"%8d|%8d|%8d|%8d|%8d|%8d|%8d|%8d|%8d\012\000"
.LC173:
	.ascii	"unchanged\000"
.LC174:
	.ascii	"codec/prep cfg change\000"
.LC175:
	.ascii	"rc cfg change rc_mode/fps/gop\000"
.LC176:
	.ascii	"set cfg change input/format \000"
.LC177:
	.ascii	"set cfg change rc_mode/fps/gop\000"
.LC178:
	.ascii	"set cfg change codec\000"
.LC179:
	.ascii	"vbr\000"
.LC180:
	.ascii	"cbr\000"
.LC181:
	.ascii	"fixqp\000"
.LC182:
	.ascii	"avbr\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
