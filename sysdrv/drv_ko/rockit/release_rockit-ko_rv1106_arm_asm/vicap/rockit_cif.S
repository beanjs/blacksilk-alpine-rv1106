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
	.file	"rockit_cif.c"
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
	.type	rockit_rkcif_ioctl, %function
rockit_rkcif_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkcif_ioctl, .-rockit_rkcif_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkcif_open, %function
rockit_rkcif_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkcif_open, .-rockit_rkcif_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkcif_buf_que, %function
rockit_rkcif_buf_que:
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
	ldr	r5, [r0, #288]
	cmp	r5, #0
	beq	.L14
	ldrb	r0, [r5]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L4
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r9, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	fp, .L23+8
	movs	r7, #0
.L5:
	movs	r1, #0
	mov	r0, r6
	bl	mpi_node_request_buf
	mov	r4, r0
	cmp	r0, #0
	beq	.L11
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L23
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [r6]
	str	r3, [sp, #8]
	ldr	r3, [r6, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movs	r3, #208
	str	r3, [sp]
	ldr	r3, .L23+4
	bl	vlog
	adds	r1, r5, #4
	movs	r3, #0
.L9:
	ldr	r2, [r1, r3, lsl #3]
	cbz	r2, .L6
	ldr	r0, [r2]
	ldr	r2, [r4]
	cmp	r0, r2
	bne	.L22
.L7:
	add	r10, r5, r3, lsl #3
	movs	r2, #1
	strb	r2, [r10, #8]
	ldr	r1, [r6, #56]
	strd	r6, r4, [r5, #76]
	strb	r2, [r5, #48]
	str	r1, [r5, #64]
	ldr	r2, [r4]
	str	r2, [r5, #60]
	ldr	r2, [r4, #448]
	str	r2, [r5, #108]
	ldr	r2, [r6, #44]
	ldr	r2, [r2, #44]
	str	r2, [r5, #52]
	ldr	r2, [fp]
	cbz	r2, .L10
	add	r0, r5, #48
	blx	r2
	cmp	r0, #0
	bge	.L10
	movs	r2, #0
	mov	r0, r4
	strb	r2, [r10, #8]
	strb	r2, [r5, #1]
	bl	mpi_obj_unref
.L11:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r9	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r0, r4, #0
	it	ne
	movne	r0, #1
.L4:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L6:
	add	r2, r5, r3, lsl #3
	str	r4, [r2, #4]
	b	.L7
.L22:
	adds	r3, r3, #1
	cmp	r3, #5
	bne	.L9
	b	.L7
.L10:
	adds	r7, r7, #1
	cmp	r7, r8
	bne	.L5
	b	.L11
.L14:
	mov	r0, r5
	b	.L4
.L24:
	.align	2
.L23:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LANCHOR1
	.fnend
	.size	rockit_rkcif_buf_que, .-rockit_rkcif_buf_que
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	cif_destroy_ctx, %function
cif_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	kfree
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	cif_destroy_ctx, .-cif_destroy_ctx
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkcif_handle_message, %function
rockit_rkcif_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r5, r0
	ldr	r3, [r0, #8]
	cmp	r3, #1
	bne	.L27
	cbnz	r0, .L28
	mov	r3, #266
	ldr	r2, .L53
	str	r3, [sp]
	ldr	r3, .L53+4
.L51:
	movs	r1, #2
.L52:
	movs	r0, #8
	bl	vlog
.L27:
	movs	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L28:
	ldr	r4, [r0, #288]
	cbz	r4, .L29
	cmp	r1, #5
	beq	.L30
	cmp	r1, #6
	beq	.L31
	cmp	r1, #0
	bne	.L27
	ldrb	r2, [r4]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L27
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L27
	mov	r1, r3
	bl	rockit_rkcif_buf_que
	b	.L27
.L29:
	mov	r3, #274
	ldr	r2, .L53+8
	str	r3, [sp]
	ldr	r3, .L53+4
	b	.L51
.L30:
	ldr	r2, [r0, #80]
	ldrd	r7, r8, [r2, #4]
	ldr	r6, [r2, #24]
	ldr	r2, [r0, #44]
	movs	r0, #8
	ldr	r2, [r2, #44]
	str	r2, [r4, #52]
	strb	r3, [r4], #48
	mov	r3, #294
	ldr	r2, .L53+12
	str	r3, [sp]
	ldr	r3, .L53+4
	bl	vlog
	ldr	r2, .L53+16
	movs	r3, #0
.L34:
	add	r1, r2, r3, lsl #3
	ldr	r1, [r1, #4]
	cmp	r6, r1
	beq	.L33
	adds	r3, r3, #1
	cmp	r3, #24
	bne	.L34
.L33:
	ldr	r9, .L53+44
	mov	r2, r8
	mov	r1, r7
	mov	r0, r4
	add	r3, r9, r3, lsl #3
	ldr	r10, [r3, #48]
	mov	r3, r10
	bl	rkcif_rockit_config_stream
	mov	r3, #296
	ldr	r2, .L53+20
	movs	r1, #5
	movs	r0, #8
	str	r3, [sp]
	add	r3, r9, #21
	strd	r6, r10, [sp, #4]
	bl	vlog
	ldr	r2, .L53+24
	movw	r3, #297
	movs	r1, #5
	movs	r0, #8
	str	r3, [sp]
	add	r3, r9, #21
	bl	vlog
	movs	r1, #5
	mov	r0, r5
	bl	rockit_rkcif_buf_que
	ldr	r2, .L53+28
	movs	r1, #5
	movw	r3, #299
	movs	r0, #8
	str	r3, [sp]
	add	r3, r9, #21
	bl	vlog
	mov	r0, r4
	bl	rkcif_rockit_resume_stream
	movw	r3, #301
	ldr	r2, .L53+32
	movs	r1, #5
	str	r3, [sp]
	add	r3, r9, #21
	b	.L52
.L31:
	mov	r3, #306
	movs	r6, #0
	ldr	r2, .L53+36
	movs	r1, #5
	strb	r6, [r4]
	movs	r0, #8
	str	r3, [sp]
	add	r7, r4, #40
	ldr	r3, .L53+4
	mov	r5, r4
	bl	vlog
.L36:
	ldr	r0, [r5, #4]
	cbz	r0, .L35
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cbz	r3, .L35
	bl	mpi_obj_unref
	str	r6, [r5, #4]
.L35:
	adds	r5, r5, #8
	cmp	r5, r7
	bne	.L36
	mov	r3, #314
	ldr	r2, .L53+40
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L53+4
	movs	r0, #8
	bl	vlog
	add	r0, r4, #48
	bl	rkcif_rockit_pause_stream
	b	.L27
.L54:
	.align	2
.L53:
	.word	.LC1
	.word	.LANCHOR0+21
	.word	.LC2
	.word	.LC3
	.word	.LANCHOR0+48
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LANCHOR0
	.fnend
	.size	rockit_rkcif_handle_message, .-rockit_rkcif_handle_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkcif_compat_ioctl, %function
rockit_rkcif_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkcif_compat_ioctl, .-rockit_rkcif_compat_ioctl
	.align	1
	.global	rockit_rkcif_mpibuf_done
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkcif_mpibuf_done, %function
rockit_rkcif_mpibuf_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	.pad #44
	sub	sp, sp, #44
	cbnz	r0, .L57
	movs	r3, #102
	ldr	r2, .L87
	str	r3, [sp]
	ldr	r3, .L87+4
.L86:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L78:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L57:
	ldr	r7, [r0, #28]
	cbnz	r7, .L59
	movs	r3, #107
	ldr	r2, .L87+8
	str	r3, [sp]
	ldr	r3, .L87+4
	b	.L86
.L59:
	ldr	r8, [r7, #288]
	cmp	r8, #0
	bne	.L60
	movs	r3, #115
	ldr	r2, .L87+12
	str	r3, [sp]
	ldr	r3, .L87+4
	b	.L86
.L60:
	ldrb	r6, [r0, #2]	@ zero_extendqisi2
	cbz	r6, .L61
	movs	r1, #1
	mov	r0, r7
	bl	rockit_rkcif_buf_que
	movs	r3, #0
	strb	r3, [r4, #2]
	b	.L78
.L61:
	ldr	r5, [r0, #32]
	cmp	r5, #0
	beq	.L78
	ldr	r3, [r0, #72]
	str	r3, [r5, #624]
	ldr	r3, [r0, #68]
	str	r3, [r5, #620]
	ldr	r3, .L87+16
	ldr	r2, [r0, #88]
	sub	r9, r3, #48
.L63:
	ldr	r1, [r3, r6, lsl #3]
	cmp	r2, r1
	beq	.L62
	adds	r6, r6, #1
	cmp	r6, #24
	bne	.L63
	movs	r3, #137
	ldr	r2, .L87+20
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L87+4
	movs	r0, #8
	bl	vlog
.L62:
	add	r6, r9, r6, lsl #3
	mov	r2, #1000
	ldr	r3, [r6, #52]
	movs	r6, #0
	str	r3, [r5, #640]
	ldr	r3, [r4, #76]
	str	r3, [r5, #628]
	ldr	r3, [r4, #80]
	str	r3, [r5, #632]
	add	r3, sp, #36
	ldrd	r0, [r4, #112]
	bl	div_s64_rem
	ldr	r2, .L87+24
	strd	r0, [r5, #672]
	ldr	r3, [r4, #108]
	str	r3, [r5, #668]
	ldr	r3, [r4, #20]
	str	r3, [r5, #584]
	strd	r0, [sp, #16]
	movs	r1, #5
	str	r3, [sp, #24]
	movs	r0, #8
	ldr	r3, [r4, #80]
	str	r3, [sp, #8]
	ldr	r3, [r4, #76]
	str	r3, [sp, #4]
	movs	r3, #149
	str	r3, [sp]
	ldr	r3, .L87+4
	bl	vlog
	str	r6, [r5, #608]
	mov	r2, r6
	mov	r1, r5
	mov	r0, r7
	bl	mpi_node_buffer_out
	ldr	r3, [r5, #448]
	cbnz	r3, .L65
	mov	r0, r5
	bl	mpi_obj_unref
	b	.L78
.L65:
	ldr	r10, .L87+4
	mov	r9, r8
	ldr	fp, .L87+28
.L68:
	ldr	r3, [r9, #4]
	mov	r2, fp
	movs	r1, #5
	movs	r0, #8
	strd	r6, r3, [sp, #4]
	movs	r3, #160
	str	r3, [sp]
	mov	r3, r10
	bl	vlog
	ldr	r3, [r9, #4]
	cbz	r3, .L66
	ldr	r2, [r5]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L66
	add	r6, r8, r6, lsl #3
	movs	r3, #0
	strb	r3, [r6, #8]
.L67:
	mov	r0, r5
	bl	mpi_obj_unref
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cbz	r3, .L69
	movs	r1, #1
	mov	r0, r7
	bl	rockit_rkcif_buf_que
	cbz	r0, .L69
	movs	r3, #0
	strb	r3, [r4, #1]
	b	.L78
.L66:
	adds	r6, r6, #1
	add	r9, r9, #8
	cmp	r6, #5
	bne	.L68
	b	.L67
.L69:
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	strb	r3, [r8, #1]
	b	.L78
.L88:
	.align	2
.L87:
	.word	.LC10
	.word	.LANCHOR0+240
	.word	.LC11
	.word	.LC12
	.word	.LANCHOR0+48
	.word	.LC15
	.word	.LC13
	.word	.LC14
	.fnend
	.size	rockit_rkcif_mpibuf_done, .-rockit_rkcif_mpibuf_done
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	cif_create_ctx, %function
cif_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L90
	mov	r1, #3520
	ldr	r0, [r3, #52]
	b	kmem_cache_alloc
.L91:
	.align	2
.L90:
	.word	kmalloc_caches
	.fnend
	.size	cif_create_ctx, .-cif_create_ctx
	.align	1
	.global	rockit_rkcif_dev_register
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkcif_dev_register, %function
rockit_rkcif_dev_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r8, r0
	ldr	r5, .L109
	mov	r1, #3264
	movs	r6, #1
	mov	fp, #0
	mov	r10, fp
	ldr	r0, [r5, #8]
	mov	r9, r5
	bl	kmem_cache_alloc
	movs	r2, #164
	movs	r1, #0
	mov	r4, r0
	bl	memset
	movw	r3, #357
	ldr	r2, .L109+4
	movs	r1, #5
	movs	r0, #8
	add	r7, r4, #60
	str	r7, [r4, #60]
	str	r7, [r4, #64]
	str	r3, [sp]
	str	r8, [sp, #4]
	ldr	r3, .L109+8
	bl	vlog
	ldr	r3, .L109+12
	str	r3, [r4, #68]
	ldr	r3, .L109+16
	str	r3, [r4, #76]
	movs	r3, #2
	strd	r3, r6, [r4, #48]
	ldr	r3, [r4, #56]
	orr	r3, r3, #3
	str	r3, [r4, #56]
.L93:
	ldr	r2, [r4, #52]
	ldr	r0, [r9, #20]
	cmp	r2, r10
	bgt	.L97
	ldr	r3, [r4, #48]
	add	fp, fp, #1
	cmp	r3, fp
	bgt	.L102
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cbz	r0, .L100
	mov	r3, #-1
	movs	r1, #2
	str	r3, [r0, #16]
	strd	r1, r3, [r0, #8]
	mov	r1, #3520
	ldr	r0, [r9, #20]
	bl	kmem_cache_alloc
	str	r0, [r5, #20]
	cbz	r0, .L100
	movs	r3, #16
	movs	r2, #1
	strd	r3, r3, [r0, #8]
	strd	r2, r3, [r0]
	str	r3, [r0, #16]
	ldr	r3, [r4, #64]
	str	r5, [r4, #64]
	strd	r7, r3, [r5]
	str	r5, [r3]
.L100:
	mov	r2, r8
	movs	r1, #8
	mov	r0, r4
	bl	mpi_dev_register
	ldr	r3, .L109+20
	ldr	r1, .L109+24
	mov	r0, r4
	str	r3, [r4, #80]
	bl	mpi_sysfs_dev_add
	mov	r3, #434
	ldr	r2, .L109+28
	movs	r1, #5
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L109+8
	bl	vlog
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L97:
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cmp	r0, #0
	beq	.L95
	strd	r6, fp, [r0, #8]
	mov	r1, #3520
	str	r10, [r0, #16]
	ldr	r0, [r9, #4]
	bl	kmem_cache_alloc
	str	r0, [r5, #20]
	cbz	r0, .L95
	mov	r2, #2160
	mov	r3, #3840
	strd	r3, r2, [r0, #8]
	movs	r2, #4
	str	r2, [r0, #36]
	ldr	r2, [r0, #64]
	str	r6, [r0, #32]
	orr	r2, r2, #3
	str	r2, [r0, #64]
	ldr	r2, [r0, #68]
	strd	r6, r6, [r0, #40]
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
.L95:
	add	r10, r10, #1
	b	.L93
.L102:
	mov	r10, #0
	b	.L93
.L110:
	.align	2
.L109:
	.word	kmalloc_caches
	.word	.LC16
	.word	.LANCHOR0+265
	.word	cif_create_ctx
	.word	cif_destroy_ctx
	.word	rockit_rkcif_handle_message
	.word	.LANCHOR0+292
	.word	.LC17
	.fnend
	.size	rockit_rkcif_dev_register, .-rockit_rkcif_dev_register
	.section	.init.text,"ax",%progbits
	.align	1
	.global	rockit_rkcif_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkcif_init, %function
rockit_rkcif_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movs	r4, #0
	ldr	r5, .L118
	.pad #32
	sub	sp, sp, #32
	mov	r1, r4
	ldr	r7, .L118+4
	strd	r4, r4, [sp, #20]
	movw	r6, #449
	ldr	r0, [r5]
	str	r4, [sp, #28]
	bl	rkcif_rockit_function_register
	movs	r1, #1
	ldr	r8, .L118+12
	str	r0, [r5]
	ldr	r0, .L118+8
	bl	rkcif_rockit_function_register
	add	r0, sp, #20
	bl	rkcif_rockit_get_cifdev
	add	r5, sp, #20
.L113:
	ldr	r0, [r5], #4
	cbz	r0, .L112
	bl	rockit_rkcif_dev_register
	ldr	r3, [r5, #-4]
	mov	r2, r8
	movs	r1, #5
	movs	r0, #8
	strd	r4, r3, [sp, #4]
	mov	r3, r7
	str	r6, [sp]
	bl	vlog
.L112:
	adds	r4, r4, #1
	cmp	r4, #3
	bne	.L113
	movs	r0, #0
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L119:
	.align	2
.L118:
	.word	.LANCHOR1
	.word	.LANCHOR0+420
	.word	rockit_rkcif_mpibuf_done
	.word	.LC18
	.fnend
	.size	rockit_rkcif_init, .-rockit_rkcif_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	rockit_rkcif_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkcif_exit, %function
rockit_rkcif_exit:
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
	bl	rkcif_rockit_get_cifdev
	mov	r5, r0
	cbnz	r0, .L120
	add	r4, sp, #4
.L125:
	ldr	r0, [r4], #4
	cbz	r0, .L123
	bl	mpi_dev_find_by_name
	cbz	r0, .L123
	bl	mpi_dev_unregister
.L123:
	adds	r5, r5, #1
	cmp	r5, #3
	bne	.L125
.L120:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
	.fnend
	.size	rockit_rkcif_exit, .-rockit_rkcif_exit
	.global	rockit_cif_buf_que
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.40985, %object
	.size	__func__.40985, 21
__func__.40985:
	.ascii	"rockit_rkcif_buf_que\000"
	.type	__func__.41019, %object
	.size	__func__.41019, 26
__func__.41019:
	.ascii	"rockit_rkcif_node_message\000"
	.space	1
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
	.type	__func__.40967, %object
	.size	__func__.40967, 25
__func__.40967:
	.ascii	"rockit_rkcif_mpibuf_done\000"
	.type	__func__.41057, %object
	.size	__func__.41057, 26
__func__.41057:
	.ascii	"rockit_rkcif_dev_register\000"
	.space	1
	.type	rockit_rkcif_driver_fops, %object
	.size	rockit_rkcif_driver_fops, 128
rockit_rkcif_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	rockit_rkcif_ioctl
	.word	rockit_rkcif_compat_ioctl
	.word	0
	.space	4
	.word	rockit_rkcif_open
	.space	4
	.word	0
	.space	60
	.type	__func__.41069, %object
	.size	__func__.41069, 18
__func__.41069:
	.ascii	"rockit_rkcif_init\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rockit_cif_buf_que, %object
	.size	rockit_cif_buf_que, 4
rockit_cif_buf_que:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"vvi(%s-%d) processing, bufs: %d\000"
.LC1:
	.ascii	"\033[1;31merr:cif node null\033[0m\000"
.LC2:
	.ascii	"\033[1;31merr:cif node ctx null\033[0m\000"
.LC3:
	.ascii	"MPI_EVENT_STREAM_ON\000"
.LC4:
	.ascii	"fmt index:%d fmt:0x%08x\000"
.LC5:
	.ascii	"rkcif_rockit_config_stream done\000"
.LC6:
	.ascii	"rockit_rkcif_buf_que done\000"
.LC7:
	.ascii	"rkcif_rockit_resume_stream done\000"
.LC8:
	.ascii	"MPI_EVENT_STREAM_OFF\000"
.LC9:
	.ascii	"\033[1;32mrockit cif stream off\033[0m\000"
.LC10:
	.ascii	"\033[1;31merr, rockit_cfg null\033[0m\000"
.LC11:
	.ascii	"\033[1;31merr, node null\033[0m\000"
.LC12:
	.ascii	"\033[1;31mnode->ctx is null\033[0m\000"
.LC13:
	.ascii	"vw:%dvh:%d pts:%lld event:%d\000"
.LC14:
	.ascii	"  %d :%p\000"
.LC15:
	.ascii	"\033[1;31mthe format is not find!\033[0m\000"
.LC16:
	.ascii	"rockit_rkcif_dev_register name = %s\012\000"
.LC17:
	.ascii	"rockit_rkcif_dev_register done\012\000"
.LC18:
	.ascii	"rockit_rkcif_init %d:name = %s\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
