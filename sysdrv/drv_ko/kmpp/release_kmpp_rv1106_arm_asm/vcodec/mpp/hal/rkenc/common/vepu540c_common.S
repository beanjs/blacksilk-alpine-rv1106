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
	.file	"vepu540c_common.c"
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
	.type	vepu540c_jpeg_set_uv_offset, %function
vepu540c_jpeg_set_uv_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r6, r2
	ldrd	r4, r2, [r1, #8]
	mov	r5, r0
	mov	r7, r3
	cbnz	r2, .L2
	ldr	r2, [r1, #4]
.L2:
	ldr	r0, [r7, #52]
	muls	r4, r2, r4
	bl	mpp_frame_get_fmt
	tst	r0, #15728640
	beq	.L3
	ldr	r0, [r7, #52]
	bl	mpp_frame_get_fbc_offset
	movw	r1, #581
	mov	r4, r0
	mov	r2, r0
	ldr	r0, .L22
	bl	printk
	cbnz	r4, .L13
.L5:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L3:
	cmp	r6, #9
	bhi	.L6
	adr	r3, .L7
	ldr	pc, [r3, r6, lsl #2]
	.p2align 2
.L7:
	.word	.L5+1
	.word	.L5+1
	.word	.L5+1
	.word	.L6+1
	.word	.L14+1
	.word	.L10+1
	.word	.L14+1
	.word	.L21+1
	.word	.L5+1
	.word	.L5+1
	.p2align 1
.L10:
	add	r3, r4, r4, lsl #1
	lsrs	r3, r3, #1
.L9:
	cbz	r4, .L11
.L4:
	ldr	r2, [r5, #36]
	add	r4, r4, r2
	str	r4, [r5, #36]
.L11:
	cmp	r3, #0
	beq	.L5
	ldr	r2, [r5, #40]
	add	r3, r3, r2
	str	r3, [r5, #40]
	b	.L5
.L6:
	mov	r2, r6
	movw	r1, #614
	ldr	r0, .L22+4
	bl	printk
.L21:
	add	r3, r4, r4, lsl #2
	lsrs	r3, r3, #2
	b	.L9
.L14:
	mov	r3, r4
	b	.L9
.L13:
	movs	r3, #0
	b	.L4
.L23:
	.align	2
.L22:
	.word	.LC0
	.word	.LC1
	.fnend
	.size	vepu540c_jpeg_set_uv_offset, .-vepu540c_jpeg_set_uv_offset
	.align	1
	.global	vepu540c_set_roi
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_roi, %function
vepu540c_set_roi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	add	r4, r0, #16
	mov	r5, r0
	.pad #24
	sub	sp, sp, #24
	mov	r6, r1
	mov	r7, r2
	movs	r1, #0
	movs	r2, #128
	mov	r0, r4
	mov	r8, r3
	bl	memset
	cbz	r5, .L25
	cbnz	r6, .L26
.L25:
	ldr	r1, .L51
	mov	r3, r5
	ldr	r0, .L51+4
	movs	r2, #39
	str	r6, [sp]
.L50:
	bl	printk
	b	.L49
.L26:
	ldr	r3, [r6, #4]
	cmp	r3, #8
	bhi	.L28
	ldr	r0, .L51+8
	add	r2, r6, #24
	ldr	ip, .L51+32
	movs	r3, #0
.L29:
	ldr	r1, [r6, #4]
	sub	r5, r2, #16
	cmp	r1, r3
	bgt	.L37
.L27:
	movs	r0, #0
	b	.L24
.L28:
	movs	r2, #44
	ldr	r1, .L51
	ldr	r0, .L51+12
	bl	printk
.L49:
	mov	r0, #-1
.L24:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L37:
	ldrh	lr, [r2, #-16]
	ldrh	r1, [r2, #-12]
	add	r1, r1, lr
	cmp	r1, r7
	bgt	.L38
	ldrh	r1, [r2, #-14]
	ldrh	r9, [r2, #-10]
	add	r1, r1, r9
	cmp	r1, r8
	mov	r1, #-1
	it	le
	movle	r1, #0
.L30:
	ldrh	r9, [r2, #-8]
	ldrb	r10, [r2, #-1]	@ zero_extendqisi2
	cmp	r9, #1
	bhi	.L41
	ldrh	r9, [r2, #-4]
	cmp	r9, #7
	bhi	.L41
	ldrb	r9, [r2, #-2]	@ zero_extendqisi2
	cmp	r9, #1
	bhi	.L41
	cmp	r10, #2
	it	cs
	movcs	r1, #-1
.L31:
	ldrsh	r9, [r2, #-6]
	cmp	r10, #0
	beq	.L32
	cmp	r9, #51
	ble	.L34
.L33:
	movs	r2, #65
	ldr	r1, .L51
	ldr	r0, .L51+16
	bl	printk
	ldrh	r3, [r5]
	ldr	r1, .L51
	ldr	r0, .L51+20
	strd	r7, r8, [sp, #12]
	ldrh	r2, [r5, #6]
	str	r2, [sp, #8]
	ldrh	r2, [r5, #4]
	str	r2, [sp, #4]
	ldrh	r2, [r5, #2]
	str	r2, [sp]
	movs	r2, #68
	bl	printk
	ldrh	r2, [r5, #12]
	ldrh	r3, [r5, #8]
	ldr	r1, .L51
	ldr	r0, .L51+24
	str	r2, [sp]
	movs	r2, #70
	bl	printk
	ldrsh	r2, [r5, #10]
	ldrb	r3, [r5, #15]	@ zero_extendqisi2
	ldr	r1, .L51
	ldr	r0, .L51+28
	str	r2, [sp]
	movs	r2, #72
	b	.L50
.L38:
	mov	r1, #-1
	b	.L30
.L41:
	mov	r1, #-1
	b	.L31
.L32:
	add	r9, r9, #51
	uxth	r9, r9
	cmp	r9, #102
	bhi	.L33
.L34:
	cmp	r1, #0
	bne	.L33
	add	lr, lr, #15
	ldrh	r1, [r4]
	ldrh	r5, [r4, #2]
	asr	lr, lr, #4
	bfi	r1, lr, #0, #10
	strh	r1, [r4]	@ movhi
	ldrh	r1, [r2, #-14]
	adds	r1, r1, #15
	asrs	r1, r1, #4
	bfi	r5, r1, #0, #10
	strh	r5, [r4, #2]	@ movhi
	ldrh	r5, [r2, #-12]
	ldrh	r1, [r2, #-16]
	add	r1, r1, r5
	ldrh	r5, [r4, #4]
	adds	r1, r1, #15
	asrs	r1, r1, #4
	bfi	r5, r1, #0, #10
	strh	r5, [r4, #4]	@ movhi
	ldrh	r5, [r2, #-10]
	ldrh	r1, [r2, #-14]
	add	r1, r1, r5
	ldrh	r5, [r4, #6]
	adds	r1, r1, #15
	asrs	r1, r1, #4
	bfi	r5, r1, #0, #10
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	strh	r5, [r4, #6]	@ movhi
	ldrh	r5, [r2, #-6]
	bfi	r1, r5, #0, #7
	strb	r1, [r4, #8]
	ldrb	r5, [r2, #-1]	@ zero_extendqisi2
	bfi	r1, r5, #7, #1
	strb	r1, [r4, #8]
	ldrb	r1, [r4, #9]	@ zero_extendqisi2
	bic	r1, r1, #63
	orr	r1, r1, #63
	strb	r1, [r4, #9]
	ldrh	r1, [r2, #-8]
	cbz	r1, .L36
	ldr	r1, [r4, #12]
	ands	r1, r1, r0
	orr	r1, r1, ip
	str	r1, [r4, #12]
.L36:
	adds	r4, r4, #16
	adds	r3, r3, #1
	adds	r2, r2, #16
	b	.L29
.L52:
	.align	2
.L51:
	.word	.LANCHOR0
	.word	.LC2
	.word	-15732481
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	1048832
	.fnend
	.size	vepu540c_set_roi, .-vepu540c_set_roi
	.align	1
	.global	vepu540c_set_qpmap_smart
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_qpmap_smart, %function
vepu540c_set_qpmap_smart:
	.fnstart
	@ args = 20, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r5, r0
	mov	r9, r3
	mov	r10, r2
	ldrd	r8, r6, [sp, #48]
	mov	r0, r1
	ldrd	r4, r3, [sp, #56]
	ldr	r7, [sp, #64]
	cbz	r1, .L121
	cbz	r2, .L121
	cmp	r9, #0
	beq	.L121
	clz	r2, r7
	ldrb	r1, [r5, #12]	@ zero_extendqisi2
	lsrs	r2, r2, #5
	bfi	r1, r2, #0, #1
	strb	r1, [r5, #12]
	ldr	r1, .L146
	ldr	r2, [r5, #12]
	ands	r1, r1, r2
	ldr	r2, .L146+4
	orrs	r2, r2, r1
	ldr	r1, .L146+8
	str	r2, [r5, #12]
	cmp	r3, #0
	bne	.L55
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L146+8
	adds	r6, r6, #63
	adds	r4, r4, #15
	asrs	r4, r4, #4
	str	r0, [sp, #4]
	mov	r0, r10
	bl	mpp_buffer_get_ptr_with_caller
	bics	r6, r6, #63
	it	mi
	addmi	r6, r6, #15
	asrs	r6, r6, #4
	muls	r4, r6, r4
	mov	fp, r0
	cbz	r7, .L57
.L145:
	mov	r2, r4
	movs	r1, #0
	mov	r0, r9
	bl	memset
.L121:
	mov	r7, #-1
	b	.L54
.L57:
	lsls	r2, r4, #2
	mov	r1, r7
	bl	memset
	ldr	r3, .L146+12
	add	ip, r9, #-1
	mov	r6, r7
	mov	r2, r7
	mov	r0, r7
.L58:
	cmp	r0, r4
	blt	.L62
	ldr	r1, .L146+8
	mov	r0, r10
	str	r2, [sp, #4]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	ldr	r2, [sp, #4]
	adds	r1, r2, r6
	cmp	r1, #0
	bgt	.L63
.L107:
	ldr	r1, .L146+8
	mov	r0, r10
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_end_cpu_access
.L54:
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L62:
	ldr	r1, [sp, #4]
	ldr	r1, [r1, r0, lsl #2]
	uxtb	lr, r1
	ubfx	r1, r1, #8, #4
	add	lr, lr, #7
	add	r1, r1, r3
	add	lr, r3, lr, lsr #3
	ldrb	r1, [r1, #75]	@ zero_extendqisi2
	ldrb	lr, [lr, #42]	@ zero_extendqisi2
	orr	lr, lr, r1
	ldrb	r1, [ip, #1]!	@ zero_extendqisi2
	lsls	r1, r1, #2
	and	r1, r1, #63
	orr	r1, lr, r1
	strb	r1, [ip]
	tst	r1, #3
	beq	.L59
	adds	r6, r6, #1
.L60:
	adds	r0, r0, #1
	b	.L58
.L59:
	and	lr, r1, #12
	cmp	lr, #7
	bhi	.L61
	and	r1, r1, #48
	cmp	r1, #31
	bls	.L60
.L61:
	adds	r2, r2, #1
	b	.L60
.L63:
	cmp	r8, #35
	bls	.L122
	cmp	r8, #41
	bls	.L123
	cmp	r8, #46
	ite	cc
	movcc	r1, #2
	movcs	r1, #3
.L64:
	movs	r0, #100
	lsl	ip, r4, #1
	muls	r6, r0, r6
	cmp	ip, r6
	ble	.L65
	cmp	r8, #40
	ldrh	r2, [r5, #12]
	bls	.L66
	movs	r0, #26
.L141:
	bfi	r2, r0, #6, #6
	strh	r2, [r5, #12]	@ movhi
	add	r2, r4, r4, lsr #31
	cmp	r6, r2, asr #1
	bge	.L69
	adds	r1, r1, #5
.L70:
	rsb	r1, r1, #128
	movs	r2, #0
.L72:
	cmp	r2, r4
	bge	.L107
	ldrb	r0, [r9, r2]	@ zero_extendqisi2
	lsls	r0, r0, #30
	it	ne
	strbne	r1, [fp, r2, lsl #2]
	adds	r2, r2, #1
	b	.L72
.L122:
	movs	r1, #0
	b	.L64
.L123:
	movs	r1, #1
	b	.L64
.L66:
	cmp	r8, #35
	ite	hi
	movhi	r0, #25
	movls	r0, #23
	b	.L141
.L69:
	cmp	r6, r4
	ite	lt
	addlt	r1, r1, #4
	addge	r1, r1, #3
	b	.L70
.L65:
	muls	r2, r0, r2
	movs	r0, #10
	muls	r0, r4, r0
	cmp	r0, r2
	ble	.L107
	cmp	r8, #40
	ldrh	r0, [r5, #12]
	bls	.L76
	movs	r6, #26
.L142:
	cmp	r2, r4
	bfi	r0, r6, #6, #6
	strh	r0, [r5, #12]	@ movhi
	bge	.L79
	adds	r1, r1, #5
.L80:
	rsb	r1, r1, #128
	movs	r2, #0
.L83:
	cmp	r2, r4
	bge	.L107
	ldrb	r0, [r9, r2]	@ zero_extendqisi2
	lsls	r3, r0, #30
	bne	.L84
	and	r5, r0, #12
	cmp	r5, #7
	bhi	.L85
	and	r0, r0, #48
	cmp	r0, #31
	bls	.L84
.L85:
	strb	r1, [fp, r2, lsl #2]
.L84:
	adds	r2, r2, #1
	b	.L83
.L76:
	cmp	r8, #35
	ite	hi
	movhi	r6, #25
	movls	r6, #23
	b	.L142
.L79:
	add	ip, ip, r4
	cmp	ip, r2
	ble	.L81
	adds	r1, r1, #4
	b	.L80
.L81:
	add	r0, r4, r4, lsl #2
	cmp	r0, r2
	ite	gt
	addgt	r1, r1, #3
	addle	r1, r1, #2
	b	.L80
.L55:
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L146+8
	adds	r6, r6, #31
	adds	r4, r4, #31
	str	r0, [sp, #4]
	mov	r0, r10
	bl	mpp_buffer_get_ptr_with_caller
	bics	r6, r6, #31
	it	mi
	addmi	r6, r6, #15
	bics	r4, r4, #31
	it	mi
	addmi	r4, r4, #15
	asrs	r6, r6, #4
	asrs	r4, r4, #4
	muls	r4, r6, r4
	mov	fp, r0
	cmp	r7, #0
	bne	.L145
	bic	r2, r4, #-1073741824
	mov	r1, r7
	bl	memset
	ldr	r3, .L146+12
	add	ip, r9, #-1
	mov	r6, r7
	mov	r2, r7
	mov	r0, r7
.L90:
	cmp	r0, r4
	blt	.L94
	ldr	r1, .L146+8
	mov	r0, r10
	str	r2, [sp, #4]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	ldr	r2, [sp, #4]
	adds	r1, r2, r6
	cmp	r1, #0
	ble	.L107
	cmp	r8, #35
	bls	.L125
	cmp	r8, #41
	bls	.L126
	cmp	r8, #46
	ite	cc
	movcc	r1, #2
	movcs	r1, #3
.L96:
	movs	r0, #100
	lsl	ip, r4, #1
	muls	r6, r0, r6
	cmp	ip, r6
	ble	.L97
	cmp	r8, #40
	ldrh	r2, [r5, #12]
	bls	.L98
	movs	r0, #26
.L143:
	bfi	r2, r0, #6, #6
	strh	r2, [r5, #12]	@ movhi
	add	r2, r4, r4, lsr #31
	cmp	r6, r2, asr #1
	bge	.L101
	adds	r1, r1, #5
.L102:
	movs	r2, #0
	rsb	r1, r1, #128
	mov	r5, r2
	mov	r6, r2
.L104:
	cmp	r2, r4
	bge	.L107
	ldrb	r0, [r9, r2]	@ zero_extendqisi2
	adds	r2, r2, #1
	ands	r0, r0, #3
	it	ne
	movne	r0, #1
	cmp	r5, r0
	it	cc
	movcc	r5, r0
	ands	ip, r2, #3
	bne	.L128
	adds	r0, r6, #1
	cbz	r5, .L105
	mov	r5, ip
	strb	r1, [fp, r6, lsl #2]
.L105:
	mov	r6, r0
	b	.L104
.L94:
	ldr	r1, [sp, #4]
	ldr	r1, [r1, r0, lsl #2]
	uxtb	lr, r1
	ubfx	r1, r1, #8, #4
	add	lr, lr, #7
	add	r1, r1, r3
	add	lr, r3, lr, lsr #3
	ldrb	r1, [r1, #75]	@ zero_extendqisi2
	ldrb	lr, [lr, #42]	@ zero_extendqisi2
	orr	lr, lr, r1
	ldrb	r1, [ip, #1]!	@ zero_extendqisi2
	lsls	r1, r1, #2
	and	r1, r1, #63
	orr	r1, lr, r1
	strb	r1, [ip]
	tst	r1, #3
	beq	.L91
	adds	r6, r6, #1
.L92:
	adds	r0, r0, #1
	b	.L90
.L91:
	and	lr, r1, #12
	cmp	lr, #7
	bhi	.L93
	and	r1, r1, #48
	cmp	r1, #31
	bls	.L92
.L93:
	adds	r2, r2, #1
	b	.L92
.L125:
	movs	r1, #0
	b	.L96
.L126:
	movs	r1, #1
	b	.L96
.L98:
	cmp	r8, #35
	ite	hi
	movhi	r0, #25
	movls	r0, #23
	b	.L143
.L147:
	.align	2
.L146:
	.word	-524287
	.word	209570
	.word	.LANCHOR0+17
	.word	.LANCHOR0
.L101:
	cmp	r4, r6
	ite	gt
	addgt	r1, r1, #4
	addle	r1, r1, #3
	b	.L102
.L128:
	mov	r0, r6
	b	.L105
.L97:
	muls	r2, r0, r2
	movs	r0, #10
	muls	r0, r4, r0
	cmp	r0, r2
	ble	.L107
	cmp	r8, #40
	ldrh	r0, [r5, #12]
	bls	.L108
	movs	r6, #26
.L144:
	cmp	r4, r2
	bfi	r0, r6, #6, #6
	strh	r0, [r5, #12]	@ movhi
	ble	.L111
	adds	r1, r1, #5
.L112:
	movs	r0, #0
	rsb	r1, r1, #128
	mov	r5, r0
	mov	r6, r0
.L115:
	cmp	r0, r4
	bge	.L107
	ldrb	r2, [r9, r0]	@ zero_extendqisi2
	lsls	r3, r2, #30
	bne	.L129
	and	ip, r2, #12
	cmp	ip, #7
	bhi	.L130
	and	r2, r2, #48
	cmp	r2, #31
	ite	ls
	movls	r2, #0
	movhi	r2, #1
.L116:
	cmp	r5, r2
	add	r0, r0, #1
	it	cc
	movcc	r5, r2
	ands	ip, r0, #3
	bne	.L131
	adds	r2, r6, #1
	cbz	r5, .L117
	mov	r5, ip
	strb	r1, [fp, r6, lsl #2]
.L117:
	mov	r6, r2
	b	.L115
.L108:
	cmp	r8, #35
	ite	hi
	movhi	r6, #25
	movls	r6, #23
	b	.L144
.L111:
	add	ip, ip, r4
	cmp	ip, r2
	ble	.L113
	adds	r1, r1, #4
	b	.L112
.L113:
	add	r0, r4, r4, lsl #2
	cmp	r0, r2
	ite	gt
	addgt	r1, r1, #3
	addle	r1, r1, #2
	b	.L112
.L129:
	movs	r2, #0
	b	.L116
.L130:
	movs	r2, #1
	b	.L116
.L131:
	mov	r2, r6
	b	.L117
	.fnend
	.size	vepu540c_set_qpmap_smart, .-vepu540c_set_qpmap_smart
	.align	1
	.global	vepu540c_set_qpmap_normal
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_qpmap_normal, %function
vepu540c_set_qpmap_normal:
	.fnstart
	@ args = 20, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r6, r0
	mov	r8, r2
	mov	r9, r3
	ldrd	r7, r4, [sp, #48]
	mov	r0, r1
	ldrd	r2, r5, [sp, #60]
	cbz	r1, .L194
	cmp	r8, #0
	beq	.L194
	cbz	r3, .L194
	clz	r3, r5
	ldrb	r1, [r6, #12]	@ zero_extendqisi2
	lsrs	r3, r3, #5
	bfi	r1, r3, #0, #1
	strb	r1, [r6, #12]
	ldr	r1, .L208
	ldr	r3, [r6, #12]
	ands	r1, r1, r3
	ldr	r3, .L208+4
	orrs	r3, r3, r1
	ldr	r1, .L208+8
	str	r3, [r6, #12]
	cmp	r2, #0
	bne	.L150
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L208+8
	adds	r4, r4, #63
	mov	fp, r0
	mov	r0, r8
	bl	mpp_buffer_get_ptr_with_caller
	bics	r4, r4, #63
	it	mi
	addmi	r4, r4, #15
	asrs	r4, r4, #4
	ldr	r3, [sp, #56]
	mov	r10, r0
	adds	r3, r3, #15
	asrs	r3, r3, #4
	muls	r4, r3, r4
	cbz	r5, .L152
.L207:
	mov	r2, r4
	movs	r1, #0
	mov	r0, r9
	bl	memset
.L194:
	mov	r5, #-1
	b	.L149
.L152:
	mov	r1, r5
	lsls	r2, r4, #2
	bl	memset
	ldr	ip, .L208+12
	add	r0, r9, #-1
	mov	r3, r5
	mov	r1, r5
.L153:
	cmp	r1, r4
	blt	.L156
	cmp	r7, #35
	bls	.L195
	cmp	r7, #46
	ite	cc
	movcc	fp, #4
	movcs	fp, #3
.L157:
	movs	r2, #100
	muls	r3, r2, r3
	rsb	r2, r4, r4, lsl #4
	cmp	r2, r3
	ble	.L158
	cmp	r3, r4, asr #5
	ble	.L158
	cmp	r7, #40
	ldrh	r1, [r6, #12]
	bls	.L159
	movs	r0, #28
.L205:
	bfi	r1, r0, #6, #6
	strh	r1, [r6, #12]	@ movhi
.L158:
	ldr	r1, .L208+8
	mov	r0, r8
	strd	r2, r3, [sp]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	ldrd	r2, r3, [sp]
	cmp	r2, r3
	bgt	.L161
.L183:
	ldr	r1, .L208+8
	mov	r0, r8
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_end_cpu_access
.L149:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L156:
	ldr	lr, [fp, r1, lsl #2]
	uxtb	r2, lr
	ubfx	lr, lr, #8, #4
	adds	r2, r2, #7
	add	lr, lr, ip
	add	r2, ip, r2, lsr #3
	ldrb	lr, [lr, #75]	@ zero_extendqisi2
	ldrb	r2, [r2, #42]	@ zero_extendqisi2
	orr	r2, r2, lr
	ldrb	lr, [r0, #1]!	@ zero_extendqisi2
	lsl	lr, lr, #2
	and	lr, lr, #63
	orr	r2, r2, lr
	strb	r2, [r0]
	tst	r2, #3
	bne	.L154
	and	lr, r2, #12
	cmp	lr, #7
	bhi	.L155
	and	r2, r2, #48
	cmp	r2, #31
	bls	.L154
.L155:
	adds	r3, r3, #1
.L154:
	adds	r1, r1, #1
	b	.L153
.L195:
	mov	fp, #0
	b	.L157
.L159:
	cmp	r7, #35
	ite	hi
	movhi	r0, #27
	movls	r0, #25
	b	.L205
.L161:
	cmp	r3, #0
	ble	.L183
	cmp	r3, r4
	bge	.L163
	add	fp, fp, #7
.L164:
	rsb	fp, fp, #128
	movs	r3, #0
.L167:
	cmp	r3, r4
	bge	.L183
	ldrb	r2, [r9, r3]	@ zero_extendqisi2
	lsls	r1, r2, #30
	bne	.L168
	and	r1, r2, #12
	cmp	r1, #7
	bhi	.L169
	and	r2, r2, #48
	cmp	r2, #31
	bls	.L168
.L169:
	strb	fp, [r10, r3, lsl #2]
.L168:
	adds	r3, r3, #1
	b	.L167
.L163:
	add	r2, r4, r4, lsl #1
	cmp	r2, r3
	ble	.L165
	add	fp, fp, #6
	b	.L164
.L165:
	rsb	r2, r4, r4, lsl #3
	cmp	r2, r3
	ite	gt
	addgt	fp, fp, #5
	addle	fp, fp, #4
	b	.L164
.L150:
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L208+8
	adds	r4, r4, #31
	mov	fp, r0
	mov	r0, r8
	bl	mpp_buffer_get_ptr_with_caller
	bics	r4, r4, #31
	it	mi
	addmi	r4, r4, #15
	asrs	r4, r4, #4
	ldr	r3, [sp, #56]
	mov	r10, r0
	adds	r3, r3, #31
	bics	r3, r3, #31
	it	mi
	addmi	r3, r3, #15
	asrs	r3, r3, #4
	muls	r4, r3, r4
	cmp	r5, #0
	bne	.L207
	mov	r1, r5
	bic	r2, r4, #-1073741824
	bl	memset
	ldr	ip, .L208+12
	add	r0, r9, #-1
	mov	r3, r5
	mov	r1, r5
.L174:
	cmp	r1, r4
	blt	.L177
	cmp	r7, #35
	bls	.L197
	cmp	r7, #46
	ite	cc
	movcc	fp, #4
	movcs	fp, #3
.L178:
	movs	r2, #100
	muls	r3, r2, r3
	rsb	r2, r4, r4, lsl #4
	cmp	r2, r3
	ble	.L179
	cmp	r3, r4, asr #5
	ble	.L179
	cmp	r7, #40
	ldrh	r1, [r6, #12]
	bls	.L180
	movs	r0, #28
.L206:
	bfi	r1, r0, #6, #6
	strh	r1, [r6, #12]	@ movhi
.L179:
	ldr	r1, .L208+8
	mov	r0, r8
	strd	r2, r3, [sp]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	ldrd	r2, r3, [sp]
	cmp	r2, r3
	ble	.L183
	cmp	r3, #0
	ble	.L183
	cmp	r4, r3
	ble	.L184
	add	fp, fp, #7
.L185:
	movs	r2, #0
	rsb	fp, fp, #128
	mov	r1, r2
	mov	r0, r2
.L188:
	cmp	r2, r4
	bge	.L183
	ldrb	r3, [r9, r2]	@ zero_extendqisi2
	lsls	r6, r3, #30
	bne	.L199
	and	r6, r3, #12
	cmp	r6, #7
	bhi	.L200
	and	r3, r3, #48
	cmp	r3, #31
	ite	ls
	movls	r3, #0
	movhi	r3, #1
.L189:
	cmp	r1, r3
	add	r2, r2, #1
	it	cc
	movcc	r1, r3
	ands	r6, r2, #3
	bne	.L201
	adds	r3, r0, #1
	cbz	r1, .L190
	mov	r1, r6
	strb	fp, [r10, r0, lsl #2]
.L190:
	mov	r0, r3
	b	.L188
.L177:
	ldr	r2, [fp, r1, lsl #2]
	uxtb	lr, r2
	ubfx	r2, r2, #8, #4
	add	lr, lr, #7
	add	r2, r2, ip
	add	lr, ip, lr, lsr #3
	ldrb	r2, [r2, #75]	@ zero_extendqisi2
	ldrb	lr, [lr, #42]	@ zero_extendqisi2
	orr	r2, lr, r2
	ldrb	lr, [r0, #1]!	@ zero_extendqisi2
	lsl	lr, lr, #2
	and	lr, lr, #63
	orr	r2, r2, lr
	strb	r2, [r0]
	tst	r2, #3
	bne	.L175
	and	lr, r2, #12
	cmp	lr, #7
	bhi	.L176
	and	r2, r2, #48
	cmp	r2, #31
	bls	.L175
.L176:
	adds	r3, r3, #1
.L175:
	adds	r1, r1, #1
	b	.L174
.L197:
	mov	fp, #0
	b	.L178
.L180:
	cmp	r7, #35
	ite	hi
	movhi	r0, #27
	movls	r0, #25
	b	.L206
.L184:
	add	r2, r4, r4, lsl #1
	cmp	r2, r3
	ble	.L186
	add	fp, fp, #6
	b	.L185
.L186:
	rsb	r2, r4, r4, lsl #3
	cmp	r2, r3
	ite	gt
	addgt	fp, fp, #5
	addle	fp, fp, #4
	b	.L185
.L199:
	movs	r3, #0
	b	.L189
.L200:
	movs	r3, #1
	b	.L189
.L201:
	mov	r3, r0
	b	.L190
.L209:
	.align	2
.L208:
	.word	-524287
	.word	209570
	.word	.LANCHOR0+91
	.word	.LANCHOR0
	.fnend
	.size	vepu540c_set_qpmap_normal, .-vepu540c_set_qpmap_normal
	.align	1
	.global	vepu540c_set_osd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_osd, %function
vepu540c_set_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, r0
	ldr	r4, [r0, #8]
	.pad #40
	sub	sp, sp, #40
	cmp	r4, #0
	beq	.L226
	ldr	r6, [r4, #4]
	cmp	r6, #0
	beq	.L226
	cmp	r6, #8
	bls	.L212
	mov	r3, r6
	mov	r2, #494
	ldr	r1, .L227
	ldr	r0, .L227+4
	bl	printk
	ldr	r3, [r4, #4]
	cmp	r3, #8
	bls	.L218
	movw	r1, #495
	ldr	r3, .L227+8
	str	r1, [sp]
	ldr	r2, .L227+12
	ldr	r0, .L227+16
	bl	printk
.L218:
	mov	r0, #-1
	b	.L210
.L212:
	ldr	r5, [r0]
	adds	r4, r4, #148
	mov	r9, #0
	mov	r10, #36
	add	r7, r5, #24
.L215:
	ldr	r1, [r4, #-128]
	add	r0, sp, #12
	bl	vepu541_set_fmt
	mul	r1, r10, r9
	ldr	r3, [r4, #-140]
	adds	r2, r5, r1
	ldrb	r0, [r5, r1]	@ zero_extendqisi2
	bfi	r0, r3, #0, #1
	strb	r0, [r5, r1]
	ldr	r3, [r4, #-136]
	bfi	r0, r3, #6, #1
	strb	r0, [r5, r1]
	ldr	r3, [r4, #-132]
	bfi	r0, r3, #7, #1
	strb	r0, [r5, r1]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	ldr	lr, [r2, #20]
	ldr	r3, [sp, #12]
	bfi	r0, r3, #0, #4
	strb	r0, [r2, #1]
	ldr	r3, [r4, #-124]
	bfi	r0, r3, #5, #1
	strb	r0, [r2, #1]
	ldrh	r0, [r2, #4]
	ldr	r3, [r4, #-120]
	bfi	r0, r3, #0, #14
	strh	r0, [r2, #4]	@ movhi
	ldr	r3, [r4, #-116]
	ldr	r0, [r2, #4]
	bfi	r0, r3, #14, #14
	str	r0, [r2, #4]
	ldrh	r0, [r2, #8]
	ldr	r3, [r4, #-112]
	bfi	r0, r3, #0, #14
	strh	r0, [r2, #8]	@ movhi
	ldr	r3, [r4, #-108]
	ldr	r0, [r2, #8]
	bfi	r0, r3, #14, #14
	str	r0, [r2, #8]
	ldrb	r0, [r2, #7]	@ zero_extendqisi2
	ldr	r3, [r4, #-96]
	bfi	r0, r3, #4, #4
	strb	r0, [r2, #7]
	ldr	r0, [r4, #-104]
	bfi	lr, r0, #0, #17
	str	lr, [r2, #20]
	ldr	r0, [r4, #-100]
	ubfx	lr, lr, #24, #8
	bfi	lr, r0, #1, #1
	strb	lr, [r2, #23]
	ldrb	lr, [r5, r1]	@ zero_extendqisi2
	ldr	r0, [r4, #-92]
	bfi	lr, r0, #1, #1
	strb	lr, [r5, r1]
	ldr	r0, [r4, #-88]
	bfi	lr, r0, #2, #1
	strb	lr, [r5, r1]
	ldr	r0, [r4, #-84]
	bfi	lr, r0, #3, #1
	strb	lr, [r5, r1]
	ldr	r0, [r4, #-80]
	bfi	lr, r0, #4, #1
	strb	lr, [r5, r1]
	ldr	r0, [r4, #-76]
	ldrb	lr, [r2, #11]	@ zero_extendqisi2
	ldrh	ip, [r2, #22]
	bfi	lr, r0, #4, #1
	strb	lr, [r2, #11]
	ldr	r0, [r4, #-72]
	bfi	lr, r0, #5, #2
	strb	lr, [r2, #11]
	ldr	r0, [r4, #-68]
	bfi	ip, r0, #1, #8
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	strh	ip, [r2, #22]	@ movhi
	ldr	r3, [r4, #-56]
	bfi	r0, r3, #4, #1
	strb	r0, [r2, #1]
	ldr	r3, [r4, #-52]
	ldr	r0, [r5, r1]
	bfi	r0, r3, #14, #8
	str	r0, [r5, r1]
	ldr	r3, [r4, #-48]
	ldrh	r0, [r2, #2]
	bfi	r0, r3, #6, #8
	strh	r0, [r2, #2]	@ movhi
	ldr	r3, [r4, #-44]
	ubfx	r0, r0, #8, #8
	bfi	r0, r3, #6, #2
	strb	r0, [r2, #3]
	ldr	r3, [r4, #-40]
	ldrb	r0, [r5, r1]	@ zero_extendqisi2
	bfi	r0, r3, #5, #1
	strb	r0, [r5, r1]
	ldrb	r3, [r2, #32]	@ zero_extendqisi2
	add	r0, r2, #32
	ldr	r1, [r4, #-36]
	bfi	r3, r1, #0, #1
	strb	r3, [r2, #32]
	ldr	r1, [r4, #-32]
	bfi	r3, r1, #1, #7
	ldrb	r1, [r2, #33]	@ zero_extendqisi2
	strb	r3, [r2, #32]
	ldr	r3, [r4, #-28]
	bfi	r1, r3, #0, #6
	strb	r1, [r2, #33]
	ldr	r3, [r2, #32]
	ldr	r1, [r4, #-24]
	bfi	r3, r1, #14, #6
	str	r3, [r2, #32]
	ldr	r2, [r4, #-20]
	ubfx	r3, r3, #16, #16
	bfi	r3, r2, #4, #5
	strh	r3, [r0, #2]	@ movhi
	ldr	r1, [r4, #-60]
	cbz	r1, .L213
	movs	r2, #0
	ldr	r0, [r8, #4]
	bl	mpp_dev_get_mpi_ioaddress
	str	r0, [r7, #-8]
.L213:
	ldr	r1, [r4, #-12]
	cbz	r1, .L214
	movs	r2, #0
	ldr	r0, [r8, #4]
	bl	mpp_dev_get_mpi_ioaddress
	str	r0, [r7, #-12]
.L214:
	mov	r2, r4
	add	r9, r9, #1
	ldr	r3, [r2, #-8]!	@ unaligned
	cmp	r6, r9
	add	r4, r4, #140
	add	r7, r7, #36
	str	r3, [r7, #-36]	@ unaligned
	ldr	r3, [r2, #4]	@ unaligned
	str	r3, [r7, #-32]	@ unaligned
	bne	.L215
	ldr	r3, [r5, #288]
	and	r2, r3, #-134217728
	ldr	r3, .L227+20
	orrs	r3, r3, r2
	str	r3, [r5, #288]
	ldr	r3, [r5, #292]
	and	r2, r3, #-134217728
	ldr	r3, .L227+24
	orrs	r3, r3, r2
	str	r3, [r5, #292]
	ldr	r3, [r5, #296]
	and	r2, r3, #-134217728
	ldr	r3, .L227+28
	orrs	r3, r3, r2
	str	r3, [r5, #296]
	ldr	r3, [r5, #300]
	and	r3, r3, #-16777216
	orr	r3, r3, #8388608
	orr	r3, r3, #32768
	str	r3, [r5, #300]
	mov	r3, #-16711936
	str	r3, [r5, #304]
	mov	r3, #65280
	strh	r3, [r5, #308]	@ movhi
.L226:
	movs	r0, #0
.L210:
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L228:
	.align	2
.L227:
	.word	.LANCHOR0+117
	.word	.LC8
	.word	.LANCHOR0+134
	.word	.LC9
	.word	.LC10
	.word	7679053
	.word	33773525
	.word	128920192
	.fnend
	.size	vepu540c_set_osd, .-vepu540c_set_osd
	.global	__aeabi_uidivmod
	.align	1
	.global	vepu540c_set_jpeg_reg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_jpeg_reg, %function
vepu540c_set_jpeg_reg:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r0
	ldr	r5, [r0, #12]
	.pad #44
	sub	sp, sp, #44
	ldrd	r8, r3, [r0, #16]
	ldr	r4, [r0, #4]
	ldr	r6, [r5, #16]
	cbnz	r3, .L230
	mov	r2, #264
	ldr	r1, [r5, #56]
	ldr	r0, [r0]
	bl	mpp_dev_get_iova_address
	mov	r3, r5
	mov	r1, r6
	strd	r0, r0, [r4, #32]
	str	r0, [r4, #40]
	mov	r0, r4
	ldr	r2, [r8]
	bl	vepu540c_jpeg_set_uv_offset
.L230:
	ldr	r3, [r5, #32]
	ldr	r2, [r3, #28]
	ldr	r0, [r3]
	cmp	r2, #0
	bne	.L231
	cmp	r0, #0
	beq	.L232
	mov	r1, r0
	movw	r2, #257
	ldr	r0, [r7]
	bl	mpp_dev_get_iova_address
	ldr	r3, [r5, #32]
	ldr	r3, [r3, #12]
	add	r0, r0, r3
	str	r0, [r4, #4]
.L233:
	ldr	r3, [r5, #32]
	ldr	r9, [r4, #4]
	ldr	r3, [r3, #24]
	add	r2, r9, #-1
	str	r9, [r4, #8]
	add	r3, r3, r2
	str	r3, [r4]
	ldr	r0, [r5, #28]
	bl	mpp_packet_get_length
	add	r0, r0, r9
	str	r0, [r4, #12]
.L234:
	ldr	r3, [r6]
	ldr	r2, .L254
	adds	r3, r3, #15
	ldrh	r1, [r4, #64]
	and	r3, r2, r3, lsr #3
	subs	r3, r3, #1
	bfi	r1, r3, #0, #11
	strh	r1, [r4, #64]	@ movhi
	ldrb	r1, [r6]	@ zero_extendqisi2
	add	r3, r1, #15
	bic	r3, r3, #15
	subs	r3, r3, r1
	ldrb	r1, [r4, #68]	@ zero_extendqisi2
	bfi	r1, r3, #0, #6
	strb	r1, [r4, #68]
	ldr	r3, [r6, #4]
	adds	r3, r3, #15
	and	r2, r2, r3, lsr #3
	ldrh	r3, [r4, #66]
	subs	r2, r2, #1
	bfi	r3, r2, #0, #11
	strh	r3, [r4, #66]	@ movhi
	ldrb	r2, [r6, #4]	@ zero_extendqisi2
	add	r3, r2, #15
	bic	r3, r3, #15
	subs	r3, r3, r2
	ldrb	r2, [r4, #70]	@ zero_extendqisi2
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #70]
	ldr	r1, [r8]
	ldrb	r3, [r4, #72]	@ zero_extendqisi2
	and	r1, r1, #15
	bfi	r3, r1, #2, #4
	strb	r3, [r4, #72]
	ldr	r2, [r8, #4]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #72]
	ldr	r2, [r8, #8]
	bfi	r3, r2, #1, #1
	strb	r3, [r4, #72]
	ldrh	r3, [r4, #72]
	bic	r3, r3, #1920
	orr	r3, r3, #128
	strh	r3, [r4, #72]	@ movhi
	ldr	r3, [r6, #36]
	cmp	r3, #0
	ldrb	r3, [r4, #95]	@ zero_extendqisi2
	ite	le
	movle	r2, #0
	movgt	r2, #1
	bfi	r3, r2, #2, #1
	strb	r3, [r4, #95]
	ldr	r2, [r6, #32]
	bfi	r3, r2, #3, #2
	strb	r3, [r4, #95]
	ldr	r3, [r6, #8]
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	cbnz	r3, .L236
	ands	r0, r2, #60
	bne	.L237
	ldr	r3, [r6]
	lsls	r3, r3, #2
.L236:
	and	r2, r2, #52
	cmp	r2, #16
	itet	ne
	addne	r0, r3, r3, lsr #31
	moveq	r0, r3
	asrne	r0, r0, #1
	cmp	r1, #2
	bhi	.L241
	ldr	r2, [r4, #76]
	and	r1, r2, #-134217728
	ldr	r2, .L254+4
	orrs	r2, r2, r1
	str	r2, [r4, #76]
	ldr	r2, [r4, #80]
	and	r1, r2, #-134217728
	ldr	r2, .L254+8
	orrs	r2, r2, r1
	str	r2, [r4, #80]
	ldr	r2, [r4, #84]
	and	r1, r2, #-134217728
	ldr	r2, .L254+12
	orrs	r2, r2, r1
	str	r2, [r4, #84]
	ldr	r2, [r4, #88]
	lsrs	r2, r2, #21
	lsls	r2, r2, #21
	orr	r2, r2, #32768
	orr	r2, r2, #128
	str	r2, [r4, #88]
.L241:
	ldr	r2, [r4, #100]
	strh	r0, [r4, #104]	@ movhi
	bfi	r2, r3, #0, #17
	str	r2, [r4, #100]
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_offset_y
	ldrh	r3, [r4, #98]
	bfi	r3, r0, #0, #14
	strh	r3, [r4, #98]	@ movhi
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_offset_x
	ldrh	r3, [r4, #96]
	bfi	r3, r0, #0, #14
	strh	r3, [r4, #96]	@ movhi
	ldrh	r3, [r4, #108]
	bic	r3, r3, #816
	bic	r3, r3, #3
	strh	r3, [r4, #108]	@ movhi
	ldrh	r3, [r4, #112]
	bfc	r3, #0, #15
	strh	r3, [r4, #112]	@ movhi
	ldrh	r3, [r4, #116]
	bfc	r3, #0, #15
	strh	r3, [r4, #116]	@ movhi
	ldrh	r3, [r4, #120]
	bfc	r3, #0, #15
	strh	r3, [r4, #120]	@ movhi
	mov	r3, #-1610612736
	str	r3, [r4, #124]
	ldr	r3, [r4, #128]
	and	r3, r3, #-1073741824
	str	r3, [r4, #128]
	ldr	r3, [r7, #20]
	cbz	r3, .L242
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_is_full
	cmp	r0, #0
	bne	.L243
	add	r2, sp, #4
	movs	r1, #19
	bl	rk_dvbm_ctrl
	ldr	r3, [sp, #8]
	str	r3, [r4, #16]
	ldr	r3, [sp, #20]
	str	r3, [r4, #20]
	ldr	r3, [sp, #4]
	str	r3, [r4, #24]
	ldr	r3, [sp, #16]
	str	r3, [r4, #28]
	ldr	r3, [sp, #12]
	str	r3, [r4, #32]
	ldr	r3, [sp, #24]
	strd	r3, r3, [r4, #36]
.L242:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L232:
	ldr	r2, [r3, #4]
	ldr	r3, [r3, #12]
	add	r3, r3, r2
	str	r3, [r4, #4]
	b	.L233
.L231:
	ldr	r1, .L254+16
	bl	mpp_buffer_get_size_with_caller
	ldr	r3, [r5, #32]
	movw	r2, #257
	ldr	r1, [r3]
	mov	r10, r0
	ldr	r0, [r7]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #4]
	mov	r9, r0
	ldr	r3, [r5, #32]
	ldr	r0, [r5, #28]
	ldr	fp, [r3, #12]
	bl	mpp_packet_get_length
	mov	r1, r10
	add	r0, r0, fp
	bl	__aeabi_uidivmod
	ldr	r0, [r4, #4]
	add	r1, r1, r9
	str	r1, [r4, #12]
	ldr	r3, [r5, #32]
	ldr	r3, [r3, #16]
	add	r3, r3, r0
	add	r0, r0, r10
	str	r3, [r4, #8]
	str	r0, [r4]
	b	.L234
.L237:
	cmp	r0, #4
	bne	.L238
	ldr	r3, [r6]
	add	r3, r3, r3, lsl #1
	b	.L236
.L238:
	cmp	r0, #8
	beq	.L239
	and	r0, r2, #56
	cmp	r0, #32
	bne	.L236
.L239:
	ldr	r3, [r6]
	lsls	r3, r3, #1
	b	.L236
.L243:
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_phy_addr
	cbz	r0, .L245
	strd	r0, r0, [r4, #32]
	mov	r3, r5
	str	r0, [r4, #40]
	mov	r1, r6
	ldr	r2, [r8]
	mov	r0, r4
	bl	vepu540c_jpeg_set_uv_offset
	b	.L242
.L245:
	movw	r1, #767
	ldr	r0, .L254+20
	bl	printk
	b	.L242
.L255:
	.align	2
.L254:
	.word	536870910
	.word	20261917
	.word	123164288
	.word	33762283
	.word	.LANCHOR0+151
	.word	.LC11
	.fnend
	.size	vepu540c_set_jpeg_reg, .-vepu540c_set_jpeg_reg
	.align	1
	.global	vepu540c_set_dvbm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu540c_set_dvbm, %function
vepu540c_set_dvbm:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	.pad #40
	sub	sp, sp, #40
	mov	r4, r0
	add	r2, sp, #4
	movs	r1, #19
	movs	r0, #0
	bl	rk_dvbm_ctrl
	ldr	r3, [sp, #4]
	str	r3, [r4]
	ldr	r3, [sp, #16]
	str	r3, [r4, #4]
	ldr	r3, [sp, #8]
	str	r3, [r4, #8]
	ldr	r3, [sp, #20]
	str	r3, [r4, #12]
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
	.fnend
	.size	vepu540c_set_dvbm, .-vepu540c_set_dvbm
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.35475, %object
	.size	__func__.35475, 17
__func__.35475:
	.ascii	"vepu540c_set_roi\000"
	.type	__FUNCTION__.35510, %object
	.size	__FUNCTION__.35510, 25
__FUNCTION__.35510:
	.ascii	"vepu540c_set_qpmap_smart\000"
	.type	md_idx0, %object
	.size	md_idx0, 33
md_idx0:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.type	md_idx1, %object
	.size	md_idx1, 16
md_idx1:
	.byte	0
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.type	__FUNCTION__.35563, %object
	.size	__FUNCTION__.35563, 26
__FUNCTION__.35563:
	.ascii	"vepu540c_set_qpmap_normal\000"
	.type	__func__.35589, %object
	.size	__func__.35589, 17
__func__.35589:
	.ascii	"vepu540c_set_osd\000"
	.type	__FUNCTION__.35590, %object
	.size	__FUNCTION__.35590, 17
__FUNCTION__.35590:
	.ascii	"vepu540c_set_osd\000"
	.type	__FUNCTION__.35632, %object
	.size	__FUNCTION__.35632, 22
__FUNCTION__.35632:
	.ascii	"vepu540c_set_jpeg_reg\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016%d: fbc case u_offset = %d\000"
.LC1:
	.ascii	"\0013%d: unknown color space: %d\012\000"
.LC2:
	.ascii	"\0013%s:%d: invalid buf %p roi %p\012\000"
.LC3:
	.ascii	"\0013%s:%d: invalid region number %d\012\000"
.LC4:
	.ascii	"\0013%s:%d: region %d invalid param:\012\000"
.LC5:
	.ascii	"\0013%s:%d: position [%d:%d:%d:%d] vs [%d:%d]\012\000"
.LC6:
	.ascii	"\0013%s:%d: force intra %d qp area index %d\012\000"
.LC7:
	.ascii	"\0013%s:%d: abs qp mode %d value %d\012\000"
.LC8:
	.ascii	"\0013%s:%d: do NOT support more than 8 regions inva"
	.ascii	"lid num %d\012\000"
.LC9:
	.ascii	"osd->num_region <= 8\000"
.LC10:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC11:
	.ascii	"\0013%d: online case set full frame err\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
