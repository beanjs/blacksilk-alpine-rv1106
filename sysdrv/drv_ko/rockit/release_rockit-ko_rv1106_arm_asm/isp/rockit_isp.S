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
	.file	"rockit_isp.c"
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
	.type	rockit_rkisp_ioctl, %function
rockit_rkisp_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_ioctl, .-rockit_rkisp_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_open, %function
rockit_rkisp_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_open, .-rockit_rkisp_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_buf_que, %function
rockit_rkisp_buf_que:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r1
	.pad #20
	sub	sp, sp, #20
	mov	r6, r0
	cmp	r0, #0
	beq	.L4
	ldr	r4, [r0, #288]
	cmp	r4, #0
	beq	.L15
	ldrb	r0, [r4]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L4
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r9, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	fp, .L22+8
	movs	r5, #0
.L5:
	movs	r1, #0
	mov	r0, r6
	bl	mpi_node_request_buf
	mov	r7, r0
	cmp	r0, #0
	beq	.L11
	ldr	r3, [r7]
	movs	r1, #5
	ldr	r2, .L22
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [r6]
	str	r3, [sp, #8]
	ldr	r3, [r6, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movs	r3, #219
	str	r3, [sp]
	ldr	r3, .L22+4
	bl	vlog
	adds	r1, r4, #4
	movs	r3, #0
.L9:
	ldr	r2, [r1, r3, lsl #3]
	cbz	r2, .L6
	ldr	r0, [r2]
	ldr	r2, [r7]
	cmp	r0, r2
	bne	.L21
.L7:
	add	r10, r4, r3, lsl #3
	movs	r2, #1
	strb	r2, [r10, #8]
	ldr	r1, [r6, #56]
	strb	r2, [r4, #48]
	strd	r6, r7, [r4, #80]
	str	r1, [r4, #72]
	ldr	r2, [r7]
	str	r2, [r4, #64]
	ldr	r2, [r7, #448]
	str	r2, [r4, #100]
	ldr	r2, [r6, #44]
	ldr	r2, [r2, #44]
	str	r2, [r4, #52]
	ldr	r2, [fp]
	cbnz	r2, .L10
.L12:
	adds	r5, r5, #1
	cmp	r5, r8
	bne	.L5
.L11:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r9	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r0, r5, #0
	it	ne
	movne	r0, #1
.L4:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L6:
	add	r2, r4, r3, lsl #3
	str	r7, [r2, #4]
	b	.L7
.L21:
	adds	r3, r3, #1
	cmp	r3, #5
	bne	.L9
	b	.L7
.L10:
	add	r0, r4, #48
	blx	r2
	cmp	r0, #0
	bge	.L12
	movs	r2, #0
	mov	r0, r7
	strb	r2, [r10, #8]
	strb	r2, [r4, #1]
	bl	mpi_obj_unref
	ldr	r3, [r4, #100]
	cmp	r3, #0
	beq	.L12
	b	.L11
.L15:
	mov	r0, r4
	b	.L4
.L23:
	.align	2
.L22:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LANCHOR1
	.fnend
	.size	rockit_rkisp_buf_que, .-rockit_rkisp_buf_que
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	isp_destroy_ctx, %function
isp_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	kfree
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	isp_destroy_ctx, .-isp_destroy_ctx
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_handle_message, %function
rockit_rkisp_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	ldr	r3, [r0, #8]
	cmp	r3, #1
	bne	.L26
	cbnz	r0, .L27
	mov	r3, #266
	ldr	r2, .L51
	str	r3, [sp]
	ldr	r3, .L51+4
.L49:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L26:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L27:
	ldr	r4, [r0, #288]
	cbz	r4, .L28
	cmp	r1, #5
	beq	.L29
	cmp	r1, #6
	beq	.L30
	cmp	r1, #0
	bne	.L26
	ldrb	r2, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L26
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L26
	mov	r1, r3
	bl	rockit_rkisp_buf_que
	b	.L26
.L28:
	movw	r3, #275
	ldr	r2, .L51+8
	str	r3, [sp]
	ldr	r3, .L51+4
	b	.L49
.L29:
	strb	r3, [r4]
	ldr	r4, .L51+12
.L32:
	movs	r1, #5
	mov	r0, r5
	bl	rockit_rkisp_buf_que
	cbnz	r0, .L33
	movs	r0, #100
	bl	msleep
	mov	r0, r4
	bl	printk
	b	.L32
.L33:
	ldr	r0, .L51+16
.L50:
	bl	printk
	b	.L26
.L30:
	movs	r3, #0
	add	r6, r4, #40
	mov	r5, r3
	strb	r3, [r4]
.L35:
	ldr	r0, [r4, #4]
	cbz	r0, .L34
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	cbz	r3, .L34
	bl	mpi_obj_unref
	str	r5, [r4, #4]
.L34:
	adds	r4, r4, #8
	cmp	r4, r6
	bne	.L35
	ldr	r0, .L51+20
	b	.L50
.L52:
	.align	2
.L51:
	.word	.LC1
	.word	.LANCHOR0+21
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.fnend
	.size	rockit_rkisp_handle_message, .-rockit_rkisp_handle_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_compat_ioctl, %function
rockit_rkisp_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_compat_ioctl, .-rockit_rkisp_compat_ioctl
	.align	1
	.global	rockit_rkisp_mpibuf_done
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_mpibuf_done, %function
rockit_rkisp_mpibuf_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r4, r0
	cbnz	r0, .L55
	movs	r3, #102
	ldr	r2, .L102
	str	r3, [sp]
	ldr	r3, .L102+4
.L100:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L90:
	movs	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L55:
	ldr	r7, [r0, #32]
	cbnz	r7, .L57
	ldr	r2, .L102+8
	ldr	r3, [r2, #4]
	cmp	r3, #9
	add	r1, r3, #1
	str	r1, [r2, #4]
	bgt	.L90
	movs	r3, #107
	ldr	r2, .L102+12
	str	r3, [sp]
	ldr	r3, .L102+4
	b	.L100
.L57:
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	ldr	r8, [r7, #288]
	cbz	r1, .L59
	movs	r1, #1
	mov	r0, r7
	bl	rockit_rkisp_buf_que
	cbz	r0, .L60
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	strb	r3, [r8, #1]
.L60:
	movs	r3, #0
	strb	r3, [r4, #2]
	b	.L90
.L59:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L61
	mov	r0, r7
	bl	mpi_node_request_buf
	mov	r5, r0
.L62:
	cmp	r5, #0
	beq	.L90
	ldr	r3, [r4, #64]
	movs	r6, #0
	str	r3, [r5, #624]
	ldr	r3, [r4, #60]
	str	r3, [r5, #620]
	ldr	r3, .L102+16
	ldr	r2, [r4, #80]
	sub	r9, r3, #72
.L65:
	ldr	r1, [r3, r6, lsl #3]
	cmp	r2, r1
	beq	.L64
	adds	r6, r6, #1
	cmp	r6, #24
	bne	.L65
	movs	r3, #138
	ldr	r2, .L102+20
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L102+4
	movs	r0, #8
	bl	vlog
.L64:
	add	r6, r9, r6, lsl #3
	mov	r2, #1000
	ldr	r3, [r6, #76]
	str	r3, [r5, #640]
	ldr	r3, [r4, #68]
	str	r3, [r5, #628]
	ldr	r3, [r4, #72]
	str	r3, [r5, #632]
	add	r3, sp, #12
	ldrd	r0, [r4, #104]
	bl	div_s64_rem
	strd	r0, [r5, #672]
	ldr	r3, [r4, #100]
	str	r3, [r5, #668]
	ldr	r3, [r4, #28]
	str	r3, [r5, #584]
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	cbz	r2, .L67
	orr	r3, r3, #4
.L68:
	str	r3, [r5, #584]
	movs	r2, #0
	mov	r1, r5
	mov	r0, r7
	bl	mpi_node_buffer_out
	mov	r3, sp
	bic	r2, r3, #8160
	bic	r2, r2, #31
	ldr	r3, [r2, #4]
	bic	r3, r3, #-16777216
	bic	r3, r3, #255
	cbnz	r3, .L69
.L72:
	ldr	r3, [r5, #448]
	cbnz	r3, .L99
.L101:
	mov	r0, r5
	bl	mpi_obj_unref
	b	.L90
.L61:
	ldr	r5, [r0, #36]
	b	.L62
.L67:
	orr	r3, r3, #2
	b	.L68
.L69:
	ldr	r3, [r2, #4]
	tst	r3, #983040
	bne	.L72
	ldr	r0, .L102+24
	movs	r6, #11
	bl	printk
	ldr	r9, .L102+28
	ldr	r10, .L102+32
.L73:
	subs	r6, r6, #1
	beq	.L72
	ldr	r3, [r9, #4]
	mov	r0, r10
	blx	r3
	b	.L73
.L99:
	cmp	r8, #0
	beq	.L101
	add	r1, r8, #4
	movs	r3, #0
.L75:
	ldr	r2, [r1, r3, lsl #3]
	cbz	r2, .L76
	ldr	r0, [r5]
	ldr	r2, [r2]
	cmp	r0, r2
	bne	.L76
	add	r3, r8, r3, lsl #3
	movs	r2, #0
	strb	r2, [r3, #8]
.L77:
	mov	r0, r5
	bl	mpi_obj_unref
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cbz	r3, .L78
	movs	r1, #1
	mov	r0, r7
	bl	rockit_rkisp_buf_que
	cbz	r0, .L78
	movs	r3, #0
	strb	r3, [r4, #1]
	b	.L90
.L76:
	adds	r3, r3, #1
	cmp	r3, #5
	bne	.L75
	b	.L77
.L78:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	strb	r3, [r8, #1]
	b	.L90
.L103:
	.align	2
.L102:
	.word	.LC6
	.word	.LANCHOR0+47
	.word	.LANCHOR1
	.word	.LC7
	.word	.LANCHOR0+72
	.word	.LC9
	.word	.LC8
	.word	arm_delay_ops
	.word	214748000
	.fnend
	.size	rockit_rkisp_mpibuf_done, .-rockit_rkisp_mpibuf_done
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	isp_create_ctx, %function
isp_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L105
	mov	r1, #3520
	ldr	r0, [r3, #48]
	b	kmem_cache_alloc
.L106:
	.align	2
.L105:
	.word	kmalloc_caches
	.fnend
	.size	isp_create_ctx, .-isp_create_ctx
	.align	1
	.global	rockit_rkisp_dev_register
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_dev_register, %function
rockit_rkisp_dev_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #3264
	ldr	r6, .L124
	mov	r8, r0
	mov	r9, #0
	mov	r10, #1
	mov	fp, r9
	ldr	r0, [r6, #8]
	bl	kmem_cache_alloc
	movs	r2, #164
	movs	r1, #0
	mov	r4, r0
	bl	memset
	ldr	r3, .L124+4
	add	r7, r4, #60
	str	r7, [r4, #60]
	str	r7, [r4, #64]
	str	r3, [r4, #68]
	ldr	r3, .L124+8
	str	r3, [r4, #76]
	movs	r3, #2
	strd	r3, r3, [r4, #48]
	movs	r3, #3
	str	r3, [r4, #56]
.L108:
	ldr	r2, [r4, #52]
	ldr	r0, [r6, #20]
	cmp	r2, fp
	bgt	.L112
	ldr	r2, [r4, #48]
	add	r9, r9, #1
	cmp	r2, r9
	bgt	.L117
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cbz	r0, .L115
	mov	r3, #-1
	movs	r1, #2
	str	r3, [r0, #16]
	strd	r1, r3, [r0, #8]
	mov	r1, #3520
	ldr	r0, [r6, #20]
	bl	kmem_cache_alloc
	str	r0, [r5, #20]
	cbz	r0, .L115
	movs	r3, #16
	movs	r2, #1
	strd	r3, r3, [r0, #8]
	strd	r2, r3, [r0]
	str	r3, [r0, #16]
	ldr	r3, [r4, #64]
	str	r5, [r4, #64]
	strd	r7, r3, [r5]
	str	r5, [r3]
.L115:
	mov	r2, r8
	movs	r1, #8
	mov	r0, r4
	bl	mpi_dev_register
	ldr	r3, .L124+12
	mov	r0, r4
	ldr	r1, .L124+16
	str	r3, [r4, #80]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpi_sysfs_dev_add
.L112:
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cmp	r0, #0
	beq	.L110
	strd	r10, r9, [r0, #8]
	mov	r1, #3520
	str	fp, [r0, #16]
	ldr	r0, [r6, #4]
	bl	kmem_cache_alloc
	str	r0, [r5, #20]
	cbz	r0, .L110
	mov	r2, #2160
	mov	r3, #3840
	strd	r3, r2, [r0, #8]
	movs	r2, #4
	str	r2, [r0, #36]
	ldr	r2, [r0, #64]
	str	r10, [r0, #32]
	orr	r2, r2, #3
	str	r2, [r0, #64]
	ldr	r2, [r0, #68]
	strd	r10, r10, [r0, #40]
	orr	r2, r2, #3
	str	r2, [r0, #68]
	ldr	r2, [r0, #56]
	orr	r2, r2, #3
	str	r2, [r0, #56]
	ldr	r2, [r0, #60]
	orr	r2, r2, #3
	str	r2, [r0, #60]
	ldr	r2, [r0, #72]
	orr	r2, r2, #3
	str	r2, [r0, #72]
	ldr	r2, [r0, #76]
	orr	r2, r2, #14
	str	r2, [r0, #76]
	ldr	r2, [r4, #64]
	str	r5, [r4, #64]
	strd	r7, r2, [r5]
	str	r5, [r2]
.L110:
	add	fp, fp, #1
	b	.L108
.L117:
	mov	fp, #0
	b	.L108
.L125:
	.align	2
.L124:
	.word	kmalloc_caches
	.word	isp_create_ctx
	.word	isp_destroy_ctx
	.word	rockit_rkisp_handle_message
	.word	.LANCHOR0+264
	.fnend
	.size	rockit_rkisp_dev_register, .-rockit_rkisp_dev_register
	.section	.init.text,"ax",%progbits
	.align	1
	.global	rockit_rkisp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_init, %function
rockit_rkisp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	movs	r4, #0
	ldr	r5, .L133
	.pad #20
	sub	sp, sp, #20
	mov	r1, r4
	strd	r4, r4, [sp, #4]
	ldr	r0, [r5]
	str	r4, [sp, #12]
	bl	rkisp_rockit_function_register
	movs	r1, #1
	str	r0, [r5]
	ldr	r0, .L133+4
	bl	rkisp_rockit_function_register
	add	r0, sp, #4
	bl	rkisp_rockit_get_ispdev
	add	r5, sp, #4
.L128:
	ldr	r0, [r5], #4
	cbz	r0, .L127
	bl	rockit_rkisp_dev_register
.L127:
	adds	r4, r4, #1
	cmp	r4, #3
	bne	.L128
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L134:
	.align	2
.L133:
	.word	.LANCHOR1
	.word	rockit_rkisp_mpibuf_done
	.fnend
	.size	rockit_rkisp_init, .-rockit_rkisp_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	rockit_rkisp_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_exit, %function
rockit_rkisp_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	add	r0, sp, #4
	movs	r3, #0
	strd	r3, r3, [sp, #4]
	str	r3, [sp, #12]
	bl	rkisp_rockit_get_ispdev
	mov	r5, r0
	cbnz	r0, .L135
	add	r4, sp, #4
.L140:
	ldr	r0, [r4], #4
	cbz	r0, .L138
	bl	mpi_dev_find_by_name
	cbz	r0, .L138
	bl	mpi_dev_unregister
.L138:
	adds	r5, r5, #1
	cmp	r5, #3
	bne	.L140
.L135:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
	.fnend
	.size	rockit_rkisp_exit, .-rockit_rkisp_exit
	.global	rockit_buf_que
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.40990, %object
	.size	__func__.40990, 21
__func__.40990:
	.ascii	"rockit_rkisp_buf_que\000"
	.type	__func__.41011, %object
	.size	__func__.41011, 26
__func__.41011:
	.ascii	"rockit_rkisp_node_message\000"
	.type	__func__.40967, %object
	.size	__func__.40967, 25
__func__.40967:
	.ascii	"rockit_rkisp_mpibuf_done\000"
	.type	v4l2_rockit_fmt, %object
	.size	v4l2_rockit_fmt, 192
v4l2_rockit_fmt:
	.word	842094158
	.word	0
	.word	909203022
	.word	2
	.word	1345466932
	.word	7
	.word	1448695129
	.word	9
	.word	1498831189
	.word	10
	.word	875836505
	.word	14
	.word	1431918169
	.word	17
	.word	1498765654
	.word	18
	.word	1346520914
	.word	65536
	.word	1329743698
	.word	65538
	.word	875836498
	.word	65540
	.word	825770306
	.word	131072
	.word	1196573255
	.word	131073
	.word	1195528775
	.word	131074
	.word	1111967570
	.word	131075
	.word	808535874
	.word	131076
	.word	808534599
	.word	131077
	.word	808534338
	.word	131078
	.word	808535890
	.word	131079
	.word	842090306
	.word	131080
	.word	842089031
	.word	131081
	.word	842088770
	.word	131082
	.word	842090322
	.word	131083
	.word	844257602
	.word	131085
	.type	rockit_rkisp_driver_fops, %object
	.size	rockit_rkisp_driver_fops, 128
rockit_rkisp_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	rockit_rkisp_ioctl
	.word	rockit_rkisp_compat_ioctl
	.word	0
	.space	4
	.word	rockit_rkisp_open
	.space	4
	.word	0
	.space	60
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rockit_buf_que, %object
	.size	rockit_buf_que, 4
rockit_buf_que:
	.space	4
	.type	__func____LINE__.40968, %object
	.size	__func____LINE__.40968, 4
__func____LINE__.40968:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"vvi(%s-%d) processing, bufs: %d\000"
.LC1:
	.ascii	"\033[1;31merr:node null\033[0m\000"
.LC2:
	.ascii	"\033[1;31merr: ctx is null\033[0m\000"
.LC3:
	.ascii	"rkisp queue buf fail\000"
.LC4:
	.ascii	"rkisp queue buf done\000"
.LC5:
	.ascii	"rockit isp stream off\000"
.LC6:
	.ascii	"\033[1;31merr, rockit_cfg null\033[0m\000"
.LC7:
	.ascii	"\033[1;31merr, node null\033[0m\000"
.LC8:
	.ascii	"wait 10 ms\000"
.LC9:
	.ascii	"\033[1;31mthe format is not find!\033[0m\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
