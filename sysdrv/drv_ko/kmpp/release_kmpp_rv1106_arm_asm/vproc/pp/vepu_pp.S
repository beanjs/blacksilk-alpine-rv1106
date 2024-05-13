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
	.file	"vepu_pp.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_register_vmpibuf_func_to_pp:					
	.asciz 	"register_vmpibuf_func_to_pp"					
__kstrtabns_register_vmpibuf_func_to_pp:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_unregister_vmpibuf_func_pp:					
	.asciz 	"unregister_vmpibuf_func_pp"					
__kstrtabns_unregister_vmpibuf_func_pp:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vepu_pp_create_chn:					
	.asciz 	"vepu_pp_create_chn"					
__kstrtabns_vepu_pp_create_chn:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vepu_pp_destroy_chn:					
	.asciz 	"vepu_pp_destroy_chn"					
__kstrtabns_vepu_pp_destroy_chn:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vepu_pp_control:					
	.asciz 	"vepu_pp_control"					
__kstrtabns_vepu_pp_control:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	IS_ERR_OR_NULL, %function
IS_ERR_OR_NULL:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L3
	cmn	r0, #4096
	ite	ls
	movls	r0, #0
	movhi	r0, #1
	bx	lr
.L3:
	movs	r0, #1
	bx	lr
	.fnend
	.size	IS_ERR_OR_NULL, .-IS_ERR_OR_NULL
	.align	1
	.global	register_vmpibuf_func_to_pp
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	register_vmpibuf_func_to_pp, %function
register_vmpibuf_func_to_pp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	str	r0, [r3]
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.fnend
	.size	register_vmpibuf_func_to_pp, .-register_vmpibuf_func_to_pp
	.align	1
	.global	unregister_vmpibuf_func_pp
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	unregister_vmpibuf_func_pp, %function
unregister_vmpibuf_func_pp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	movs	r2, #0
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.fnend
	.size	unregister_vmpibuf_func_pp, .-unregister_vmpibuf_func_pp
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vmpibuf_func, %function
get_vmpibuf_func:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r3, .L15
	ldr	r3, [r3]
	mov	r0, r3
	bl	IS_ERR_OR_NULL
	cbz	r0, .L10
	ldr	r1, .L15+4
	ldr	r0, .L15+8
	bl	printk
	mvn	r3, #11
.L10:
	mov	r0, r3
	pop	{r3, pc}
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC0
	.fnend
	.size	get_vmpibuf_func, .-get_vmpibuf_func
	.align	1
	.global	vepu_pp_control
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu_pp_control, %function
vepu_pp_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	.pad #36
	sub	sp, sp, #36
	mov	r6, r2
	ble	.L18
	mov	r3, r0
	movw	r2, #403
	ldr	r1, .L104
	ldr	r0, .L104+4
	bl	printk
	mov	r0, #-1
