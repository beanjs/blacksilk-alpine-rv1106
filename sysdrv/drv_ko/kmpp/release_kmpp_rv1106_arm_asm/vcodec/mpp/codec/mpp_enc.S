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
	.file	"mpp_enc.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	mpp_enc_deinit_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_deinit_frame, %function
mpp_enc_deinit_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L1
	ldr	r3, [r0, #368]
	cbz	r3, .L1
	ldr	r0, [r0, #372]
	cbz	r0, .L1
	movw	r3, #5332
	movs	r2, #0
	str	r2, [r4, r3]
	movw	r3, #10788
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #372
	bl	mpp_packet_deinit
	add	r0, r4, #368
	pop	{r4, lr}
	b	mpp_frame_deinit
.L1:
	pop	{r4, pc}
	.fnend
	.size	mpp_enc_deinit_frame, .-mpp_enc_deinit_frame
	.align	1
	.global	mpp_enc_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_deinit, %function
mpp_enc_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	add	r6, r4, #5344
	adds	r6, r6, #8
	mov	r7, r0
	mov	r0, r6
	bl	down
	cbnz	r4, .L13
	movs	r2, #180
	ldr	r1, .L81
	ldr	r0, .L81+4
	bl	printk
	mvn	r0, #2
.L12:
	pop	{r4, r5, r6, r7, r8, pc}
.L13:
	movw	r3, #5340
	ldr	r3, [r4, r3]
	cbz	r3, .L15
	mov	r0, r4
	bl	mpp_enc_deinit_frame
.L15:
	mov	r0, r4
	bl	mpp_enc_impl_free_task
	ldr	r0, [r4, #4]
	cbz	r0, .L16
	bl	enc_impl_deinit
	movs	r3, #0
	str	r3, [r4, #4]
.L16:
	ldr	r0, [r4, #8]
	cbz	r0, .L17
	bl	mpp_enc_hal_deinit
	movs	r3, #0
	str	r3, [r4, #8]
.L17:
	ldr	r3, [r4, #404]
	cbz	r3, .L18
	add	r0, r4, #404
	bl	mpp_packet_deinit
.L18:
	ldr	r1, [r4, #408]
	cbz	r1, .L19
	ldr	r0, .L81+8
	bl	mpp_osal_free
.L19:
	movw	r5, #5304
	mov	r8, #0
	str	r8, [r4, #408]
	adds	r0, r4, r5
	ldr	r3, [r4, r5]
	cbz	r3, .L20
	bl	mpp_enc_ref_cfg_deinit
	str	r8, [r4, r5]
.L20:
	ldr	r3, [r4, #460]
	cbz	r3, .L21
	add	r0, r4, #460
	bl	mpp_enc_refs_deinit
	movs	r3, #0
	str	r3, [r4, #460]
.L21:
	ldr	r0, [r4, #60]
	cbz	r0, .L22
	bl	rc_deinit
	movs	r3, #0
	str	r3, [r4, #60]
.L22:
	movw	r3, #10736
	ldr	r3, [r4, r3]
	cbz	r3, .L23
	movw	r2, #10768
	ldr	r2, [r4, r2]
	ldr	r2, [r2, #12]
	cbnz	r2, .L24
	ldr	r0, [r3, #20]
	cbz	r0, .L24
	ldr	r1, .L81+8
	bl	mpp_buffer_put_with_caller
.L24:
	movw	r3, #10736
	ldr	r1, [r4, r3]
	mov	r5, r3
	cbz	r1, .L25
	ldr	r0, .L81+8
	bl	mpp_osal_free
.L25:
	movs	r3, #0
	str	r3, [r4, r5]
.L23:
	add	r0, r4, #5504
	bl	mpp_enc_unref_osd_buf
	movw	r3, #5348
	ldr	r3, [r4, r3]
	cbz	r3, .L27
	movw	r3, #10772
	ldr	r0, [r4, r3]
	cbz	r0, .L28
	ldr	r1, .L81+8
	bl	mpp_buffer_put_with_caller
.L28:
	movw	r3, #10776
	ldr	r0, [r4, r3]
	cbz	r0, .L29
	ldr	r1, .L81+8
	bl	mpp_buffer_put_with_caller
.L29:
	movw	r3, #10780
	ldr	r1, [r4, r3]
	cbz	r1, .L27
	ldr	r0, .L81+8
	bl	mpp_osal_free
.L27:
	ldr	r1, [r4, #436]
	cbz	r1, .L31
	ldr	r0, .L81+8
	bl	mpp_osal_free
.L31:
	movs	r5, #0
	mov	r0, r6
	str	r5, [r4, #436]
	movw	r6, #5364
	strd	r5, r5, [r4, #444]
	bl	up
	ldr	r3, [r4, r6]
	cbz	r3, .L32
	movs	r1, #244
	ldr	r0, .L81+12
	bl	printk
	ldr	r3, [r7, #56]
	ldr	r0, [r4, r6]
	blx	r3
	movs	r1, #246
	ldr	r0, .L81+16
	bl	printk
	str	r5, [r4, r6]
.L32:
	ldr	r0, .L81+8
	mov	r1, r4
	bl	mpp_osal_free
	movs	r0, #0
	b	.L12
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR0+15
	.word	.LC1
	.word	.LC2
	.fnend
	.size	mpp_enc_deinit, .-mpp_enc_deinit
	.align	1
	.global	mpp_enc_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_init, %function
mpp_enc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L95
	movs	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #72
	sub	sp, sp, #72
	mov	r6, r1
	ldr	r7, [r1]
	strd	r3, r3, [sp]
	mov	r8, r0
	str	r2, [sp, #8]
	cbnz	r0, .L84
	movs	r2, #43
	ldr	r1, .L95+4
	ldr	r0, .L95+8
	mvn	r5, #2
	bl	printk
.L83:
	mov	r0, r5
	add	sp, sp, #72
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L84:
	str	r3, [r0]
	movw	r1, #10792
	ldr	r0, .L95+12
	bl	mpp_osal_calloc
	mov	r4, r0
	cbnz	r0, .L86
	movs	r2, #51
	ldr	r1, .L95+4
	ldr	r0, .L95+8
	mvn	r5, #3
	bl	printk
	b	.L83
.L86:
	add	r0, r0, #460
	bl	mpp_enc_refs_init
	mov	r5, r0
	cbz	r0, .L87
	ldr	r1, .L95+4
	movs	r2, #57
	ldr	r0, .L95+16
.L94:
	bl	printk
.L88:
	mov	r0, r4
	bl	mpp_enc_deinit
	b	.L83
.L87:
	ldr	r1, [r6, #4]
	movs	r2, #29
	strd	r2, r0, [sp, #60]
	add	r3, r4, #600
	ldr	r0, [r6, #8]
	str	r1, [sp, #40]
	ldr	r1, [r6, #16]
	str	r3, [sp, #36]
	str	r3, [sp, #20]
	str	r1, [sp, #44]
	ldr	r1, [r6, #24]
	str	r7, [sp, #32]
	strd	r7, r2, [sp, #12]
	str	r1, [sp, #68]
	ldr	r1, [r6, #28]
	str	r1, [sp, #48]
	ldr	r1, [r6, #20]
	str	r1, [sp, #52]
	ldr	r1, [r6, #36]
	str	r1, [sp, #56]
	movw	r1, #10740
	str	r0, [r4, r1]
	movw	r1, #10744
	ldr	r0, [r6, #12]
	str	r0, [r4, r1]
	add	r1, sp, #32
	ldr	r3, [r4, #460]
	add	r0, sp, #4
	str	r3, [sp, #24]
	movs	r3, #2
	str	r3, [sp, #28]
	bl	mpp_enc_hal_init
	mov	r5, r0
	cbz	r0, .L89
	movs	r2, #82
	ldr	r1, .L95+4
	ldr	r0, .L95+20
	b	.L94
.L89:
	ldr	r3, [sp, #60]
	add	r1, sp, #12
	mov	r0, sp
	str	r3, [sp, #16]
	mov	r3, #-1
	str	r3, [sp, #28]
	bl	enc_impl_init
	mov	r5, r0
	cbz	r0, .L90
	movs	r2, #91
	ldr	r1, .L95+4
	ldr	r0, .L95+24
	b	.L94
.L90:
	mov	r0, r4
	bl	mpp_enc_impl_alloc_task
	ldr	r2, [r6, #20]
	add	r0, r4, #60
	cbz	r2, .L91
	add	r2, sp, #8
.L91:
	mov	r1, r7
	mov	r5, #1024
	bl	rc_init
	str	r7, [r4]
	mov	r1, r5
	str	r5, [r4, #448]
	ldr	r0, .L95+12
	ldr	r3, [sp]
	str	r3, [r4, #4]
	ldr	r3, [sp, #4]
	str	r3, [r4, #8]
	ldr	r3, [sp, #64]
	str	r3, [r4, #12]
	movs	r3, #0
	str	r3, [r4, #424]
	ldr	r3, .L95+28
	str	r3, [r4, #428]
	movs	r3, #88
	str	r3, [r4, #432]
	bl	mpp_osal_calloc
	mov	r1, r5
	str	r0, [r4, #436]
	ldr	r0, .L95+12
	bl	mpp_osal_calloc
	mov	r2, r5
	mov	r1, r0
	str	r0, [r4, #408]
	add	r0, r4, #404
	bl	mpp_packet_init
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	mov	r1, r0
	ldr	r0, [r4, #404]
	bl	mpp_packet_set_length
	str	r7, [r4, #1172]
	movw	r7, #5304
	adds	r0, r4, r7
	bl	mpp_enc_ref_cfg_init
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	ldr	r5, [r4, r7]
	bl	mpp_enc_ref_default
	mov	r1, r0
	mov	r0, r5
	bl	mpp_enc_ref_cfg_copy
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	ldr	r5, [r4, #460]
	bl	mpp_enc_ref_default
	mov	r1, r0
	mov	r0, r5
	bl	mpp_enc_refs_set_cfg
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	ldr	r1, [r4, #752]
	ldr	r0, [r4, #460]
	bl	mpp_enc_refs_set_rc_igop
	mov	r5, r0
	cmp	r0, #0
	bne	.L88
	movw	r0, #5352
	adds	r3, r4, r0
	movs	r2, #1
	adds	r1, r3, #4
	str	r2, [r4, r0]
	strd	r1, r1, [r3, #4]
	movw	r3, #5328
	str	r2, [r4, r3]
	movw	r3, #5332
	str	r5, [r4, r3]
	movw	r3, #6634
	movs	r2, #4
	strb	r2, [r4, r3]
	bl	get_vsm_ops
	cbnz	r0, .L92
	movs	r1, #44
	ldr	r0, .L95+12
	bl	mpp_osal_calloc
	movw	r3, #10736
	str	r0, [r4, r3]
.L92:
	ldr	r2, [r6, #4]
	movw	r3, #5340
	str	r2, [r4, r3]
	movw	r3, #10768
	ldr	r2, [r6, #24]
	str	r2, [r4, r3]
	movw	r3, #5348
	ldr	r2, [r6, #28]
	str	r2, [r4, r3]
	movw	r3, #10788
	ldr	r2, [r6, #32]
	str	r2, [r4, r3]
	add	r3, r4, #5344
	ldr	r2, [r6, #16]
	str	r2, [r3]
	str	r4, [r8]
	b	.L83
.L96:
	.align	2
.L95:
	.word	.LC3
	.word	.LANCHOR0+30
	.word	.LC4
	.word	.LANCHOR0+43
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.fnend
	.size	mpp_enc_init, .-mpp_enc_init
	.align	1
	.global	mpp_enc_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_start, %function
mpp_enc_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L106
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L98
	mov	r3, r0
	mov	r2, #258
	ldr	r1, .L106+4
	ldr	r0, .L106+8
	bl	printk
.L98:
	add	r6, r4, #5344
	adds	r6, r6, #8
	mov	r0, r6
	bl	down
	movw	r3, #5328
	movs	r2, #0
	mov	r0, r6
	str	r2, [r4, r3]
	bl	up
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L99
	mov	r3, r4
	movw	r2, #265
	ldr	r1, .L106+4
	ldr	r0, .L106+12
	bl	printk
.L99:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L107:
	.align	2
.L106:
	.word	.LANCHOR1
	.word	.LANCHOR0+56
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_start, .-mpp_enc_start
	.align	1
	.global	mpp_enc_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_stop, %function
mpp_enc_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	add	r5, r0, #5344
	adds	r5, r5, #8
	ldr	r6, .L117
	mov	r4, r0
	mov	r0, r5
	bl	down
	ldr	r2, [r6]
	lsls	r2, r2, #31
	bpl	.L109
	mov	r3, r4
	mov	r2, #276
	ldr	r1, .L117+4
	ldr	r0, .L117+8
	bl	printk
.L109:
	movw	r3, #5328
	movs	r2, #1
	str	r2, [r4, r3]
	movw	r3, #5332
	ldr	r7, [r4, r3]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L110
	mov	r3, r4
	movw	r2, #279
	ldr	r1, .L117+4
	ldr	r0, .L117+12
	bl	printk
.L110:
	mov	r0, r5
	bl	up
	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, pc}
.L118:
	.align	2
.L117:
	.word	.LANCHOR1
	.word	.LANCHOR0+70
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_stop, .-mpp_enc_stop
	.align	1
	.global	mpp_enc_check_pkt_pool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_pkt_pool, %function
mpp_enc_check_pkt_pool:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	cbz	r0, .L119
	ldr	r3, [r0, #64]
	cbz	r3, .L119
	movw	r2, #5364
	ldr	r0, [r4, r2]
	pop	{r4, lr}
	bx	r3
.L119:
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	mpp_enc_check_pkt_pool, .-mpp_enc_check_pkt_pool
	.align	1
	.global	mpp_enc_reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_reset, %function
mpp_enc_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L132
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L126
	mov	r3, r0
	movw	r2, #303
	ldr	r1, .L132+4
	ldr	r0, .L132+8
	bl	printk
.L126:
	cbnz	r4, .L128
	movw	r2, #305
	ldr	r1, .L132+4
	ldr	r0, .L132+12
	bl	printk
	mvn	r0, #2
.L125:
	pop	{r4, pc}
.L128:
	movs	r0, #0
	b	.L125
.L133:
	.align	2
.L132:
	.word	.LANCHOR1
	.word	.LANCHOR0+83
	.word	.LC9
	.word	.LC11
	.fnend
	.size	mpp_enc_reset, .-mpp_enc_reset
	.align	1
	.global	mpp_enc_oneframe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_oneframe, %function
mpp_enc_oneframe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbnz	r0, .L135
	mov	r2, #318
	ldr	r1, .L143
	ldr	r0, .L143+4
	bl	printk
	mvn	r0, #2
.L134:
	pop	{r3, r4, r5, pc}
.L135:
	ldr	r5, .L143+8
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bmi	.L137
.L142:
	movs	r0, #0
	b	.L134
.L137:
	mov	r3, r0
	mov	r2, #322
	ldr	r1, .L143
	ldr	r0, .L143+12
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L142
	mov	r3, r4
	mov	r2, #324
	ldr	r1, .L143
	ldr	r0, .L143+16
	bl	printk
	b	.L142
.L144:
	.align	2
.L143:
	.word	.LANCHOR0+97
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_oneframe, .-mpp_enc_oneframe
	.align	1
	.global	mpp_enc_cfg_reg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_reg, %function
mpp_enc_cfg_reg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	mov	r7, r1
	mov	r4, r0
	cbnz	r0, .L146
	mov	r2, #336
	ldr	r1, .L168
	ldr	r0, .L168+4
	mvn	r7, #2
	bl	printk
.L145:
	mov	r0, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L146:
	ldr	r6, .L168+8
	ldr	r3, [r6]
	lsls	r2, r3, #31
	bpl	.L148
	mov	r3, r0
	mov	r2, #340
	ldr	r1, .L168
	ldr	r0, .L168+12
	bl	printk
.L148:
	add	r5, r4, #5344
	adds	r5, r5, #8
	mov	r0, r5
	bl	down
	movw	r3, #5328
	ldr	r8, [r4, r3]
	cmp	r8, #0
	beq	.L149
	mov	r0, r5
	mov	r7, #-1
	bl	up
	b	.L145
.L149:
	mov	r0, r4
	bl	mpp_enc_proc_rc_update
	movw	r3, #5336
	str	r8, [r4, r3]
	movw	r3, #5348
	ldr	r3, [r4, r3]
	cmp	r3, #0
	beq	.L151
	movw	r3, #10772
	ldr	r3, [r4, r3]
	cmp	r3, #0
	bne	.L151
	ldr	r2, [r4, #1172]
	ldrd	r1, r3, [r4, #628]
	cmp	r2, #7
	bne	.L153
	adds	r1, r1, #63
	adds	r3, r3, #63
	bics	r1, r1, #63
	it	mi
	addmi	r1, r1, #15
	bics	r3, r3, #63
	asr	r1, r1, #4
.L167:
	it	mi
	addmi	r3, r3, #15
	ldr	r10, .L168+20
	movs	r0, #0
	asrs	r3, r3, #4
	str	r10, [sp]
	mul	r8, r3, r1
	add	r1, r4, #10752
	ldr	r3, .L168+16
	adds	r1, r1, #20
	lsl	r9, r8, #2
	mov	r2, r9
	bl	mpp_buffer_get_with_tag
	movw	r3, #10776
	ldr	r0, [r4, r3]
	adds	r1, r4, r3
	cbnz	r0, .L159
	str	r10, [sp]
	mov	r2, r9
	ldr	r3, .L168+16
	bl	mpp_buffer_get_with_tag
.L159:
	mov	r1, r8
	ldr	r0, .L168+20
	bl	mpp_osal_calloc
	movw	r3, #10780
	str	r0, [r4, r3]
	cbnz	r0, .L151
	movw	r1, #365
	ldr	r0, .L168+24
	bl	printk
.L151:
	mov	r1, r7
	mov	r0, r4
	bl	mpp_enc_impl_reg_cfg
	movw	r3, #5336
	movs	r2, #1
	str	r2, [r4, r3]
	mov	r7, r0
	mov	r0, r5
	bl	up
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L145
	mov	r3, r4
	mov	r2, #370
	ldr	r1, .L168
	ldr	r0, .L168+28
	bl	printk
	b	.L145
.L153:
	adds	r1, r1, #31
	adds	r3, r3, #31
	bics	r1, r1, #31
	it	mi
	addmi	r1, r1, #15
	bics	r3, r3, #31
	asr	r1, r1, #4
	b	.L167
.L169:
	.align	2
.L168:
	.word	.LANCHOR0+114
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC12
	.word	.LANCHOR0+130
	.word	.LC13
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_reg, .-mpp_enc_cfg_reg
	.align	1
	.global	mpp_enc_hw_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_hw_start, %function
mpp_enc_hw_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r8, r1
	mov	r4, r0
	cbnz	r0, .L171
	movw	r2, #381
	ldr	r1, .L182
	ldr	r0, .L182+4
	mvn	r6, #2
	bl	printk
.L170:
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, pc}
.L171:
	ldr	r7, .L182+8
	ldr	r2, [r7]
	lsls	r2, r2, #31
	bpl	.L173
	mov	r3, r0
	movw	r2, #385
	ldr	r1, .L182
	ldr	r0, .L182+12
	bl	printk
.L173:
	add	r5, r4, #5344
	adds	r5, r5, #8
	mov	r0, r5
	bl	down
	movw	r3, #5328
	ldr	r3, [r4, r3]
	cbz	r3, .L174
	mov	r0, r5
	mov	r6, #-1
	bl	up
	b	.L170
.L174:
	movw	r6, #5336
	movs	r3, #2
	mov	r1, r8
	str	r3, [r4, r6]
	mov	r0, r4
	bl	mpp_enc_impl_hw_start
	movs	r3, #3
	str	r3, [r4, r6]
	mov	r6, r0
	cbnz	r0, .L175
	movw	r3, #5332
	movs	r2, #1
	str	r2, [r4, r3]
.L175:
	mov	r0, r5
	bl	up
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L170
	mov	r3, r4
	mov	r2, #398
	ldr	r1, .L182
	ldr	r0, .L182+16
	bl	printk
	b	.L170
.L183:
	.align	2
.L182:
	.word	.LANCHOR0+146
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_hw_start, .-mpp_enc_hw_start
	.align	1
	.global	mpp_enc_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_run_task, %function
mpp_enc_run_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	cbnz	r0, .L185
	movw	r2, #409
	ldr	r1, .L194
	ldr	r0, .L194+4
	mvn	r6, #2
	bl	printk
.L184:
	mov	r0, r6
	pop	{r4, r5, r6, pc}
.L185:
	ldr	r5, .L194+8
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L187
	mov	r3, r0
	movw	r2, #413
	ldr	r1, .L194
	ldr	r0, .L194+12
	bl	printk
.L187:
	movs	r2, #0
	movs	r1, #7
	ldr	r0, [r4, #12]
	bl	mpp_dev_ioctl
	ldr	r3, [r5]
	lsls	r3, r3, #31
	mov	r6, r0
	bpl	.L184
	mov	r3, r4
	movw	r2, #417
	ldr	r1, .L194
	ldr	r0, .L194+16
	bl	printk
	b	.L184
.L195:
	.align	2
.L194:
	.word	.LANCHOR0+163
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_run_task, .-mpp_enc_run_task
	.align	1
	.global	mpp_enc_check_hw_running
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_hw_running, %function
mpp_enc_check_hw_running:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L200
	ldr	r0, [r0, #12]
	pop	{r3, lr}
	b	mpp_dev_chnl_check_running
.L200:
	movw	r2, #427
	ldr	r1, .L201
	ldr	r0, .L201+4
	bl	printk
	mvn	r0, #2
	pop	{r3, pc}
.L202:
	.align	2
.L201:
	.word	.LANCHOR0+180
	.word	.LC11
	.fnend
	.size	mpp_enc_check_hw_running, .-mpp_enc_check_hw_running
	.align	1
	.global	mpp_enc_unbind_jpeg_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_unbind_jpeg_task, %function
mpp_enc_unbind_jpeg_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L207
	ldr	r0, [r0, #12]
	pop	{r3, lr}
	b	mpp_dev_chnl_unbind_jpeg_task
.L207:
	movw	r2, #439
	ldr	r1, .L208
	ldr	r0, .L208+4
	bl	printk
	mvn	r0, #2
	pop	{r3, pc}
.L209:
	.align	2
.L208:
	.word	.LANCHOR0+205
	.word	.LC11
	.fnend
	.size	mpp_enc_unbind_jpeg_task, .-mpp_enc_unbind_jpeg_task
	.align	1
	.global	mpp_enc_check_is_int_process
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_is_int_process, %function
mpp_enc_check_is_int_process:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbnz	r0, .L211
	mov	r2, #452
	ldr	r1, .L213
	ldr	r0, .L213+4
	bl	printk
.L212:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L211:
	add	r5, r0, #5344
	adds	r5, r5, #8
	mov	r0, r5
	bl	down
	movw	r3, #5336
	ldr	r4, [r4, r3]
	mov	r0, r5
	subs	r3, r4, #4
	rsbs	r4, r3, #0
	adcs	r4, r4, r3
	bl	up
	b	.L212
.L214:
	.align	2
.L213:
	.word	.LANCHOR0+230
	.word	.LC11
	.fnend
	.size	mpp_enc_check_is_int_process, .-mpp_enc_check_is_int_process
	.align	1
	.global	mpp_enc_int_process
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_int_process, %function
mpp_enc_int_process:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r1
	mov	r8, r2
	mov	r9, r3
	mov	r4, r0
	cbnz	r0, .L216
	movw	r2, #471
	ldr	r1, .L225
	ldr	r0, .L225+4
	mvn	r5, #2
	bl	printk
.L215:
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L216:
	ldr	r7, .L225+8
	ldr	r2, [r7]
	lsls	r2, r2, #31
	bpl	.L218
	mov	r3, r0
	movw	r2, #475
	ldr	r1, .L225
	ldr	r0, .L225+12
	bl	printk
.L218:
	movw	r6, #5336
	movs	r3, #4
	mov	r2, r8
	str	r3, [r4, r6]
	mov	r1, r5
	mov	r3, r9
	mov	r0, r4
	bl	mpp_enc_impl_int
	movs	r3, #5
	str	r3, [r4, r6]
	movw	r3, #5332
	movs	r2, #0
	str	r2, [r4, r3]
	ldr	r3, [r7]
	lsls	r3, r3, #31
	mov	r5, r0
	bpl	.L215
	mov	r3, r4
	mov	r2, #480
	ldr	r1, .L225
	ldr	r0, .L225+16
	bl	printk
	b	.L215
.L226:
	.align	2
.L225:
	.word	.LANCHOR0+259
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_int_process, .-mpp_enc_int_process
	.align	1
	.global	mpp_enc_proc_debug
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_debug, %function
mpp_enc_proc_debug:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	mov	r7, r2
	mov	r4, r1
	cbnz	r1, .L228
	movw	r2, #489
	ldr	r1, .L234
	ldr	r0, .L234+4
	pop	{r4, r5, r6, r7, r8, lr}
	b	printk
.L228:
	ldr	r5, .L234+8
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L229
	mov	r3, r1
	movw	r2, #493
	ldr	r1, .L234
	ldr	r0, .L234+12
	bl	printk
.L229:
	mov	r2, r7
	mov	r1, r4
	mov	r0, r6
	bl	mpp_enc_impl_poc_debug_info
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L227
	mov	r3, r4
	movw	r2, #497
	ldr	r1, .L234
	ldr	r0, .L234+16
	pop	{r4, r5, r6, r7, r8, lr}
	b	printk
.L227:
	pop	{r4, r5, r6, r7, r8, pc}
.L235:
	.align	2
.L234:
	.word	.LANCHOR0+279
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_proc_debug, .-mpp_enc_proc_debug
	.align	1
	.global	mpp_enc_register_chl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_register_chl, %function
mpp_enc_register_chl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbnz	r0, .L237
	movw	r2, #509
	ldr	r1, .L239
	ldr	r0, .L239+4
	bl	printk
	mvn	r0, #2
.L236:
	pop	{r3, pc}
.L237:
	movw	r3, #5340
	ldr	r3, [r0, r3]
	ldr	r0, [r0, #12]
	orr	r2, r2, r3, lsl #16
	bl	mpp_dev_chnl_register
	movs	r0, #0
	b	.L236
.L240:
	.align	2
.L239:
	.word	.LANCHOR0+298
	.word	.LC11
	.fnend
	.size	mpp_enc_register_chl, .-mpp_enc_register_chl
	.align	1
	.global	mpp_enc_notify
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_notify, %function
mpp_enc_notify:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r5, .L248
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bpl	.L243
	mov	r3, r0
	str	r1, [sp]
	mov	r2, #524
	ldr	r1, .L248+4
	ldr	r0, .L248+8
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L243
	mov	r3, r4
	movw	r2, #526
	ldr	r1, .L248+4
	ldr	r0, .L248+12
	bl	printk
.L243:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L249:
	.align	2
.L248:
	.word	.LANCHOR1
	.word	.LANCHOR0+319
	.word	.LC14
	.word	.LC10
	.fnend
	.size	mpp_enc_notify, .-mpp_enc_notify
	.align	1
	.global	mpp_enc_control
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_control, %function
mpp_enc_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r6, r1
	mov	r4, r2
	mov	r5, r0
	cbnz	r0, .L251
	movw	r2, #542
	ldr	r1, .L318
	ldr	r0, .L318+4
	bl	printk
.L315:
	mvn	r0, #2
.L250:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L251:
	cbnz	r2, .L253
	ldr	r3, .L318+8
	cmp	r1, r3
	beq	.L253
	mov	r3, r0
	str	r1, [sp]
	movw	r2, #547
	ldr	r1, .L318
	ldr	r0, .L318+12
	bl	printk
	b	.L315
.L253:
	ldr	r7, .L318+16
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L254
	str	r4, [sp]
	mov	r3, r6
	movw	r2, #551
	ldr	r1, .L318
	ldr	r0, .L318+20
	bl	printk
.L254:
	ldr	r3, .L318+24
	cmp	r6, r3
	beq	.L255
	bhi	.L256
	subs	r3, r3, #4
	cmp	r6, r3
	beq	.L257
	bhi	.L258
	subs	r3, r3, #1
	cmp	r6, r3
	beq	.L259
.L260:
	add	r8, r5, #5344
	add	r8, r8, #8
	mov	r0, r8
	bl	down
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	mpp_enc_proc_cfg
	ldr	r0, [r5, #8]
	bl	mpp_enc_hal_prepare
	mov	r0, r8
	bl	up
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L314
	mov	r3, r6
	movw	r2, #610
	ldr	r1, .L318
	ldr	r0, .L318+28
	bl	printk
	b	.L314
.L258:
	ldr	r3, .L318+32
	cmp	r6, r3
	beq	.L261
	adds	r3, r3, #2
	cmp	r6, r3
	bne	.L260
	ldr	r3, [r7]
	lsls	r7, r3, #30
	bpl	.L273
	movw	r2, #582
	ldr	r1, .L318
	ldr	r0, .L318+36
	bl	printk
.L273:
	movs	r2, #200
	add	r1, r5, #704
	b	.L316
.L256:
	ldr	r3, .L318+40
	cmp	r6, r3
	beq	.L263
	bhi	.L264
	subs	r3, r3, #12
	cmp	r6, r3
	bne	.L260
	ldr	r3, [r7]
	lsls	r6, r3, #30
	bpl	.L274
	movw	r2, #587
	ldr	r1, .L318
	ldr	r0, .L318+44
	bl	printk
.L274:
	mov	r2, #2832
	addw	r1, r5, #1172
	b	.L316
.L264:
	ldr	r3, .L318+48
	cmp	r6, r3
	beq	.L266
	add	r3, r3, #512
	cmp	r6, r3
	bne	.L260
	ldr	r3, [r7]
	lsls	r1, r3, #30
	bpl	.L276
	movw	r2, #597
	ldr	r1, .L318
	ldr	r0, .L318+52
	bl	printk
.L276:
	add	r5, r5, #5280
	add	r3, r5, #24
.L277:
	ldr	r2, [r5], #4	@ unaligned
	cmp	r5, r3
	str	r2, [r4], #4	@ unaligned
	bne	.L277
	b	.L314
.L259:
	ldr	r3, [r7]
	lsls	r0, r3, #30
	bpl	.L268
	movw	r2, #557
	ldr	r1, .L318
	ldr	r0, .L318+56
	bl	printk
.L268:
	movw	r2, #4720
	add	r1, r5, #600
	mov	r0, r4
	bl	memcpy
	ldr	r3, [r4, #56]
	bic	r3, r3, #2
	cmp	r3, #1
	itttt	eq
	ldrdeq	r2, r3, [r4, #12]
	strdeq	r3, r2, [r4, #12]
	ldrdeq	r2, r3, [r4, #28]
	strdeq	r3, r2, [r4, #28]
.L314:
	movs	r0, #0
	b	.L250
.L257:
	ldr	r3, [r7]
	lsls	r1, r3, #30
	bpl	.L270
	movw	r2, #567
	ldr	r1, .L318
	ldr	r0, .L318+60
	bl	printk
.L270:
	add	r0, r5, #608
	movs	r2, #96
	mov	r1, r4
.L317:
	bl	memcpy
	b	.L314
.L255:
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L271
	mov	r2, #572
	ldr	r1, .L318
	ldr	r0, .L318+64
	bl	printk
.L271:
	mov	r2, #2832
	mov	r1, r4
	addw	r0, r5, #1172
	b	.L317
.L261:
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L272
	movw	r2, #577
	ldr	r1, .L318
	ldr	r0, .L318+68
	bl	printk
.L272:
	add	r1, r5, #608
	movs	r2, #96
.L316:
	mov	r0, r4
	b	.L317
.L266:
	ldr	r3, [r7]
	lsls	r0, r3, #30
	bpl	.L275
	mov	r2, #592
	ldr	r1, .L318
	ldr	r0, .L318+72
	bl	printk
.L275:
	ldr	r3, [r5, #420]	@ unaligned
	str	r3, [r4]	@ unaligned
	b	.L314
.L263:
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L278
	movw	r2, #602
	ldr	r1, .L318
	ldr	r0, .L318+76
	bl	printk
.L278:
	movs	r2, #136
	add	r1, r5, #4016
	b	.L316
.L319:
	.align	2
.L318:
	.word	.LANCHOR0+334
	.word	.LC15
	.word	3276809
	.word	.LC16
	.word	.LANCHOR1
	.word	.LC17
	.word	3276807
	.word	.LC27
	.word	3276804
	.word	.LC22
	.word	3276820
	.word	.LC23
	.word	3309570
	.word	.LC25
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC24
	.word	.LC26
	.fnend
	.size	mpp_enc_control, .-mpp_enc_control
	.align	1
	.global	mpp_enc_pkt_full_inc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_pkt_full_inc, %function
mpp_enc_pkt_full_inc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	mpp_enc_impl_pkt_full_inc
	.fnend
	.size	mpp_enc_pkt_full_inc, .-mpp_enc_pkt_full_inc
	.global	mpp_enc_debug
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.22464, %object
	.size	__func__.22464, 15
__func__.22464:
	.ascii	"mpp_enc_deinit\000"
	.type	__FUNCTION__.22465, %object
	.size	__FUNCTION__.22465, 15
__FUNCTION__.22465:
	.ascii	"mpp_enc_deinit\000"
	.type	__func__.22444, %object
	.size	__func__.22444, 13
__func__.22444:
	.ascii	"mpp_enc_init\000"
	.type	__FUNCTION__.22445, %object
	.size	__FUNCTION__.22445, 13
__FUNCTION__.22445:
	.ascii	"mpp_enc_init\000"
	.type	__func__.22470, %object
	.size	__func__.22470, 14
__func__.22470:
	.ascii	"mpp_enc_start\000"
	.type	__func__.22476, %object
	.size	__func__.22476, 13
__func__.22476:
	.ascii	"mpp_enc_stop\000"
	.type	__func__.22491, %object
	.size	__func__.22491, 14
__func__.22491:
	.ascii	"mpp_enc_reset\000"
	.type	__func__.22499, %object
	.size	__func__.22499, 17
__func__.22499:
	.ascii	"mpp_enc_oneframe\000"
	.type	__func__.22507, %object
	.size	__func__.22507, 16
__func__.22507:
	.ascii	"mpp_enc_cfg_reg\000"
	.type	__FUNCTION__.22510, %object
	.size	__FUNCTION__.22510, 16
__FUNCTION__.22510:
	.ascii	"mpp_enc_cfg_reg\000"
	.type	__func__.22517, %object
	.size	__func__.22517, 17
__func__.22517:
	.ascii	"mpp_enc_hw_start\000"
	.type	__func__.22526, %object
	.size	__func__.22526, 17
__func__.22526:
	.ascii	"mpp_enc_run_task\000"
	.type	__func__.22531, %object
	.size	__func__.22531, 25
__func__.22531:
	.ascii	"mpp_enc_check_hw_running\000"
	.type	__func__.22536, %object
	.size	__func__.22536, 25
__func__.22536:
	.ascii	"mpp_enc_unbind_jpeg_task\000"
	.type	__func__.22542, %object
	.size	__func__.22542, 29
__func__.22542:
	.ascii	"mpp_enc_check_is_int_process\000"
	.type	__func__.22551, %object
	.size	__func__.22551, 20
__func__.22551:
	.ascii	"mpp_enc_int_process\000"
	.type	__func__.22561, %object
	.size	__func__.22561, 19
__func__.22561:
	.ascii	"mpp_enc_proc_debug\000"
	.type	__func__.22569, %object
	.size	__func__.22569, 21
__func__.22569:
	.ascii	"mpp_enc_register_chl\000"
	.type	__func__.22575, %object
	.size	__func__.22575, 15
__func__.22575:
	.ascii	"mpp_enc_notify\000"
	.type	__func__.22583, %object
	.size	__func__.22583, 16
__func__.22583:
	.ascii	"mpp_enc_control\000"
	.type	__param_str_mpp_enc_debug, %object
	.size	__param_str_mpp_enc_debug, 25
__param_str_mpp_enc_debug:
	.ascii	"mpp_vcodec.mpp_enc_debug\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	mpp_enc_debug, %object
	.size	mpp_enc_debug, 4
mpp_enc_debug:
	.space	4
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_mpp_enc_debug163, %object
	.size	__UNIQUE_ID_mpp_enc_debug163, 61
__UNIQUE_ID_mpp_enc_debug163:
	.ascii	"mpp_vcodec.parm=mpp_enc_debug:bits mpp_enc debug in"
	.ascii	"formation\000"
	.type	__UNIQUE_ID_mpp_enc_debugtype162, %object
	.size	__UNIQUE_ID_mpp_enc_debugtype162, 39
__UNIQUE_ID_mpp_enc_debugtype162:
	.ascii	"mpp_vcodec.parmtype=mpp_enc_debug:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: found NULL input\012\000"
.LC1:
	.ascii	"\0016%d: buf_pool_destroy in\000"
.LC2:
	.ascii	"\0016%d: buf_pool_destroy out\000"
.LC3:
	.ascii	"smart\000"
.LC4:
	.ascii	"\0013%s:%d: failed to malloc context\012\000"
.LC5:
	.ascii	"\0013%s:%d: could not init enc refs\012\000"
.LC6:
	.ascii	"\0013%s:%d: could not init enc hal\012\000"
.LC7:
	.ascii	"\0013%s:%d: could not init impl\012\000"
.LC8:
	.ascii	"64e135b0 author: Yandong Lin 2023-08-23 [h265e_api]"
	.ascii	": fix h265 cfg change not clear issue\000"
.LC9:
	.ascii	"\0016%s:%d: %p in\012\000"
.LC10:
	.ascii	"\0016%s:%d: %p out\012\000"
.LC11:
	.ascii	"\0013%s:%d: found NULL input enc\012\000"
.LC12:
	.ascii	"mpp_enc\000"
.LC13:
	.ascii	"\0016%d: alloc mv_flag failed!\012\000"
.LC14:
	.ascii	"\0016%s:%d: %p in flag %08x\012\000"
.LC15:
	.ascii	"\0013%s:%d: found NULL enc\012\000"
.LC16:
	.ascii	"\0013%s:%d: found NULL param enc %p cmd %x\012\000"
.LC17:
	.ascii	"\0016%s:%d: sending cmd %d param %p\012\000"
.LC18:
	.ascii	"\0016%s:%d: get all config\012\000"
.LC19:
	.ascii	"\0016%s:%d: set prep config\012\000"
.LC20:
	.ascii	"\0016%s:%d: set codec config\012\000"
.LC21:
	.ascii	"\0016%s:%d: get prep config\012\000"
.LC22:
	.ascii	"\0016%s:%d: get rc config\012\000"
.LC23:
	.ascii	"\0016%s:%d: get codec config\012\000"
.LC24:
	.ascii	"\0016%s:%d: get header mode\012\000"
.LC25:
	.ascii	"\0016%s:%d: get ref config\012\000"
.LC26:
	.ascii	"\0016%s:%d: get roi config\012\000"
.LC27:
	.ascii	"\0016%s:%d: sending cmd %d done\012\000"
	.section	__param,"a"
	.align	2
	.type	__param_mpp_enc_debug, %object
	.size	__param_mpp_enc_debug, 20
__param_mpp_enc_debug:
	.word	__param_str_mpp_enc_debug
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	mpp_enc_debug
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
