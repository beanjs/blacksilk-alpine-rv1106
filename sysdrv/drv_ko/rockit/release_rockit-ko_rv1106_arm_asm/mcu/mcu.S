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
	.file	"mcu.c"
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
	.type	mcu_send_message, %function
mcu_send_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	ldr	r2, [r3, #232]
	str	r1, [r2]
	ldr	r3, [r3, #228]
	str	r0, [r3]
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.fnend
	.size	mcu_send_message, .-mcu_send_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_compat_ioctl, %function
vmcu_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vmcu_compat_ioctl, .-vmcu_compat_ioctl
	.section	.init.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	isp_max_w_setup, %function
isp_max_w_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	push	{r3, lr}
	.save {r3, lr}
	mov	r1, r2
	bl	simple_strtoul
	ldr	r3, .L6
	str	r0, [r3, #252]
	movs	r0, #1
	pop	{r3, pc}
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.fnend
	.size	isp_max_w_setup, .-isp_max_w_setup
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	isp_max_h_setup, %function
isp_max_h_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	push	{r3, lr}
	.save {r3, lr}
	mov	r1, r2
	bl	simple_strtoul
	ldr	r3, .L9
	str	r0, [r3, #256]
	movs	r0, #1
	pop	{r3, pc}
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.fnend
	.size	isp_max_h_setup, .-isp_max_h_setup
	.text
	.align	1
	.global	vmcu_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_version, %function
vmcu_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r0, #128]
	ldr	r3, [r3]
	ldr	r6, [r3, #160]
	ldr	r3, [r1, #32]	@ unaligned
	cmp	r3, #76
	beq	.L12
	movs	r1, #2
	movs	r3, #221
	ldr	r2, .L18
	mov	r0, r1
	str	r3, [sp]
	ldr	r3, .L18+4
	bl	vlog
.L12:
	movs	r5, #0
	movs	r3, #1
	strb	r5, [r4, #1]
	strb	r3, [r4]
	strb	r5, [r4, #2]
	strb	r5, [r4, #3]
	strb	r5, [r4, #4]
	strb	r5, [r4, #5]
	strb	r5, [r4, #6]
	strb	r5, [r4, #7]
	strb	r5, [r4, #8]
	strb	r5, [r4, #9]
	strb	r5, [r4, #10]
	strb	r5, [r4, #11]
	ldr	r0, [r6]
	bl	strlen
	cmp	r0, #16
	ite	ls
	strls	r0, [r4, #12]	@ unaligned
	strbhi	r5, [r4, #13]
	add	r0, r4, #16
	itttt	hi
	strbhi	r5, [r4, #14]
	movhi	r3, #16
	strbhi	r5, [r4, #15]
	strbhi	r3, [r4, #12]
	ldr	r2, [r4, #12]	@ unaligned
	ldr	r1, [r6]
	bl	strncpy
	movs	r0, #0
	strb	r0, [r4, #36]
	strb	r0, [r4, #37]
	strb	r0, [r4, #38]
	strb	r0, [r4, #39]
	strb	r0, [r4, #56]
	strb	r0, [r4, #57]
	strb	r0, [r4, #58]
	strb	r0, [r4, #59]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L19:
	.align	2
.L18:
	.word	.LC0
	.word	.LANCHOR1
	.fnend
	.size	vmcu_version, .-vmcu_version
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_release, %function
vmcu_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	ldr	r4, [r1, #128]
	ldr	r0, [r4]
	bl	mpi_obj_unref
	ldr	r3, [r4]
	ldr	r2, .L21
	movs	r1, #4
	movs	r0, #2
	ldr	r3, [r3]
	str	r3, [sp, #4]
	mov	r3, #300
	str	r3, [sp]
	ldr	r3, .L21+4
	bl	vlog
	mov	r0, r4
	bl	kfree
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L22:
	.align	2
.L21:
	.word	.LC1
	.word	.LANCHOR1+13
	.fnend
	.size	vmcu_release, .-vmcu_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_read, %function
vmcu_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L25
	bl	mpi_fs_buf_read
	cmp	r0, #-1
	it	eq
	moveq	r0, #0
	pop	{r3, pc}
.L26:
	.align	2
.L25:
	.word	.LANCHOR0+168
	.fnend
	.size	vmcu_read, .-vmcu_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_ioctl, %function
vmcu_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	uxtb	r4, r1
	ldr	r3, .L32
	mov	r6, r0
	mov	r5, r1
	mov	r7, r2
	adds	r3, r3, #4
	movs	r1, #5
	ldr	r8, [r3, #160]
	movs	r0, #2
	strd	r4, r3, [sp, #8]
	movs	r3, #253
	str	r4, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L32+4
	ldr	r3, .L32+8
	bl	vlog
	ldr	r1, [r8, #212]
	cmp	r1, r4
	bhi	.L28
	mov	r3, #256
	ldr	r2, .L32+12
	str	r3, [sp]
	ldr	r3, .L32+8
.L31:
	movs	r1, #2
	mov	r0, r1
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L29:
.L28:
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r1
	sbc	r1, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r1
	ldr	r1, [r8, #208]
	movs	r3, #20
	mla	r1, r3, r4, r1
	cbnz	r1, .L30
	movw	r3, #263
	ldr	r2, .L32+16
	str	r3, [sp]
	ldr	r3, .L32+8
	b	.L31
.L30:
	mov	r3, r7
	mov	r2, r5
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	.LC2
	.word	.LANCHOR1+26
	.word	.LC3
	.word	.LC4
	.fnend
	.size	vmcu_ioctl, .-vmcu_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_thread_fn, %function
vmcu_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r7, .L44
	mov	r6, r0
	ldr	r8, .L44+28
	movs	r5, #0
	ldr	r9, .L44+32
.L35:
	bl	kthread_should_stop
	cbz	r0, .L39
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L39:
	ldr	r10, [r6, #204]
	cmp	r10, #0
	beq	.L36
	movs	r0, #1
	mov	r4, r5
	bl	msleep
.L37:
	mov	r5, r4
	b	.L35
.L36:
	movs	r0, #10
	bl	msleep
	ldr	r3, .L44+4
	ldr	r3, [r3, #236]
	ldr	r4, [r3]
	cmp	r5, r4
	beq	.L37
	cmp	r4, #0
	beq	.L37
	mov	r1, r10
	movs	r0, #8
	bl	mcu_send_message
	cmp	r4, #7
	bne	.L37
	movs	r1, #4
	mov	r0, r7
	bl	ioremap
	movs	r1, #4
	ldr	fp, [r0]
	mov	r0, r8
	bl	ioremap
	movs	r1, #4
	ldr	r2, [r0]
	mov	r0, r9
	str	r2, [sp, #12]
	bl	ioremap
	movs	r1, #4
	ldrh	r5, [r0, #2]
	ldr	r0, .L44+8
	bl	ioremap
	movs	r1, #4
	lsls	r5, r5, #4
	ldrh	r10, [r0, #2]
	ldr	r0, .L44+12
	bl	ioremap
	mov	r1, fp
	lsl	r10, r10, #4
	ldr	fp, .L44+36
	ldr	r3, [r0]
	ldr	r2, [sp, #12]
	ldr	r0, .L44+16
	strd	r10, r3, [sp]
	mov	r3, r5
	bl	printk
	movs	r1, #44
	ldr	r0, .L44+20
	bl	ioremap
	ldr	r5, .L44+20
	ldr	r3, .L44+24
	sub	r10, r0, #4
.L38:
	mov	r1, r5
	mov	r0, r3
	ldr	r2, [r10, #4]!
	adds	r5, r5, #4
	bl	printk
	cmp	r5, fp
	ldr	r3, .L44+24
	bne	.L38
	movs	r0, #10
	bl	msleep
	movs	r1, #0
	mov	r0, r1
	bl	mcu_send_message
	b	.L37
.L45:
	.align	2
.L44:
	.word	-5963680
	.word	.LANCHOR0
	.word	-5943284
	.word	-5963000
	.word	.LC5
	.word	-5943292
	.word	.LC6
	.word	-5963752
	.word	-5943288
	.word	-5943248
	.fnend
	.size	vmcu_thread_fn, .-vmcu_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_open, %function
vmcu_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r7, r1
	ldr	r0, [r3, #12]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L47
	movs	r1, #2
	movw	r3, #287
	ldr	r2, .L49+4
	mov	r0, r1
	str	r3, [sp]
	ldr	r3, .L49+8
	bl	vlog
	mov	r0, #-1
.L46:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L47:
	ldr	r5, .L49+12
	adds	r6, r5, #4
	mov	r0, r6
	bl	mpi_obj_ref
	ldr	r3, [r5, #4]
	str	r6, [r4]
	movs	r1, #4
	str	r4, [r7, #128]
	movs	r0, #2
	ldr	r2, .L49+16
	str	r3, [sp, #4]
	mov	r3, #292
	str	r3, [sp]
	ldr	r3, .L49+8
	bl	vlog
	movs	r0, #0
	b	.L46
.L50:
	.align	2
.L49:
	.word	kmalloc_caches
	.word	.LC7
	.word	.LANCHOR1+37
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	vmcu_open, .-vmcu_open
	.global	__aeabi_idiv
	.align	1
	.global	mcu_wrap_config
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_wrap_config, %function
mcu_wrap_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r0
	ldr	r4, .L61
	.pad #28
	sub	sp, sp, #28
	mov	fp, r1
	ldr	r3, [r4, #248]
	cmp	r3, #1
	bne	.L51
	movs	r1, #0
	movs	r0, #6
	bl	mcu_send_message
	ldr	r5, [r4, #256]
	cbnz	r5, .L54
	ldr	r3, [r4, #244]
	ldr	r5, [r3]
	ubfx	r5, r5, #0, #14
.L54:
	ldr	r3, [r4, #220]
	mov	r0, #1000
	mov	r1, r5
	mov	r10, #0
	muls	r0, r6, r0
	ldr	r7, [r3, #604]
	bl	__aeabi_idiv
	movs	r3, #112
	ldr	r2, .L61+4
	movs	r1, #4
	sub	r8, r7, #4
	mov	r9, r0
	str	r3, [sp]
	strd	r7, r5, [sp, #4]
	movs	r0, #2
	ldr	r3, .L61+8
	bl	vlog
	lsl	r3, r9, #5
	mov	r9, #32
	str	r3, [sp, #20]
.L56:
	movs	r3, #0
	str	r3, [r8, #4]!
	str	r3, [r8, #256]
	ldr	r3, .L61+12
	str	r9, [r8, #768]
	ldr	r2, .L61+16
	smull	r0, r1, r10, r3
	asr	r3, r10, #31
	movs	r0, #2
	rsb	r3, r3, r1, asr #6
	movs	r1, #4
	str	r3, [r8, #512]
	strd	r9, r3, [sp, #4]
	movs	r3, #120
	str	r3, [sp]
	ldr	r3, .L61+8
	bl	vlog
	ldr	r3, [r8, #512]
	cmp	r3, r6
	bge	.L55
	add	r9, r9, #32
	ldr	r3, [sp, #20]
	cmp	r9, #2080
	add	r10, r10, r3
	bne	.L56
.L55:
	ldr	r3, [r4, #224]
	adds	r6, r6, #31
	str	r5, [r7, #1024]
	bic	r6, r6, #31
	cmp	r3, #0
	it	ne
	movne	fp, r3
	ldr	r3, [r4, #220]
	str	r6, [r7, #1028]
	movs	r1, #1
	str	fp, [r7, #1032]
	ldr	r0, [r3, #448]
	bl	dma_buf_end_cpu_access
	ldr	r3, [r7, #1032]
	ldr	r2, .L61+20
	movs	r1, #4
	movs	r0, #2
	str	r3, [sp, #8]
	ldr	r3, [r4, #220]
	ldr	r3, [r3, #608]
	str	r3, [sp, #4]
	movs	r3, #131
	str	r3, [sp]
	ldr	r3, .L61+8
	bl	vlog
	ldr	r3, [r4, #220]
	movs	r0, #1
	ldr	r1, [r3, #608]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mcu_send_message
.L51:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	.LC8
	.word	.LANCHOR1+47
	.word	274877907
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mcu_wrap_config, .-mcu_wrap_config
	.align	1
	.global	mcu_set_wrap_line
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_set_wrap_line, %function
mcu_set_wrap_line:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L64
	str	r0, [r3, #224]
	bx	lr
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.fnend
	.size	mcu_set_wrap_line, .-mcu_set_wrap_line
	.align	1
	.global	mcu_get_wrap_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_get_wrap_status, %function
mcu_get_wrap_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldr	r0, [r3, #248]
	bx	lr
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.fnend
	.size	mcu_get_wrap_status, .-mcu_get_wrap_status
	.align	1
	.global	mcu_wrap_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_wrap_start, %function
mcu_wrap_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r4, .L73
	ldr	r3, [r4, #248]
	cmp	r3, #1
	bne	.L69
	ldr	r2, .L73+4
	movs	r3, #148
	movs	r1, #4
	str	r3, [sp]
	movs	r0, #2
	ldr	r3, .L73+8
	bl	vlog
	movs	r1, #0
	movs	r0, #5
	bl	mcu_send_message
	ldr	r3, [r4, #244]
	movs	r1, #2
	str	r1, [r4, #248]
	ldr	r2, [r4, #256]
	ldr	r3, [r3]
	ubfx	r3, r3, #0, #14
	cmp	r3, r2
	beq	.L69
	strd	r2, r3, [sp, #4]
	mov	r0, r1
	movs	r3, #153
	ldr	r2, .L73+12
	str	r3, [sp]
	ldr	r3, .L73+8
	bl	vlog
.L69:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L74:
	.align	2
.L73:
	.word	.LANCHOR0
	.word	.LC11
	.word	.LANCHOR1+63
	.word	.LC12
	.fnend
	.size	mcu_wrap_start, .-mcu_wrap_start
	.align	1
	.global	mcu_reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_reset, %function
mcu_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r3, .L77
	ldr	r3, [r3, #248]
	cbz	r3, .L75
	movs	r1, #0
	movs	r0, #9
	bl	mcu_send_message
	movs	r0, #100
	bl	msleep
	movs	r1, #4
	ldr	r0, .L77+4
	bl	ioremap
	mov	r3, #1966110
	str	r3, [r0]
	movs	r0, #100
	pop	{r3, lr}
	b	msleep
.L75:
	pop	{r3, pc}
.L78:
	.align	2
.L77:
	.word	.LANCHOR0
	.word	-12875260
	.fnend
	.size	mcu_reset, .-mcu_reset
	.align	1
	.global	mcu_wrap_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_wrap_end, %function
mcu_wrap_end:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	ldr	r4, .L81
	ldr	r0, [r4, #248]
	cmp	r0, #2
	bne	.L79
	movs	r3, #171
	ldr	r2, .L81+4
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L81+8
	bl	vlog
	movs	r3, #1
	movs	r1, #0
	str	r3, [r4, #248]
	movs	r0, #6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	b	mcu_send_message
.L79:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.word	.LC13
	.word	.LANCHOR1+78
	.fnend
	.size	mcu_wrap_end, .-mcu_wrap_end
	.align	1
	.global	vmcu_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_probe, %function
vmcu_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #28
	sub	sp, sp, #28
	mov	r6, r0
	movs	r1, #4
	ldr	r0, .L102
	movs	r3, #0
	movs	r2, #0
	strd	r2, [sp, #16]
	bl	ioremap
	ldr	r3, [r0]
	and	r3, r3, #30
	cmp	r3, #30
	beq	.L84
	movs	r1, #4
	ldr	r0, .L102
	bl	ioremap
	ldr	r2, .L102+4
	movs	r1, #4
	ldr	r3, [r0]
	str	r3, [sp, #4]
	movw	r3, #337
	str	r3, [sp]
	ldr	r3, .L102+8
.L101:
	movs	r0, #2
	bl	vlog
.L83:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L84:
	ldr	r4, .L102+12
	movs	r2, #252
	movs	r1, #0
	mov	r0, r4
	bl	memset
	ldr	r0, .L102+16
	bl	mpi_allocator_find_by_name
	str	r0, [r4, #216]
	cbnz	r0, .L86
	mov	r3, #344
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L102+8
	ldr	r2, .L102+20
	b	.L101
.L86:
	ldr	r0, [r4, #260]
	cmp	r0, #0
	beq	.L88
	mov	r2, #416
	movs	r1, #0
	bl	filp_open
	movw	r3, #349
	ldr	r2, .L102+24
	movs	r1, #4
	mov	r7, r0
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r0, #2
	ldr	r3, .L102+8
	bl	vlog
	cbz	r7, .L88
	ldr	r5, .L102+28
	mov	r1, #4096
	ldr	r0, [r5]
	bl	ioremap
	mov	r2, #4096
	movs	r1, #0
	bl	memset
	mov	r1, #4096
	ldr	r0, [r5]
	bl	ioremap
	mov	r2, #4096
	mov	r1, r0
	add	r3, sp, #16
	mov	r0, r7
	bl	kernel_read
	movs	r1, #4
	ldrd	r2, [sp, #16]
	str	r0, [sp, #4]
	movs	r0, #2
	strd	r2, [sp, #8]
	mov	r3, #358
	ldr	r2, .L102+32
	str	r3, [sp]
	ldr	r3, .L102+8
	bl	vlog
	movs	r1, #4
	ldr	r0, .L102+36
	bl	ioremap
	ldr	r3, [r5]
	str	r3, [r0]
.L88:
	movs	r1, #4
	ldr	r0, .L102
	bl	ioremap
	mov	r3, #1966080
	movs	r1, #4
	str	r3, [r0]
	ldr	r0, .L102+40
	bl	ioremap
	movs	r1, #4
	str	r0, [r4, #228]
	ldr	r0, .L102+44
	bl	ioremap
	movs	r1, #4
	str	r0, [r4, #232]
	ldr	r0, .L102+48
	bl	ioremap
	movs	r1, #4
	str	r0, [r4, #236]
	ldr	r0, .L102+52
	bl	ioremap
	movs	r1, #4
	str	r0, [r4, #240]
	ldr	r0, .L102+56
	bl	ioremap
	mov	r2, #10240
	movs	r1, #1
	str	r0, [r4, #244]
	ldr	r0, [r4, #216]
	bl	mpi_allocator_alloc
	mov	r5, r0
	cbz	r0, .L91
	movs	r1, #0
	bl	mpi_buf_create
	str	r0, [r4, #220]
	cbz	r0, .L91
	ldr	r3, .L102+60
	str	r3, [r0, #4]
	mov	r0, r5
	bl	dma_buf_put
	mov	r0, r5
	ldr	r7, [r4, #220]
	bl	get_dma_buf_phy_addr
	str	r0, [r7, #608]
	mov	r0, r5
	ldr	r7, [r4, #220]
	bl	dma_buf_vmap
	ldr	r3, [r4, #220]
	mov	r2, #10240
	movs	r1, #0
	str	r0, [r7, #604]
	ldr	r0, [r3, #604]
	bl	memset
	ldr	r3, [r4, #220]
	movs	r1, #1
	ldrd	r2, r3, [r3, #604]
	add	r3, r3, #2048
	str	r3, [r2]
	mov	r3, #8192
	str	r3, [r2, #4]
	ldr	r3, [r4, #220]
	ldr	r0, [r3, #448]
	bl	dma_buf_end_cpu_access
	ldr	r3, [r4, #220]
	movs	r0, #3
	ldr	r1, [r3, #608]
	bl	mcu_send_message
.L91:
	mov	r1, #3264
	mov	r0, r6
	bl	kstrdup
	ldr	r7, .L102+64
	ldr	r5, .L102+68
	mov	r2, r6
	movs	r1, #8
	movs	r3, #1
	str	r4, [r4, #164]
	str	r3, [r4, #212]
	str	r7, [r4, #208]
	str	r0, [r4]
	ldr	r0, .L102+72
	bl	mpi_dev_register
	add	r1, r7, #20
	sub	r0, r5, #188
	movs	r3, #0
	strd	r5, r5, [r4, #192]
	str	r3, [r4, #72]
	strd	r3, r3, [r4, #80]
	str	r3, [r4, #188]
	bl	mpi_sysfs_dev_add
	sub	r1, r5, #192
	mov	r3, r6
	mov	r2, #-1
	ldr	r0, .L102+76
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L93
	bl	wake_up_process
.L93:
	mov	r1, #8192
	ldr	r0, .L102+80
	str	r5, [r4, #200]
	bl	mpi_fs_buf_init
	ldr	r3, [r4, #220]
	movs	r1, #4
	movs	r0, #2
	ldr	r3, [r3, #604]
	add	r2, r3, #2048
	str	r2, [r4, #184]
	ldr	r2, [r4, #176]
	adds	r3, r3, #64
	str	r2, [r4, #180]
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	mov	r3, #398
	ldr	r2, .L102+84
	str	r3, [sp]
	ldr	r3, .L102+8
	bl	vlog
	movs	r3, #1
	str	r3, [r4, #248]
	b	.L83
.L103:
	.align	2
.L102:
	.word	-12875260
	.word	.LC14
	.word	.LANCHOR1+91
	.word	.LANCHOR0
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LANCHOR2
	.word	.LC18
	.word	-16293820
	.word	-10747896
	.word	-10747892
	.word	-10747856
	.word	-10747852
	.word	-6290412
	.word	.LC19
	.word	.LANCHOR1+104
	.word	.LANCHOR0+192
	.word	.LANCHOR0+4
	.word	vmcu_thread_fn
	.word	.LANCHOR0+168
	.word	.LC20
	.fnend
	.size	vmcu_probe, .-vmcu_probe
	.align	1
	.global	vmcu_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_shutdown, %function
vmcu_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L105
	movs	r3, #1
	adds	r0, r0, #4
	str	r3, [r0, #200]
	b	mpi_dev_unregister
.L106:
	.align	2
.L105:
	.word	.LANCHOR0
	.fnend
	.size	vmcu_shutdown, .-vmcu_shutdown
	.align	1
	.global	vmcu_load
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_load, %function
vmcu_load:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L108
	bl	vmcu_probe
	movs	r0, #0
	pop	{r3, pc}
.L109:
	.align	2
.L108:
	.word	.LC21
	.fnend
	.size	vmcu_load, .-vmcu_load
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vmcu_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_exit, %function
vmcu_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vmcu_shutdown
	.fnend
	.size	vmcu_exit, .-vmcu_exit
	.global	g_vmcu_dev
	.global	isp_max_h
	.global	isp_max_w
	.global	mcu_fw_addr
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.38104, %object
	.size	__func__.38104, 13
__func__.38104:
	.ascii	"vmcu_version\000"
	.type	__func__.38146, %object
	.size	__func__.38146, 13
__func__.38146:
	.ascii	"vmcu_release\000"
	.type	__func__.38117, %object
	.size	__func__.38117, 11
__func__.38117:
	.ascii	"vmcu_ioctl\000"
	.type	__func__.38139, %object
	.size	__func__.38139, 10
__func__.38139:
	.ascii	"vmcu_open\000"
	.type	__func__.38062, %object
	.size	__func__.38062, 16
__func__.38062:
	.ascii	"mcu_wrap_config\000"
	.type	__func__.38076, %object
	.size	__func__.38076, 15
__func__.38076:
	.ascii	"mcu_wrap_start\000"
	.type	__func__.38083, %object
	.size	__func__.38083, 13
__func__.38083:
	.ascii	"mcu_wrap_end\000"
	.type	__func__.38165, %object
	.size	__func__.38165, 11
__func__.38165:
	.ascii	"vmcu_probe\000"
	.space	2
	.type	vmcu_ioctls, %object
	.size	vmcu_ioctls, 20
vmcu_ioctls:
	.word	-1068733184
	.word	0
	.word	vmcu_version
	.word	.LC22
	.word	0
	.type	vmcu_driver_fops, %object
	.size	vmcu_driver_fops, 128
vmcu_driver_fops:
	.word	0
	.space	4
	.word	vmcu_read
	.space	24
	.word	0
	.word	vmcu_ioctl
	.word	vmcu_compat_ioctl
	.word	0
	.space	4
	.word	vmcu_open
	.space	4
	.word	vmcu_release
	.space	60
	.type	__param_str_isp_max_h, %object
	.size	__param_str_isp_max_h, 17
__param_str_isp_max_h:
	.ascii	"rockit.isp_max_h\000"
	.type	__param_str_isp_max_w, %object
	.size	__param_str_isp_max_w, 17
__param_str_isp_max_w:
	.ascii	"rockit.isp_max_w\000"
	.type	__param_str_mcu_fw_addr, %object
	.size	__param_str_mcu_fw_addr, 19
__param_str_mcu_fw_addr:
	.ascii	"rockit.mcu_fw_addr\000"
	.type	__param_str_mcu_fw_path, %object
	.size	__param_str_mcu_fw_path, 19
__param_str_mcu_fw_path:
	.ascii	"rockit.mcu_fw_path\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	mcu_fw_addr, %object
	.size	mcu_fw_addr, 4
mcu_fw_addr:
	.word	-9441280
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_vmcu_dev, %object
	.size	g_vmcu_dev, 252
g_vmcu_dev:
	.space	252
	.type	isp_max_w, %object
	.size	isp_max_w, 4
isp_max_w:
	.space	4
	.type	isp_max_h, %object
	.size	isp_max_h, 4
isp_max_h:
	.space	4
	.type	mcu_fw_path, %object
	.size	mcu_fw_path, 4
mcu_fw_path:
	.space	4
	.section	.init.rodata,"a"
	.type	__setup_str_isp_max_h_setup, %object
	.size	__setup_str_isp_max_h_setup, 10
__setup_str_isp_max_h_setup:
	.ascii	"rk_cam_h=\000"
	.type	__setup_str_isp_max_w_setup, %object
	.size	__setup_str_isp_max_w_setup, 10
__setup_str_isp_max_w_setup:
	.ascii	"rk_cam_w=\000"
	.section	.init.setup,"aw"
	.align	2
	.type	__setup_isp_max_h_setup, %object
	.size	__setup_isp_max_h_setup, 12
__setup_isp_max_h_setup:
	.word	__setup_str_isp_max_h_setup
	.word	isp_max_h_setup
	.word	0
	.type	__setup_isp_max_w_setup, %object
	.size	__setup_isp_max_w_setup, 12
__setup_isp_max_w_setup:
	.word	__setup_str_isp_max_w_setup
	.word	isp_max_w_setup
	.word	0
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_isp_max_htype230, %object
	.size	__UNIQUE_ID_isp_max_htype230, 31
__UNIQUE_ID_isp_max_htype230:
	.ascii	"rockit.parmtype=isp_max_h:uint\000"
	.type	__UNIQUE_ID_isp_max_wtype229, %object
	.size	__UNIQUE_ID_isp_max_wtype229, 31
__UNIQUE_ID_isp_max_wtype229:
	.ascii	"rockit.parmtype=isp_max_w:uint\000"
	.type	__UNIQUE_ID_mcu_fw_addrtype228, %object
	.size	__UNIQUE_ID_mcu_fw_addrtype228, 33
__UNIQUE_ID_mcu_fw_addrtype228:
	.ascii	"rockit.parmtype=mcu_fw_addr:uint\000"
	.type	__UNIQUE_ID_mcu_fw_pathtype227, %object
	.size	__UNIQUE_ID_mcu_fw_pathtype227, 34
__UNIQUE_ID_mcu_fw_pathtype227:
	.ascii	"rockit.parmtype=mcu_fw_path:charp\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct vmcu_version mismatching\033[0m\000"
.LC1:
	.ascii	"\033[1;32mvmcu refcnt %d\033[0m\000"
.LC2:
	.ascii	"vmcu_ioctl: nr = %d, index = %d dev = %p\000"
.LC3:
	.ascii	"\033[1;31mindex = %d\033[0m\000"
.LC4:
	.ascii	"\033[1;31mioctl is null\033[0m\000"
.LC5:
	.ascii	"dvbm en = %x,  line_cnt = %x,  read1 = %x, read2 = "
	.ascii	"%x, 0x308 = %x\000"
.LC6:
	.ascii	"[%x]: %x\000"
.LC7:
	.ascii	"\033[1;31mvalloc open fail\033[0m\000"
.LC8:
	.ascii	"\033[1;32mconfig_addr=%p, isp_max_h=%d\033[0m\000"
.LC9:
	.ascii	"\033[1;32misp line = %08x, enc_line = %08x\033[0m\000"
.LC10:
	.ascii	"\033[1;32mg_vmcu_dev.plog_buf->paddr = %x, wrap_lin"
	.ascii	"e = %d\033[0m\000"
.LC11:
	.ascii	"\033[1;32msend wrap start\033[0m\000"
.LC12:
	.ascii	"\033[1;31misp input height config err, config h= %d"
	.ascii	", real h = %d\033[0m\000"
.LC13:
	.ascii	"\033[1;32msend wrap end\033[0m\000"
.LC14:
	.ascii	"\033[1;32mmcu status is not reset = %08x, please ch"
	.ascii	"eck\033[0m\000"
.LC15:
	.ascii	"valloc\000"
.LC16:
	.ascii	"\033[1;31mgetting alloc fail %p\033[0m\000"
.LC17:
	.ascii	"\033[1;32mopen fp = %p\033[0m\000"
.LC18:
	.ascii	"\033[1;32msize = %d, pos = %d\033[0m\000"
.LC19:
	.ascii	"mcu\000"
.LC20:
	.ascii	"\033[1;32mlog buf = %08x, len = %d\033[0m\000"
.LC21:
	.ascii	"vmcu\000"
.LC22:
	.ascii	"VMCU_IOCTL_VERSION\000"
	.section	__param,"a"
	.align	2
	.type	__param_isp_max_h, %object
	.size	__param_isp_max_h, 20
__param_isp_max_h:
	.word	__param_str_isp_max_h
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	isp_max_h
	.type	__param_isp_max_w, %object
	.size	__param_isp_max_w, 20
__param_isp_max_w:
	.word	__param_str_isp_max_w
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	isp_max_w
	.type	__param_mcu_fw_addr, %object
	.size	__param_mcu_fw_addr, 20
__param_mcu_fw_addr:
	.word	__param_str_mcu_fw_addr
	.word	0
	.word	param_ops_uint
	.short	256
	.byte	-1
	.byte	0
	.word	mcu_fw_addr
	.type	__param_mcu_fw_path, %object
	.size	__param_mcu_fw_path, 20
__param_mcu_fw_path:
	.word	__param_str_mcu_fw_path
	.word	0
	.word	param_ops_charp
	.short	256
	.byte	-1
	.byte	0
	.word	mcu_fw_path
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