.L17:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L18:
	mov	fp, #636
	ldr	r7, .L104+8
	mul	fp, fp, r0
	cmp	r1, #16
	add	r8, r7, #4
	mov	r9, r7
	add	r4, r8, fp
	beq	.L20
	cmp	r1, #32
	beq	.L21
	cmp	r1, #48
	beq	.L22
	cmp	r1, #64
	beq	.L23
	cmp	r1, #80
	bne	.L100
	ldr	r3, [r4, #160]
	mov	r0, #16777472
	orr	r3, r3, #66846720
	orr	r3, r3, #65536
	str	r3, [r4, #160]
	mov	r3, #8388736
	str	r3, [r4, #164]
	add	r3, r3, #8388608
	str	r3, [r4, #168]
	mov	r3, #6291552
	strd	r0, r3, [r4, #172]
	sub	r3, r3, #5767168
	str	r3, [r4, #180]
	mov	r3, #524296
	str	r3, [r4, #184]
	b	.L103
.L20:
	ldr	r3, [r2]
	add	fp, fp, r9
	ldr	r7, [r2, #8]
	ldr	r8, [r2, #12]
	str	r3, [sp, #8]
	cmp	r7, #0
	ldrd	r3, lr, [fp, #32]
	ldrb	r2, [r4, #60]	@ zero_extendqisi2
	it	eq
	moveq	r7, #30
	clz	r3, r3
	cmp	r8, #0
	lsr	r3, r3, #5
	it	eq
	moveq	r8, #1
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #60]
	ldr	r2, [fp, #16]
	cbnz	r2, .L28
	ldr	r3, [fp, #20]
	cbz	r3, .L29
.L28:
	mov	r1, #636
	subs	r3, r7, #1
	mla	r1, r1, r5, r9
	ldr	r1, [r1, #40]
	subs	r3, r1, r3
	it	ne
	movne	r3, #1
.L29:
	ldrb	r1, [r4, #60]	@ zero_extendqisi2
	bfi	r1, r3, #1, #1
	mov	r3, #636
	mla	r3, r3, r5, r9
	strb	r1, [r4, #60]
	ldr	ip, [r3, #24]
	cmp	ip, #0
	bne	.L30
	ldr	r3, [r3, #28]
	cbz	r3, .L31
.L30:
	clz	r3, lr
	lsrs	r3, r3, #5
.L31:
	ldrb	r1, [r4, #60]	@ zero_extendqisi2
	bfi	r1, r3, #2, #1
	strb	r1, [r4, #60]
	mov	r1, #636
	ldrh	r3, [r4, #64]
	mla	r1, r1, r5, r9
	ldrh	r9, [r4, #66]
	ldr	r0, [r1, #8]
	lsr	fp, r0, #3
	add	fp, fp, #-1
	ubfx	fp, fp, #0, #11
	bfi	r3, fp, #0, #11
	strh	r3, [r4, #64]	@ movhi
	ldr	r3, [r1, #12]
	lsrs	r3, r3, #3
	subs	r3, r3, #1
	bfi	r9, r3, #0, #11
	strh	r9, [r4, #66]	@ movhi
	ldrb	r9, [r4, #68]	@ zero_extendqisi2
	ldr	r3, [r6, #4]
	bfi	r9, r3, #0, #4
	ldr	r3, [r4, #72]
	strb	r9, [r4, #68]
	bic	r3, r3, #4128831
	str	r3, [r4, #72]
	ldr	r3, [r4, #76]
	and	r3, r3, #-1073692672
	str	r3, [r4, #76]
	ldr	r3, [r4, #80]
	bfi	r3, r0, #0, #17
	lsrs	r0, r0, #1
	str	r3, [r4, #80]
	strh	r0, [r4, #84]	@ movhi
	cbz	r2, .L32
	ldr	r2, [r1, #40]
	adds	r2, r2, #0
	it	ne
	movne	r2, #1
.L32:
	ldrb	r3, [r4, #104]	@ zero_extendqisi2
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #104]
	ands	r2, r3, #1
	ldr	r3, .L104+8
	beq	.L33
	mov	r2, #636
	mla	r2, r2, r5, r3
	ldr	r2, [r2, #40]
	adds	r2, r2, #-1
	it	ne
	movne	r2, #1
.L33:
	ldrb	r1, [r4, #104]	@ zero_extendqisi2
	bfi	r1, r2, #1, #1
	add	r2, fp, #4
	strb	r1, [r4, #104]
	mov	r1, #636
	mla	r1, r1, r5, r3
	asrs	r2, r2, #2
	adds	r2, r2, #7
	asrs	r2, r2, #3
	lsls	r2, r2, #4
	str	r2, [r4, #156]
	ldr	r2, [r1, #20]
	cbz	r2, .L34
	ldr	r2, [r1, #40]
	adds	r2, r2, #0
	it	ne
	movne	r2, #1
.L34:
	str	r2, [r4, #160]
	ldr	r2, [sp, #8]
	cmp	r2, #0
	ite	le
	movle	r1, #0
	movgt	r1, #1
	cmp	ip, #0
	beq	.L35
	cmp	lr, #0
	ite	eq
	moveq	ip, r1
	movne	ip, #0
.L35:
	ldrb	r2, [r4, #188]	@ zero_extendqisi2
	bfi	r2, ip, #0, #1
	strb	r2, [r4, #188]
	ands	r2, r2, #1
	beq	.L36
	ldr	r2, [sp, #8]
	cmp	r2, r8
	ite	le
	movle	r2, #0
	movgt	r2, #1
.L36:
	ldrb	r0, [r4, #188]	@ zero_extendqisi2
	bfi	r0, r2, #1, #1
	mov	r2, #636
	mla	r2, r2, r5, r3
	strb	r0, [r4, #188]
	ldr	r2, [r2, #28]
	cbz	r2, .L37
	clz	r2, lr
	lsrs	r2, r2, #5
.L37:
	orr	r2, r2, r1, lsl #1
	orr	r2, r2, #4
	str	r2, [r4, #200]
	mov	r2, #636
	mla	r2, r2, r5, r3
	ldrd	fp, r9, [r2, #8]
	bl	get_vmpibuf_func
	ldr	r3, .L104+8
	ldr	r2, [r0, #24]
	cbz	r2, .L38
	ldr	r0, [r6, #20]
	blx	r2
	ldr	r3, .L104+8
	str	r0, [sp, #4]
.L38:
	ldr	r2, [r6, #4]
	cmp	r2, #6
	beq	.L39
	cmp	r2, #7
	bne	.L40
	mul	r9, r9, fp
	ldr	r2, [sp, #4]
	add	r10, r9, r2
	add	r2, r10, r9, lsr #2
	str	r2, [sp, #12]
.L40:
	ldr	r2, [sp, #4]
	strd	r2, r10, [r4, #584]
	ldr	r2, [sp, #12]
	str	r2, [r4, #592]
	ldr	r2, [r6]
	tst	r2, #1
	mov	r2, #636
	mla	r2, r2, r5, r3
	itete	eq
	ldreq	r1, [r2, #48]
	ldrne	r1, [r2, #52]
	ldreq	r1, [r1, #8]
	ldrne	r1, [r1, #8]
	itete	eq
	streq	r1, [r4, #556]
	strne	r1, [r4, #556]
	ldreq	r2, [r2, #52]
	ldrne	r2, [r2, #48]
	ldr	r2, [r2, #8]
	strd	r2, r2, [r4, #560]
	mov	r2, #636
	mla	r0, r2, r5, r3
	mla	r3, r2, r5, r3
	ldr	r1, [r0, #36]
	ldr	r2, [r3, #40]
	adds	r1, r1, #1
	cmp	r8, r1
	add	r2, r2, #1
	it	eq
	moveq	r1, #0
	cmp	r7, r2
	str	r1, [r0, #36]
	bne	.L45
	movs	r2, #0
.L45:
	str	r2, [r3, #40]
	b	.L103
.L39:
	ldr	r2, [sp, #4]
	mla	r10, r9, fp, r2
	str	r10, [sp, #12]
	b	.L40
.L105:
	.align	2
.L104:
	.word	.LANCHOR1+17
	.word	.LC1
	.word	.LANCHOR0
.L21:
	bl	get_vmpibuf_func
	ldr	r2, [r6, #4]
	ldrb	r3, [r4, #188]	@ zero_extendqisi2
	add	fp, fp, r7
	bfi	r3, r2, #2, #2
	strb	r3, [r4, #188]
	ldr	r2, [r6, #8]
	ldrh	r3, [r4, #188]
	bfi	r3, r2, #4, #12
	strh	r3, [r4, #188]	@ movhi
	ldrb	r3, [r4, #190]	@ zero_extendqisi2
	ldr	r2, [r6, #12]
	bfi	r3, r2, #0, #3
	strb	r3, [r4, #190]
	ldrb	r3, [r4, #192]	@ zero_extendqisi2
	ldr	r2, [r6, #16]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #192]
	ldr	r2, [r6, #20]
	bfi	r3, r2, #1, #1
	strb	r3, [r4, #192]
	ldr	r3, [r4, #192]
	bic	r3, r3, #130560
	bic	r3, r3, #508
	orr	r3, r3, #25728
	orr	r3, r3, #76
	str	r3, [r4, #192]
	movs	r3, #64
	str	r3, [r4, #196]
	ldr	r3, [fp, #56]
	ldr	r3, [r3, #8]
	strd	r3, r3, [r4, #576]
	ldr	r3, [r0, #24]
	cbz	r3, .L103
	ldr	r0, [r6]
	blx	r3
	str	r0, [r4, #600]
.L103:
	movs	r0, #0
	b	.L17
.L22:
	ldr	r2, [r2, #4]
	ldrh	r3, [r4, #204]
	bfi	r3, r2, #0, #12
	strh	r3, [r4, #204]	@ movhi
	ldr	r2, [r6, #8]
	ldr	r3, [r4, #204]
	bfi	r3, r2, #12, #18
	str	r3, [r4, #204]
	ldr	r3, [r4, #208]
	and	r3, r3, #-1073741824
	orr	r3, r3, #7
	str	r3, [r4, #208]
	b	.L103
.L23:
	bl	get_vmpibuf_func
	ldr	r3, [r0, #24]
	cbz	r3, .L48
	ldr	r0, [r6]
	blx	r3
	str	r0, [r4, #596]
.L48:
	mov	r1, #636
	ldr	r6, .L106
	mla	r5, r1, r5, r9
	ldr	r7, .L106+4
	mov	ip, #1572864
	ldr	r8, .L106+28
	ldr	r3, [r5, #60]
	ldr	r3, [r3, #8]
	strd	r3, r3, [r4, #568]
	ldr	r3, .L106+8
	strd	r6, r3, [r4, #108]
	movw	r3, #1798
	strd	r7, r3, [r4, #116]
	ldr	r3, .L106+12
	strd	ip, r3, [r4, #124]
	sub	r3, r3, #2097184
	str	r3, [r4, #132]
	ldr	r3, .L106+16
	str	r3, [r4, #136]
	sub	r3, r3, #4718592
	str	r3, [r4, #140]
	ldr	r3, .L106+20
	strd	r8, r3, [r4, #144]
	ldr	r3, .L106+24
	str	r3, [r4, #152]
	ldr	r3, [r5, #44]
	str	r3, [r4, #156]
	b	.L103
.L100:
	cmp	r1, #96
	bne	.L49
	add	r2, r7, fp
	add	r3, fp, #60
	add	r3, r3, r8
	mov	r1, #544
	str	r3, [sp, #20]
	movs	r3, #0
	strd	r1, r3, [sp, #24]
	ldr	r3, [r2, #632]
	ldr	r3, [r3, #16]
	cbz	r3, .L50
	add	r1, sp, #20
	ldr	r0, [r2, #636]
	blx	r3
.L50:
	add	fp, fp, #604
	movs	r2, #24
	add	r3, r8, fp
	str	r3, [sp, #20]
	movs	r3, #0
	strd	r2, r3, [sp, #24]
	mov	r3, #636
	mla	r3, r3, r5, r9
	ldr	r2, [r3, #632]
	ldr	r2, [r2, #20]
	cbz	r2, .L51
	add	r1, sp, #20
	ldr	r0, [r3, #636]
	blx	r2
.L51:
	mov	r1, #636
	mla	r2, r1, r5, r9
	mov	r4, r1
	ldr	r3, [r2, #632]
	ldr	r3, [r3, #24]
	cbz	r3, .L52
	ldr	r0, [r2, #636]
	blx	r3
.L52:
	mla	r5, r4, r5, r9
	ldr	r3, [r5, #632]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L103
	ldr	r0, [r5, #636]
	blx	r3
	b	.L103
.L49:
	cmp	r1, #112
	bne	.L54
	add	fp, fp, r7
	ldr	r3, [fp, #624]
	str	r3, [r2]
	ldr	r3, [fp, #628]
	str	r3, [r2, #4]
	b	.L103
.L54:
	cmp	r1, #128
	bne	.L103
	add	fp, fp, r7
	ldr	r3, [fp, #608]
	str	r3, [r6]
	ldr	r3, [fp, #612]
	str	r3, [r6, #4]
	ldr	r3, [fp, #616]
	str	r3, [r6, #8]
	ldr	r3, [fp, #620]
	str	r3, [r6, #12]
	b	.L103
.L107:
	.align	2
.L106:
	.word	134940683
	.word	151389702
	.word	101717012
	.word	4194352
	.word	6291504
	.word	1094799954
	.word	3158064
	.word	3145824
	.fnend
	.size	vepu_pp_control, .-vepu_pp_control
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	pp_malloc_buffer, %function
pp_malloc_buffer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r1
	mov	r6, r0
	bl	get_vmpibuf_func
	mov	r5, r0
	movs	r0, #12
	bl	vmalloc
	mov	r4, r0
	bl	IS_ERR_OR_NULL
	cbz	r0, .L109
	movs	r2, #49
	ldr	r1, .L124
	ldr	r0, .L124+4
	mvn	r4, #11
	bl	printk
.L108:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L109:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L108
	mov	r0, r7
	blx	r3
	str	r0, [r4]
	cmp	r0, #0
	beq	.L108
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L108
	blx	r3
	str	r0, [r4, #4]
	ldr	r3, [r5, #24]
	cbz	r3, .L111
	ldr	r0, [r4]
	blx	r3
	str	r0, [r4, #8]
.L111:
	ldr	r3, [r4, #8]
	adds	r3, r3, #1
	bne	.L108
	ldr	r3, [r6, #628]
	movs	r2, #0
	ldr	r1, [r4, #4]
	ldr	r0, [r6, #632]
	ldr	r3, [r3, #32]
	blx	r3
	str	r0, [r4, #8]
	b	.L108
.L125:
	.align	2
.L124:
	.word	.LANCHOR1+33
	.word	.LC2
	.fnend
	.size	pp_malloc_buffer, .-pp_malloc_buffer
	.align	1
	.global	vepu_pp_create_chn
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu_pp_create_chn, %function
vepu_pp_create_chn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, r0
	mov	r6, r0
	mov	r5, r1
	ldr	r0, .L155
	ldr	r1, .L155+4
	bl	printk
	cmp	r6, #1
	ble	.L127
	mov	r3, r6
	movs	r2, #168
	ldr	r1, .L155+8
	ldr	r0, .L155+12
	bl	printk
.L154:
	mov	r10, #-1
.L126:
	mov	r0, r10
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L127:
	mov	r2, #636
	ldr	r7, .L155+16
	mul	r4, r2, r6
	add	r8, r7, #4
	movs	r1, #0
	add	r8, r8, r4
	add	r4, r4, r7
	mov	r0, r8
	bl	memset
	str	r6, [r4, #4]
	ldr	r3, [r5]
	str	r3, [r4, #8]
	ldr	r3, [r5, #4]
	str	r3, [r4, #12]
	ldr	r3, [r5, #8]
	str	r3, [r4, #16]
	ldr	r3, [r5, #12]
	str	r3, [r4, #20]
	ldr	r3, [r5, #16]
	str	r3, [r4, #24]
	ldr	r3, [r5, #20]
	str	r3, [r4, #28]
	ldr	r3, [r5, #24]
	str	r3, [r4, #32]
	ldr	r3, .L155+20
	str	r3, [r4, #632]
	ldr	r0, [r3, #4]
	bl	vmalloc
	str	r0, [r4, #636]
	cbnz	r0, .L129
	movs	r2, #187
	ldr	r1, .L155+8
	ldr	r0, .L155+24
	bl	printk
	b	.L154
.L129:
	ldr	r3, [r4, #632]
	movs	r1, #0
	ldr	r2, [r3, #4]
	bl	memset
	ldr	r3, [r4, #632]
	ldr	r0, [r4, #636]
	movs	r1, #25
	ldr	r3, [r3, #8]
	blx	r3
	ldr	fp, [r4, #32]
	ldrd	r5, r4, [r4, #8]
	adds	r5, r5, #31
	bic	r5, r5, #31
	cmp	fp, #0
	beq	.L130
	adds	r4, r4, #31
	bic	r4, r4, #31
.L131:
	asrs	r5, r5, #3
	asrs	r4, r4, #3
	cmp	fp, #0
	beq	.L132
	asrs	r3, r5, #1
	asr	r9, r4, #1
.L133:
	mul	r9, r9, r3
	mov	r0, r8
	lsl	r1, r9, #4
	bl	pp_malloc_buffer
	mov	r3, #636
	mla	r3, r3, r6, r7
	strd	r0, r0, [r3, #48]
	bl	IS_ERR_OR_NULL
	cmp	r0, #0
	beq	.L141
	movs	r2, #109
	ldr	r1, .L155+28
	ldr	r0, .L155+32
	mov	r10, #-1
	bl	printk
.L134:
	mov	r3, #636
	mla	r3, r3, r6, r7
	ldr	r3, [r3, #24]
	cbz	r3, .L135
	cmp	fp, #0
	beq	.L136
	asrs	r1, r5, #2
	asrs	r4, r4, #2
.L137:
	muls	r1, r4, r1
	mov	r0, r8
	adds	r1, r1, #63
	asrs	r1, r1, #6
	lsls	r1, r1, #4
	bl	pp_malloc_buffer
	mov	r3, #636
	mla	r3, r3, r6, r7
	str	r0, [r3, #56]
	bl	IS_ERR_OR_NULL
	cbz	r0, .L135
	movs	r2, #125
	ldr	r1, .L155+28
	ldr	r0, .L155+32
	mov	r10, #-1
	bl	printk
.L135:
	mov	r4, #636
	mla	r4, r4, r6, r7
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L126
	add	r1, r9, #127
	mov	r0, r8
	asrs	r1, r1, #7
	lsls	r1, r1, #4
	bl	pp_malloc_buffer
	str	r0, [r4, #60]
	bl	IS_ERR_OR_NULL
	cbz	r0, .L138
	movs	r2, #142
	ldr	r1, .L155+28
	ldr	r0, .L155+32
	mov	r10, #-1
	bl	printk
.L138:
	adds	r2, r5, #3
	mov	r3, #636
	it	mi
	addmi	r2, r5, #6
	mla	r6, r3, r6, r7
	asrs	r2, r2, #2
	adds	r3, r2, #7
	it	mi
	addmi	r3, r2, #14
	asrs	r3, r3, #3
	lsls	r3, r3, #4
	str	r3, [r6, #44]
	b	.L126
.L130:
	adds	r4, r4, #31
	lsls	r5, r5, #2
	bic	r4, r4, #31
	lsls	r4, r4, #2
	b	.L131
.L132:
	add	r9, r5, #15
	asr	r9, r9, #4
	lsl	r3, r9, #3
	add	r9, r4, #15
	asr	r9, r9, #4
	lsl	r9, r9, #3
	b	.L133
.L141:
	mov	r10, r0
	b	.L134
.L136:
	add	r1, r5, #15
	adds	r4, r4, #15
	asrs	r1, r1, #4
	asrs	r4, r4, #4
	lsls	r1, r1, #2
	lsls	r4, r4, #2
	b	.L137
.L156:
	.align	2
.L155:
	.word	.LC3
	.word	.LANCHOR1+50
	.word	.LANCHOR1+69
	.word	.LC4
	.word	.LANCHOR0
	.word	pp_srv_api
	.word	.LC5
	.word	.LANCHOR1+88
	.word	.LC2
	.fnend
	.size	vepu_pp_create_chn, .-vepu_pp_create_chn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	pp_free_buffer, %function
pp_free_buffer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	bl	get_vmpibuf_func
	mov	r6, r0
	cbz	r4, .L157
	ldr	r1, [r4, #4]
	cbz	r1, .L159
	ldr	r3, [r5, #628]
	ldr	r0, [r5, #632]
	ldr	r3, [r3, #36]
	blx	r3
.L159:
	ldr	r0, [r4]
	cbz	r0, .L160
	ldr	r3, [r6, #16]
	blx	r3
.L160:
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	b	vfree
.L157:
	pop	{r4, r5, r6, pc}
	.fnend
	.size	pp_free_buffer, .-pp_free_buffer
	.align	1
	.global	vepu_pp_destroy_chn
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu_pp_destroy_chn, %function
vepu_pp_destroy_chn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r2, r0
	mov	r4, r0
	ldr	r1, .L179
	ldr	r0, .L179+4
	bl	printk
	cmp	r4, #1
	ble	.L168
	mov	r3, r4
	movs	r2, #205
	ldr	r1, .L179+8
	ldr	r0, .L179+12
	bl	printk
	mov	r0, #-1
.L167:
	pop	{r3, r4, r5, r6, r7, pc}
.L168:
	mov	r5, #636
	ldr	r7, .L179+16
	muls	r5, r4, r5
	adds	r6, r7, #4
	add	r6, r6, r5
	add	r5, r5, r7
	mov	r0, r6
	ldr	r1, [r5, #48]
	bl	pp_free_buffer
	ldr	r3, [r5, #24]
	cbz	r3, .L170
	ldr	r1, [r5, #56]
	mov	r0, r6
	bl	pp_free_buffer
.L170:
	mov	r3, #636
	mla	r3, r3, r4, r7
	ldr	r2, [r3, #16]
	cbz	r2, .L171
	ldr	r1, [r3, #60]
	mov	r0, r6
	bl	pp_free_buffer
.L171:
	mov	r3, #636
	movs	r5, #0
	mla	r4, r3, r4, r7
	ldr	r3, [r4, #632]
	ldr	r0, [r4, #636]
	ldr	r3, [r3, #12]
	blx	r3
	ldr	r0, [r4, #636]
	cmp	r0, #0
	beq	.L167
	bl	vfree
	str	r5, [r4, #636]
	mov	r0, r5
	b	.L167
.L180:
	.align	2
.L179:
	.word	.LANCHOR1+107
	.word	.LC3
	.word	.LANCHOR1+127
	.word	.LC6
	.word	.LANCHOR0
	.fnend
	.size	vepu_pp_destroy_chn, .-vepu_pp_destroy_chn
	.section	.rodata
	.set	.LANCHOR1,. + 0
	.type	__FUNCTION__.18422, %object
	.size	__FUNCTION__.18422, 17
__FUNCTION__.18422:
	.ascii	"get_vmpibuf_func\000"
	.type	__func__.18527, %object
	.size	__func__.18527, 16
__func__.18527:
	.ascii	"vepu_pp_control\000"
	.type	__func__.18429, %object
	.size	__func__.18429, 17
__func__.18429:
	.ascii	"pp_malloc_buffer\000"
	.type	__FUNCTION__.18456, %object
	.size	__FUNCTION__.18456, 19
__FUNCTION__.18456:
	.ascii	"vepu_pp_create_chn\000"
	.type	__func__.18457, %object
	.size	__func__.18457, 19
__func__.18457:
	.ascii	"vepu_pp_create_chn\000"
	.type	__func__.18447, %object
	.size	__func__.18447, 19
__func__.18447:
	.ascii	"pp_allocate_buffer\000"
	.type	__FUNCTION__.18468, %object
	.size	__FUNCTION__.18468, 20
__FUNCTION__.18468:
	.ascii	"vepu_pp_destroy_chn\000"
	.type	__func__.18469, %object
	.size	__func__.18469, 20
__func__.18469:
	.ascii	"vepu_pp_destroy_chn\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_mpi_buf_fn, %object
	.size	g_mpi_buf_fn, 4
g_mpi_buf_fn:
	.space	4
	.type	g_pp_ctx, %object
	.size	g_pp_ctx, 1272
g_pp_ctx:
	.space	1272
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s failed\012\000"
.LC1:
	.ascii	"\0013%s:%d: vepu pp control channel id %d error\012"
	.ascii	"\000"
.LC2:
	.ascii	"\0013%s:%d: failed\012\000"
.LC3:
	.ascii	"\0016%s %d\012\000"
.LC4:
	.ascii	"\0013%s:%d: vepu pp create channel id %d error\012\000"
.LC5:
	.ascii	"\0013%s:%d: vepu pp vmalloc failed\012\000"
.LC6:
	.ascii	"\0013%s:%d: vepu pp destroy channel id %d error\012"
	.ascii	"\000"
	.section	___ksymtab+register_vmpibuf_func_to_pp,"a"
	.align	2
	.type	__ksymtab_register_vmpibuf_func_to_pp, %object
	.size	__ksymtab_register_vmpibuf_func_to_pp, 12
__ksymtab_register_vmpibuf_func_to_pp:
	.word	register_vmpibuf_func_to_pp
	.word	__kstrtab_register_vmpibuf_func_to_pp
	.word	__kstrtabns_register_vmpibuf_func_to_pp
	.section	___ksymtab+unregister_vmpibuf_func_pp,"a"
	.align	2
	.type	__ksymtab_unregister_vmpibuf_func_pp, %object
	.size	__ksymtab_unregister_vmpibuf_func_pp, 12
__ksymtab_unregister_vmpibuf_func_pp:
	.word	unregister_vmpibuf_func_pp
	.word	__kstrtab_unregister_vmpibuf_func_pp
	.word	__kstrtabns_unregister_vmpibuf_func_pp
	.section	___ksymtab+vepu_pp_control,"a"
	.align	2
	.type	__ksymtab_vepu_pp_control, %object
	.size	__ksymtab_vepu_pp_control, 12
__ksymtab_vepu_pp_control:
	.word	vepu_pp_control
	.word	__kstrtab_vepu_pp_control
	.word	__kstrtabns_vepu_pp_control
	.section	___ksymtab+vepu_pp_create_chn,"a"
	.align	2
	.type	__ksymtab_vepu_pp_create_chn, %object
	.size	__ksymtab_vepu_pp_create_chn, 12
__ksymtab_vepu_pp_create_chn:
	.word	vepu_pp_create_chn
	.word	__kstrtab_vepu_pp_create_chn
	.word	__kstrtabns_vepu_pp_create_chn
	.section	___ksymtab+vepu_pp_destroy_chn,"a"
	.align	2
	.type	__ksymtab_vepu_pp_destroy_chn, %object
	.size	__ksymtab_vepu_pp_destroy_chn, 12
__ksymtab_vepu_pp_destroy_chn:
	.word	vepu_pp_destroy_chn
	.word	__kstrtab_vepu_pp_destroy_chn
	.word	__kstrtabns_vepu_pp_destroy_chn
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
