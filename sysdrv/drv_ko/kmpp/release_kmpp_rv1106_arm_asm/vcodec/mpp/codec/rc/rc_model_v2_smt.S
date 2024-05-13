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
	.file	"rc_model_v2_smt.c"
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
	.type	set_coef, %function
set_coef:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	mov	r5, r1
	ldr	r0, [r0, #328]
	movs	r1, #0
	mov	r4, r2
	bl	mpp_data_get_pre_val_v2
	movs	r1, #1
	mov	r6, r0
	ldr	r0, [r7, #328]
	bl	mpp_data_get_pre_val_v2
	mov	r8, r0
	ldr	r0, [r7, #328]
	bl	mpp_data_sum_v2
	cbnz	r0, .L2
.L25:
	str	r4, [r5]
	pop	{r4, r5, r6, r7, r8, pc}
.L2:
	cmp	r0, #1
	bne	.L4
	cbnz	r6, .L5
	adds	r4, r4, #10
	b	.L25
.L5:
	adds	r4, r4, #25
	b	.L25
.L4:
	cmp	r0, #2
	bne	.L6
	cmp	r6, #0
	beq	.L5
.L8:
	adds	r4, r4, #35
	b	.L25
.L6:
	cmp	r0, #3
	bne	.L7
	cmp	r6, #0
	beq	.L8
.L11:
	adds	r4, r4, #51
	b	.L25
.L7:
	subs	r3, r0, #4
	cmp	r3, #2
	bhi	.L9
	cbnz	r6, .L10
	cmp	r8, #0
	beq	.L8
	b	.L11
.L10:
	adds	r4, r4, #64
	b	.L25
.L9:
	subs	r0, r0, #7
	cmp	r0, #2
	bhi	.L12
	orrs	r3, r6, r8
	beq	.L10
	adds	r4, r4, #72
	b	.L25
.L12:
	adds	r4, r4, #80
	b	.L25
	.fnend
	.size	set_coef, .-set_coef
	.global	__aeabi_idiv
	.global	__aeabi_uidiv
	.align	1
	.global	rc_model_v2_smt_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_start, %function
rc_model_v2_smt_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #76
	sub	sp, sp, #76
	ldr	r3, [r0, #28]
	mov	r4, r0
	ldr	r5, [r0, #556]
	mov	fp, r1
	str	r3, [sp, #28]
	ldr	r3, [r0, #32]
	str	r3, [sp, #32]
	ldr	r3, [r0, #124]
	str	r3, [sp, #24]
	ldr	r3, [r0, #120]
	str	r3, [sp, #8]
	ldr	r3, [r0, #132]
	str	r3, [sp, #52]
	ldr	r3, [r0, #128]
	ldr	r0, [r0, #324]
	str	r3, [sp, #12]
	bl	mpp_data_sum_v2
	movs	r1, #0
	str	r0, [sp, #40]
	ldr	r0, [r4, #324]
	bl	mpp_data_get_pre_val_v2
	str	r0, [sp, #44]
	ldr	r0, [r4, #328]
	bl	mpp_data_sum_v2
	ldrb	r3, [fp, #156]	@ zero_extendqisi2
	lsls	r1, r3, #29
	str	r0, [sp, #56]
	bmi	.L182
	ldr	r0, [fp, #296]
	bl	mpp_frame_get_ppinfo
	mov	r7, r0
	ldrd	r0, r1, [r4, #28]
	bl	__aeabi_idiv
	ldr	r3, [r4, #48]
	ldr	r9, [r4, #56]
	mov	r6, r0
	str	r3, [sp, #16]
	cbz	r7, .L29
	ldr	r3, [r7, #8]
	lsls	r2, r3, #31
	bpl	.L29
	ubfx	r2, r3, #4, #9
	asrs	r3, r3, #16
	tst	r3, #254
	uxtb	r1, r3
	bne	.L30
	cmp	r1, #0
	bne	.L135
	movs	r3, #30
	cmp	r2, #0
	bne	.L195
	str	r3, [sp, #8]
	b	.L29
.L30:
	movs	r3, #33
	str	r3, [sp, #8]
	orrs	r3, r2, r1
	beq	.L29
.L31:
	ldr	r3, [sp, #12]
	cmp	r3, #37
	it	ge
	movge	r3, #37
	str	r3, [sp, #12]
.L29:
	ldr	r0, [r4, #324]
	bl	mpp_data_sum_v2
	cbnz	r0, .L33
	ldr	r3, [r4, #256]
	cbz	r3, .L33
	ldr	r3, [r4, #136]
	str	r3, [sp, #24]
	str	r3, [sp, #8]
.L33:
	ldrb	r3, [fp, #152]	@ zero_extendqisi2
	tst	r3, #16
	ite	ne
	movne	r3, #2
	moveq	r3, #0
	str	r3, [r4, #260]
	ldrb	r2, [fp, #154]	@ zero_extendqisi2
	and	r2, r2, #63
	cmp	r2, #3
	it	eq
	moveq	r3, r2
	ldr	r2, [r4, #288]
	str	r3, [r4, #260]
	cbz	r2, .L36
	cmp	r2, #1
	beq	.L37
	cmp	r3, #2
	bne	.L41
	add	r7, r4, #336
	mov	r0, r7
	bl	mpp_pid_calc
	ldr	r3, [r4, #340]
	mov	r8, r0
	subs	r3, r3, r0
	mov	r0, r7
	str	r3, [r4, #316]
	bl	mpp_pid_reset
	ldrd	r2, [r4, #296]
	ldr	r7, [r4, #380]
	orrs	r3, r2, r3
	beq	.L42
	ldr	r3, [r4, #388]
	add	r7, r7, r8
	str	r7, [r4, #372]
	add	r3, r3, r8
	b	.L196
.L135:
	movs	r3, #32
.L195:
	str	r3, [sp, #8]
	b	.L31
.L36:
	cmp	r3, #2
	bne	.L39
	ldr	r3, [r4, #380]
	str	r3, [r4, #372]
	ldr	r3, [r4, #388]
.L196:
	str	r3, [r4, #376]
.L40:
	ldr	r3, [r4, #320]
	cbnz	r3, .L47
	cmp	r6, #14
	bgt	.L48
	lsls	r1, r6, #2
.L49:
	ldr	r6, [r4, #404]
	add	r0, r4, #320
	cmp	r1, r6
	it	lt
	movlt	r1, r6
	cmp	r1, #50
	it	ge
	movge	r1, #50
	cmp	r1, #20
	it	lt
	movlt	r1, #20
	bl	mpp_data_init
.L47:
	ldrd	r3, r2, [r4, #372]
	ldrd	r0, r1, [sp, #28]
	add	r3, r3, r2
	cmp	r3, #199
	ite	gt
	asrgt	r3, r3, #1
	movle	r3, #100
	str	r3, [fp, #164]
	bl	__aeabi_idiv
	movs	r3, #1
	mov	r2, r3
	mov	r1, #-1
	ldr	r7, [fp, #164]
	str	r0, [sp, #16]
	ldr	r0, [r4, #320]
	bl	mpp_data_avg
	ldrd	r8, [r4, #272]
	orrs	r3, r8, r9
	str	r0, [sp, #28]
	bne	.L53
	ldr	r3, [r4, #92]
	cmp	r3, #0
	bge	.L54
	ldr	r2, .L206
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #16]
	ldr	r0, [r4]
	smull	r2, r3, r3, r2
	asrs	r1, r1, #31
	adds	r0, r0, #15
	ldr	r6, .L206+4
	asrs	r2, r0, #4
	rsb	r1, r1, r3, asr #2
	ldr	r3, [r4, #376]
	adds	r1, r1, #1
	cmp	r1, #3
	it	ge
	movge	r1, #3
	cmp	r1, #1
	it	lt
	movlt	r1, #1
	muls	r1, r3, r1
	ldr	r3, [r4, #4]
	add	r0, r3, #15
	asrs	r0, r0, #4
	muls	r0, r2, r0
	movs	r2, #0
.L55:
	adds	r2, r2, #1
	cmp	r2, #8
	beq	.L56
	ldr	r3, [r6, r2, lsl #2]
	cmp	r0, r3
	bcs	.L55
.L56:
	add	r2, r6, r2, lsl #2
	ldr	r3, [r2, #132]
	muls	r0, r3, r0
	sub	r0, r0, #350
	bl	__aeabi_uidiv
	ldr	r2, [r4, #284]
	cmp	r0, #95
	ldr	r1, [sp, #24]
	it	ge
	movge	r0, #95
	cmp	r0, #4
	ite	ge
	addge	r6, r6, r0
	addlt	r6, r6, #4
	cmp	r1, #31
	ldrb	r3, [r6, #36]	@ zero_extendqisi2
	ble	.L58
	cmp	r3, r1
	blt	.L138
.L199:
	cmp	r3, r2
	it	ge
	movge	r3, r2
.L54:
	str	r3, [r4, #552]
.L53:
	ldr	r3, [r4, #260]
	cmp	r3, #2
	bne	.L59
	cmp	r8, #1
	sbcs	r3, r9, #0
	blt	.L60
	ldrd	r9, r3, [r4, #280]
	ldr	r2, [sp, #28]
	cmp	r2, r9
	blt	.L61
	cmp	r2, r3
	it	ge
	movge	r2, r3
	mov	r9, r2
.L61:
	ldrd	r3, r6, [r4, #560]
	cmp	r3, r7
	blt	.L62
	add	r2, r7, r7, lsl #2
	cmp	r3, r2
	ble	.L63
	adds	r7, r6, #3
.L64:
	ldr	r3, [r4, #580]
	cmp	r3, #0
	bne	.L69
	ldr	r3, [r4, #204]
	cmp	r3, #0
	beq	.L69
	ldrd	r10, r3, [r4, #568]
	str	r3, [sp, #16]
	ldr	r3, [r4, #576]
	asr	r8, r3, #5
	ldr	r3, .L206+8
	cmp	r8, #7
	ldr	r3, [r3]
	it	ge
	movge	r8, #7
	lsls	r3, r3, #31
	bpl	.L71
	mov	r3, r4
	mov	r2, #418
	ldr	r1, .L206+12
	ldr	r0, .L206+16
	bl	printk
.L71:
	mov	r0, r10
	ldr	r1, [sp, #16]
	bl	__aeabi_idiv
	ldr	r3, .L206+8
	ldr	r3, [r3]
	cmp	r0, #35
	it	ge
	movge	r0, #35
	mov	r10, r0
	lsls	r0, r3, #24
	bpl	.L72
	ldr	r3, [r4, #576]
	movw	r2, #423
	ldr	r1, .L206+12
	ldr	r0, .L206+20
	strd	r10, r3, [sp]
	ldr	r3, [r4, #552]
	bl	printk
.L72:
	ldr	r2, .L206+4
	ldr	r3, [r4, #208]
	uxtab	r8, r2, r8
	add	r3, r3, r2
	ldrsb	r2, [r8, #225]
	ldrsb	r3, [r3, #189]
	subs	r1, r3, r2
	cmp	r10, r1
	itt	gt
	subgt	r10, r10, r3
	addgt	r10, r10, r2
	ldrd	r2, r3, [r4, #104]
	cmp	r3, r10
	bgt	.L74
	cmp	r2, r10
	mov	r3, r2
	it	ge
	movge	r3, r10
.L74:
	str	r3, [r4, #552]
	movs	r3, #0
	strd	r3, r3, [r4, #568]
	ldr	r3, .L206+8
	ldr	r3, [r3]
	lsls	r1, r3, #31
	bpl	.L69
	mov	r3, r4
	mov	r2, #434
	ldr	r1, .L206+12
	ldr	r0, .L206+24
	bl	printk
.L69:
	ldr	r3, .L206+4
	add	r9, r9, r3
	ldrb	r1, [r9, #233]	@ zero_extendqisi2
	ldrb	r2, [r9, #285]	@ zero_extendqisi2
	cmp	r1, r7
	bgt	.L75
	cmp	r2, r7
	it	ge
	movge	r2, r7
	mov	r1, r2
.L75:
	add	r5, r5, r3
	ldrb	r2, [r5, #233]	@ zero_extendqisi2
	ldrb	r0, [r5, #285]	@ zero_extendqisi2
	cmp	r2, r1
	bgt	.L76
	cmp	r0, r1
	mov	r2, r0
	it	ge
	movge	r2, r1
.L76:
	add	r6, r6, r3
	ldrb	r3, [r6, #337]	@ zero_extendqisi2
	ldrb	r1, [r6, #389]	@ zero_extendqisi2
	cmp	r3, r2
	bgt	.L123
	cmp	r1, r2
	mov	r3, r1
	it	ge
	movge	r3, r2
.L123:
	str	r3, [r4, #552]
	b	.L60
.L39:
	add	r0, r4, #480
	ldr	r7, [r4, #384]
	bl	mpp_pid_calc
	subs	r0, r7, r0
	ldr	r7, [r4, #392]
	str	r0, [r4, #372]
	add	r0, r4, #516
.L204:
	bl	mpp_pid_calc
	subs	r0, r7, r0
.L197:
	str	r0, [r4, #376]
	b	.L40
.L37:
	ldr	r7, [r4, #380]
.L42:
	add	r0, r4, #408
	bl	mpp_pid_calc
	subs	r0, r7, r0
	ldr	r7, [r4, #388]
	str	r0, [r4, #372]
	add	r0, r4, #444
	b	.L204
.L41:
	ldr	r3, [r4, #264]
	cmp	r3, #2
	bne	.L43
	add	r0, r4, #336
	bl	mpp_pid_calc
	ldr	r7, [r4, #316]
	ldr	r3, [r4, #404]
	mov	r1, r6
	add	r8, r3, #-1
	mov	r10, r0
	ldr	r0, [r4, #560]
	subs	r7, r7, r0
	ldr	r0, [sp, #16]
	str	r3, [sp, #16]
	muls	r0, r3, r0
	bl	__aeabi_idiv
	mov	r1, r8
	add	r0, r0, r7
	add	r0, r0, r10
	bl	__aeabi_idiv
	mov	r1, r6
	ldr	r3, [sp, #16]
	str	r0, [r4, #384]
	str	r0, [r4, #372]
	mul	r0, r3, r9
	bl	__aeabi_idiv
	mov	r1, r8
	add	r0, r0, r7
	add	r0, r0, r10
	bl	__aeabi_idiv
	str	r0, [r4, #392]
	b	.L197
.L43:
	add	r0, r4, #480
	bl	mpp_pid_calc
	mov	r10, r0
	add	r0, r4, #516
	bl	mpp_pid_calc
	ldrd	r2, r1, [r4, #28]
	mov	r7, r0
	ldr	r0, [sp, #16]
	bl	axb_div_c
	ldrd	r2, r1, [r4, #28]
	mov	r8, r0
	mov	r0, r9
	bl	axb_div_c
	ldr	r3, [r4, #384]
	lsl	r8, r8, #1
	sub	r3, r3, r10
	cmp	r3, r8
	ite	le
	strle	r3, [r4, #372]
	strgt	r8, [r4, #372]
	ldr	r3, [r4, #392]
	subs	r7, r3, r7
	lsls	r0, r0, #1
	cmp	r7, r0
	ite	le
	strle	r7, [r4, #376]
	strgt	r0, [r4, #376]
	b	.L40
.L48:
	cmp	r6, #24
	lsl	r1, r6, #1
	it	le
	addle	r1, r1, r6
	b	.L49
.L58:
	cmp	r3, #30
	bgt	.L199
	movs	r3, #31
	b	.L54
.L138:
	ldr	r3, [sp, #24]
	b	.L54
.L63:
	lsls	r2, r7, #1
	cmp	r3, r2
	ble	.L65
	adds	r7, r6, #2
	b	.L64
.L65:
	add	r7, r7, r2
	cmp	r7, r3, lsl #1
	bge	.L141
	adds	r7, r6, #1
	b	.L64
.L62:
	lsls	r2, r3, #1
	add	r3, r3, r2
	cmp	r3, r7
	bge	.L66
	subs	r7, r6, #3
	b	.L64
.L66:
	cmp	r2, r7
	bge	.L67
	subs	r7, r6, #2
	b	.L64
.L67:
	cmp	r3, r7, lsl #1
	bge	.L141
	subs	r7, r6, #1
	b	.L64
.L141:
	mov	r7, r6
	b	.L64
.L207:
	.align	2
.L206:
	.word	1717986919
	.word	.LANCHOR0
	.word	rc_debug
	.word	.LANCHOR0+168
	.word	.LC1
	.word	.LC2
	.word	.LC3
.L59:
	ldr	r3, [r4, #264]
	cmp	r3, #2
	bne	.L78
	cmp	r5, #32
	ble	.L142
	cmp	r5, #35
	ite	lt
	movlt	r3, #2
	movge	r3, #1
.L79:
	add	r5, r5, r3
	str	r5, [r4, #552]
.L60:
	ldr	r3, [sp, #40]
	cmp	r3, #700
	bge	.L155
	ldr	r3, [sp, #44]
	cmp	r3, #200
	beq	.L155
	ldr	r3, [sp, #40]
	cmp	r3, #400
	bge	.L156
	ldr	r3, [sp, #44]
	cmp	r3, #100
	ite	ne
	movne	r3, #4
	moveq	r3, #5
.L124:
	ldr	r2, [sp, #56]
	ldr	r0, [r4, #260]
	cmp	r2, #11
	ldr	r1, [r4, #552]
	it	gt
	addgt	r3, r3, #1
	cmp	r0, #2
	bne	.L126
	ldr	r2, [sp, #24]
	add	r3, r3, r2
	cmp	r3, r1
	bgt	.L131
	ldr	r3, [sp, #52]
	cmp	r3, r1
	it	ge
	movge	r3, r1
.L131:
	str	r3, [r4, #552]
	b	.L128
.L142:
	movs	r3, #3
	b	.L79
.L78:
	ldr	r0, [r4, #324]
	mov	r3, #1024
	str	r3, [sp, #68]
	bl	mpp_data_sum_v2
	movs	r1, #0
	mov	r6, r0
	ldr	r0, [r4, #324]
	bl	mpp_data_get_pre_val_v2
	movs	r1, #1
	mov	r7, r0
	ldr	r0, [r4, #324]
	bl	mpp_data_get_pre_val_v2
	cmp	r6, #99
	add	r1, sp, #68
	bgt	.L80
	movs	r2, #0
.L200:
	mov	r0, r4
	bl	set_coef
	ldr	r3, [sp, #68]
	cmp	r3, #1024
	itt	gt
	movgt	r3, #1024
	strgt	r3, [sp, #68]
	ldr	r0, [sp, #68]
	cmp	r0, #900
	bge	.L144
	cmp	r0, #306
	ble	.L100
	mvn	r2, #306
	add	r0, r0, r2
	ldr	r3, .L208
	lsls	r0, r0, #9
	umull	r0, r1, r0, r3
	lsrs	r0, r1, #7
	add	r0, r0, #512
.L101:
	cmp	r0, #1024
	it	ge
	movge	r0, #1024
	mov	r10, r0
.L99:
	ldrd	r7, r3, [r4, #372]
	ldr	r6, [r4, #552]
	subs	r3, r3, r7
	str	r3, [sp, #48]
	ldrd	r2, r3, [r4, #396]
	sub	r8, r3, r2
	lsls	r2, r2, #10
	lsls	r3, r7, #10
	str	r3, [sp, #32]
	ldr	r1, [sp, #32]
	mla	r7, r10, r8, r2
	ldr	r3, [sp, #48]
	str	r2, [sp, #36]
	mla	r3, r10, r3, r1
	movs	r1, #100
	asrs	r7, r7, #10
	eor	r2, r7, r7, asr #31
	sub	r2, r2, r7, asr #31
	asrs	r3, r3, #10
	cmp	r3, #100
	mul	lr, r1, r2
	it	lt
	movlt	r3, #100
	lsls	r0, r3, #1
	add	ip, r0, r3
	cmp	lr, ip
	bgt	.L102
.L109:
	subs	r6, r5, #1
	b	.L103
.L80:
	cmp	r6, #199
	bgt	.L82
	cmp	r7, #99
	bgt	.L83
	movs	r2, #102
	b	.L200
.L83:
	movs	r2, #154
.L205:
	add	r1, sp, #68
	b	.L200
.L82:
	cmp	r6, #300
	bge	.L84
	cmp	r7, #99
	ble	.L83
	cmp	r7, #100
	bne	.L85
	cmp	r0, #99
	bgt	.L86
	movs	r2, #205
	b	.L200
.L86:
	cmp	r0, #100
	bne	.L85
	mov	r2, #256
	b	.L200
.L85:
	movw	r2, #307
	b	.L205
.L84:
	cmp	r6, #600
	bge	.L87
	cmp	r7, #99
	bgt	.L88
	cmp	r0, #99
	ble	.L85
	cmp	r0, #100
	bne	.L89
.L91:
	mov	r2, #358
	b	.L205
.L89:
	mov	r2, #410
	b	.L205
.L88:
	cmp	r7, #100
	bne	.L90
	cmp	r0, #99
	ble	.L91
	cmp	r0, #100
	beq	.L89
.L90:
	movw	r2, #461
	b	.L205
.L87:
	cmp	r6, #900
	mov	r3, r1
	bge	.L92
	cmp	r7, #99
	bgt	.L93
	cmp	r0, #99
	ble	.L89
	cmp	r0, #100
	beq	.L90
.L95:
	mov	r2, #512
	mov	r1, r3
	b	.L200
.L93:
	cmp	r7, #100
	bne	.L94
	cmp	r0, #99
	ble	.L95
	cmp	r0, #100
	bne	.L94
	movw	r2, #563
	b	.L200
.L94:
	movw	r2, #614
	b	.L200
.L92:
	movw	r3, #1499
	cmp	r6, r3
	bgt	.L96
	movw	r2, #666
	b	.L200
.L96:
	movw	r3, #1899
	cmp	r6, r3
	ite	le
	movle	r2, #768
	movgt	r2, #900
	b	.L200
.L100:
	movw	r1, #307
	lsls	r0, r0, #9
	bl	__aeabi_idiv
	b	.L101
.L144:
	mov	r10, #1024
	b	.L99
.L102:
	muls	r1, r7, r1
	cmp	ip, r1
	bge	.L104
	cmp	r3, r7
	bgt	.L105
	cmp	r6, #29
	ble	.L202
	subs	r6, r5, #4
.L103:
	ldrd	r9, r3, [r4, #280]
	cmp	r9, r6
	bgt	.L146
	cmp	r6, r3
	it	ge
	movge	r6, r3
.L112:
	cmp	r6, #34
	ldr	r0, [r4, #48]
	ldr	r2, [r4, #56]
	ble	.L113
	add	r0, r0, r2
	ldr	r1, [sp, #16]
	str	r3, [sp, #60]
	add	r0, r0, r0, lsr #31
	asrs	r0, r0, #1
	bl	__aeabi_idiv
	rsbs	r2, r0, #0
	ldr	r0, .L208+4
	smull	r0, r1, r2, r0
	strd	r0, [sp, #16]
	asrs	r0, r2, #31
	ldr	r3, [sp, #20]
	rsb	r0, r0, r3, asr #1
	ldr	r3, [sp, #60]
	cmp	r7, r0, lsl #1
	ble	.L147
	cmp	r7, r0
	ite	le
	movle	r7, #102
	movgt	r7, #51
.L114:
	add	r10, r10, r7
	cmp	r10, #1024
	bge	.L149
	cmp	r6, #35
	it	ne
	movne	r10, #1024
.L115:
	ldr	r2, [sp, #36]
	ldr	r1, [sp, #32]
	mla	r8, r8, r10, r2
	ldr	r2, [sp, #48]
	mla	r10, r2, r10, r1
	movs	r2, #100
	asr	r8, r8, #10
	eor	r6, r8, r8, asr #31
	sub	r6, r6, r8, asr #31
	asr	r10, r10, #10
	cmp	r10, #100
	mul	r7, r2, r6
	it	lt
	movlt	r10, #100
	lsl	r1, r10, #1
	add	r0, r1, r10
	cmp	r7, r0
	ble	.L151
	mul	r2, r2, r8
	cmp	r0, r2
	bge	.L116
	cmp	r8, r10
	blt	.L117
	subs	r6, r5, #3
.L113:
	cmp	r9, r6
	bgt	.L119
	cmp	r3, r6
	it	ge
	movge	r3, r6
	mov	r9, r3
.L119:
	cmp	r9, #36
	bgt	.L120
	cmp	r9, #33
	bgt	.L152
	cmp	r9, #30
	mov	r3, #1
	ite	gt
	movgt	r2, #3
	movle	r2, #4
.L121:
	subs	r3, r5, r3
	cmp	r3, r9
	bgt	.L123
	adds	r3, r5, r2
	cmp	r3, r9
	it	ge
	movge	r3, r9
	b	.L123
.L105:
	cmp	r3, r7, lsl #2
	bgt	.L107
	cmp	r6, #29
	ble	.L203
.L202:
	subs	r6, r5, #3
	b	.L103
.L107:
	movs	r2, #10
	muls	r2, r7, r2
	cmp	r2, r3
	ble	.L109
.L203:
	subs	r6, r5, #2
	b	.L103
.L104:
	cmp	r5, #35
	ite	gt
	movgt	r6, #0
	movle	r6, #1
	cmp	r0, r2
	bgt	.L110
	adds	r3, r5, #2
.L201:
	add	r6, r6, r3
	b	.L103
.L110:
	add	r1, r2, r2, lsl #1
	cmp	r0, r1
	bgt	.L111
	adds	r3, r5, #1
	b	.L201
.L111:
	add	r2, r2, r2, lsl #2
	cmp	r2, r3
	ite	gt
	addgt	r6, r5, #1
	movle	r6, r5
	b	.L103
.L146:
	mov	r6, r9
	b	.L112
.L147:
	movs	r7, #205
	b	.L114
.L149:
	mov	r10, #1024
	b	.L115
.L117:
	cmp	r10, r8, lsl #2
	bgt	.L118
	subs	r6, r5, #2
	b	.L113
.L118:
	movs	r2, #10
	mul	r8, r2, r8
	cmp	r8, r10
	ble	.L151
	subs	r6, r5, #1
	b	.L113
.L116:
	add	r6, r6, r6, lsl #1
	cmp	r6, r1
	ite	lt
	movlt	r6, r5
	addge	r6, r5, #1
	b	.L113
.L151:
	mov	r6, r5
	b	.L113
.L152:
	movs	r2, #2
	mov	r3, r2
	b	.L121
.L155:
	movs	r3, #6
	b	.L124
.L156:
	movs	r3, #5
	b	.L124
.L209:
	.align	2
.L208:
	.word	1340867839
	.word	1717986919
.L126:
	ldr	r2, [sp, #8]
	adds	r2, r3, r2
	cmp	r2, r1
	bgt	.L129
	ldr	r2, [sp, #12]
	cmp	r2, r1
	it	ge
	movge	r2, r1
.L129:
	cmp	r0, #3
	beq	.L130
	str	r2, [r4, #552]
.L128:
	ldr	r2, [r4, #552]
	ldrd	r3, r1, [r4, #280]
	cmp	r2, r3
	blt	.L132
	cmp	r2, r1
	mov	r3, r2
	it	ge
	movge	r3, r1
.L132:
	str	r3, [r4, #552]
	str	r3, [fp, #172]
	movs	r3, #0
	str	r3, [fp, #212]
	ldr	r3, [r4, #260]
	cbnz	r3, .L133
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #28]
	subs	r3, r3, #1
	cmp	r3, r2
	bgt	.L133
	ldr	r3, [r4, #552]
	ldr	r2, [sp, #12]
	cmp	r3, r2
	bne	.L133
	ldr	r3, [r4, #556]
	cmp	r3, r2
	itt	eq
	moveq	r3, #1
	streq	r3, [fp, #212]
.L133:
	ldr	r3, [r4, #96]
	str	r3, [fp, #176]
	ldr	r3, [r4, #100]
	str	r3, [fp, #180]
	ldrd	r3, r2, [r4, #272]
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #272]
	movs	r3, #0
	str	r3, [r4, #580]
	ldr	r3, .L210
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L182
	mov	r3, r4
	mov	r2, #828
	ldr	r1, .L210+4
	ldr	r0, .L210+8
	bl	printk
.L182:
	movs	r0, #0
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L130:
	ldr	r1, [sp, #8]
	subs	r2, r2, #1
	subs	r1, r1, #1
	add	r3, r3, r1
	cmp	r2, r3
	blt	.L131
	ldr	r3, [sp, #12]
	cmp	r3, r2
	it	ge
	movge	r3, r2
	b	.L131
.L120:
	cmp	r9, #41
	mov	r2, #1
	ite	lt
	movlt	r3, #3
	movge	r3, #4
	b	.L121
.L211:
	.align	2
.L210:
	.word	rc_debug
	.word	.LANCHOR0+441
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_start, .-rc_model_v2_smt_start
	.align	1
	.global	rc_model_v2_smt_proc_show
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_proc_show, %function
rc_model_v2_smt_proc_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	.pad #44
	sub	sp, sp, #44
	ldr	r1, .L223
	mov	r5, r0
	mov	r6, r2
	bl	seq_puts
	ldr	r3, .L223+4
	ldr	r2, .L223+8
	mov	r0, r5
	ldr	r1, .L223+12
	ldr	r7, .L223+16
	str	r3, [sp, #28]
	ldr	r3, .L223+20
	str	r3, [sp, #24]
	ldr	r3, .L223+24
	str	r3, [sp, #20]
	ldr	r3, .L223+28
	str	r3, [sp, #16]
	ldr	r3, .L223+32
	str	r3, [sp, #12]
	ldr	r3, .L223+36
	str	r3, [sp, #8]
	ldr	r3, .L223+40
	str	r3, [sp, #4]
	ldr	r3, .L223+44
	str	r3, [sp]
	ldr	r3, .L223+48
	bl	seq_printf
	ldr	r9, [r4, #8]
	ldr	r8, [r4, #60]
	cmp	r9, #2
	bne	.L213
	ldrd	r0, r1, [r4, #16]
	bl	__aeabi_idiv
	ldr	r10, [r4, #40]
	mov	fp, r0
	ldrd	r0, r1, [r4, #28]
	bl	__aeabi_idiv
	str	r0, [sp, #36]
	mov	r0, r9
	bl	strof_rc_mode
	ldr	r2, [r4, #92]
	ldr	r1, .L223+52
	ldr	r3, [sp, #36]
	strd	r2, r2, [sp, #24]
	mov	r2, r6
	strd	r7, r7, [sp, #16]
	strd	fp, r3, [sp, #4]
	mov	r3, r10
	str	r0, [sp, #12]
	str	r8, [sp]
.L220:
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L223+56
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L223+60
	mov	r0, r5
	ldr	r2, .L223+8
	ldr	r1, .L223+64
	str	r3, [sp, #8]
	ldr	r3, .L223+68
	str	r3, [sp, #4]
	ldr	r3, .L223+72
	str	r3, [sp]
	ldr	r3, .L223+76
	bl	seq_printf
	ldr	r0, [r4, #36]
	cmp	r0, #1
	bne	.L215
	bl	strof_gop_mode
	ldr	r3, [r4, #112]
	ldr	r2, [r4, #44]
	ldr	r1, .L223+80
	strd	r3, r2, [sp]
	mov	r2, r6
	str	r3, [sp, #8]
	mov	r3, r0
.L221:
	mov	r0, r5
	bl	seq_printf
	ldr	r3, [r4, #8]
	cmp	r3, #0
	bne	.L217
	ldr	r1, .L223+84
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L223+88
	ldr	r2, .L223+8
	mov	r0, r5
	ldr	r1, .L223+92
	str	r3, [sp, #28]
	ldr	r3, .L223+96
	str	r3, [sp, #24]
	ldr	r3, .L223+100
	str	r3, [sp, #20]
	ldr	r3, .L223+104
	str	r3, [sp, #16]
	ldr	r3, .L223+108
	str	r3, [sp, #12]
	ldr	r3, .L223+112
	str	r3, [sp, #8]
	ldr	r3, .L223+116
	str	r3, [sp, #4]
	ldr	r3, .L223+120
	str	r3, [sp]
	ldr	r3, .L223+124
	bl	seq_printf
	ldr	r3, [r4, #156]
	mov	r2, r6
	ldr	r1, .L223+128
	mov	r0, r5
	str	r3, [sp, #28]
	ldr	r3, [r4, #124]
	str	r3, [sp, #24]
	ldr	r3, [r4, #132]
	str	r3, [sp, #20]
	ldr	r3, [r4, #120]
	str	r3, [sp, #16]
	ldr	r3, [r4, #128]
	str	r3, [sp, #12]
	ldr	r3, [r4, #108]
	str	r3, [sp, #8]
	ldr	r3, [r4, #104]
	str	r3, [sp, #4]
	ldr	r3, [r4, #100]
	str	r3, [sp]
	ldr	r3, [r4, #96]
	bl	seq_printf
.L217:
	ldr	r1, .L223+132
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L223+136
	ldr	r2, .L223+8
	mov	r0, r5
	ldr	r1, .L223+140
	str	r3, [sp, #28]
	ldr	r3, .L223+144
	str	r3, [sp, #24]
	ldr	r3, .L223+148
	str	r3, [sp, #20]
	ldr	r3, .L223+152
	str	r3, [sp, #16]
	ldr	r3, .L223+156
	str	r3, [sp, #12]
	ldr	r3, .L223+160
	str	r3, [sp, #8]
	ldr	r3, .L223+164
	str	r3, [sp, #4]
	ldr	r3, .L223+168
	str	r3, [sp]
	ldr	r3, .L223+172
	bl	seq_printf
	ldr	r0, [r4, #212]
	bl	strof_bool
	ldr	r3, [r4, #228]
	mov	r2, r6
	ldr	r1, .L223+176
	str	r3, [sp, #28]
	ldr	r3, [r4, #224]
	str	r3, [sp, #24]
	ldr	r3, [r4, #220]
	str	r3, [sp, #20]
	ldr	r3, [r4, #216]
	str	r3, [sp, #16]
	ldr	r3, [r4, #244]
	str	r3, [sp, #12]
	ldr	r3, [r4, #240]
	str	r3, [sp, #8]
	ldr	r3, [r4, #236]
	str	r3, [sp, #4]
	ldr	r3, [r4, #232]
	str	r3, [sp]
	mov	r3, r0
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L223+180
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L223+184
	mov	r0, r5
	ldr	r2, .L223+8
	ldr	r1, .L223+188
	str	r3, [sp, #4]
	ldr	r3, .L223+192
	str	r3, [sp]
	ldr	r3, .L223+172
	bl	seq_printf
	ldr	r8, [r4, #204]
	mov	r0, r8
	cmp	r8, #0
	beq	.L218
	bl	strof_bool
	movs	r3, #0
	ldr	r1, .L223+196
	mov	r2, r6
	str	r3, [sp, #4]
	ldr	r3, [r4, #208]
	str	r3, [sp]
	mov	r3, r0
.L222:
	mov	r0, r5
	bl	seq_printf
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L213:
	ldr	r3, [r4, #56]
	ldr	r0, .L223+200
	strd	r7, r7, [sp, #24]
	smull	r10, fp, r3, r0
	asrs	r3, r3, #31
	rsb	r3, r3, fp, asr #6
	str	r3, [sp, #20]
	ldr	r3, [r4, #48]
	smull	r0, r1, r3, r0
	asrs	r3, r3, #31
	rsb	r3, r3, r1, asr #6
	str	r3, [sp, #16]
	ldr	r3, .L223+204
	ldrd	r0, r1, [r4, #28]
	str	r3, [sp, #12]
	bl	__aeabi_idiv
	str	r0, [sp, #8]
	ldrd	r0, r1, [r4, #16]
	bl	__aeabi_idiv
	ldr	r3, [r4, #40]
	mov	r2, r6
	ldr	r1, .L223+208
	strd	r8, r0, [sp]
	b	.L220
.L215:
	bl	strof_gop_mode
	ldr	r3, [r4, #112]
	mov	r2, r6
	ldr	r1, .L223+212
	str	r3, [sp]
	mov	r3, r0
	strd	r7, r7, [sp, #4]
	b	.L221
.L218:
	bl	strof_bool
	mov	r2, r6
	ldr	r1, .L223+216
	strd	r7, r8, [sp]
	mov	r3, r0
	b	.L222
.L224:
	.align	2
.L223:
	.word	.LC4
	.word	.LC8
	.word	.LC6
	.word	.LC7
	.word	.LC17
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC5
	.word	.LC16
	.word	.LC20
	.word	.LC23
	.word	.LC22
	.word	.LC24
	.word	.LC25
	.word	.LC21
	.word	.LC26
	.word	.LC28
	.word	.LC31
	.word	.LC30
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC29
	.word	.LC39
	.word	.LC40
	.word	.LC43
	.word	.LC42
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC41
	.word	.LC51
	.word	.LC52
	.word	.LC54
	.word	.LC53
	.word	.LC55
	.word	.LC56
	.word	274877907
	.word	.LC19
	.word	.LC18
	.word	.LC27
	.word	.LC57
	.fnend
	.size	rc_model_v2_smt_proc_show, .-rc_model_v2_smt_proc_show
	.align	1
	.global	rc_model_v2_smt_hal_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_hal_start, %function
rc_model_v2_smt_hal_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	mov	r3, r0
	ldr	r2, .L230
	ldr	r2, [r2]
	lsls	r2, r2, #31
	bpl	.L226
	str	r1, [sp]
	movw	r2, #1018
	ldr	r1, .L230+4
	ldr	r0, .L230+8
	bl	printk
.L226:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L231:
	.align	2
.L230:
	.word	rc_debug
	.word	.LANCHOR0+463
	.word	.LC58
	.fnend
	.size	rc_model_v2_smt_hal_start, .-rc_model_v2_smt_hal_start
	.align	1
	.global	rc_model_v2_smt_hal_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_hal_end, %function
rc_model_v2_smt_hal_end:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r5, .L239
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bpl	.L234
	mov	r3, r0
	str	r1, [sp]
	mov	r2, #1024
	ldr	r1, .L239+4
	ldr	r0, .L239+8
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L234
	mov	r3, r4
	movw	r2, #1025
	ldr	r1, .L239+4
	ldr	r0, .L239+12
	bl	printk
.L234:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L240:
	.align	2
.L239:
	.word	rc_debug
	.word	.LANCHOR0+489
	.word	.LC59
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_hal_end, .-rc_model_v2_smt_hal_end
	.align	1
	.global	bits_model_smt_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_smt_deinit, %function
bits_model_smt_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, .L266
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L242
	mov	r3, r0
	movs	r2, #80
	ldr	r1, .L266+4
	ldr	r0, .L266+8
	bl	printk
.L242:
	ldr	r0, [r4, #320]
	cbz	r0, .L243
	bl	mpp_data_deinit
	movs	r3, #0
	str	r3, [r4, #320]
.L243:
	ldr	r0, [r4, #324]
	cbz	r0, .L244
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #324]
.L244:
	ldr	r0, [r4, #328]
	cbz	r0, .L245
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #328]
.L245:
	ldr	r0, [r4, #332]
	cbz	r0, .L246
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #332]
.L246:
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L247
	mov	r3, r4
	movs	r2, #102
	ldr	r1, .L266+4
	ldr	r0, .L266+12
	bl	printk
.L247:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L267:
	.align	2
.L266:
	.word	rc_debug
	.word	.LANCHOR0+513
	.word	.LC1
	.word	.LC3
	.fnend
	.size	bits_model_smt_deinit, .-bits_model_smt_deinit
	.align	1
	.global	rc_model_v2_smt_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_deinit, %function
rc_model_v2_smt_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, .L277
	ldr	r2, [r4]
	lsls	r2, r2, #31
	bpl	.L269
	mov	r3, r0
	movw	r2, #271
	ldr	r1, .L277+4
	ldr	r0, .L277+8
	bl	printk
.L269:
	mov	r0, r5
	bl	bits_model_smt_deinit
	ldr	r3, [r4]
	lsls	r3, r3, #31
	bpl	.L270
	mov	r3, r5
	movw	r2, #273
	ldr	r1, .L277+4
	ldr	r0, .L277+12
	bl	printk
.L270:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L278:
	.align	2
.L277:
	.word	rc_debug
	.word	.LANCHOR0+535
	.word	.LC1
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_deinit, .-rc_model_v2_smt_deinit
	.align	1
	.global	bits_model_smt_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_smt_init, %function
bits_model_smt_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r7, .L313
	.pad #44
	sub	sp, sp, #44
	ldr	r5, [r0, #40]
	add	r6, sp, #20
	ldrd	r8, r9, [r4, #28]
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	mov	r1, r9
	ldr	r3, [r7]
	mov	r0, r8
	str	r3, [r6]
	bl	__aeabi_idiv
	mov	r1, r9
	mov	r6, r0
	ldr	r0, [r4, #60]
	mul	r0, r0, r8
	bl	__aeabi_idiv
	ldr	r3, .L313+4
	ldr	r2, [r3]
	subs	r8, r0, #0
	str	r3, [sp, #12]
	it	eq
	moveq	r8, #8
	tst	r2, #1
	beq	.L281
	mov	r3, r4
	movs	r2, #119
	adds	r1, r7, #4
	ldr	r0, .L313+8
	bl	printk
.L281:
	ldr	r0, [r4, #324]
	movs	r3, #0
	movs	r2, #0
	movs	r1, #10
	strd	r2, [r4, #272]
	movs	r3, #1
	str	r5, [r4, #404]
	str	r3, [r4, #268]
	movs	r3, #0
	strd	r3, r3, [r4, #568]
	movs	r3, #51
	strd	r1, r3, [r4, #280]
	cbz	r0, .L282
	bl	mpp_data_deinit_v2
.L282:
	movs	r2, #0
	movs	r1, #10
	add	r0, r4, #324
	bl	mpp_data_init_v2
	ldr	r0, [r4, #328]
	cbz	r0, .L283
	bl	mpp_data_deinit_v2
.L283:
	movs	r2, #0
	movs	r1, #10
	add	r0, r4, #328
	bl	mpp_data_init_v2
	ldr	r0, [r4, #332]
	cbz	r0, .L284
	bl	mpp_data_deinit_v2
.L284:
	add	fp, r4, #336
	mov	r1, r8
	ldr	r2, [r4, #392]
	add	r10, r4, #408
	add	r0, r4, #332
	add	r9, r4, #444
	bl	mpp_data_init_v2
	mov	r0, fp
	bl	mpp_pid_reset
	add	r8, r4, #480
	mov	r0, r10
	movs	r7, #100
	bl	mpp_pid_reset
	mov	r0, r9
	bl	mpp_pid_reset
	mov	r0, r8
	bl	mpp_pid_reset
	add	r3, r4, #516
	mov	r0, r3
	str	r3, [sp, #8]
	bl	mpp_pid_reset
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	mov	r0, fp
	str	r7, [sp]
	str	r6, [sp, #4]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	mov	r0, r10
	strd	r7, r6, [sp]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	mov	r0, r9
	strd	r7, r6, [sp]
	bl	mpp_pid_set_param
	mov	r0, r8
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	strd	r7, r6, [sp]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	strd	r7, r6, [sp]
	ldr	r0, [sp, #8]
	bl	mpp_pid_set_param
	ldrd	r2, r1, [r4, #28]
	ldr	r0, [r4, #48]
	bl	axb_div_c
	ldrd	r2, r1, [r4, #28]
	mov	r7, r0
	ldr	r0, [r4, #56]
	bl	axb_div_c
	movs	r3, #0
	movs	r2, #0
	strd	r2, [r4, #296]
	strd	r2, [r4, #304]
	movs	r3, #0
	str	r3, [r4, #312]
	mov	r8, r0
	cbnz	r5, .L285
	movs	r3, #10
	str	r7, [r4, #384]
	muls	r7, r3, r7
	str	r5, [r4, #288]
	muls	r3, r0, r3
	str	r0, [r4, #392]
	str	r7, [r4, #380]
	str	r3, [r4, #388]
.L286:
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L290
	mov	r3, r4
	movs	r2, #192
	ldr	r1, .L313+12
	ldr	r0, .L313+16
	bl	printk
.L290:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L285:
	cmp	r5, #1
	bne	.L287
	ldr	r2, [r4, #204]
	str	r5, [r4, #288]
	strd	r7, r3, [r4, #380]
	strd	r0, r3, [r4, #388]
	cmp	r2, #0
	beq	.L286
	str	r3, [r4, #204]
	b	.L286
.L287:
	cmp	r5, r6
	bge	.L288
	asrs	r7, r7, #1
	adds	r5, r5, #1
	asrs	r0, r0, #1
	str	r7, [r4, #384]
	str	r0, [r4, #392]
	movs	r3, #2
	muls	r7, r5, r7
	str	r3, [r4, #288]
	muls	r0, r5, r0
	str	r7, [r4, #380]
	str	r0, [r4, #388]
	b	.L286
.L288:
	cmp	r5, #50
	ble	.L289
	cmp	r5, #100
	ble	.L292
	cmp	r5, #200
	ble	.L293
	cmp	r5, #300
	ite	le
	movle	r3, #3
	movgt	r3, #4
.L289:
	movs	r2, #3
	str	r2, [r4, #288]
	add	r2, sp, #40
	rsb	r6, r6, #1
	add	r3, r2, r3, lsl #2
	mov	r1, r6
	ldr	r5, [r3, #-20]
	mul	r0, r7, r5
	mul	r5, r8, r5
	add	r0, r0, r0, lsr #31
	add	r5, r5, r5, lsr #31
	asrs	r0, r0, #1
	str	r0, [r4, #380]
	asrs	r5, r5, #1
	str	r5, [r4, #388]
	bl	__aeabi_idiv
	mov	r1, r6
	add	r0, r0, r7
	str	r0, [r4, #384]
	mov	r0, r5
	bl	__aeabi_idiv
	add	r0, r0, r8
	str	r0, [r4, #392]
	b	.L286
.L292:
	movs	r3, #1
	b	.L289
.L293:
	movs	r3, #2
	b	.L289
.L314:
	.align	2
.L313:
	.word	.LANCHOR0+560
	.word	rc_debug
	.word	.LC1
	.word	.LANCHOR0+580
	.word	.LC3
	.fnend
	.size	bits_model_smt_init, .-bits_model_smt_init
	.align	1
	.global	rc_model_v2_smt_h265_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_h265_init, %function
rc_model_v2_smt_h265_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L324
	mov	r6, r1
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L316
	mov	r3, r0
	movs	r2, #246
	ldr	r1, .L324+4
	ldr	r0, .L324+8
	bl	printk
.L316:
	mov	r2, #260
	mov	r1, r6
	mov	r0, r4
	bl	memcpy
	mov	r0, r4
	bl	bits_model_smt_init
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L317
	mov	r3, r4
	movs	r2, #251
	ldr	r1, .L324+4
	ldr	r0, .L324+12
	bl	printk
.L317:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L325:
	.align	2
.L324:
	.word	rc_debug
	.word	.LANCHOR0+600
	.word	.LC1
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_h265_init, .-rc_model_v2_smt_h265_init
	.align	1
	.global	rc_model_v2_smt_h264_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_h264_init, %function
rc_model_v2_smt_h264_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L335
	mov	r6, r1
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L327
	mov	r3, r0
	movw	r2, #259
	ldr	r1, .L335+4
	ldr	r0, .L335+8
	bl	printk
.L327:
	mov	r2, #260
	mov	r1, r6
	mov	r0, r4
	bl	memcpy
	mov	r0, r4
	bl	bits_model_smt_init
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L328
	mov	r3, r4
	mov	r2, #264
	ldr	r1, .L335+4
	ldr	r0, .L335+12
	bl	printk
.L328:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L336:
	.align	2
.L335:
	.word	rc_debug
	.word	.LANCHOR0+626
	.word	.LC1
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_h264_init, .-rc_model_v2_smt_h264_init
	.global	__aeabi_idivmod
	.align	1
	.global	bits_model_update_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_update_smt, %function
bits_model_update_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, .L353
	mov	r5, r1
	ldr	r3, [r6]
	lsls	r2, r3, #31
	bpl	.L338
	mov	r3, r0
	movs	r2, #203
	ldr	r1, .L353+4
	ldr	r0, .L353+8
	bl	printk
.L338:
	mov	r1, r5
	ldr	r0, [r4, #332]
	bl	mpp_data_update_v2
	ldr	r1, [r4, #372]
	subs	r3, r1, r5
	str	r3, [r4, #396]
	ldr	r3, [r4, #376]
	subs	r1, r5, r1
	subs	r3, r3, r5
	str	r3, [r4, #400]
	ldr	r3, [r4, #260]
	cmp	r3, #2
	bne	.L339
	ldrd	r3, r2, [r4, #296]
	add	r0, r4, #408
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #296]
	bl	mpp_pid_update
	ldr	r1, [r4, #376]
	add	r0, r4, #444
	subs	r1, r5, r1
.L351:
	bl	mpp_pid_update
	ldr	r3, [r4, #312]
	ldr	r0, [r4, #296]
	add	r5, r5, r3
	ldr	r3, [r4, #304]
	str	r5, [r4, #312]
	ldr	r1, [r4, #28]
	add	r0, r0, r3
	bl	__aeabi_idivmod
	cbnz	r1, .L341
	ldr	r3, [r4, #48]
	add	r0, r4, #336
	ldr	r2, [r4, #56]
	adds	r1, r3, r2
	asrs	r1, r1, #1
	add	r7, r1, r1, lsl #1
	cmp	r7, r5, lsl #1
	ble	.L342
.L352:
	subs	r1, r1, r5
	bl	mpp_pid_update
	movs	r3, #0
	str	r3, [r4, #312]
.L341:
	ldr	r3, [r4, #552]
	str	r3, [r4, #556]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L344
	mov	r3, r4
	movs	r2, #237
	ldr	r1, .L353+4
	ldr	r0, .L353+12
	bl	printk
.L344:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L339:
	ldrd	r3, r2, [r4, #304]
	add	r0, r4, #480
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #304]
	bl	mpp_pid_update
	ldr	r1, [r4, #376]
	add	r0, r4, #516
	subs	r1, r5, r1
	b	.L351
.L342:
	movs	r1, #6
	ldr	r7, .L353+16
	muls	r1, r2, r1
	lsls	r3, r3, #2
	smull	r10, fp, r3, r7
	asrs	r3, r3, #31
	smull	r8, r9, r1, r7
	asrs	r1, r1, #31
	rsb	r3, r3, fp, asr #2
	rsb	r1, r1, r9, asr #2
	add	r1, r1, r3
	b	.L352
.L354:
	.align	2
.L353:
	.word	rc_debug
	.word	.LANCHOR0+652
	.word	.LC1
	.word	.LC3
	.word	1717986919
	.fnend
	.size	bits_model_update_smt, .-bits_model_update_smt
	.align	1
	.global	rc_model_v2_smt_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_end, %function
rc_model_v2_smt_end:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r0
	ldr	r6, .L378
	mov	r5, r1
	ldr	r7, [r1, #184]
	ldr	r3, [r6]
	lsls	r0, r3, #31
	bpl	.L356
	add	r3, r1, #160
	movw	r2, #990
	str	r3, [sp]
	mov	r3, r4
	ldr	r1, .L378+4
	ldr	r0, .L378+8
	bl	printk
.L356:
	ldr	r3, [r6]
	lsls	r1, r3, #25
	bpl	.L357
	ldr	r3, [r5, #208]
	movw	r2, #991
	ldr	r1, .L378+4
	ldr	r0, .L378+12
	str	r3, [sp]
	ldr	r3, [r5, #204]
	bl	printk
.L357:
	ldr	r1, [r5, #204]
	ldr	r0, [r4, #324]
	bl	mpp_data_update_v2
	ldr	r1, [r5, #208]
	ldr	r0, [r4, #328]
	bl	mpp_data_update_v2
	movs	r3, #0
	str	r3, [r4, #268]
	ldr	r3, [r4, #260]
	cbz	r3, .L358
	ldr	r3, [r4, #288]
	cmp	r3, #1
	bne	.L359
.L358:
	ldr	r1, [r4, #552]
	ldr	r0, [r4, #320]
	bl	mpp_data_update
.L360:
	ldr	r3, [r6]
	lsls	r2, r3, #25
	bpl	.L361
	mov	r3, r7
	mov	r2, #1004
	ldr	r1, .L378+4
	ldr	r0, .L378+16
	bl	printk
.L361:
	mov	r1, r7
	mov	r0, r4
	bl	bits_model_update_smt
	ldr	r1, [r4, #552]
	ldr	r3, [r4, #260]
	ldr	r2, [r4, #572]
	str	r1, [r4, #556]
	str	r3, [r4, #264]
	adds	r2, r2, #1
	ldr	r3, [r5, #200]
	str	r2, [r4, #572]
	str	r3, [r4, #576]
	ldr	r3, [r4, #568]
	add	r3, r3, r1
	str	r3, [r4, #568]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L362
	mov	r3, r4
	mov	r2, #1012
	ldr	r1, .L378+4
	ldr	r0, .L378+20
	bl	printk
.L362:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L359:
	ldr	r3, [r4, #552]
	strd	r7, r3, [r4, #560]
	b	.L360
.L379:
	.align	2
.L378:
	.word	rc_debug
	.word	.LANCHOR0+674
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC3
	.fnend
	.size	rc_model_v2_smt_end, .-rc_model_v2_smt_end
	.align	1
	.global	check_super_frame_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_super_frame_smt, %function
check_super_frame_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r6, .L398
	mov	r7, r1
	ldr	r8, [r0, #260]
	ldr	r3, [r6]
	lsls	r0, r3, #31
	bpl	.L381
	mov	r3, r5
	mov	r2, #840
	ldr	r1, .L398+4
	ldr	r0, .L398+8
	bl	printk
.L381:
	ldr	r4, [r5, #188]
	cbz	r4, .L382
	cmp	r8, #2
	ldr	r3, [r5, #196]
	ldr	r2, [r7, #24]
	it	eq
	ldreq	r3, [r5, #192]
	cmp	r2, r3
	bcc	.L387
	cmp	r4, #1
	bne	.L388
	ldr	r3, [r6]
	lsls	r1, r3, #25
	bpl	.L384
	mov	r2, #848
	ldr	r1, .L398+4
	ldr	r0, .L398+12
	bl	printk
.L384:
	movs	r3, #1
	str	r3, [r5, #176]
	movs	r3, #0
	str	r3, [r5, #184]
.L388:
	mov	r4, #-1
	b	.L382
.L387:
	movs	r4, #0
.L382:
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L380
	mov	r3, r5
	movw	r2, #855
	ldr	r1, .L398+4
	ldr	r0, .L398+16
	bl	printk
.L380:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
.L399:
	.align	2
.L398:
	.word	rc_debug
	.word	.LANCHOR0+694
	.word	.LC1
	.word	.LC63
	.word	.LC3
	.fnend
	.size	check_super_frame_smt, .-check_super_frame_smt
	.align	1
	.global	check_re_enc_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_re_enc_smt, %function
check_re_enc_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r4, r0
	ldr	r5, [r0, #60]
	mov	r7, r1
	ldr	r10, [r0, #260]
	ldr	r0, [r0, #332]
	bl	mpp_data_sum_v2
	mov	r1, r5
	bl	__aeabi_idiv
	mov	r1, #-1
	mul	r6, r0, r5
	mov	r8, r0
	ldr	r0, [r4, #332]
	bl	mpp_data_get_pre_val_v2
	ldr	r3, [r7, #24]
	mov	r1, r5
	subs	r0, r3, r0
	add	r0, r0, r6
	bl	__aeabi_idiv
	ldr	r3, .L439
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #1
	mov	r6, r0
	beq	.L401
	mov	r3, r4
	movw	r2, #871
	ldr	r1, .L439+4
	ldr	r0, .L439+8
	bl	printk
.L401:
	ldr	r3, [r9]
	lsls	r0, r3, #25
	bpl	.L402
	strd	r8, r6, [sp]
	movw	r2, #873
	ldr	r3, [r4, #52]
	ldr	r1, .L439+4
	ldr	r0, .L439+12
	bl	printk
.L402:
	ldr	r2, [r4, #580]
	ldr	r3, [r4, #156]
	cmp	r2, r3
	blt	.L403
.L405:
	movs	r5, #0
.L400:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L403:
	ldr	r3, [r4, #248]
	cmp	r3, #0
	bne	.L405
	mov	r1, r7
	mov	r0, r4
	bl	check_super_frame_smt
	mov	r5, r0
	cmp	r0, #0
	bne	.L413
	ldr	r3, [r4, #204]
	cbz	r3, .L406
	ldr	r3, [r4, #268]
	cmp	r3, #0
	beq	.L405
.L406:
	ldr	r3, [r9]
	lsls	r1, r3, #22
	bpl	.L407
	str	r10, [sp]
	movw	r2, #887
	ldr	r3, [r4, #176]
	ldr	r1, .L439+4
	ldr	r0, .L439+16
	bl	printk
.L407:
	ldr	r3, [r4, #176]
	ldr	r2, [r9]
	cbz	r3, .L408
	cmp	r10, #0
	bne	.L408
	ldr	r0, [r4, #180]
	lsls	r2, r2, #22
	add	r1, r0, #100
	ldr	r0, [r4, #56]
	mul	r0, r0, r1
	ldr	r1, .L439+20
	umull	r0, r1, r0, r1
	lsr	r5, r1, #5
	bpl	.L409
	ldr	r2, [r4, #52]
	strd	r5, r6, [sp, #4]
	ldr	r1, .L439+4
	str	r2, [sp]
	movw	r2, #891
	ldr	r0, .L439+24
	bl	printk
.L409:
	cmp	r6, r5
	mov	r5, #-1
	it	le
	movle	r5, #0
	b	.L400
.L408:
	cmp	r10, #0
	beq	.L410
	cmp	r10, #2
	bne	.L414
	ldr	r3, [r7, #4]
	add	r3, r3, r3, lsl #1
	add	r3, r3, r3, lsr #31
	asrs	r3, r3, #1
.L411:
	ldr	r1, [r7, #24]
	cmp	r1, r3
	ble	.L412
	ldr	r3, [r4, #56]
	sub	r1, r3, r3, asr #3
	cmp	r1, r6
	bge	.L412
	ldr	r0, .L439+28
	asrs	r5, r3, #31
	sub	r6, r6, r8
	smull	r0, r1, r3, r0
	rsb	r5, r5, r1, asr #3
	cmp	r5, r6
	mov	r5, #-1
	it	ge
	movge	r5, #0
.L412:
	lsls	r3, r2, #31
	bpl	.L400
	str	r5, [sp]
	mov	r3, r4
	mov	r2, #912
	ldr	r1, .L439+4
	ldr	r0, .L439+32
	bl	printk
	b	.L400
.L410:
	ldr	r3, [r7, #4]
	add	r3, r3, r3, lsl #1
	b	.L411
.L414:
	movs	r3, #0
	b	.L411
.L413:
	mov	r5, #-1
	b	.L400
.L440:
	.align	2
.L439:
	.word	rc_debug
	.word	.LANCHOR0+716
	.word	.LC1
	.word	.LC64
	.word	.LC65
	.word	1374389535
	.word	.LC66
	.word	1717986919
	.word	.LC67
	.fnend
	.size	check_re_enc_smt, .-check_re_enc_smt
	.align	1
	.global	rc_model_v2_smt_check_reenc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_check_reenc, %function
rc_model_v2_smt_check_reenc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r5, r1
	ldr	r7, .L483
	add	r6, r1, #160
	mov	r4, r0
	ldr	r3, [r7]
	lsls	r1, r3, #31
	bpl	.L442
	mov	r3, r0
	str	r6, [sp]
	movw	r2, #923
	ldr	r1, .L483+4
	ldr	r0, .L483+8
	bl	printk
.L442:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bfc	r3, #2, #1
	strb	r3, [r5, #156]
	ldr	r3, [r4, #8]
	cmp	r3, #2
	beq	.L444
	ldr	r3, [r5, #264]
	lsls	r2, r3, #31
	bmi	.L444
	ldr	r3, [r4, #588]
	cmp	r3, #0
	bne	.L444
	ldr	r3, [r4, #592]
	cmp	r3, #0
	bne	.L444
	mov	r1, r6
	mov	r0, r4
	bl	check_re_enc_smt
	cmp	r0, #0
	beq	.L444
	ldrb	r3, [r5, #152]	@ zero_extendqisi2
	ldr	r6, [r4, #176]
	tst	r3, #16
	ldr	r3, [r4, #184]
	it	ne
	movne	r6, #0
	cbz	r3, .L447
	ldr	r2, [r4, #584]
	cmp	r3, r2
	it	ls
	movls	r6, #0
.L447:
	ldr	r3, [r7]
	lsls	r3, r3, #22
	bpl	.L448
	ldr	r3, [r4, #584]
	movw	r2, #941
	ldr	r1, .L483+4
	ldr	r0, .L483+12
	str	r3, [sp]
	mov	r3, r6
	bl	printk
.L448:
	ldr	r1, [r7]
	cmp	r6, #1
	and	r1, r1, #512
	beq	.L449
	cmp	r6, #2
	beq	.L450
	ldr	r3, [r4, #260]
	ldr	r0, [r4, #196]
	cmp	r3, #2
	ldr	r6, [r5, #184]
	ldr	r3, [r5, #172]
	it	eq
	ldreq	r0, [r4, #192]
	lsls	r2, r0, #1
	cmp	r6, r2
	ble	.L453
	adds	r3, r3, #3
.L481:
	str	r3, [r5, #172]
.L454:
	ldrd	r2, r3, [r5, #172]
	cmp	r2, r3
	bge	.L456
	ldr	r3, [r4, #580]
	adds	r3, r3, #1
	str	r3, [r4, #580]
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r5, #156]
.L456:
	movs	r3, #0
	str	r3, [r4, #584]
	cbz	r1, .L444
	mov	r2, #976
	ldr	r1, .L483+4
	ldr	r0, .L483+16
	b	.L482
.L449:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bic	r3, r3, #5
	orr	r3, r3, #5
	strb	r3, [r5, #156]
	ldr	r3, [r4, #584]
	str	r6, [r4, #588]
	adds	r3, r3, #1
	str	r3, [r4, #584]
	cbz	r1, .L444
	ldr	r1, .L483+4
	movw	r2, #949
	ldr	r0, .L483+20
.L482:
	bl	printk
.L444:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L450:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bic	r3, r3, #20
	orr	r3, r3, #20
	strb	r3, [r5, #156]
	movs	r3, #1
	str	r3, [r4, #592]
	ldr	r3, [r4, #584]
	adds	r3, r3, #1
	str	r3, [r4, #584]
	cmp	r1, #0
	beq	.L444
	mov	r2, #956
	ldr	r1, .L483+4
	ldr	r0, .L483+24
	b	.L482
.L453:
	add	r2, r2, r0
	add	r2, r2, r2, lsr #31
	cmp	r6, r2, asr #1
	ble	.L455
	adds	r3, r3, #2
	b	.L481
.L455:
	cmp	r6, r0
	ble	.L454
	adds	r3, r3, #1
	b	.L481
.L484:
	.align	2
.L483:
	.word	rc_debug
	.word	.LANCHOR0+733
	.word	.LC60
	.word	.LC68
	.word	.LC71
	.word	.LC69
	.word	.LC70
	.fnend
	.size	rc_model_v2_smt_check_reenc, .-rc_model_v2_smt_check_reenc
	.global	smt_h265e
	.global	smt_h264e
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mb_num, %object
	.size	mb_num, 36
mb_num:
	.word	0
	.word	200
	.word	700
	.word	1200
	.word	2000
	.word	4000
	.word	8000
	.word	16000
	.word	20000
	.type	qscale2qp, %object
	.size	qscale2qp, 96
qscale2qp:
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	16
	.byte	18
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	29
	.byte	30
	.byte	30
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	33
	.byte	33
	.byte	34
	.byte	34
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.byte	38
	.byte	38
	.byte	38
	.byte	38
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	40
	.byte	40
	.byte	40
	.byte	40
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.type	tab_bit, %object
	.size	tab_bit, 36
tab_bit:
	.word	3780
	.word	3570
	.word	3150
	.word	2940
	.word	2730
	.word	3780
	.word	2100
	.word	1680
	.word	2100
	.type	__func__.25716, %object
	.size	__func__.25716, 21
__func__.25716:
	.ascii	"calc_smt_debreath_qp\000"
	.type	strength_map.25715, %object
	.size	strength_map.25715, 36
strength_map.25715:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	10
	.byte	11
	.byte	11
	.byte	11
	.byte	12
	.byte	12
	.byte	12
	.type	intra_qp_map.25713, %object
	.size	intra_qp_map.25713, 8
intra_qp_map.25713:
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.type	inter_pqp0, %object
	.size	inter_pqp0, 52
inter_pqp0:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	21
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	26
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	29
	.byte	29
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	33
	.byte	34
	.byte	35
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.type	inter_pqp1, %object
	.size	inter_pqp1, 52
inter_pqp1:
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	29
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	42
	.byte	42
	.byte	43
	.byte	43
	.byte	44
	.type	intra_pqp0, %object
	.size	intra_pqp0, 52
intra_pqp0:
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	34
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.type	intra_pqp1, %object
	.size	intra_pqp1, 52
intra_pqp1:
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	45
	.byte	46
	.byte	47
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.type	__func__.25910, %object
	.size	__func__.25910, 22
__func__.25910:
	.ascii	"rc_model_v2_smt_start\000"
	.type	__func__.25965, %object
	.size	__func__.25965, 26
__func__.25965:
	.ascii	"rc_model_v2_smt_hal_start\000"
	.type	__func__.25970, %object
	.size	__func__.25970, 24
__func__.25970:
	.ascii	"rc_model_v2_smt_hal_end\000"
	.type	__func__.25637, %object
	.size	__func__.25637, 22
__func__.25637:
	.ascii	"bits_model_smt_deinit\000"
	.type	__func__.25677, %object
	.size	__func__.25677, 23
__func__.25677:
	.ascii	"rc_model_v2_smt_deinit\000"
	.space	2
.LC0:
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.type	__func__.25650, %object
	.size	__func__.25650, 20
__func__.25650:
	.ascii	"bits_model_smt_init\000"
	.type	__func__.25666, %object
	.size	__func__.25666, 26
__func__.25666:
	.ascii	"rc_model_v2_smt_h265_init\000"
	.type	__func__.25672, %object
	.size	__func__.25672, 26
__func__.25672:
	.ascii	"rc_model_v2_smt_h264_init\000"
	.type	__func__.25660, %object
	.size	__func__.25660, 22
__func__.25660:
	.ascii	"bits_model_update_smt\000"
	.type	__func__.25960, %object
	.size	__func__.25960, 20
__func__.25960:
	.ascii	"rc_model_v2_smt_end\000"
	.type	__func__.25919, %object
	.size	__func__.25919, 22
__func__.25919:
	.ascii	"check_super_frame_smt\000"
	.type	__func__.25932, %object
	.size	__func__.25932, 17
__func__.25932:
	.ascii	"check_re_enc_smt\000"
	.type	__func__.25945, %object
	.size	__func__.25945, 28
__func__.25945:
	.ascii	"rc_model_v2_smt_check_reenc\000"
	.space	3
	.type	smt_h265e, %object
	.size	smt_h265e, 48
smt_h265e:
	.word	.LC19
	.word	16777220
	.word	600
	.word	rc_model_v2_smt_h265_init
	.word	rc_model_v2_smt_deinit
	.word	0
	.word	rc_model_v2_smt_check_reenc
	.word	rc_model_v2_smt_start
	.word	rc_model_v2_smt_end
	.word	rc_model_v2_smt_hal_start
	.word	rc_model_v2_smt_hal_end
	.word	rc_model_v2_smt_proc_show
	.type	smt_h264e, %object
	.size	smt_h264e, 48
smt_h264e:
	.word	.LC19
	.word	7
	.word	600
	.word	rc_model_v2_smt_h264_init
	.word	rc_model_v2_smt_deinit
	.word	0
	.word	rc_model_v2_smt_check_reenc
	.word	rc_model_v2_smt_start
	.word	rc_model_v2_smt_end
	.word	rc_model_v2_smt_hal_start
	.word	rc_model_v2_smt_hal_end
	.word	rc_model_v2_smt_proc_show
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC1:
	.ascii	"\0016%s:%d: enter %p\012\000"
.LC2:
	.ascii	"\0016%s:%d: i qp_out %d, qp_start_sum = %d, intra_l"
	.ascii	"v4_prop %d\000"
.LC3:
	.ascii	"\0016%s:%d: leave %p\012\000"
.LC4:
	.ascii	"\012--------------------------RC base param 1------"
	.ascii	"--------------------\012\000"
.LC5:
	.ascii	"Gop\000"
.LC6:
	.ascii	"ChnId\000"
.LC7:
	.ascii	"%7s|%7s|%8s|%6s|%6s|%8s|%13s|%13s|%5s|%5s \012\000"
.LC8:
	.ascii	"PQp\000"
.LC9:
	.ascii	"IQp\000"
.LC10:
	.ascii	"MaxBr(kbps)\000"
.LC11:
	.ascii	"MinBr(kbps)\000"
.LC12:
	.ascii	"RcMode\000"
.LC13:
	.ascii	"TrgFr\000"
.LC14:
	.ascii	"ViFr\000"
.LC15:
	.ascii	"StatTm\000"
.LC16:
	.ascii	"%7d|%7u|%8u|%6u|%6u|%8s|%13s|%13s|%5u|%5u \012\000"
.LC17:
	.ascii	"N/A\000"
.LC18:
	.ascii	"%7d|%7u|%8u|%6u|%6u|%8s|%13u|%13u|%5s|%5s \012\000"
.LC19:
	.ascii	"smart\000"
.LC20:
	.ascii	"\012--------------------------RC gop mode attr-----"
	.ascii	"--------------------\012\000"
.LC21:
	.ascii	"GopMode\000"
.LC22:
	.ascii	"%7s|%10s|%10s|%12s|%10s \012\000"
.LC23:
	.ascii	"ViQpDelta\000"
.LC24:
	.ascii	"BgInterval\000"
.LC25:
	.ascii	"IpQpDelta\000"
.LC26:
	.ascii	"%7d|%10s|%10d|%12u|%10d\012\000"
.LC27:
	.ascii	"%7d|%10s|%10d|%12s|%10s\012\000"
.LC28:
	.ascii	"\012-------------------RC run smart common param---"
	.ascii	"----------------\012\000"
.LC29:
	.ascii	"MaxQp\000"
.LC30:
	.ascii	"%7s|%8s|%8s|%8s|%8s|%10s|%10s|%10s|%10s|%15s\012\000"
.LC31:
	.ascii	"MaxReEncTimes\000"
.LC32:
	.ascii	"FrmMinIQp\000"
.LC33:
	.ascii	"FrmMaxIQp\000"
.LC34:
	.ascii	"FrmMinQp\000"
.LC35:
	.ascii	"FrmMaxQp\000"
.LC36:
	.ascii	"MinIQp\000"
.LC37:
	.ascii	"MaxIQp\000"
.LC38:
	.ascii	"MinQp\000"
.LC39:
	.ascii	"%7d|%8u|%8u|%8u|%8u|%10d|%10d|%10d|%10d|%15d\012\000"
.LC40:
	.ascii	"\012-----------------------RC HierarchicalQp INFO--"
	.ascii	"---------------------\012\000"
.LC41:
	.ascii	"bEnable\000"
.LC42:
	.ascii	"%7s|%10s|%12s|%12s|%12s|%12s|%12s|%12s|%12s|%12s\012"
	.ascii	"\000"
.LC43:
	.ascii	"QpDelta[3]\000"
.LC44:
	.ascii	"QpDelta[2]\000"
.LC45:
	.ascii	"QpDelta[1]\000"
.LC46:
	.ascii	"QpDelta[0]\000"
.LC47:
	.ascii	"FrameNum[3]\000"
.LC48:
	.ascii	"FrameNum[2]\000"
.LC49:
	.ascii	"FrameNum[1]\000"
.LC50:
	.ascii	"FrameNum[0]\000"
.LC51:
	.ascii	"%7d|%10s|%12d|%12d|%12d|%12d|%12d|%12d|%12d|%12d\012"
	.ascii	"\000"
.LC52:
	.ascii	"\012-----------------------RC debreath_effect info-"
	.ascii	"-----------------------\012\000"
.LC53:
	.ascii	"%7s|%10s|%10s|%18s\012\000"
.LC54:
	.ascii	"DeBrthEfctCnt\000"
.LC55:
	.ascii	"Strength0\000"
.LC56:
	.ascii	"%7d|%10s|%10d|%18u\012\000"
.LC57:
	.ascii	"%7d|%10s|%10s|%18u\012\000"
.LC58:
	.ascii	"\0016%s:%d: smt_hal_start enter ctx %p task %p\012\000"
.LC59:
	.ascii	"\0016%s:%d: smt_hal_end enter ctx %p task %p\012\000"
.LC60:
	.ascii	"\0016%s:%d: enter ctx %p cfg %p\012\000"
.LC61:
	.ascii	"\0016%s:%d: motion_level %u, complex_level %u\012\000"
.LC62:
	.ascii	"\0016%s:%d: bits_mode_update real_bit %d\000"
.LC63:
	.ascii	"\0016%s:%d: super frame drop current frame\000"
.LC64:
	.ascii	"\0016%s:%d: reenc check target_bps %d last_ins_bps "
	.ascii	"%d ins_bps %d\000"
.LC65:
	.ascii	"\0016%s:%d: drop mode %d frame_type %d\012\000"
.LC66:
	.ascii	"\0016%s:%d: drop mode %d check max_bps %d bit_thr %"
	.ascii	"d ins_bps %d\000"
.LC67:
	.ascii	"\0016%s:%d: leave %p ret %d\012\000"
.LC68:
	.ascii	"\0016%s:%d: reenc drop_mode %d drop_cnt %d\012\000"
.LC69:
	.ascii	"\0016%s:%d: drop\012\000"
.LC70:
	.ascii	"\0016%s:%d: force_pskip\012\000"
.LC71:
	.ascii	"\0016%s:%d: drop disable\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
