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
	.file	"venc.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vcodec_get_chnl_ctx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_ctx, %function
vcodec_get_chnl_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #288]
	bx	lr
	.fnend
	.size	vcodec_get_chnl_ctx, .-vcodec_get_chnl_ctx
	.align	1
	.global	vcodec_get_chnl_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_id, %function
vcodec_get_chnl_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #56]
	bx	lr
	.fnend
	.size	vcodec_get_chnl_id, .-vcodec_get_chnl_id
	.align	1
	.global	vcodec_get_chnl_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_type, %function
vcodec_get_chnl_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #1
	bx	lr
	.fnend
	.size	vcodec_get_chnl_type, .-vcodec_get_chnl_type
	.align	1
	.global	mpi_buf_get_dmabuf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_get_dmabuf, %function
mpi_buf_get_dmabuf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L5
	ldr	r0, [r0, #448]
.L5:
	bx	lr
	.fnend
	.size	mpi_buf_get_dmabuf, .-mpi_buf_get_dmabuf
	.align	1
	.global	mpi_buffer_pool_get_free_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_get_free_num, %function
mpi_buffer_pool_get_free_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L10
	ldr	r3, [r0, #12]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L11
.L10:
	movs	r0, #1
	bx	lr
.L11:
	ldr	r0, [r0, #68]
	bx	lr
	.fnend
	.size	mpi_buffer_pool_get_free_num, .-mpi_buffer_pool_get_free_num
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_compat_ioctl, %function
venc_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	venc_compat_ioctl, .-venc_compat_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_poll, %function
venc_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r2, r1
	ldr	r4, [r0, #128]
	cbz	r1, .L18
	ldr	r3, [r1]
	cbz	r3, .L18
	addw	r1, r4, #4052
	cbz	r1, .L18
	blx	r3
.L18:
	movw	r3, #4124
	ldr	r3, [r4, r3]
	cmp	r3, #0
	ite	ne
	movne	r0, #65
	moveq	r0, #0
	pop	{r4, pc}
	.fnend
	.size	venc_poll, .-venc_poll
	.align	1
	.global	mpi_buf_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_map, %function
mpi_buf_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L31
	ldr	r0, [r0, #448]
	bl	dma_buf_vmap
	str	r0, [r4, #604]
	mov	r4, r0
.L31:
	mov	r0, r4
	pop	{r4, pc}
	.fnend
	.size	mpi_buf_map, .-mpi_buf_map
	.align	1
	.global	mpi_buf_unmap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_unmap, %function
mpi_buf_unmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L36
	ldr	r1, [r0, #604]
	cbz	r1, .L37
	ldr	r0, [r0, #448]
	cbz	r0, .L37
	bl	dma_buf_vunmap
.L37:
	movs	r3, #0
	str	r3, [r4, #604]
.L36:
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	mpi_buf_unmap, .-mpi_buf_unmap
	.align	1
	.global	venc_node_pp_get_md_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_get_md_attr, %function
venc_node_pp_get_md_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r3, [r1, #4]	@ unaligned
	ldr	r2, [r0, #128]
	cmp	r3, #20
	beq	.L48
	movw	r3, #2047
	ldr	r2, .L57
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L57+4
	movs	r0, #4
	bl	vlog
.L56:
	mov	r0, #-1
.L47:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L48:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #0
	ble	.L50
	movs	r2, #1
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #2052
	ldr	r2, .L57+8
	str	r3, [sp]
	ldr	r3, .L57+4
	bl	vlog
	b	.L56
.L50:
	movw	r3, #31648
	ldr	r0, [r2, r3]
	cmp	r0, #0
	ble	.L51
	movw	r0, #31644
	ldr	r0, [r2, r0]
	cmp	r0, #0
	ble	.L51
	str	r0, [r1, #8]	@ unaligned
	ldr	r3, [r2, r3]
	str	r3, [r1, #12]	@ unaligned
.L52:
	movw	r3, #31652
	movs	r0, #0
	ldr	r3, [r2, r3]
	str	r3, [r1, #16]	@ unaligned
	b	.L47
.L51:
	movw	r3, #4228
	ldr	r0, [r2, r3]
	movs	r3, #0
	cmp	r0, #1
	bne	.L53
	movs	r0, #70
	strb	r0, [r1, #8]
	movs	r0, #3
	strb	r3, [r1, #9]
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
.L55:
	strb	r0, [r1, #12]
	strb	r3, [r1, #13]
	strb	r3, [r1, #14]
	strb	r3, [r1, #15]
	b	.L52
.L53:
	cmp	r0, #2
	bne	.L54
	movs	r4, #50
	strb	r3, [r1, #9]
	strb	r4, [r1, #8]
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
	b	.L55
.L54:
	movs	r0, #30
	strb	r3, [r1, #9]
	strb	r0, [r1, #8]
	movs	r0, #1
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
	b	.L55
.L58:
	.align	2
.L57:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	venc_node_pp_get_md_attr, .-venc_node_pp_get_md_attr
	.align	1
	.global	venc_node_enable_tb
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_enable_tb, %function
venc_node_enable_tb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1]
	ldr	r3, [r0, #128]
	cmp	r2, #15
	ble	.L60
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #2081
	ldr	r2, .L62
	str	r3, [sp]
	ldr	r3, .L62+4
	bl	vlog
	mov	r0, #-1
.L59:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L60:
	add	r3, r3, r2
	movw	r2, #4912
	movs	r1, #1
	movs	r0, #0
	strb	r1, [r3, r2]
	b	.L59
.L63:
	.align	2
.L62:
	.word	.LC1
	.word	.LANCHOR0+25
	.fnend
	.size	venc_node_enable_tb, .-venc_node_enable_tb
	.align	1
	.global	venc_node_tb_bind
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_tb_bind, %function
venc_node_tb_bind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r0, #128]
	ldr	r0, [r1]	@ unaligned
	ldr	r2, [r1, #4]	@ unaligned
	cmp	r0, #15
	bgt	.L65
	cmp	r2, #15
	ble	.L66
.L65:
	movs	r3, #16
	str	r0, [sp, #4]
	strd	r2, r3, [sp, #8]
	movs	r1, #2
	movw	r3, #2097
	ldr	r2, .L68
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L68+4
	bl	vlog
	mov	r0, #-1
.L64:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L66:
	add	r3, r3, r0
	movs	r0, #0
	add	r3, r3, #4928
	strb	r2, [r3]
	b	.L64
.L69:
	.align	2
.L68:
	.word	.LC2
	.word	.LANCHOR0+45
	.fnend
	.size	venc_node_tb_bind, .-venc_node_tb_bind
	.align	1
	.global	venc_node_tb_request
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_tb_request, %function
venc_node_tb_request:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1]
	ldr	r0, [r0, #128]
	cmp	r3, #15
	ble	.L71
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	mov	r3, #2112
	ldr	r2, .L73
	str	r3, [sp]
	ldr	r3, .L73+4
	bl	vlog
	mov	r0, #-1
.L70:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L71:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	addw	r3, r3, #1236
	movs	r1, #1
	str	r1, [r0, r3, lsl #2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L70
.L74:
	.align	2
.L73:
	.word	.LC1
	.word	.LANCHOR0+63
	.fnend
	.size	venc_node_tb_request, .-venc_node_tb_request
	.align	1
	.global	mpi_buf_ref
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_ref, %function
mpi_buf_ref:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	.save {r4, r5, r6}
	cbz	r0, .L75
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L81
	movs	r3, #0
	movs	r1, #12
.L79:
	mul	r2, r1, r3
	ldr	r6, [r2, r5]
	cmp	r6, r0
	bne	.L77
	ldr	r3, .L81+4
	movw	r1, #31664
	add	r3, r3, r2
	ldr	r2, [r3, r1]
	adds	r2, r2, #1
	str	r2, [r3, r1]
.L78:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6}
	b	mpi_obj_ref
.L77:
	adds	r3, r3, #1
	cmp	r3, #512
	bne	.L79
	b	.L78
.L75:
	pop	{r4, r5, r6}
	bx	lr
.L82:
	.align	2
.L81:
	.word	g_venc_dev+31660
	.word	g_venc_dev
	.fnend
	.size	mpi_buf_ref, .-mpi_buf_ref
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_open, %function
venc_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L84
	push	{r3, lr}
	.save {r3, lr}
	str	r0, [r1, #128]
	bl	mpi_obj_ref
	movs	r0, #0
	pop	{r3, pc}
.L85:
	.align	2
.L84:
	.word	g_venc_dev+4
	.fnend
	.size	venc_open, .-venc_open
	.align	1
	.global	mpi_buffer_queue_pop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_pop, %function
mpi_buffer_queue_pop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	mpi_queue_pop_obj
	.fnend
	.size	mpi_buffer_queue_pop, .-mpi_buffer_queue_pop
	.align	1
	.global	mpi_buffer_queue_push
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_push, %function
mpi_buffer_queue_push:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	mpi_queue_push_obj
	pop	{r3, pc}
	.fnend
	.size	mpi_buffer_queue_push, .-mpi_buffer_queue_push
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_venc_node, %function
get_venc_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	movs	r1, #0
	movs	r0, #4
	b	vsys_get_node_from_map
	.fnend
	.size	get_venc_node, .-get_venc_node
	.align	1
	.global	vcodec_set_intra_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_set_intra_info, %function
vcodec_set_intra_info:
	.fnstart
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r0, #15
	.pad #20
	sub	sp, sp, #20
	mov	r5, r0
	mov	r8, r2
	mov	r9, r3
	ldrd	r6, [sp, #56]
	ldr	r10, [sp, #64]
	bls	.L90
	movs	r3, #16
	ldr	r2, .L123
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #926
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L123+4
	bl	vlog
	mov	r0, #-1
.L89:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L90:
	bl	get_venc_node
	cbz	r0, .L92
	ldr	r3, [r0, #116]
	cbz	r3, .L92
	blx	r3
.L92:
	ldr	r4, .L123+8
	ldr	r3, [r4, #224]
	cbz	r3, .L94
	cbz	r5, .L94
	ldr	r3, [r4, #332]
	cbnz	r3, .L94
	add	r3, r4, r5, lsl #4
	ldr	fp, [r3, #3800]
	cmp	fp, #0
	bne	.L94
	bl	mcu_get_wrap_status
	cmp	r0, #2
	bne	.L94
	mov	r3, #936
	str	r5, [sp, #4]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L123+4
	movs	r0, #4
	ldr	r2, .L123+12
	bl	vlog
	mov	r0, fp
	bl	mpp_vcodec_run_task
	cmp	r0, #0
	bne	.L96
	movs	r3, #1
	str	r3, [r4, #332]
.L94:
	cmp	r10, #0
	beq	.L122
	add	r3, r5, #7648
	adds	r3, r3, #6
	ldr	r3, [r4, r3, lsl #2]
	cmp	r3, #9
	beq	.L97
	cmp	r3, #15
	bne	.L98
.L97:
	add	r3, r5, #238
	lsls	r3, r3, #4
	adds	r1, r4, r3
	ldr	r2, [r4, r3]
	cmp	r2, #0
	itttt	gt
	addgt	r2, r2, #-1
	strgt	r2, [r4, r3]
	movgt	r3, #0
	strgt	r3, [r1, #4]
.L98:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	fp, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r2, r4, r5
	movw	r3, #4932
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	movw	r2, #4916
	add	r3, r3, r4
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cbz	r3, .L99
	addw	r10, r5, #1236
	add	r3, r4, r10, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L99
	mov	r3, #800
	movs	r2, #0
	mla	r3, r3, r5, r4
	add	r3, r3, #17792
	adds	r3, r3, #24
.L102:
	ldrd	r0, [r3], #8
	cmp	r1, r7
	it	eq
	cmpeq	r0, r6
	beq	.L100
	orrs	r1, r0, r1
	bne	.L101
	movs	r3, #100
	mla	r5, r3, r5, r2
	addw	r3, r5, #627
	addw	r5, r5, #2227
	add	r3, r4, r3, lsl #3
	add	r5, r4, r5, lsl #3
	strd	r8, [r3]
	strd	r6, [r5]
.L100:
	add	r4, r4, r10, lsl #2
	ldr	r3, [r4, #4]
	subs	r3, r3, #1
	str	r3, [r4, #4]
.L99:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, fp	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L122:
	movs	r0, #0
	b	.L89
.L96:
	mov	r3, #940
	str	r5, [sp, #4]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L123+4
	movs	r0, #4
	ldr	r2, .L123+16
	bl	vlog
	b	.L94
.L101:
	adds	r2, r2, #1
	cmp	r2, #100
	bne	.L102
	movw	r3, #967
	str	r2, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L123+4
	movs	r0, #4
	ldr	r2, .L123+20
	bl	vlog
	b	.L100
.L124:
	.align	2
.L123:
	.word	.LC1
	.word	.LANCHOR0+84
	.word	g_venc_dev
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.fnend
	.size	vcodec_set_intra_info, .-vcodec_set_intra_info
	.align	1
	.global	vcodec_notify
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_notify, %function
vcodec_notify:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r10, r0
	ldr	r6, .L135
	mov	r7, r1
	mov	r9, r2
	movs	r4, #0
	movs	r5, #1
	mov	r8, r6
.L127:
	mov	r2, r5
	movs	r1, #0
	movs	r0, #4
	bl	vsys_get_node_from_map
	cbz	r0, .L126
	ldr	r3, [r6, #3816]
	cbnz	r3, .L126
	adds	r4, r4, #1
.L126:
	adds	r5, r5, #1
	adds	r6, r6, #16
	cmp	r5, #16
	bne	.L127
	orrs	r4, r7, r4
	bne	.L130
	ldr	r3, [r8, #332]
	orrs	r3, r10, r3
	bne	.L125
	ldrd	r6, [r9]
	movw	r3, #1001
	ldr	r2, .L135+4
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L135+8
	strd	r6, [sp, #8]
	bl	vlog
	mov	r0, r4
	bl	mpp_vcodec_run_task
	mov	r4, r0
	cbnz	r0, .L129
	bl	mcu_get_wrap_status
	cmp	r0, #2
	bne	.L129
	movs	r3, #1
	str	r3, [r8, #332]
.L125:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L129:
	movw	r3, #1005
	strd	r6, [sp, #8]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L135+8
	movs	r0, #4
	ldr	r2, .L135+12
	movs	r4, #0
	bl	vlog
	b	.L125
.L130:
	mov	r4, #-1
	b	.L125
.L136:
	.align	2
.L135:
	.word	g_venc_dev
	.word	.LC6
	.word	.LANCHOR0+106
	.word	.LC7
	.fnend
	.size	vcodec_notify, .-vcodec_notify
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_pp_node, %function
get_pp_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	movs	r1, #0
	movs	r0, #20
	b	vsys_get_node_from_map
	.fnend
	.size	get_pp_node, .-get_pp_node
	.align	1
	.global	vcodec_destory_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_destory_dev, %function
vcodec_destory_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L140
	bl	mpi_dev_unregister
	mov	r0, r4
	bl	kfree
	movs	r0, #0
.L138:
	pop	{r4, pc}
.L140:
	mov	r0, #-1
	b	.L138
	.fnend
	.size	vcodec_destory_dev, .-vcodec_destory_dev
	.align	1
	.global	mpi_buf_alloc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_alloc, %function
mpi_buf_alloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r0, .L147
	bl	mpi_allocator_find_by_name
	mov	r2, r4
	movs	r1, #1
	bl	mpi_allocator_alloc
	mov	r5, r0
	cbz	r0, .L143
	movs	r1, #0
	bl	mpi_buf_create
	mov	r4, r0
	cbz	r0, .L141
	ldr	r3, .L147+4
	str	r3, [r0, #4]
	mov	r0, r5
	bl	dma_buf_put
.L141:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L143:
	mov	r4, r0
	b	.L141
.L148:
	.align	2
.L147:
	.word	.LC8
	.word	.LC9
	.fnend
	.size	mpi_buf_alloc, .-mpi_buf_alloc
	.align	1
	.global	mpi_buf_unref
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_unref, %function
mpi_buf_unref:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	cmp	r0, #0
	beq	.L149
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, .L161
	movs	r2, #0
	movs	r3, #12
.L154:
	mul	r1, r3, r2
	ldr	r6, [r1, r0]
	cmp	r6, r4
	bne	.L151
	ldr	r3, .L161+4
	add	r3, r3, r1
	movw	r1, #31664
	ldr	r2, [r3, r1]
	subs	r2, r2, #1
	str	r2, [r3, r1]
	cbnz	r2, .L152
	movw	r1, #31668
	movw	r6, #31660
	ldr	r0, [r3, r1]
	str	r2, [r3, r6]
	mov	r2, #-1
	str	r2, [r3, r1]
.L153:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r0, #0
	blt	.L155
	movs	r2, #0
	mov	r1, r4
	bl	remove_user_from_buf
.L155:
	ldr	r3, [r4, #444]
	cbz	r3, .L156
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L161+8
	movs	r0, #4
	str	r3, [sp, #4]
	movw	r3, #1130
	str	r3, [sp]
	ldr	r3, .L161+12
	bl	vlog
.L156:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_obj_unref
.L151:
	adds	r2, r2, #1
	cmp	r2, #512
	bne	.L154
.L152:
	mov	r0, #-1
	b	.L153
.L149:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L162:
	.align	2
.L161:
	.word	g_venc_dev+31660
	.word	g_venc_dev
	.word	.LC10
	.word	.LANCHOR0+120
	.fnend
	.size	mpi_buf_unref, .-mpi_buf_unref
	.align	1
	.global	mpi_buffer_queue_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_create, %function
mpi_buffer_queue_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L164
	movs	r1, #4
	b	mpi_queue_create
.L165:
	.align	2
.L164:
	.word	mpi_obj_unref
	.fnend
	.size	mpi_buffer_queue_create, .-mpi_buffer_queue_create
	.align	1
	.global	mpi_buffer_queue_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_destroy, %function
mpi_buffer_queue_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	movs	r1, #0
	bl	mpi_queue_destroy
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	mpi_buffer_queue_destroy, .-mpi_buffer_queue_destroy
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_destroy_ctx, %function
venc_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0]
	cbz	r0, .L168
	movs	r1, #0
	bl	mpi_queue_destroy
.L168:
	mov	r0, r4
	bl	kfree
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	venc_destroy_ctx, .-venc_destroy_ctx
	.align	1
	.global	mpi_buffer_pool_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_create, %function
mpi_buffer_pool_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	ldr	r0, .L177
	mov	r6, r1
	bl	mpi_allocator_find_by_name
	mov	r4, r0
	cbz	r0, .L172
	ldr	r3, .L177+4
	mov	r2, r5
	movs	r1, #1
	str	r3, [sp]
	mov	r3, r6
	bl	mpi_buf_pool_create
	mov	r4, r0
.L172:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L178:
	.align	2
.L177:
	.word	.LC8
	.word	.LC9
	.fnend
	.size	mpi_buffer_pool_create, .-mpi_buffer_pool_create
	.align	1
	.global	mpi_buffer_pool_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_destroy, %function
mpi_buffer_pool_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #0
	b	mpi_buf_pool_destroy
	.fnend
	.size	mpi_buffer_pool_destroy, .-mpi_buffer_pool_destroy
	.align	1
	.global	mpi_buffer_pool_request_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_request_buf, %function
mpi_buffer_pool_request_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #0
	b	mpi_buf_pool_request_buf
	.fnend
	.size	mpi_buffer_pool_request_buf, .-mpi_buffer_pool_request_buf
	.align	1
	.global	venc_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_create, %function
venc_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r0
	ldr	r0, .L189
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r5, [r5, #128]
	cmp	r2, #16
	mov	r6, r0
	beq	.L182
	mov	r3, #1536
	ldr	r2, .L189+4
	str	r3, [sp]
	ldr	r3, .L189+8
.L188:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	b	.L187
.L182:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, #15
	ble	.L184
	strd	r3, r2, [sp, #4]
	movs	r1, #2
	movw	r3, #1540
	ldr	r2, .L189+12
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L189+8
	bl	vlog
.L187:
	mov	r0, #-1
.L181:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L184:
	ldr	r0, .L189+16
	bl	mpi_allocator_find_by_name
	cbnz	r0, .L185
	movw	r3, #1546
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L189+8
	movs	r0, #4
	ldr	r2, .L189+20
	bl	vlog
	b	.L187
.L185:
	mov	r0, r6
	movs	r3, #0
	movs	r2, #1
	ldr	r1, [r4, #4]	@ unaligned
	bl	mpi_dev_create_node_with_params
	mov	r6, r0
	cbnz	r0, .L186
	mov	r3, #1552
	ldr	r2, .L189+24
	str	r3, [sp]
	ldr	r3, .L189+8
	b	.L188
.L186:
	ldr	r3, .L189+28
	movs	r1, #1
	str	r3, [r0, #4]
	bl	mpi_node_enable_auto_streamon
	mov	r3, r6
	ldr	r2, [r4, #4]	@ unaligned
	movs	r0, #4
	ldr	r1, [r4]	@ unaligned
	bl	vsys_add_node_to_map
	ldr	r3, [r4, #4]	@ unaligned
	ldr	r2, [r4, #12]	@ unaligned
	movs	r0, #0
	add	r3, r3, #7648
	adds	r3, r3, #6
	add	r3, r5, r3, lsl #2
	str	r2, [r3, #-4]
	b	.L181
.L190:
	.align	2
.L189:
	.word	.LC11
	.word	.LC12
	.word	.LANCHOR0+134
	.word	.LC1
	.word	.LC8
	.word	.LC13
	.word	.LC14
	.word	.LC9
	.fnend
	.size	venc_node_create, .-venc_node_create
	.align	1
	.global	venc_node_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_delete, %function
venc_node_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1]
	ldr	r7, [r0, #128]
	cmp	r4, #15
	ble	.L192
	movs	r3, #16
	ldr	r2, .L228
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1572
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L228+4
	bl	vlog
	mov	r0, #-1
.L191:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L192:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L228+8
	add	r3, r4, #56
	ldr	r3, [r5, r3, lsl #2]
	cbz	r3, .L194
	ldr	r0, [r5, #340]
	cbz	r0, .L194
	bl	mpi_buf_unref
	movs	r3, #0
	strd	r3, r3, [r5, #336]
.L194:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r3, #192
	add	r9, r7, #532
	muls	r3, r4, r3
	mov	r10, #0
	add	r6, r3, #340
	add	r8, r7, r3
	add	r6, r6, r7
	add	r9, r9, r3
.L197:
	ldr	r0, [r8, #344]
	cbz	r0, .L195
	bl	kfree
.L195:
	ldr	r0, [r8, #348]
	cbz	r0, .L196
	bl	kfree
.L196:
	str	r10, [r6]	@ unaligned
	adds	r6, r6, #12
	str	r10, [r6, #-8]	@ unaligned
	add	r8, r8, #12
	str	r10, [r6, #-4]	@ unaligned
	cmp	r6, r9
	bne	.L197
	mov	r0, r4
	sub	r10, r7, #4
	bl	get_venc_node
	mov	r6, r0
	cbz	r0, .L198
	mov	r2, r4
	movs	r1, #0
	movs	r0, #4
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
.L198:
	add	r9, r7, r4
	movw	fp, #4912
	ldrb	r3, [r9, fp]	@ zero_extendqisi2
	cbz	r3, .L199
	add	r3, r9, #4928
	movs	r2, #255
	mov	r8, #0
	strb	r2, [r3]
	addw	r3, r4, #1236
	mov	r1, r8
	str	r8, [r7, r3, lsl #2]
	mov	r7, #800
	mul	r6, r7, r4
	mov	r2, r7
	add	r0, r6, #4992
	adds	r0, r0, #24
	add	r0, r0, r10
	bl	memset
	add	r0, r6, #17792
	adds	r0, r0, #24
	mov	r2, r7
	mov	r1, r8
	add	r0, r0, r10
	bl	memset
	strb	r8, [r9, fp]
.L199:
	cbnz	r4, .L200
	ldr	r3, [r5, #224]
	cbz	r3, .L200
	bl	mcu_wrap_end
	str	r4, [r5, #224]
	strd	r4, r4, [r5, #212]
.L200:
	movs	r5, #0
.L201:
	mov	r0, r5
	bl	get_venc_node
	mov	r4, r0
	cbnz	r0, .L203
	adds	r5, r5, #1
	cmp	r5, #16
	bne	.L201
	bl	mpp_vcodec_clear_buf_resource
	mov	r0, r4
	b	.L191
.L203:
	movs	r0, #0
	b	.L191
.L229:
	.align	2
.L228:
	.word	.LC1
	.word	.LANCHOR0+151
	.word	g_venc_dev
	.fnend
	.size	venc_node_delete, .-venc_node_delete
	.align	1
	.global	venc_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_start, %function
venc_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r6, r1
	ldr	r3, [r1, #20]	@ unaligned
	.pad #28
	sub	sp, sp, #28
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #36
	beq	.L231
	movw	r2, #1623
	ldr	r1, .L271
	ldr	r0, .L271+4
	bl	printk
.L270:
	mov	r4, #-1
.L230:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L231:
	cmp	r4, #15
	ble	.L233
	movs	r3, #16
	ldr	r2, .L271+8
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1628
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L271
	bl	vlog
	b	.L270
.L233:
	ldr	r3, [r1, #8]	@ unaligned
	movs	r0, #4
	ldr	r2, .L271+12
	ldr	r5, .L271+16
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	movs	r1, #5
	strd	r4, r3, [sp, #4]
	movw	r3, #1631
	str	r3, [sp]
	ldr	r3, .L271
	bl	vlog
	add	r3, r4, #56
	ldr	r3, [r5, r3, lsl #2]
	cbnz	r3, .L234
	ldr	r3, [r6, #4]	@ unaligned
	cbz	r3, .L235
.L234:
	cbnz	r4, .L237
	strd	r4, r4, [r5, #324]
	str	r4, [r5, #336]
.L238:
	ldr	r3, [r6, #4]	@ unaligned
	cbz	r3, .L237
	str	r3, [r5, #224]
	b	.L237
.L235:
	cmp	r4, #0
	beq	.L238
.L237:
	mov	r0, r4
	bl	get_venc_node
	cbz	r0, .L240
	mov	r0, r4
	bl	get_venc_node
	bl	mpi_node_streamon
.L240:
	cbz	r4, .L241
.L243:
	movs	r4, #0
	b	.L230
.L241:
	ldr	r3, .L271+20
	add	r7, r6, #32
.L242:
	ldr	r0, [r6]	@ unaligned
	adds	r6, r6, #8
	ldr	r1, [r6, #-4]	@ unaligned
	cmp	r6, r7
	mov	r2, r3
	stmia	r2!, {r0, r1}
	mov	r3, r2
	bne	.L242
	ldr	r0, [r6]	@ unaligned
	str	r0, [r2]
	ldr	r3, [r5, #224]
	cmp	r3, #0
	beq	.L243
	ldr	r0, .L271+24
	bl	mpi_dev_find_by_name
	mov	r9, r0
	movs	r0, #0
	bl	get_venc_node
	movs	r1, #0
	mov	r7, r0
	mov	r0, r1
	bl	mpi_buf_create
	mov	r6, r0
	cmp	r0, #0
	beq	.L244
	cmp	r9, #0
	beq	.L244
	cmp	r7, #0
	beq	.L244
	ldr	r3, .L271+28
	str	r3, [r0, #4]
	ldr	r3, [r5, #300]
	ldr	r2, [r5, #304]
	ldr	ip, [r5, #312]
	ldr	lr, [r5, #316]
	ldr	r1, [r5, #320]
	str	r3, [r0, #620]
	str	r2, [r0, #624]
	str	r1, [r0, #640]
	movs	r1, #0
	str	ip, [r0, #628]
	str	lr, [r0, #632]
	movs	r0, #0
	strd	r0, [r6, #672]
	movs	r1, #0
	str	r1, [r6, #668]
	movs	r1, #4
	strd	r3, r2, [sp, #4]
	mov	r0, r1
	movw	r3, #678
	strd	ip, lr, [sp, #12]
	str	r3, [sp]
	ldr	r2, .L271+32
	ldr	r3, .L271+36
	bl	vlog
	ldr	r3, [r7, #288]
	ldr	r8, [r3]
	cmp	r8, #0
	bne	.L245
	movw	r3, #681
	ldr	r2, .L271+40
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L271+36
	movs	r0, #4
	bl	vlog
	b	.L230
.L245:
	mov	r0, r8
	bl	mpi_queue_pop_obj
	cbz	r0, .L246
	bl	mpi_buf_unref
.L246:
	mov	r1, r6
	mov	r0, r8
	movs	r3, #1
	str	r3, [r5, #332]
	bl	mpi_queue_push_obj
	cbnz	r0, .L247
	movw	r3, #689
	ldr	r2, .L271+44
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L271+36
	movs	r0, #4
	bl	vlog
	mov	r0, r6
	bl	mpi_obj_unref
.L247:
	ldr	r3, [r9, #80]
	movs	r2, #0
	movs	r1, #7
	mov	r0, r7
	blx	r3
.L244:
	movs	r3, #1
	str	r3, [r5, #220]
	b	.L230
.L272:
	.align	2
.L271:
	.word	.LANCHOR0+168
	.word	.LC15
	.word	.LC1
	.word	.LC16
	.word	g_venc_dev
	.word	g_venc_dev+288
	.word	.LC11
	.word	.LC9
	.word	.LC17
	.word	.LANCHOR0+184
	.word	.LC18
	.word	.LC19
	.fnend
	.size	venc_node_start, .-venc_node_start
	.align	1
	.global	venc_node_pp_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_start, %function
venc_node_pp_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r4, [r1]
	cmp	r4, #0
	ble	.L274
	movs	r3, #1
	ldr	r2, .L277
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1945
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L277+4
	bl	vlog
	mov	r0, #-1
.L273:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L274:
	mov	r0, r4
	bl	get_pp_node
	cmp	r0, #0
	beq	.L273
	mov	r0, r4
	bl	get_pp_node
	bl	mpi_node_streamon
	movs	r0, #0
	b	.L273
.L278:
	.align	2
.L277:
	.word	.LC1
	.word	.LANCHOR0+199
	.fnend
	.size	venc_node_pp_start, .-venc_node_pp_start
	.align	1
	.global	venc_node_set_vcodec_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_vcodec_attr, %function
venc_node_set_vcodec_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #128]
	cmp	r3, #15
	bls	.L280
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1730
	ldr	r2, .L284
	str	r3, [sp]
	ldr	r3, .L284+4
	bl	vlog
	mov	r0, #-1
.L279:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L280:
	movs	r0, #60
	mla	r3, r0, r3, r2
	adds	r2, r1, r0
	add	r3, r3, #30592
	adds	r3, r3, #84
.L282:
	ldr	r0, [r1], #4	@ unaligned
	cmp	r1, r2
	str	r0, [r3], #4	@ unaligned
	bne	.L282
	movs	r0, #0
	b	.L279
.L285:
	.align	2
.L284:
	.word	.LC1
	.word	.LANCHOR0+218
	.fnend
	.size	venc_node_set_vcodec_attr, .-venc_node_set_vcodec_attr
	.align	1
	.global	venc_node_get_vcodec_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_get_vcodec_attr, %function
venc_node_get_vcodec_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #128]
	cmp	r3, #15
	bls	.L287
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1743
	ldr	r2, .L291
	str	r3, [sp]
	ldr	r3, .L291+4
	bl	vlog
	mov	r0, #-1
.L286:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L287:
	movs	r0, #60
	mla	r3, r0, r3, r2
	add	r3, r3, #30592
	adds	r3, r3, #84
	adds	r2, r3, r0
.L289:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r2
	str	r0, [r1], #4	@ unaligned
	bne	.L289
	movs	r0, #0
	b	.L286
.L292:
	.align	2
.L291:
	.word	.LC1
	.word	.LANCHOR0+244
	.fnend
	.size	venc_node_get_vcodec_attr, .-venc_node_get_vcodec_attr
	.align	1
	.global	venc_node_send_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_send_frame, %function
venc_node_send_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r0, .L308
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r3, #92
	mov	r8, r0
	beq	.L294
	movw	r3, #1659
	ldr	r2, .L308+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L308+8
	movs	r0, #4
	bl	vlog
.L307:
	mov	r0, #-1
	b	.L293
.L294:
	ldr	r5, [r4]	@ unaligned
	cmp	r5, #15
	ble	.L296
	movs	r3, #16
	ldr	r2, .L308+12
	strd	r5, r3, [sp, #4]
	movs	r1, #2
	mov	r3, #1664
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L308+8
	bl	vlog
	b	.L307
.L296:
	mov	r0, r5
	bl	get_venc_node
	mov	r7, r0
	cbz	r0, .L297
	ldr	r0, [r4, #4]	@ unaligned
	cmp	r8, #0
	beq	.L297
	cmp	r0, #0
	blt	.L297
	bl	get_mpi_buf
	mov	r6, r0
	cbz	r0, .L297
	movs	r2, #80
	add	r1, r4, #12
	add	r0, r0, #616
	bl	memcpy
	movs	r3, #4
	mov	r0, r7
	str	r3, [r6, #584]
	movs	r2, #0
	mov	r1, r6
	bl	mpi_node_buffer_in
	movs	r0, #0
.L293:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L297:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	strd	r5, r7, [sp, #4]
	movs	r0, #4
	ldr	r2, .L308+16
	strd	r8, r3, [sp, #12]
	movw	r3, #1681
	str	r3, [sp]
	ldr	r3, .L308+8
	bl	vlog
	b	.L307
.L309:
	.align	2
.L308:
	.word	.LC11
	.word	.LC20
	.word	.LANCHOR0+270
	.word	.LC1
	.word	.LC21
	.fnend
	.size	venc_node_send_frame, .-venc_node_send_frame
	.align	1
	.global	venc_node_pp_send_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_send_frame, %function
venc_node_pp_send_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r0, .L325
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r3, #92
	mov	r8, r0
	beq	.L311
	movw	r3, #1962
	ldr	r2, .L325+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L325+8
	movs	r0, #4
	bl	vlog
.L324:
	mov	r0, #-1
	b	.L310
.L311:
	ldr	r5, [r4]	@ unaligned
	cmp	r5, #0
	ble	.L313
	movs	r3, #1
	ldr	r2, .L325+12
	strd	r5, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1967
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L325+8
	bl	vlog
	b	.L324
.L313:
	mov	r0, r5
	bl	get_pp_node
	mov	r6, r0
	cbz	r0, .L314
	ldr	r0, [r4, #4]	@ unaligned
	cmp	r8, #0
	beq	.L314
	cmp	r0, #0
	blt	.L314
	bl	get_mpi_buf
	mov	r7, r0
	cbz	r0, .L314
	movs	r2, #80
	add	r1, r4, #12
	add	r0, r0, #616
	bl	memcpy
	mov	r0, r6
	movs	r2, #1
	mov	r1, r7
	bl	mpi_node_buffer_in
	movs	r0, #0
.L310:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L314:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	strd	r5, r6, [sp, #4]
	movs	r0, #4
	ldr	r2, .L325+16
	strd	r8, r3, [sp, #12]
	movw	r3, #1983
	str	r3, [sp]
	ldr	r3, .L325+8
	bl	vlog
	b	.L324
.L326:
	.align	2
.L325:
	.word	.LC9
	.word	.LC20
	.word	.LANCHOR0+291
	.word	.LC1
	.word	.LC22
	.fnend
	.size	venc_node_pp_send_frame, .-venc_node_pp_send_frame
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_thread_fn, %function
venc_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 456
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #472
	sub	sp, sp, #472
	adds	r3, r0, #4
	mov	r4, r0
	str	r3, [sp, #8]
	movs	r1, #5
	ldr	r3, [r0, #48]
	movs	r0, #4
	ldr	r2, .L390
	add	r8, r4, #4096
	add	r8, r8, #28
	str	r3, [sp, #4]
	movw	r3, #2344
	str	r3, [sp]
	ldr	r3, .L390+4
	bl	vlog
.L328:
	bl	kthread_should_stop
	cbz	r0, .L355
	movs	r1, #4
	movw	r3, #2466
	ldr	r2, .L390+8
	mov	r0, r1
	str	r3, [sp]
	ldr	r3, .L390+4
	bl	vlog
	movs	r0, #0
	add	sp, sp, #472
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L355:
	ldr	r3, [r4, #180]
	cbz	r3, .L329
	movs	r0, #1
	bl	msleep
	b	.L328
.L329:
	add	r0, r4, #196
	bl	down
	ldr	r5, [r4, #92]
.L389:
	subs	r5, r5, #48
	add	r2, r4, #92
	add	r3, r5, #48
	cmp	r3, r2
	beq	.L328
	ldr	r3, [r5, #288]
	ldr	r0, [r3]
	bl	mpi_queue_pop_obj
	mov	r7, r0
	cmp	r0, #0
	beq	.L332
	ldr	r2, .L390+12
	movs	r3, #6
	str	r3, [sp, #212]
	str	r0, [sp, #228]
	movs	r0, #0
	ldr	r3, [r2]
	adds	r1, r3, #1
	str	r1, [r2]
	str	r3, [sp, #208]
	movw	r3, #4212
	ldr	r3, [r4, r3]
	add	r2, sp, #208
	movs	r1, #16
	str	r3, [sp, #216]
	movs	r3, #1
	strd	r3, r3, [sp, #220]
	bl	vepu_pp_control
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r6, [r8]
	adds	r6, r6, #1
	cmp	r6, #5
	it	ge
	movge	r6, #0
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #4080]
	cbz	r3, .L334
	addw	r3, r6, #1058
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #4]
	str	r3, [sp, #152]
	movw	r3, #31656
	ldr	r3, [r4, r3]
	usat	r3, #2, r3
	str	r3, [sp, #156]
	movw	r3, #31652
	ldr	r3, [r4, r3]
	cmp	r3, #0
	ble	.L335
	movw	r2, #31648
	ldr	r2, [r4, r2]
	cmp	r2, #0
	ble	.L335
	movw	r1, #4095
	cmp	r2, r1
	ite	le
	strle	r2, [sp, #160]
	strgt	r1, [sp, #160]
	cmp	r3, #4
	it	ge
	movge	r3, #4
.L385:
	str	r3, [sp, #164]
	add	r3, r4, #4224
	movs	r0, #0
	add	r2, sp, #152
	ldr	r3, [r3]
	movs	r1, #32
	str	r0, [sp, #172]
	str	r3, [sp, #168]
	bl	vepu_pp_control
.L334:
	ldr	r3, [r4, #4084]
	cbz	r3, .L339
	ldr	r3, [r4, #4064]
	movs	r1, #12
	ldr	r2, [r4, #4068]
	movs	r0, #1
	strd	r0, r1, [sp, #60]
	ldr	r1, [r4, #4088]
	muls	r2, r3, r2
	movw	r3, #4228
	ldr	r3, [r4, r3]
	cmp	r1, #0
	beq	.L340
	asrs	r2, r2, #8
.L386:
	muls	r3, r2, r3
	movs	r1, #48
	add	r2, sp, #60
	movs	r0, #0
	asrs	r3, r3, #3
	str	r3, [sp, #68]
	bl	vepu_pp_control
.L339:
	ldr	r3, [r4, #4072]
	cbz	r3, .L342
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r3, #4912
	movw	r1, #4780
	ldr	r3, [r4, r3]
	movs	r0, #0
	add	r3, r4, r3, lsl #3
	ldr	r1, [r3, r1]
	str	r1, [sp, #340]
	movw	r1, #4784
	str	r0, [r3, r1]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r1, #64
	add	r2, sp, #340
	bl	vepu_pp_control
.L342:
	ldr	r3, [r4, #4076]
	cbz	r3, .L343
	add	r2, sp, #272
	movs	r1, #80
	movs	r0, #0
	bl	vepu_pp_control
.L343:
	ldr	r3, [r4, #4080]
	cbnz	r3, .L344
	ldr	r3, [r4, #4084]
	cbnz	r3, .L344
	ldr	r3, [r4, #4072]
	cbnz	r3, .L344
	ldr	r3, [r4, #4076]
	cmp	r3, #0
	beq	.L345
.L344:
	add	r2, sp, #208
	movs	r1, #96
	movs	r0, #0
	bl	vepu_pp_control
	ldr	r3, [r4, #4084]
	cbz	r3, .L346
	add	r2, sp, #20
	movs	r1, #112
	movs	r0, #0
	bl	vepu_pp_control
.L346:
	ldr	r3, [r4, #4076]
	cbz	r3, .L345
	add	r2, sp, #104
	movs	r1, #128
	movs	r0, #0
	bl	vepu_pp_control
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	lr, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	ip, #4776
	movs	r2, #52
	ldr	r3, [r4, ip]
	add	r10, sp, #152
	mla	r3, r2, r3, r4
	add	r2, sp, #104
	add	r3, r3, #4256
.L347:
	mov	r9, r2
	adds	r3, r3, #8
	ldmia	r9!, {r0, r1}
	cmp	r9, r10
	str	r0, [r3, #-8]	@ unaligned
	mov	r2, r9
	str	r1, [r3, #-4]	@ unaligned
	bne	.L347
	ldr	r3, [r4, ip]
	movs	r1, #52
	ldr	r2, [r7, #668]
	movw	r0, #4304
	mla	r1, r1, r3, r4
	adds	r3, r3, #1
	cmp	r3, #9
	it	gt
	movgt	r3, #0
	str	r2, [r1, r0]
	str	r3, [r4, ip]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, lr	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L345:
	ldr	r3, [r4, #4072]
	cbz	r3, .L350
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	ip, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r2, #4912
	ldr	r0, [r7, #668]
	ldr	r3, [r4, r2]
	addw	r1, r3, #597
	adds	r3, r3, #1
	cmp	r3, #1
	add	r1, r4, r1, lsl #3
	it	gt
	movgt	r3, #0
	str	r0, [r1, #8]
	str	r3, [r4, r2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, ip	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L350:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	ip, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r4, #4128
	str	r6, [r8]
	movs	r2, #1
	add	r6, sp, #20
	str	r2, [r3]
	add	lr, sp, #60
	adds	r3, r3, #8
.L353:
	mov	r2, r6
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, lr
	str	r0, [r3, #-8]	@ unaligned
	mov	r6, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L353
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, ip	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	addw	r0, r4, #4056
	bl	__wake_up
	ldr	r0, [r5, #76]
	movs	r2, #0
	mov	r1, r7
	bl	remove_user_from_buf
	mov	r0, r7
	bl	mpi_buf_unref
.L332:
	ldr	r5, [r5, #48]
	b	.L389
.L335:
	movw	r3, #4232
	ldr	r3, [r4, r3]
	cmp	r3, #1
	bne	.L337
	movs	r3, #70
	str	r3, [sp, #160]
	movs	r3, #3
	b	.L385
.L337:
	cmp	r3, #2
	itett	ne
	movne	r3, #30
	moveq	r2, #50
	strne	r3, [sp, #160]
	movne	r3, #1
	it	eq
	streq	r2, [sp, #160]
	b	.L385
.L340:
	asrs	r2, r2, #4
	b	.L386
.L391:
	.align	2
.L390:
	.word	.LC23
	.word	.LANCHOR0+315
	.word	.LC24
	.word	.LANCHOR1
	.fnend
	.size	venc_thread_fn, .-venc_thread_fn
	.global	__aeabi_uidivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_handle_message, %function
venc_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r3, [r0, #8]
	.pad #28
	sub	sp, sp, #28
	mov	r4, r2
	cmp	r3, #1
	bne	.L401
	cmp	r1, #1
	bne	.L401
	cmp	r2, #0
	beq	.L401
	ldr	r2, .L402
	movw	r3, #4216
	ldr	r1, [r2, r3]
	cmp	r1, #1
	ble	.L394
	ldr	r0, [r4, #668]
	bl	__aeabi_uidivmod
	cmp	r1, #0
	bne	.L401
.L394:
	ldr	r3, [r5, #288]
	movs	r1, #5
	ldr	r2, .L402+4
	movs	r0, #4
	ldr	r10, .L402+8
	movs	r6, #0
	ldr	r7, [r3]
	movw	r9, #862
	ldr	fp, .L402+16
	ldr	r3, [r7, #16]
	str	r3, [sp, #16]
	ldr	r3, [r4]
	str	r3, [sp, #12]
	ldr	r3, [r5]
	str	r3, [sp, #8]
	ldr	r3, [r5, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movw	r3, #849
	str	r3, [sp]
	ldr	r3, .L402+8
	bl	vlog
	mov	r0, r4
	bl	mpi_obj_ref
.L395:
	mov	r1, r4
	mov	r0, r7
	bl	mpi_queue_push_obj
	mov	r8, r0
	cbz	r0, .L397
	ldr	r0, .L402+12
	bl	up
	b	.L392
.L397:
	mov	r0, r7
	bl	mpi_queue_pop_obj
	mov	r6, r0
	cbnz	r0, .L396
	mov	r0, r4
	bl	mpi_obj_unref
	mov	r2, r6
	mov	r1, r4
	ldr	r0, [r5, #76]
	bl	remove_user_from_buf
	mov	r6, #-1
.L392:
	mov	r0, r6
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L396:
	ldr	r3, [r0]
	mov	r2, fp
	movs	r1, #5
	movs	r0, #4
	str	r3, [sp, #12]
	ldr	r3, [r5]
	str	r3, [sp, #8]
	ldr	r3, [r5, #44]
	ldr	r3, [r3, #44]
	strd	r9, r3, [sp]
	mov	r3, r10
	bl	vlog
	mov	r0, r6
	bl	mpi_obj_unref
	mov	r1, r6
	mov	r2, r8
	ldr	r0, [r5, #76]
	bl	remove_user_from_buf
	mov	r6, #-1
	b	.L395
.L401:
	movs	r6, #0
	b	.L392
.L403:
	.align	2
.L402:
	.word	g_venc_dev
	.word	.LC25
	.word	.LANCHOR0+330
	.word	g_venc_dev+196
	.word	.LC26
	.fnend
	.size	venc_handle_message, .-venc_handle_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_release, %function
venc_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	ldr	r4, [r1, #128]
	mov	r0, r4
	bl	mpi_obj_unref
	ldr	r3, [r4, #16]
	cmp	r3, #1
	bne	.L405
	ldr	r5, .L446
	ldr	r2, [r4]
	ldr	r1, .L446+4
	ldr	r0, .L446+8
	bl	printk
	ldr	r3, [r5, #224]
	cbz	r3, .L406
	bl	mcu_wrap_end
	movs	r3, #0
	str	r3, [r5, #224]
.L406:
	ldr	r3, [r4, #164]
	cbz	r3, .L407
	cmn	r3, #4096
	bhi	.L407
	movs	r3, #1
	add	r0, r4, #192
	str	r3, [r4, #176]
	bl	up
	ldr	r3, [r4, #164]
	movs	r1, #4
	ldr	r2, .L446+12
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #2255
	str	r3, [sp]
	ldr	r3, .L446+4
	bl	vlog
	ldr	r0, [r4, #164]
	bl	kthread_stop
	ldr	r3, [r4, #164]
	movs	r1, #4
	ldr	r2, .L446+16
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #2257
	str	r3, [sp]
	ldr	r3, .L446+4
	bl	vlog
	movs	r3, #0
	str	r3, [r4, #164]
.L407:
	add	r5, r4, #4224
	add	r6, r4, #4224
	adds	r5, r5, #8
	adds	r6, r6, #28
	movs	r7, #0
.L409:
	ldr	r0, [r5], #4
	cbz	r0, .L408
	bl	mpi_buf_unmap
	ldr	r0, [r5, #-4]
	bl	mpi_obj_unref
	str	r7, [r5, #-4]
.L408:
	cmp	r6, r5
	bne	.L409
	movw	r5, #4776
	ldr	r0, [r4, r5]
	cbz	r0, .L410
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, r5]
.L410:
	movw	r5, #4784
	ldr	r0, [r4, r5]
	cbz	r0, .L411
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, r5]
.L411:
	movs	r0, #0
	bl	get_pp_node
	mov	r5, r0
	cbz	r0, .L412
	movs	r0, #0
	bl	vepu_pp_destroy_chn
	movs	r2, #0
	mov	r1, r2
	movs	r0, #20
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
.L412:
	movs	r5, #0
	mov	r8, #192
.L418:
	mov	r0, r5
	bl	get_venc_node
	mov	r6, r0
	cbz	r0, .L414
	mov	r2, r5
	movs	r1, #0
	movs	r0, #4
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
.L414:
	mla	r6, r8, r5, r4
	movs	r7, #0
.L417:
	ldr	r0, [r6, #344]
	cbz	r0, .L415
	bl	kfree
.L415:
	ldr	r0, [r6, #348]
	cbz	r0, .L416
	bl	kfree
.L416:
	adds	r7, r7, #1
	adds	r6, r6, #12
	cmp	r7, #16
	bne	.L417
	adds	r5, r5, #1
	cmp	r5, #16
	bne	.L418
	mov	r2, #3072
	movs	r1, #0
	add	r0, r4, #340
	subs	r6, r4, #4
	bl	memset
	mov	r2, #384
	movs	r1, #0
	addw	r0, r4, #3412
	bl	memset
	mov	r2, #256
	movs	r1, #0
	addw	r0, r4, #3796
	bl	memset
	movs	r2, #172
	movs	r1, #0
	addw	r0, r4, #4060
	bl	memset
	add	r0, r6, #31616
	movs	r2, #20
	movs	r1, #0
	adds	r0, r0, #24
	bl	memset
	mov	r2, r5
	mov	r1, #-1
	add	r0, r4, #4928
	bl	memset
	add	r0, r6, #4928
	movs	r2, #64
	movs	r1, #0
	adds	r0, r0, #20
	bl	memset
	add	r0, r6, #4992
	mov	r2, #12800
	movs	r1, #0
	adds	r0, r0, #24
	bl	memset
	add	r0, r6, #17792
	mov	r2, #12800
	movs	r1, #0
	adds	r0, r0, #24
	bl	memset
	add	r0, r6, #4896
	mov	r2, r5
	movs	r1, #0
	adds	r0, r0, #20
	bl	memset
	bl	mpp_vcodec_clear_buf_resource
.L405:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L447:
	.align	2
.L446:
	.word	g_venc_dev
	.word	.LANCHOR0+358
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.fnend
	.size	venc_release, .-venc_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_ioctl, %function
venc_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r3, r2
	ldr	r2, [r0, #128]
	uxtb	r4, r1
	ldr	r6, [r2, #160]
	ldr	r5, [r6, #192]
	cmp	r5, r4
	bhi	.L449
	movw	r3, #2164
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L452
	movs	r0, #4
	ldr	r2, .L452+4
	bl	vlog
.L450:
	movw	r3, #2180
	ldr	r2, .L452+8
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L452
	movs	r0, #4
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L449:
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r5
	sbc	r5, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r6, #188]
	ands	r4, r4, r5
	movs	r5, #20
	mla	r4, r5, r4, r2
	cbnz	r4, .L451
	movw	r3, #2171
	ldr	r2, .L452+12
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L452
	movs	r0, #4
	bl	vlog
	b	.L450
.L451:
	mov	r2, r1
	mov	r1, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_ioctl_kernel
.L453:
	.align	2
.L452:
	.word	.LANCHOR0+371
	.word	.LC30
	.word	.LC32
	.word	.LC31
	.fnend
	.size	venc_ioctl, .-venc_ioctl
	.align	1
	.global	vcodec_notify_drop_frm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_notify_drop_frm, %function
vcodec_notify_drop_frm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #15
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	bls	.L455
	movs	r3, #16
	ldr	r2, .L463
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	mov	r3, #980
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L463+4
	bl	vlog
	mov	r0, #-1
.L454:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L455:
	ldr	r3, .L463+8
	add	r2, r0, #7648
	adds	r2, r2, #6
	ldr	r2, [r3, r2, lsl #2]
	cmp	r2, #9
	beq	.L457
	cmp	r2, #15
	bne	.L458
.L457:
	adds	r0, r0, #238
	lsls	r0, r0, #4
	adds	r2, r3, r0
	ldr	r3, [r3, r0]
	movs	r0, #0
	cmp	r3, #0
	ble	.L454
	str	r0, [r2, #4]
	b	.L454
.L458:
	movs	r0, #0
	b	.L454
.L464:
	.align	2
.L463:
	.word	.LC1
	.word	.LANCHOR0+382
	.word	g_venc_dev
	.fnend
	.size	vcodec_notify_drop_frm, .-vcodec_notify_drop_frm
	.align	1
	.global	venc_node_set_combo
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_combo, %function
venc_node_set_combo:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1, #8]	@ unaligned
	ldr	r3, [r0, #128]
	cmp	r2, #12
	beq	.L466
	movw	r3, #1756
	ldr	r2, .L470
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L470+4
	movs	r0, #4
	bl	vlog
.L469:
	mov	r0, #-1
.L465:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L466:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #15
	ble	.L468
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #1761
	ldr	r2, .L470+8
	str	r3, [sp]
	ldr	r3, .L470+4
	bl	vlog
	b	.L469
.L468:
	add	r3, r3, r2, lsl #4
	movs	r2, #1
	movs	r0, #0
	str	r2, [r3, #3796]
	ldr	r2, [r1, #4]	@ unaligned
	str	r2, [r3, #3800]
	b	.L465
.L471:
	.align	2
.L470:
	.word	.LC33
	.word	.LANCHOR0+405
	.word	.LC1
	.fnend
	.size	venc_node_set_combo, .-venc_node_set_combo
	.align	1
	.global	venc_node_set_snap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_snap, %function
venc_node_set_snap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r2, [r0, #128]
	cmp	r3, #12
	beq	.L473
	movw	r3, #1778
	ldr	r2, .L478
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L478+4
	movs	r0, #4
	bl	vlog
.L477:
	mov	r0, #-1
.L472:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L473:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #15
	ble	.L475
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1783
	ldr	r2, .L478+8
	str	r3, [sp]
	ldr	r3, .L478+4
	bl	vlog
	b	.L477
.L475:
	ldr	r4, [r1, #4]	@ unaligned
	add	r0, r2, r3, lsl #4
	str	r4, [r0, #3804]
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r1, #4]	@ unaligned
	cmp	r1, #0
	itt	gt
	addwgt	r3, r3, #1236
	strgt	r1, [r2, r3, lsl #2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L472
.L479:
	.align	2
.L478:
	.word	.LC34
	.word	.LANCHOR0+425
	.word	.LC1
	.fnend
	.size	venc_node_set_snap, .-venc_node_set_snap
	.align	1
	.global	venc_node_set_framerate
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_framerate, %function
venc_node_set_framerate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #16
	beq	.L481
	movw	r3, #1803
	ldr	r2, .L486
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L486+4
	movs	r0, #4
	bl	vlog
.L485:
	mov	r4, #-1
.L480:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L481:
	ldr	r4, [r1]	@ unaligned
	cmp	r4, #15
	ble	.L483
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	mov	r3, #1808
	ldr	r2, .L486+8
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L486+4
	bl	vlog
	b	.L485
.L483:
	cbnz	r4, .L484
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r0, [r0, #128]
	str	r3, [r0, #208]
	ldr	r2, [r1, #12]	@ unaligned
	movs	r1, #4
	str	r2, [r0, #212]
	mov	r0, r1
	strd	r3, r2, [sp, #4]
	movw	r3, #1814
	ldr	r2, .L486+12
	str	r3, [sp]
	ldr	r3, .L486+4
	bl	vlog
	b	.L480
.L484:
	movs	r4, #0
	b	.L480
.L487:
	.align	2
.L486:
	.word	.LC35
	.word	.LANCHOR0+444
	.word	.LC1
	.word	.LC36
	.fnend
	.size	venc_node_set_framerate, .-venc_node_set_framerate
	.align	1
	.global	venc_node_check
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_check, %function
venc_node_check:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1, #8]	@ unaligned
	cmp	r3, #16
	beq	.L489
	mov	r3, #1512
	ldr	r2, .L493
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L493+4
	movs	r0, #4
	bl	vlog
.L492:
	mov	r0, #-1
.L488:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L489:
	ldr	r0, [r1, #4]	@ unaligned
	cmp	r0, #15
	ble	.L491
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1516
	ldr	r2, .L493+8
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L493+4
	bl	vlog
	b	.L492
.L491:
	bl	get_venc_node
	clz	r0, r0
	lsrs	r0, r0, #5
	rsbs	r0, r0, #0
	b	.L488
.L494:
	.align	2
.L493:
	.word	.LC12
	.word	.LANCHOR0+468
	.word	.LC1
	.fnend
	.size	venc_node_check, .-venc_node_check
	.align	1
	.global	mpi_buf_get_paddr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_get_paddr, %function
mpi_buf_get_paddr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L497
	ldr	r0, [r0, #608]
	cmp	r0, #0
	bgt	.L495
	ldr	r0, [r4, #448]
	bl	get_dma_buf_phy_addr
	str	r0, [r4, #608]
.L495:
	pop	{r4, pc}
.L497:
	mov	r0, #-1
	b	.L495
	.fnend
	.size	mpi_buf_get_paddr, .-mpi_buf_get_paddr
	.align	1
	.global	venc_get_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_get_version, %function
venc_get_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r0, #128]
	ldr	r6, [r3, #160]
	ldr	r3, [r1, #32]	@ unaligned
	cmp	r3, #76
	beq	.L499
	movw	r3, #1491
	ldr	r2, .L503
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L503+4
	movs	r0, #4
	bl	vlog
	mov	r0, #-1
.L498:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L499:
	movs	r5, #0
	movs	r3, #1
	strb	r5, [r1, #1]
	strb	r3, [r1]
	strb	r5, [r1, #2]
	strb	r5, [r1, #3]
	strb	r5, [r1, #4]
	strb	r5, [r1, #5]
	strb	r5, [r1, #6]
	strb	r5, [r1, #7]
	strb	r5, [r1, #8]
	strb	r5, [r1, #9]
	strb	r5, [r1, #10]
	strb	r5, [r1, #11]
	strb	r5, [r1, #36]
	strb	r5, [r1, #37]
	strb	r5, [r1, #38]
	strb	r5, [r1, #39]
	strb	r5, [r1, #56]
	strb	r5, [r1, #57]
	strb	r5, [r1, #58]
	strb	r5, [r1, #59]
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
	b	.L498
.L504:
	.align	2
.L503:
	.word	.LC37
	.word	.LANCHOR0+484
	.fnend
	.size	venc_get_version, .-venc_get_version
	.align	1
	.global	venc_node_set_crop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_crop, %function
venc_node_set_crop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1, #12]	@ unaligned
	ldr	r0, [r0, #128]
	cmp	r2, #24
	beq	.L506
	movw	r3, #1692
	ldr	r2, .L512
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L512+4
	movs	r0, #4
	bl	vlog
.L511:
	mov	r0, #-1
.L505:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L506:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #15
	ble	.L508
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1697
	ldr	r2, .L512+8
	str	r3, [sp]
	ldr	r3, .L512+4
	bl	vlog
	b	.L511
.L508:
	mla	r3, r2, r3, r0
	add	r2, r1, #24
	addw	r3, r3, #3412
.L509:
	ldr	r0, [r1], #4	@ unaligned
	cmp	r1, r2
	str	r0, [r3], #4	@ unaligned
	bne	.L509
	movs	r0, #0
	b	.L505
.L513:
	.align	2
.L512:
	.word	.LC38
	.word	.LANCHOR0+501
	.word	.LC1
	.fnend
	.size	venc_node_set_crop, .-venc_node_set_crop
	.align	1
	.global	venc_node_get_crop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_get_crop, %function
venc_node_get_crop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1, #12]	@ unaligned
	ldr	r0, [r0, #128]
	cmp	r2, #24
	beq	.L515
	movw	r3, #1711
	ldr	r2, .L521
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L521+4
	movs	r0, #4
	bl	vlog
.L520:
	mov	r0, #-1
.L514:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L515:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #15
	ble	.L517
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1716
	ldr	r2, .L521+8
	str	r3, [sp]
	ldr	r3, .L521+4
	bl	vlog
	b	.L520
.L517:
	mla	r3, r2, r3, r0
	addw	r3, r3, #3412
	add	r2, r3, #24
.L518:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r2
	str	r0, [r1], #4	@ unaligned
	bne	.L518
	movs	r0, #0
	b	.L514
.L522:
	.align	2
.L521:
	.word	.LC38
	.word	.LANCHOR0+520
	.word	.LC1
	.fnend
	.size	venc_node_get_crop, .-venc_node_get_crop
	.align	1
	.global	venc_node_pp_set_md_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_set_md_attr, %function
venc_node_pp_set_md_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1, #4]	@ unaligned
	ldr	r3, [r0, #128]
	cmp	r2, #20
	beq	.L524
	movw	r3, #2028
	ldr	r2, .L530
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L530+4
	movs	r0, #4
	bl	vlog
.L529:
	mov	r0, #-1
.L523:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L524:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #0
	ble	.L526
	movs	r3, #1
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #2033
	ldr	r2, .L530+8
	str	r3, [sp]
	ldr	r3, .L530+4
	bl	vlog
	b	.L529
.L526:
	add	r3, r3, #31616
	add	r2, r1, #20
	adds	r3, r3, #20
.L527:
	ldr	r0, [r1], #4	@ unaligned
	cmp	r1, r2
	str	r0, [r3], #4	@ unaligned
	bne	.L527
	movs	r0, #0
	b	.L523
.L531:
	.align	2
.L530:
	.word	.LC0
	.word	.LANCHOR0+539
	.word	.LC1
	.fnend
	.size	venc_node_pp_set_md_attr, .-venc_node_pp_set_md_attr
	.align	1
	.global	venc_node_pp_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_create, %function
venc_node_pp_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	ldr	r3, [r1, #8]	@ unaligned
	.pad #80
	sub	sp, sp, #80
	cmp	r3, #60
	beq	.L533
	movw	r3, #1831
	ldr	r2, .L558
	str	r3, [sp]
	ldr	r3, .L558+4
.L555:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	b	.L556
.L533:
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #0
	ble	.L535
	movs	r2, #1
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1835
	ldr	r2, .L558+8
	str	r3, [sp]
	ldr	r3, .L558+4
	bl	vlog
.L556:
	mov	r8, #-1
.L532:
	mov	r0, r8
	add	sp, sp, #80
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L535:
	ldr	r3, [r1, #16]	@ unaligned
	movw	r2, #4132
	ldr	r5, .L558+12
	movs	r4, #5
	sbfx	r3, r3, #1, #29
	ldr	r7, .L558+16
	adds	r3, r3, #15
	sub	r8, r5, #104
	asrs	r3, r3, #4
	lsls	r3, r3, #8
	str	r3, [r7, r2]
.L539:
	ldr	r0, [r8]
	bl	mpi_buf_alloc
	str	r0, [r5], #4
	cbnz	r0, .L536
	movw	r3, #1843
.L557:
	str	r3, [sp]
	ldr	r2, .L558+20
	ldr	r3, .L558+4
	b	.L555
.L536:
	bl	mpi_buf_map
	cbnz	r0, .L538
	movw	r3, #1847
	b	.L557
.L538:
	ldr	r3, [r5, #-4]
	movs	r1, #0
	ldr	r2, [r8]
	ldr	r0, [r3, #604]
	bl	memset
	subs	r4, r4, #1
	bne	.L539
	ldr	r3, [r6, #20]	@ unaligned
	cbz	r3, .L540
	ldr	r4, [r6, #12]	@ unaligned
	sbfx	r4, r4, #1, #29
	adds	r4, r4, #3
	asrs	r4, r4, #2
	adds	r4, r4, #7
	asrs	r3, r4, #3
	ldr	r4, [r6, #16]	@ unaligned
	sbfx	r4, r4, #1, #29
	adds	r4, r4, #15
	asrs	r4, r4, #4
	muls	r4, r3, r4
	lsls	r4, r4, #6
	mov	r0, r4
	bl	mpi_buf_alloc
	movw	r3, #4780
	str	r0, [r7, r3]
	cbnz	r0, .L541
.L542:
	movw	r3, #1859
	b	.L557
.L541:
	mov	r0, r4
	bl	mpi_buf_alloc
	movw	r3, #4788
	str	r0, [r7, r3]
	cmp	r0, #0
	beq	.L542
.L540:
	ldr	r3, [r6, #12]	@ unaligned
	add	r1, sp, #20
	ldr	r0, [r6, #4]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r6, #16]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r6, #28]	@ unaligned
	str	r3, [sp, #36]
	ldr	r3, [r6, #32]	@ unaligned
	str	r3, [sp, #40]
	ldr	r3, [r6, #20]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r6, #24]	@ unaligned
	str	r3, [sp, #32]
	movs	r3, #0
	str	r3, [sp, #44]
	bl	vepu_pp_create_chn
	mov	r8, r0
	cbz	r0, .L543
	movw	r3, #1874
	b	.L557
.L543:
	mov	r3, r0
	movs	r2, #1
	ldr	r1, [r6, #4]	@ unaligned
	ldr	r0, .L558+24
	bl	mpi_dev_create_node_with_params
	mov	ip, r0
	cbnz	r0, .L544
	mov	r3, #1880
	ldr	r2, .L558+28
	str	r3, [sp]
	ldr	r3, .L558+4
	b	.L555
.L544:
	add	r5, sp, #20
	ldr	r4, .L558+32
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	mov	r3, r6
	ldm	r5, {r0, r1, r2}
	add	r5, r6, #56
	stm	r4, {r0, r1, r2}
	adds	r4, r4, #64
.L545:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r5
	mov	r2, r4
	stmia	r2!, {r0, r1}
	mov	r4, r2
	bne	.L545
	ldr	r0, [r3]	@ unaligned
	mov	r3, ip
	str	r0, [r2]
	movs	r0, #20
	ldr	r2, [r6, #4]	@ unaligned
	ldr	r1, [r6]	@ unaligned
	bl	vsys_add_node_to_map
	movs	r3, #0
	mov	r2, #-1
	str	r3, [r7, #180]
	ldr	r1, .L558+16
	ldr	r3, .L558+36
	ldr	r0, .L558+40
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L546
	bl	wake_up_process
.L546:
	movs	r1, #4
	movw	r3, #1891
	str	r4, [sp, #4]
	mov	r0, r1
	str	r3, [sp]
	ldr	r2, .L558+44
	ldr	r3, .L558+4
	str	r4, [r7, #168]
	bl	vlog
	b	.L532
.L559:
	.align	2
.L558:
	.word	.LC39
	.word	.LANCHOR0+564
	.word	.LC1
	.word	g_venc_dev+4236
	.word	g_venc_dev
	.word	.LC40
	.word	g_venc_dev+4
	.word	.LC41
	.word	g_venc_dev+4064
	.word	.LC9
	.word	venc_thread_fn
	.word	.LC42
	.fnend
	.size	venc_node_pp_create, .-venc_node_pp_create
	.align	1
	.global	venc_node_pp_get_result
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_get_result, %function
venc_node_pp_get_result:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r1
	ldr	r3, [r1, #4]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r0, #128]
	cmp	r3, #32
	beq	.L561
	movw	r3, #1996
	ldr	r2, .L579
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L579+4
	movs	r0, #4
	bl	vlog
.L578:
	mov	r0, #-1
.L560:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L561:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #0
	ble	.L563
	movs	r2, #1
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #2001
	ldr	r2, .L579+8
	str	r3, [sp]
	ldr	r3, .L579+4
	bl	vlog
	b	.L578
.L563:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r2, #4120
	ldr	r6, [r4, r2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #4076]
	cbz	r3, .L564
	ldr	r3, [r1, #8]	@ unaligned
	cbz	r3, .L564
	add	r3, r4, #4128
	add	r6, r4, r6, lsl #2
	movw	r7, #4232
	ldr	r3, [r3]
	str	r3, [r1, #20]	@ unaligned
	movs	r1, #0
	ldr	r3, [r6, r7]
	ldr	r0, [r3, #448]
	bl	dma_buf_fd
	str	r0, [r5, #16]	@ unaligned
	ldr	r3, [r6, r7]
	ldr	r3, [r3, #448]
	ldr	r3, [r3, #4]
	add	r2, r3, #28
	pld	[r2]
	.syntax unified
@ 223 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
.L564:
	ldr	r3, [r4, #4080]
	cbz	r3, .L565
	ldr	r3, [r5, #12]	@ unaligned
	cbz	r3, .L565
	movw	r3, #4132
	ldr	r3, [r4, r3]
	str	r3, [r5, #24]	@ unaligned
	movw	r3, #4136
	ldr	r3, [r4, r3]
	str	r3, [r5, #28]	@ unaligned
.L565:
	movw	r3, #4124
	movs	r0, #0
	str	r0, [r4, r3]
	b	.L560
.L580:
	.align	2
.L579:
	.word	.LC43
	.word	.LANCHOR0+584
	.word	.LC1
	.fnend
	.size	venc_node_pp_get_result, .-venc_node_pp_get_result
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	kzalloc.constprop.14, %function
kzalloc.constprop.14:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #3520
	b	__kmalloc
	.fnend
	.size	kzalloc.constprop.14, .-kzalloc.constprop.14
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_create_ctx, %function
venc_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movs	r0, #4
	bl	kzalloc.constprop.14
	mov	r4, r0
	cbz	r0, .L582
	ldr	r2, .L587
	movs	r1, #4
	movs	r0, #1
	bl	mpi_queue_create
	mov	r5, r0
	str	r0, [r4]
	cbnz	r0, .L582
	mov	r0, r4
	mov	r4, r5
	bl	kfree
.L582:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L588:
	.align	2
.L587:
	.word	mpi_obj_unref
	.fnend
	.size	venc_create_ctx, .-venc_create_ctx
	.align	1
	.global	vcodec_create_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_create_dev, %function
vcodec_create_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	movs	r0, #164
	mov	r5, r1
	bl	kzalloc.constprop.14
	mov	r4, r0
	cbz	r0, .L589
	ldr	r3, [r5]
	mov	r2, r6
	movs	r1, #8
	str	r3, [r0, #68]
	ldr	r3, [r5, #8]
	str	r3, [r0, #80]
	ldr	r3, [r5, #4]
	str	r3, [r0, #76]
	bl	mpi_dev_register
.L589:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
	.fnend
	.size	vcodec_create_dev, .-vcodec_create_dev
	.align	1
	.global	venc_node_pp_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_delete, %function
venc_node_pp_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	ldr	r6, [r1]
	ldr	r4, [r0, #128]
	cmp	r6, #0
	ble	.L595
	movs	r3, #1
	ldr	r2, .L619
	strd	r6, r3, [sp, #4]
	movs	r1, #2
	mov	r3, #1904
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L619+4
	bl	vlog
	mov	r0, #-1
.L594:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L595:
	ldr	r3, [r4, #164]
	cbz	r3, .L597
	cmn	r3, #4096
	bhi	.L597
	movs	r3, #1
	add	r0, r4, #192
	str	r3, [r4, #176]
	bl	up
	ldr	r3, [r4, #164]
	movs	r1, #4
	ldr	r2, .L619+8
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #1911
	str	r3, [sp]
	ldr	r3, .L619+4
	bl	vlog
	ldr	r0, [r4, #164]
	bl	kthread_stop
	ldr	r3, [r4, #164]
	movs	r1, #4
	ldr	r2, .L619+12
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #1913
	str	r3, [sp]
	ldr	r3, .L619+4
	bl	vlog
	movs	r3, #0
	str	r3, [r4, #164]
.L597:
	add	r5, r4, #4224
	add	r7, r4, #4224
	adds	r5, r5, #8
	adds	r7, r7, #28
	mov	r8, #0
.L599:
	ldr	r0, [r5], #4
	cbz	r0, .L598
	bl	mpi_buf_unmap
	ldr	r0, [r5, #-4]
	bl	mpi_obj_unref
	str	r8, [r5, #-4]
.L598:
	cmp	r5, r7
	bne	.L599
	movw	r5, #4776
	ldr	r0, [r4, r5]
	cbz	r0, .L600
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, r5]
.L600:
	movw	r5, #4784
	ldr	r0, [r4, r5]
	cbz	r0, .L601
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, r5]
.L601:
	mov	r0, r6
	bl	vepu_pp_destroy_chn
	mov	r0, r6
	bl	get_pp_node
	mov	r5, r0
	cbz	r0, .L602
	mov	r2, r6
	movs	r1, #0
	movs	r0, #20
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
.L602:
	add	r0, r4, #31616
	movs	r2, #20
	movs	r1, #0
	add	r0, r0, r2
	bl	memset
	movs	r0, #0
	b	.L594
.L620:
	.align	2
.L619:
	.word	.LC1
	.word	.LANCHOR0+608
	.word	.LC28
	.word	.LC29
	.fnend
	.size	venc_node_pp_delete, .-venc_node_pp_delete
	.align	1
	.global	to_osd_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_osd_stride, %function
to_osd_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r0, r0, #65536
	subs	r0, r0, #10
	cmp	r0, #16
	bhi	.L627
	movs	r2, #1
	movw	r3, #15375
	lsl	r0, r2, r0
	ands	r3, r0, r3
	bne	.L625
	tst	r0, #960
	bne	.L626
	lsls	r3, r0, #15
	bpl	.L627
	movs	r0, #2
	mov	r3, r2
.L623:
	muls	r1, r3, r1
	asr	r0, r1, r0
	bx	lr
.L625:
	movs	r0, #0
	movs	r3, #2
	b	.L623
.L626:
	mov	r0, r3
	movs	r3, #4
	b	.L623
.L627:
	mov	r0, #-1
	bx	lr
	.fnend
	.size	to_osd_stride, .-to_osd_stride
	.align	1
	.global	set_2bpp_color_lut
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_2bpp_color_lut, %function
set_2bpp_color_lut:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	r5, #42
	ldr	r2, [r1]
	mvn	r4, #84
	ldr	r3, [r1, #4]
	mvn	r8, #106
	ubfx	ip, r2, #16, #8
	ubfx	r7, r2, #8, #8
	uxtb	r2, r2
	mvn	r9, #20
	mov	r10, #150
	mov	fp, #77
	mul	r1, r5, r2
	ubfx	lr, r3, #16, #8
	ubfx	r6, r3, #8, #8
	uxtb	r3, r3
	add	r1, r1, #32768
	muls	r5, r3, r5
	mla	r1, r4, r7, r1
	add	r5, r5, #32768
	add	r1, r1, ip, lsl #7
	mla	r4, r4, r6, r5
	asrs	r1, r1, #8
	strb	r1, [r0]
	lsls	r1, r2, #7
	add	r1, r1, #32768
	add	r4, r4, lr, lsl #7
	mla	r1, r8, r7, r1
	asrs	r4, r4, #8
	strb	r4, [r0, #3]
	mla	r1, r9, ip, r1
	asrs	r1, r1, #8
	strb	r1, [r0, #1]
	movs	r1, #29
	mul	ip, r1, ip
	mla	r7, r10, r7, ip
	mla	r2, fp, r2, r7
	asrs	r2, r2, #8
	strb	r2, [r0, #2]
	lsls	r2, r3, #7
	add	r2, r2, #32768
	mla	r8, r8, r6, r2
	mla	r9, r9, lr, r8
	mul	lr, r1, lr
	mla	r6, r10, r6, lr
	asr	r9, r9, #8
	strb	r9, [r0, #4]
	mla	r3, fp, r3, r6
	asrs	r3, r3, #8
	strb	r3, [r0, #5]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	set_2bpp_color_lut, .-set_2bpp_color_lut
	.align	1
	.global	set_invert_buffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_invert_buffer, %function
set_invert_buffer:
	.fnstart
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	mov	r5, r0
	ldrd	r4, r6, [sp, #56]
	strd	r1, r2, [sp]
	str	r3, [sp, #8]
	cmp	r4, #0
	beq	.L630
	cmp	r0, #0
	beq	.L647
	cmp	r6, #0
	beq	.L648
	ldr	r0, [r4, #448]
	bl	dma_buf_vmap
	str	r0, [r4, #604]
	ldr	r3, [r6, #12]
	cbz	r3, .L631
	cmp	r3, #1
	bne	.L632
	mov	ip, #0
	mov	lr, r5
	mov	r8, ip
	str	r3, [sp, #12]
.L633:
	ldr	r3, [sp, #4]
	cmp	r8, r3
	bge	.L632
	mov	r10, lr
	movs	r1, #0
	b	.L646
.L631:
	mov	lr, r5
	mov	r8, r3
.L634:
	ldr	r2, [sp, #4]
	cmp	r8, r2
	bge	.L632
	mov	r10, lr
	mov	ip, #0
	b	.L640
.L638:
	add	r9, r3, ip, lsr #3
	and	r1, ip, #7
	movs	r2, #1
	ldrb	fp, [r10], #1	@ zero_extendqisi2
	lsl	r1, r2, r1
	ldr	r7, [r6, #8]
	ldrsb	r2, [r0, r9]
	add	ip, ip, #1
	sxtb	r1, r1
	cmp	fp, r7
	ite	cc
	orrcc	r2, r2, r1
	biccs	r2, r2, r1
	strb	r2, [r0, r9]
.L640:
	ldr	r2, [sp]
	cmp	ip, r2
	blt	.L638
	add	lr, lr, r2
	ldr	r2, [sp, #8]
	add	r8, r8, #1
	add	r3, r3, r2
	b	.L634
.L644:
	ldr	r3, [sp, #12]
	add	r9, ip, r1, lsr #3
	and	r2, r1, #7
	ldrb	fp, [r10], #1	@ zero_extendqisi2
	ldr	r7, [r6, #8]
	adds	r1, r1, #1
	lsl	r2, r3, r2
	ldrsb	r3, [r0, r9]
	cmp	fp, r7
	sxtb	r2, r2
	ite	hi
	orrhi	r3, r3, r2
	bicls	r3, r3, r2
	strb	r3, [r0, r9]
.L646:
	ldr	r3, [sp]
	cmp	r1, r3
	blt	.L644
	add	lr, lr, r3
	ldr	r3, [sp, #8]
	add	r8, r8, #1
	add	ip, ip, r3
	b	.L633
.L632:
	mov	r0, r5
	bl	kfree
	ldr	r1, [r4, #604]
	ldr	r0, [r4, #448]
	bl	dma_buf_vunmap
	movs	r3, #0
	str	r3, [r4, #604]
.L630:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L647:
	mov	r4, r0
	b	.L630
.L648:
	mov	r4, r6
	b	.L630
	.fnend
	.size	set_invert_buffer, .-set_invert_buffer
	.align	1
	.global	create_lingt_lut
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	create_lingt_lut, %function
create_lingt_lut:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	kzalloc.constprop.14
	cbnz	r0, .L658
.L654:
	pop	{r4, pc}
.L656:
	strb	r3, [r0, r3]
	adds	r3, r3, #1
.L655:
	cmp	r3, r4
	blt	.L656
	b	.L654
.L658:
	movs	r3, #0
	b	.L655
	.fnend
	.size	create_lingt_lut, .-create_lingt_lut
	.global	__aeabi_uidiv
	.align	1
	.global	to_osd_invert_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_osd_invert_cfg, %function
to_osd_invert_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	mov	r4, r0
	ldr	r7, [r1, #12]
	mov	r6, r1
	ldr	r5, [r1, #72]
	ldr	r0, [r7, #40]
	subs	r3, r5, #1
	mov	r1, r5
	add	r3, r3, r0
	rsbs	r0, r5, #0
	ands	r0, r0, r3
	bl	__aeabi_uidiv
	ldr	r1, [r6, #76]
	subs	r3, r1, #1
	mov	r8, r0
	ldr	r0, [r7, #44]
	add	r7, r8, #7
	add	r3, r3, r0
	rsbs	r0, r1, #0
	ands	r0, r0, r3
	asrs	r7, r7, #3
	bl	__aeabi_uidiv
	cmp	r5, #32
	mov	r9, r0
	mul	r10, r0, r8
	beq	.L660
	cmp	r5, #64
	beq	.L661
	cmp	r5, #16
	bne	.L662
	movs	r3, #0
.L666:
	str	r3, [r4, #20]
.L663:
	movs	r3, #0
	movs	r2, #1
	str	r3, [r4, #8]
	mov	r0, r10
	strd	r2, r2, [r4]
	strd	r3, r3, [r4, #12]
	str	r7, [r4, #24]
	bl	create_lingt_lut
	cbnz	r0, .L664
	movw	r3, #538
	ldr	r2, .L667
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L667+4
	movs	r0, #4
	bl	vlog
.L659:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L660:
	movs	r3, #1
	b	.L666
.L661:
	movs	r3, #3
	b	.L666
.L662:
	ldr	r0, .L667+8
	bl	printk
	b	.L663
.L664:
	add	r3, r6, #72
	str	r3, [sp, #4]
	ldr	r3, [r6, #16]
	mov	r2, r9
	mov	r1, r8
	str	r3, [sp]
	mov	r3, r7
	bl	set_invert_buffer
	str	r0, [r4, #32]
	b	.L659
.L668:
	.align	2
.L667:
	.word	.LC45
	.word	.LANCHOR0+628
	.word	.LC44
	.fnend
	.size	to_osd_invert_cfg, .-to_osd_invert_cfg
	.align	1
	.global	set_osd_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_osd_data, %function
set_osd_data:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r5, r0
	ldr	r3, [r1, #104]
	mov	r9, r1
	cbnz	r3, .L670
	str	r3, [r0, #4]
.L669:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L670:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	fp, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, [r1, #84]
	movs	r6, #0
	subs	r4, r4, #4
.L672:
	adds	r3, r4, #4
	add	r2, r9, #84
	cmp	r3, r2
	bne	.L688
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, fp	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	str	r6, [r5, #4]
	b	.L669
.L688:
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #1752]
	cmp	r3, #0
	beq	.L673
	movs	r3, #140
	ldr	r2, [r4, #20]
	mla	r3, r3, r6, r5
	adds	r2, r2, #0
	it	ne
	movne	r2, #1
	str	r2, [r3, #8]
	ldr	r2, [r4, #28]
	str	r2, [r3, #28]
	ldr	r2, [r4, #32]
	str	r2, [r3, #32]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #28]
	ldr	r2, [r2, #40]
	add	r2, r2, r1
	subs	r2, r2, #1
	str	r2, [r3, #36]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #32]
	ldr	r2, [r2, #44]
	add	r2, r2, r1
	subs	r2, r2, #1
	str	r2, [r3, #40]
	ldr	r2, [r4, #12]
	ldr	r0, [r2, #1752]
	str	r0, [r3, #136]
	cbz	r0, .L674
	bl	mpi_obj_ref
.L674:
	ldr	r3, [r4, #12]
	movs	r7, #140
	ldrd	r0, r1, [r3, #36]
	bl	to_osd_stride
	movs	r3, #140
	mla	r3, r3, r6, r5
	movs	r1, #1
	add	r10, r6, r1
	str	r0, [r3, #44]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #16
	itet	ls
	ldrls	r2, .L711
	movhi	r3, #-1
	addls	r3, r2, r3, lsl #2
	mla	r2, r7, r6, r5
	it	ls
	ldrls	r3, [r3, #648]
	mul	r7, r7, r10
	str	r3, [r2, #20]
	movs	r3, #0
	strd	r3, r1, [r2, #12]
	add	r8, r5, r7
	ldrd	r2, r0, [r4, #36]
	strb	r3, [r5, r7]
	strb	r3, [r8, #1]
	strb	r3, [r8, #2]
	strb	r3, [r8, #3]
	strb	r3, [r8, #4]
	strb	r3, [r8, #5]
	strb	r0, [r8, #6]
	strb	r2, [r8, #7]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #16
	bhi	.L676
	lsl	r3, r1, r3
	movw	r2, #9797
	ands	r2, r3, r2
	bne	.L677
	ldr	r1, .L711+4
	tst	r3, r1
	bne	.L691
.L676:
	ldr	r0, .L711+8
	bl	printk
	mov	r1, #-1
.L677:
	movs	r2, #140
	mla	r2, r2, r6, r5
	str	r1, [r2, #24]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #16
	bhi	.L678
	movs	r1, #1
	lsl	r3, r1, r3
	ands	r2, r3, #207
	bne	.L679
	ldr	r1, .L711+12
	tst	r3, r1
	bne	.L693
.L678:
	ldr	r0, .L711+16
	bl	printk
	mov	r1, #-1
.L679:
	movs	r2, #140
	mla	r2, r2, r6, r5
	str	r1, [r2, #92]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #16
	bhi	.L680
	movs	r2, #1
	movw	r1, #13260
	lsl	r3, r2, r3
	tst	r3, r1
	bne	.L694
	ldr	r1, .L711+20
	tst	r3, r1
	bne	.L681
.L680:
	mov	r3, #404
	ldr	r2, .L711+24
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L711+28
	movs	r0, #4
	bl	vlog
.L694:
	movs	r2, #0
.L681:
	movs	r3, #140
	mla	r3, r3, r6, r5
	str	r2, [r3, #104]
	ldr	r2, [r4, #40]
	str	r2, [r3, #96]
	ldr	r2, [r4, #36]
	str	r2, [r3, #100]
	ldr	r3, [r3, #20]
	cmp	r3, #17
	bne	.L682
	add	r1, r4, #64
	mov	r0, r8
	bl	set_2bpp_color_lut
.L682:
	ldr	r3, [r4, #88]
	cbz	r3, .L684
	ldr	r3, [r4, #16]
	cbz	r3, .L684
	sub	r0, r7, #84
	mov	r1, r4
	add	r0, r0, r5
	bl	to_osd_invert_cfg
	movs	r3, #140
	mla	r3, r3, r6, r5
	ldr	r0, [r3, #88]
	cbz	r0, .L684
	bl	mpi_obj_ref
.L684:
	ldr	r3, [r4, #48]
	cbz	r3, .L686
	movs	r3, #140
	movs	r2, #1
	mla	r6, r3, r6, r5
	movs	r1, #51
	movs	r3, #0
	str	r2, [r6, #108]
	strd	r1, r3, [r6, #120]
	ldr	r3, [r4, #60]
	str	r3, [r6, #116]
	ldr	r3, [r4, #52]
	cmp	r3, #0
	it	ne
	movne	r3, r2
	str	r3, [r6, #112]
.L686:
	mov	r6, r10
.L673:
	ldr	r4, [r4, #4]
	subs	r4, r4, #4
	b	.L672
.L691:
	mov	r1, r2
	b	.L677
.L693:
	mov	r1, r2
	b	.L679
.L712:
	.align	2
.L711:
	.word	.LANCHOR0
	.word	72074
	.word	.LC46
	.word	81664
	.word	.LC47
	.word	68611
	.word	.LC48
	.word	.LANCHOR0+716
	.fnend
	.size	set_osd_data, .-set_osd_data
	.align	1
	.global	mpi_buf_ref_with_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_ref_with_node, %function
mpi_buf_ref_with_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7}
	.save {r4, r5, r6, r7}
	cbz	r0, .L713
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r6, .L719
	movs	r2, #0
	movs	r3, #12
.L717:
	mul	r4, r3, r2
	ldr	r7, [r4, r6]
	cbnz	r7, .L715
	ldr	r3, .L719+4
	movw	r2, #31660
	add	r3, r3, r4
	str	r0, [r3, r2]
	movw	r2, #31668
	ldr	r1, [r1, #76]
	str	r1, [r3, r2]
	movw	r1, #31664
	ldr	r2, [r3, r1]
	adds	r2, r2, #1
	str	r2, [r3, r1]
.L716:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7}
	b	mpi_obj_ref
.L715:
	adds	r2, r2, #1
	cmp	r2, #512
	bne	.L717
	b	.L716
.L713:
	pop	{r4, r5, r6, r7}
	bx	lr
.L720:
	.align	2
.L719:
	.word	g_venc_dev+31660
	.word	g_venc_dev
	.fnend
	.size	mpi_buf_ref_with_node, .-mpi_buf_ref_with_node
	.align	1
	.global	vcodec_handle_message
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_handle_message, %function
vcodec_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	ldr	r3, [r0, #8]
	.pad #28
	sub	sp, sp, #28
	mov	r7, r1
	mov	r5, r2
	cmp	r3, #1
	beq	.L756
.L798:
	movs	r7, #0
.L769:
	mov	r0, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L756:
	movs	r6, #0
.L722:
	mov	r0, r6
	bl	get_venc_node
	cmp	r8, r0
	beq	.L724
	adds	r6, r6, #1
	cmp	r6, #16
	bne	.L722
	movw	r3, #705
	mov	r2, #-1
	strd	r3, r2, [sp]
	ldr	r3, .L800
	ldr	r2, .L800+4
.L799:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	b	.L798
.L724:
	ldr	r3, [r8, #288]
	ldr	r9, [r3]
	cmp	r9, #0
	bne	.L796
	movw	r3, #711
	str	r6, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L800+8
	ldr	r3, .L800
	b	.L799
.L796:
	cmp	r7, #1
	beq	.L728
	subs	r3, r7, #7
	rsbs	r7, r3, #0
	adcs	r7, r7, r3
	b	.L769
.L728:
	cmp	r5, #0
	beq	.L798
	ldr	r4, .L800+12
	add	r10, r6, #56
	ldr	r3, [r4, r10, lsl #2]
	cbz	r3, .L730
	ldr	r0, [r4, #212]
	cbz	r0, .L731
	ldr	r1, [r4, #216]
	cbz	r1, .L731
	add	r3, r8, #144
	add	r2, r8, #152
	bl	mpi_node_set_frame_rate
	movs	r3, #0
	strd	r3, r3, [r4, #212]
.L731:
	ldr	r3, [r5, #668]
	cbnz	r3, .L732
	ldr	r2, [r4, #220]
	cbz	r2, .L732
	str	r3, [r4, #220]
	b	.L798
.L732:
	ldr	r2, [r4, #336]
	cmp	r3, r2
	beq	.L733
	movs	r1, #4
	strd	r2, r3, [sp, #4]
	mov	r0, r1
	mov	r3, #740
	ldr	r2, .L800+16
	str	r3, [sp]
	ldr	r3, .L800
	bl	vlog
.L733:
	ldr	r3, [r5, #668]
	adds	r3, r3, #1
	str	r3, [r4, #336]
.L730:
	ldr	r3, [r4, #328]
	cmp	r3, #0
	ble	.L734
	subs	r3, r3, #1
	str	r3, [r4, #328]
	b	.L798
.L734:
	add	r3, r6, #7648
	adds	r3, r3, #6
	ldr	r3, [r4, r3, lsl #2]
	cmp	r3, #9
	beq	.L735
	cmp	r3, #15
	bne	.L736
.L735:
	add	r3, r6, #238
	lsls	r3, r3, #4
	adds	r2, r4, r3
	ldr	r3, [r4, r3]
	cmp	r3, #0
	beq	.L798
	ble	.L736
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L798
	movs	r3, #1
	str	r3, [r2, #4]
.L736:
	adds	r2, r4, r6
	movw	r3, #4916
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L737
	ldr	r3, .L800+20
	movs	r2, #0
.L739:
	ldrb	r1, [r3], #1	@ zero_extendqisi2
	cmp	r1, r6
	beq	.L738
	adds	r2, r2, #1
	cmp	r2, #16
	bne	.L739
	b	.L798
.L740:
	add	lr, lr, #1
	cmp	lr, #100
	bne	.L741
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, ip	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L798
.L743:
	str	r5, [r4, #340]
	b	.L745
.L742:
	mov	r0, r9
	bl	mpi_queue_pop_obj
	mov	r7, r0
	cbnz	r0, .L747
	ldrd	r2, [r5, #672]
	movs	r1, #4
	mov	r0, r1
	mov	r7, #-1
	strd	r2, [sp, #8]
	movw	r3, #787
	ldr	r2, .L800+24
	str	r3, [sp]
	ldr	r3, .L800
	bl	vlog
	mov	r0, r5
	bl	mpi_buf_unref
	b	.L769
.L747:
	ldr	r3, [fp, #8]
	cmp	r3, #19
	add	r2, r3, #1
	str	r2, [fp, #8]
	bgt	.L748
	ldr	r3, [r0]
	movs	r1, #4
	ldr	r2, .L800+28
	mov	r0, r1
	str	r3, [sp, #12]
	ldr	r3, [r8]
	str	r3, [sp, #8]
	ldr	r3, [r8, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movw	r3, #793
	str	r3, [sp]
	ldr	r3, .L800
	bl	vlog
.L748:
	mov	r0, r7
	mov	r7, #-1
	bl	mpi_buf_unref
.L755:
	mov	r1, r5
	mov	r0, r9
	bl	mpi_queue_push_obj
	cbnz	r0, .L746
	ldr	r3, [r4, r10, lsl #2]
	cmp	r3, #0
	beq	.L742
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #340]
	cmp	r3, #0
	beq	.L743
	ldr	r2, .L800+32
	ldr	r3, [r2, #4]
	cmp	r3, #19
	add	r1, r3, #1
	str	r1, [r2, #4]
	bgt	.L744
	ldr	r3, [r5, #668]
	movs	r1, #2
	ldr	r2, .L800+36
	movs	r0, #4
	str	r3, [sp, #4]
	movw	r3, #774
	str	r3, [sp]
	ldr	r3, .L800
	bl	vlog
.L744:
	mov	r0, r5
	bl	mpi_buf_unref
.L745:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r7, #-1
.L746:
	ldr	r3, [r4, #324]
	cbz	r3, .L751
	bl	mcu_get_wrap_status
	cmp	r0, #2
	itt	ne
	movne	r3, #0
	strne	r3, [r4, #324]
.L751:
	ldr	r3, [r4, r10, lsl #2]
	cbz	r3, .L753
	ldr	r3, [r4, #324]
	cbnz	r3, .L753
	bl	mcu_wrap_start
	movs	r3, #1
	str	r3, [r4, #324]
	movs	r1, #4
	ldr	r3, [r5, #668]
	mov	r0, r1
	ldr	r2, .L800+40
	str	r3, [sp, #20]
	ldr	r3, [r5, #632]
	str	r3, [sp, #16]
	ldr	r3, [r5, #628]
	str	r3, [sp, #12]
	ldr	r3, [r5, #624]
	str	r3, [sp, #8]
	ldr	r3, [r5, #620]
	str	r3, [sp, #4]
	movw	r3, #807
	str	r3, [sp]
	ldr	r3, .L800
	bl	vlog
.L753:
	cmp	r6, #0
	bne	.L769
	ldr	r3, [r4, #224]
	cmp	r3, #0
	beq	.L769
	bl	mcu_get_wrap_status
	cmp	r0, #2
	bne	.L769
	mov	r0, r6
	bl	mpp_vcodec_run_task
	cbnz	r0, .L754
	movs	r3, #1
	str	r3, [r4, #332]
	b	.L769
.L754:
	ldr	r3, [r5, #668]
	movs	r1, #5
	str	r0, [sp, #8]
	movs	r0, #4
	ldr	r2, .L800+44
	str	r3, [sp, #4]
	movw	r3, #817
	str	r3, [sp]
	ldr	r3, .L800
	str	r6, [r4, #332]
	bl	vlog
	b	.L769
.L801:
	.align	2
.L800:
	.word	.LANCHOR0+736
	.word	.LC49
	.word	.LC50
	.word	g_venc_dev
	.word	.LC51
	.word	g_venc_dev+4932
	.word	.LC53
	.word	.LC54
	.word	.LANCHOR1
	.word	.LC52
	.word	.LC55
	.word	.LC56
.L738:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	ip, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, #800
	mov	lr, #0
	mla	r3, r3, r2, r4
	add	r3, r3, #17792
	adds	r3, r3, #24
.L741:
	ldrd	r0, [r3], #8
	orrs	fp, r0, r1
	beq	.L740
	movs	r3, #100
	strd	r0, [r5, #672]
	mla	r3, r3, r2, lr
	movs	r0, #0
	movs	r1, #0
	addw	r2, r3, #627
	addw	r3, r3, #2227
	add	r2, r4, r2, lsl #3
	add	r3, r4, r3, lsl #3
	strd	r0, [r2]
	strd	r0, [r3]
.L737:
	ldr	r3, [r9, #16]
	movs	r1, #5
	ldr	r2, .L802
	movs	r0, #4
	ldr	fp, .L802+8
	str	r3, [sp, #16]
	ldr	r3, [r5]
	str	r3, [sp, #12]
	ldr	r3, [r8]
	str	r3, [sp, #8]
	ldr	r3, [r8, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movw	r3, #765
	str	r3, [sp]
	ldr	r3, .L802+4
	bl	vlog
	mov	r2, r6
	mov	r1, r8
	mov	r0, r5
	bl	mpi_buf_ref_with_node
	b	.L755
.L803:
	.align	2
.L802:
	.word	.LC57
	.word	.LANCHOR0+736
	.word	.LANCHOR1
	.fnend
	.size	vcodec_handle_message, .-vcodec_handle_message
	.global	__aeabi_idiv
	.align	1
	.global	to_frame_pixel_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_frame_pixel_stride, %function
to_frame_pixel_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r3, r0
	cmp	r3, #65537
	mov	r0, r1
	bhi	.L805
	cmp	r3, #65536
	bcs	.L808
	cmp	r3, #8
	beq	.L808
	cmp	r3, #10
	ite	eq
	moveq	r1, #2
	movne	r1, #1
.L806:
	bl	__aeabi_idiv
	pop	{r3, pc}
.L805:
	ldr	r2, .L813
	cmp	r3, r2
	bcc	.L810
	adds	r2, r2, #1
	cmp	r3, r2
	bls	.L811
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #3
	ite	hi
	movhi	r1, #1
	movls	r1, #4
	b	.L806
.L808:
	movs	r1, #2
	b	.L806
.L810:
	movs	r1, #1
	b	.L806
.L811:
	movs	r1, #3
	b	.L806
.L814:
	.align	2
.L813:
	.word	65542
	.fnend
	.size	to_frame_pixel_stride, .-to_frame_pixel_stride
	.align	1
	.global	dma_buf_import_mpi_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dma_buf_import_mpi_buf, %function
dma_buf_import_mpi_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r1
	movs	r1, #0
	mov	r6, r2
	bl	mpi_buf_create
	mov	r4, r0
	cmp	r0, #0
	beq	.L815
	ldr	r3, .L824
	str	r3, [r0, #4]
	ldr	r3, [r5]
	str	r3, [r0, #620]
	ldr	r3, [r5, #4]
	str	r3, [r0, #624]
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #28]
	bl	to_frame_pixel_stride
	ldr	r2, .L824+4
	add	r7, r2, #764
	str	r0, [r4, #628]
	ldr	r3, [r5, #12]
	str	r3, [r4, #632]
	movs	r3, #0
	ldr	r0, [r5, #28]
.L819:
	lsls	r1, r3, #3
	add	ip, r1, r7
	ldr	ip, [ip, #4]
	cmp	r0, ip
	bne	.L817
	add	r2, r2, r1
	ldr	r3, [r2, #764]
.L818:
	str	r3, [r4, #640]
	cmp	r6, #0
	ldrd	r2, [r5, #40]
	strd	r2, [r4, #672]
	mov	r3, #4
	str	r3, [r4, #584]
	blt	.L815
	ldr	r2, [r5, #48]
	cmp	r2, #15
	bhi	.L815
	ldr	r3, .L824+8
	movs	r1, #1
	add	r2, r3, r2, lsl #4
	str	r1, [r2, #3800]
	ldr	r2, [r5, #48]
	add	r2, r3, r2, lsl #4
	str	r6, [r2, #3804]
	ldr	r2, [r5, #48]
	add	r3, r3, r2, lsl #4
	str	r1, [r3, #3808]
.L815:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L817:
	adds	r3, r3, #1
	cmp	r3, #31
	bne	.L819
	mov	r3, #-1
	b	.L818
.L825:
	.align	2
.L824:
	.word	.LC9
	.word	.LANCHOR0
	.word	g_venc_dev
	.fnend
	.size	dma_buf_import_mpi_buf, .-dma_buf_import_mpi_buf
	.align	1
	.global	to_frame_hor_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_frame_hor_stride, %function
to_frame_hor_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #65537
	bhi	.L827
	cmp	r0, #65536
	bcs	.L829
	subs	r0, r0, #9
	cmp	r0, #1
	ite	hi
	movhi	r0, #1
	movls	r0, #2
.L828:
	muls	r0, r1, r0
	bx	lr
.L827:
	ldr	r3, .L834
	cmp	r0, r3
	bcc	.L831
	adds	r3, r3, #1
	cmp	r0, r3
	bls	.L832
	sub	r0, r0, #65536
	subs	r0, r0, #16
	cmp	r0, #3
	ite	hi
	movhi	r0, #1
	movls	r0, #4
	b	.L828
.L829:
	movs	r0, #2
	b	.L828
.L831:
	movs	r0, #1
	b	.L828
.L832:
	movs	r0, #3
	b	.L828
.L835:
	.align	2
.L834:
	.word	65542
	.fnend
	.size	to_frame_hor_stride, .-to_frame_hor_stride
	.align	1
	.global	get_mpi_buf_frm_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpi_buf_frm_info, %function
get_mpi_buf_frm_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r6, r0
	ldr	r3, .L939
	mov	r5, r1
	mov	r7, r2
	mov	r9, #0
	mov	r4, r3
.L839:
	ldr	r2, [r3, #3800]
	cmp	r2, #0
	beq	.L837
	ldr	r2, [r3, #3804]
	cmp	r7, r2
	bne	.L837
	add	r3, r4, r9, lsl #4
	ldr	r3, [r3, #3808]
	adds	r2, r3, #1
	beq	.L838
	cmp	r3, #0
	it	le
	movle	r9, #-1
.L838:
	cmp	r7, #15
	bhi	.L883
	movs	r3, #192
	mov	r8, #0
	mla	r3, r3, r7, r4
	mov	r2, r3
.L842:
	ldr	r1, [r2, #344]
	cmp	r1, r6
	beq	.L841
	add	r8, r8, #1
	adds	r2, r2, #12
	cmp	r8, #16
	bne	.L842
	mov	r8, #0
.L844:
	ldr	r2, [r3, #344]
	cbnz	r2, .L843
	movs	r3, #192
	mul	r2, r3, r7
	movs	r3, #12
	mla	r3, r3, r8, r2
	add	r3, r3, r4
	str	r6, [r3, #344]
.L841:
	mov	r10, #192
	mul	r3, r10, r7
	mov	r10, #12
	mla	r10, r10, r8, r3
	add	r10, r10, r4
	ldr	r3, [r10, #348]
	cbnz	r3, .L881
	mov	r0, #1128
	bl	kzalloc.constprop.14
	str	r0, [r10, #348]
.L881:
	cmp	r9, #-1
	beq	.L840
	mov	r10, #192
	mul	r3, r10, r7
	mov	r10, #12
	mla	r10, r10, r8, r3
	add	r10, r10, r4
	ldr	r3, [r10, #352]
	cbnz	r3, .L840
	mov	r0, #1128
	bl	kzalloc.constprop.14
	str	r0, [r10, #352]
.L840:
	cbnz	r6, .L846
.L938:
	movs	r0, #0
.L836:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L837:
	add	r9, r9, #1
	adds	r3, r3, #16
	cmp	r9, #16
	bne	.L839
	mov	r9, #-1
	b	.L838
.L843:
	add	r8, r8, #1
	adds	r3, r3, #12
	cmp	r8, #16
	bne	.L844
	movw	r3, #1356
	str	r6, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L939+4
	movs	r0, #4
	ldr	r2, .L939+8
	bl	vlog
	b	.L840
.L883:
	mov	r8, #16
	b	.L840
.L940:
	.align	2
.L939:
	.word	g_venc_dev
	.word	.LANCHOR0+1012
	.word	.LC59
.L846:
	cmp	r5, #0
	beq	.L938
	ldr	r3, [r6, #620]
	str	r3, [r5]
	ldr	r3, [r6, #624]
	str	r3, [r5, #4]
	ldr	r1, [r6, #628]
	ldr	r0, [r6, #640]
	bl	to_frame_hor_stride
	cmp	r7, #0
	str	r0, [r5, #8]
	ldr	r3, [r6, #632]
	str	r3, [r5, #12]
	blt	.L850
	ldrd	r2, [r6, #672]
	strd	r2, [r5, #40]
	ldr	r3, [r6, #668]
	str	r3, [r5, #80]
	movs	r3, #0
	str	r3, [r5, #84]
	add	r3, r7, #56
	ldr	r3, [r4, r3, lsl #2]
	cbz	r3, .L850
	ldrd	r0, [r6, #672]
	ldr	r3, [r6, #668]
	orrs	r2, r0, r1
	bne	.L852
	cbz	r3, .L853
.L852:
	adds	r3, r3, #1
	movs	r1, #0
	mov	r0, r3
.L853:
	strd	r0, [r5, #80]
	ldrd	r2, [r6, #672]
	orrs	r3, r2, r3
	bne	.L854
	ldr	r3, [r6, #668]
	cmp	r3, #0
	bne	.L854
.L857:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r10, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #340]
	cmp	r3, #0
	bne	.L855
.L856:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r10	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L850:
	cmp	r7, #15
	mov	r3, #0
	strd	r3, r3, [r5, #20]
	bhi	.L859
	movs	r3, #24
	mla	r3, r3, r7, r4
	ldr	r2, [r3, #3416]
	cmp	r2, r7
	itttt	eq
	ldreq	r2, [r3, #3420]
	streq	r2, [r5, #20]
	ldreq	r3, [r3, #3424]
	streq	r3, [r5, #24]
.L859:
	cmp	r8, #16
	mov	r3, #0
	str	r9, [r5, #48]
	str	r3, [r5, #52]
	str	r3, [r5, #60]
	beq	.L861
	movs	r3, #192
	mov	r0, r7
	mul	r2, r3, r7
	movs	r3, #12
	mla	r3, r3, r8, r2
	add	r3, r3, r4
	ldr	r10, [r3, #348]
	bl	get_venc_node
	mov	r1, r0
	cmp	r0, #0
	bne	.L862
.L864:
	movs	r3, #0
	str	r3, [r5, #52]
.L863:
	cmp	r9, #-1
	beq	.L861
	movs	r2, #192
	movs	r3, #12
	muls	r2, r7, r2
	mov	r0, r9
	mla	r8, r3, r8, r2
	add	r8, r8, r4
	ldr	r8, [r8, #352]
	bl	get_venc_node
	mov	r1, r0
	cmp	r0, #0
	bne	.L866
.L867:
	movs	r3, #0
	str	r3, [r5, #60]
.L861:
	ldr	r3, [r6]
	ldr	r2, .L941
	str	r3, [r5, #56]
	add	ip, r2, #764
	ldr	r1, [r6, #640]
	movs	r3, #0
.L870:
	ldr	r0, [ip, r3, lsl #3]
	cmp	r1, r0
	bne	.L868
	add	r3, r2, r3, lsl #3
	ldr	r3, [r3, #768]
.L869:
	str	r3, [r5, #28]
	add	r3, r7, #56
	ldr	r3, [r4, r3, lsl #2]
	cmp	r3, #0
	bne	.L885
	ldr	r3, [r6, #584]
	tst	r3, #4
	ite	eq
	moveq	r3, #1
	movne	r3, #0
.L871:
	str	r3, [r5, #64]
	cbnz	r7, .L872
	ldr	r3, [r4, #224]
	cbz	r3, .L872
	ldrd	r2, [r5, #80]
	cmp	r3, #0
	it	eq
	cmpeq	r2, #4
	itt	cc
	movcc	r3, #1
	strcc	r3, [r5, #92]
.L872:
	movs	r3, #0
	str	r3, [r5, #88]
	cmp	r7, #0
	bne	.L938
	ldr	r2, [r4, #4072]
	ldr	r3, [r4, #4076]
	orrs	r3, r2, r3
	beq	.L873
	movw	r1, #5500
	movw	r0, #4500
	bl	usleep_range
.L873:
	movs	r2, #112
	movs	r1, #0
	ldr	r0, .L941+4
	bl	memset
	ldr	r3, [r4, #4072]
	cbz	r3, .L874
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r2, #4784
	ldr	r3, [r6, #668]
	ldr	r2, [r4, r2]
	cmp	r3, r2
	beq	.L886
	movw	r2, #4792
	ldr	r2, [r4, r2]
	cmp	r3, r2
	bne	.L876
	movs	r2, #1
.L875:
	addw	r3, r2, #597
	movw	r1, #4796
	add	r3, r4, r3, lsl #3
	ldr	r3, [r3, #4]
	ldr	ip, [r3, #448]
	movs	r3, #56
	muls	r3, r2, r3
	adds	r7, r4, r3
	add	r3, r3, r1
	add	r3, r3, r4
	str	ip, [r7, r1]
	str	r3, [r5, #88]
	movw	r3, #4908
	str	r2, [r4, r3]
.L876:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L874:
	ldr	r3, [r4, #4076]
	cmp	r3, #0
	beq	.L938
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r7, .L941+8
	movs	r3, #0
	ldr	r0, [r6, #668]
	mov	ip, #52
.L879:
	mul	r2, ip, r3
	ldr	r6, [r2, r7]
	cmp	r0, r6
	bne	.L877
	movw	r3, #4908
	add	r2, r2, r4
	ldr	r0, [r4, r3]
	movs	r3, #56
	add	r2, r2, #4256
	muls	r3, r0, r3
	ldr	r6, [r2]
	movw	r2, #4804
	adds	r0, r4, r3
	add	r3, r3, #4768
	adds	r3, r3, #28
	str	r6, [r0, r2]
	add	r4, r4, r3
	str	r4, [r5, #88]
.L878:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L938
.L854:
	bl	mcu_get_wrap_status
	cmp	r0, #2
	beq	.L857
	mov	r0, #-1
	b	.L836
.L855:
	mov	r0, r7
	bl	get_venc_node
	ldr	r1, [r4, #340]
	ldr	r3, [r0, #288]
	ldr	r0, [r3]
	bl	mpi_queue_push_obj
	cbz	r0, .L858
	movs	r3, #0
	str	r3, [r4, #340]
	b	.L856
.L858:
	ldr	r1, [r4, #340]
	movs	r0, #4
	ldrd	r2, [r1, #672]
	strd	r2, [sp, #8]
	ldr	r3, [r1, #668]
	movs	r1, #2
	ldr	r2, .L941+12
	str	r3, [sp, #4]
	mov	r3, #1392
	str	r3, [sp]
	ldr	r3, .L941+16
	bl	vlog
	b	.L856
.L862:
	cmp	r10, #0
	beq	.L864
	mov	r0, r10
	bl	set_osd_data
	ldr	r3, [r10, #4]
	cmp	r3, #0
	beq	.L864
	str	r10, [r5, #52]
	b	.L863
.L866:
	cmp	r8, #0
	beq	.L867
	mov	r0, r8
	bl	set_osd_data
	ldr	r3, [r8, #4]
	cmp	r3, #0
	beq	.L867
	str	r8, [r5, #60]
	b	.L861
.L868:
	adds	r3, r3, #1
	cmp	r3, #31
	bne	.L870
	mov	r3, #-1
	b	.L869
.L885:
	movs	r3, #0
	b	.L871
.L886:
	movs	r2, #0
	b	.L875
.L877:
	adds	r3, r3, #1
	cmp	r3, #10
	bne	.L879
	b	.L878
.L942:
	.align	2
.L941:
	.word	.LANCHOR0
	.word	g_venc_dev+4796
	.word	g_venc_dev+4304
	.word	.LC58
	.word	.LANCHOR0+1012
	.fnend
	.size	get_mpi_buf_frm_info, .-get_mpi_buf_frm_info
	.align	1
	.global	venc_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_probe, %function
venc_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r2, #37808
	ldr	r4, .L944
	mov	r7, r0
	movs	r1, #0
	ldr	r6, .L944+4
	adds	r5, r4, #4
	mov	r0, r4
	bl	memset
	movs	r2, #16
	mov	r1, #-1
	ldr	r0, .L944+8
	bl	memset
	ldr	r2, .L944+12
	ldr	r1, .L944+16
	addw	r0, r4, #4056
	bl	__init_waitqueue_head
	mov	r1, #3264
	mov	r0, r7
	bl	kstrdup
	mov	r2, r7
	movs	r1, #8
	addw	r3, r6, #1036
	str	r4, [r4, #164]
	str	r3, [r4, #188]
	movs	r3, #23
	str	r3, [r4, #192]
	str	r0, [r4]
	mov	r0, r5
	bl	mpi_dev_register
	ldr	r3, .L944+20
	add	r1, r6, #1496
	mov	r0, r5
	str	r3, [r4, #72]
	ldr	r3, .L944+24
	str	r3, [r4, #80]
	ldr	r3, .L944+28
	str	r3, [r4, #84]
	bl	mpi_sysfs_dev_add
	add	r3, r4, #172
	str	r3, [r4, #172]
	str	r3, [r4, #176]
	movs	r3, #0
	str	r3, [r4, #196]
	add	r3, r4, #200
	strd	r3, r3, [r4, #200]
	pop	{r3, r4, r5, r6, r7, pc}
.L945:
	.align	2
.L944:
	.word	g_venc_dev
	.word	.LANCHOR0
	.word	g_venc_dev+4932
	.word	.LANCHOR1+12
	.word	.LC60
	.word	venc_create_ctx
	.word	venc_destroy_ctx
	.word	venc_handle_message
	.fnend
	.size	venc_probe, .-venc_probe
	.align	1
	.global	venc_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_shutdown, %function
venc_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L947
	mov	r0, r4
	bl	mpi_sysfs_dev_remove
	mov	r0, r4
	bl	mpi_dev_unregister
	ldr	r0, [r4, #-4]
	pop	{r4, lr}
	b	kfree
.L948:
	.align	2
.L947:
	.word	g_venc_dev+4
	.fnend
	.size	venc_shutdown, .-venc_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	venc_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_init, %function
venc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L950
	ldr	r0, .L950+4
	bl	venc_probe
	add	r0, r4, #68
	mov	r1, r4
	bl	vmpi_register_fn2vcocdec
	mov	r0, r4
	bl	register_vmpibuf_func_to_pp
	movs	r0, #0
	pop	{r4, pc}
.L951:
	.align	2
.L950:
	.word	.LANCHOR2
	.word	.LC9
	.fnend
	.size	venc_init, .-venc_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	venc_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_exit, %function
venc_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	vmpi_unregister_fn2vcocdec
	bl	unregister_vmpibuf_func_pp
	pop	{r3, lr}
	b	venc_shutdown
	.fnend
	.size	venc_exit, .-venc_exit
	.global	gmpi_buf_ops
	.global	gmpidev_ops
	.global	g_venc_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.37977, %object
	.size	__func__.37977, 25
__func__.37977:
	.ascii	"venc_node_pp_get_md_attr\000"
	.type	__func__.37990, %object
	.size	__func__.37990, 20
__func__.37990:
	.ascii	"venc_node_enable_tb\000"
	.type	__func__.38003, %object
	.size	__func__.38003, 18
__func__.38003:
	.ascii	"venc_node_tb_bind\000"
	.type	__func__.38017, %object
	.size	__func__.38017, 21
__func__.38017:
	.ascii	"venc_node_tb_request\000"
	.type	__func__.37444, %object
	.size	__func__.37444, 22
__func__.37444:
	.ascii	"vcodec_set_intra_info\000"
	.type	__func__.37466, %object
	.size	__func__.37466, 14
__func__.37466:
	.ascii	"vcodec_notify\000"
	.type	__func__.37532, %object
	.size	__func__.37532, 14
__func__.37532:
	.ascii	"mpi_buf_unref\000"
	.type	__func__.37715, %object
	.size	__func__.37715, 17
__func__.37715:
	.ascii	"venc_node_create\000"
	.type	__func__.37731, %object
	.size	__func__.37731, 17
__func__.37731:
	.ascii	"venc_node_delete\000"
	.type	__func__.37750, %object
	.size	__func__.37750, 16
__func__.37750:
	.ascii	"venc_node_start\000"
	.type	__func__.37326, %object
	.size	__func__.37326, 15
__func__.37326:
	.ascii	"send_first_buf\000"
	.type	__func__.37916, %object
	.size	__func__.37916, 19
__func__.37916:
	.ascii	"venc_node_pp_start\000"
	.type	__func__.37803, %object
	.size	__func__.37803, 26
__func__.37803:
	.ascii	"venc_node_set_vcodec_attr\000"
	.type	__func__.37817, %object
	.size	__func__.37817, 26
__func__.37817:
	.ascii	"venc_node_get_vcodec_attr\000"
	.type	__func__.37761, %object
	.size	__func__.37761, 21
__func__.37761:
	.ascii	"venc_node_send_frame\000"
	.type	__func__.37927, %object
	.size	__func__.37927, 24
__func__.37927:
	.ascii	"venc_node_pp_send_frame\000"
	.type	__func__.38134, %object
	.size	__func__.38134, 15
__func__.38134:
	.ascii	"venc_thread_fn\000"
	.type	__func__.37391, %object
	.size	__func__.37391, 28
__func__.37391:
	.ascii	"venc_handle_node_pp_message\000"
	.type	__func__.38096, %object
	.size	__func__.38096, 13
__func__.38096:
	.ascii	"venc_release\000"
	.type	__func__.38036, %object
	.size	__func__.38036, 11
__func__.38036:
	.ascii	"venc_ioctl\000"
	.type	__func__.37458, %object
	.size	__func__.37458, 23
__func__.37458:
	.ascii	"vcodec_notify_drop_frm\000"
	.type	__func__.37831, %object
	.size	__func__.37831, 20
__func__.37831:
	.ascii	"venc_node_set_combo\000"
	.type	__func__.37846, %object
	.size	__func__.37846, 19
__func__.37846:
	.ascii	"venc_node_set_snap\000"
	.type	__func__.37866, %object
	.size	__func__.37866, 24
__func__.37866:
	.ascii	"venc_node_set_framerate\000"
	.type	__func__.37698, %object
	.size	__func__.37698, 16
__func__.37698:
	.ascii	"venc_node_check\000"
	.type	__func__.37691, %object
	.size	__func__.37691, 17
__func__.37691:
	.ascii	"venc_get_version\000"
	.type	__func__.37775, %object
	.size	__func__.37775, 19
__func__.37775:
	.ascii	"venc_node_set_crop\000"
	.type	__func__.37789, %object
	.size	__func__.37789, 19
__func__.37789:
	.ascii	"venc_node_get_crop\000"
	.type	__func__.37963, %object
	.size	__func__.37963, 25
__func__.37963:
	.ascii	"venc_node_pp_set_md_attr\000"
	.type	__func__.37878, %object
	.size	__func__.37878, 20
__func__.37878:
	.ascii	"venc_node_pp_create\000"
	.type	__func__.37943, %object
	.size	__func__.37943, 24
__func__.37943:
	.ascii	"venc_node_pp_get_result\000"
	.type	__func__.37904, %object
	.size	__func__.37904, 20
__func__.37904:
	.ascii	"venc_node_pp_delete\000"
	.type	__func__.37268, %object
	.size	__func__.37268, 18
__func__.37268:
	.ascii	"to_osd_invert_cfg\000"
	.space	2
	.type	CSWTCH.100, %object
	.size	CSWTCH.100, 68
CSWTCH.100:
	.word	65551
	.word	65551
	.word	65550
	.word	65550
	.word	-1
	.word	-1
	.word	65546
	.word	65546
	.word	65546
	.word	65546
	.word	65551
	.word	65551
	.word	65550
	.word	65550
	.word	-1
	.word	-1
	.word	17
	.type	__func__.37205, %object
	.size	__func__.37205, 20
__func__.37205:
	.ascii	"to_osd_alpha_source\000"
	.type	__func__.37342, %object
	.size	__func__.37342, 25
__func__.37342:
	.ascii	"venc_handle_node_message\000"
	.space	3
	.type	fmt, %object
	.size	fmt, 248
fmt:
	.word	0
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.word	4
	.word	4
	.word	5
	.word	5
	.word	6
	.word	5
	.word	7
	.word	6
	.word	8
	.word	7
	.word	9
	.word	8
	.word	10
	.word	10
	.word	12
	.word	13
	.word	13
	.word	14
	.word	15
	.word	15
	.word	16
	.word	16
	.word	17
	.word	9
	.word	18
	.word	11
	.word	65536
	.word	65536
	.word	65537
	.word	65537
	.word	65538
	.word	65538
	.word	65539
	.word	65539
	.word	65540
	.word	65540
	.word	65541
	.word	65541
	.word	65542
	.word	65542
	.word	65543
	.word	65543
	.word	65544
	.word	65544
	.word	65545
	.word	65545
	.word	65552
	.word	65546
	.word	65553
	.word	65547
	.word	65554
	.word	65548
	.word	65555
	.word	65549
	.type	__func__.37641, %object
	.size	__func__.37641, 21
__func__.37641:
	.ascii	"get_mpi_buf_frm_info\000"
	.space	3
	.type	venc_ioctls, %object
	.size	venc_ioctls, 460
venc_ioctls:
	.word	-1068735232
	.word	0
	.word	venc_get_version
	.word	.LC61
	.word	0
	.word	-1072667391
	.word	0
	.word	venc_node_create
	.word	.LC62
	.word	0
	.word	1074029826
	.word	0
	.word	venc_node_delete
	.word	.LC63
	.word	0
	.word	1076126979
	.word	0
	.word	venc_node_start
	.word	.LC64
	.word	0
	.word	1079796996
	.word	0
	.word	venc_node_send_frame
	.word	.LC65
	.word	0
	.word	1075340549
	.word	0
	.word	venc_node_set_crop
	.word	.LC66
	.word	0
	.word	1074554118
	.word	0
	.word	venc_node_set_combo
	.word	.LC67
	.word	0
	.word	1074554119
	.word	0
	.word	venc_node_set_snap
	.word	.LC68
	.word	0
	.word	-1069783800
	.word	0
	.word	venc_node_pp_create
	.word	.LC69
	.word	0
	.word	1074029833
	.word	0
	.word	venc_node_pp_delete
	.word	.LC70
	.word	0
	.word	1074029834
	.word	0
	.word	venc_node_pp_start
	.word	.LC71
	.word	0
	.word	1079797003
	.word	0
	.word	venc_node_pp_send_frame
	.word	.LC72
	.word	0
	.word	-1071618804
	.word	0
	.word	venc_node_pp_get_result
	.word	.LC73
	.word	0
	.word	1074029837
	.word	0
	.word	venc_node_enable_tb
	.word	.LC74
	.word	0
	.word	1074291982
	.word	0
	.word	venc_node_tb_bind
	.word	.LC75
	.word	0
	.word	1074029839
	.word	0
	.word	venc_node_tb_request
	.word	.LC76
	.word	0
	.word	-1072143088
	.word	0
	.word	venc_node_get_crop
	.word	.LC77
	.word	0
	.word	1077699857
	.word	0
	.word	venc_node_set_vcodec_attr
	.word	.LC78
	.word	0
	.word	-1069783790
	.word	0
	.word	venc_node_get_vcodec_attr
	.word	.LC79
	.word	0
	.word	-1072405229
	.word	0
	.word	venc_node_pp_set_md_attr
	.word	.LC80
	.word	0
	.word	-1072405228
	.word	0
	.word	venc_node_pp_get_md_attr
	.word	.LC81
	.word	0
	.word	1074816277
	.word	0
	.word	venc_node_check
	.word	.LC82
	.word	0
	.word	1074816278
	.word	0
	.word	venc_node_set_framerate
	.word	.LC83
	.word	0
	.type	venc_driver_fops, %object
	.size	venc_driver_fops, 128
venc_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	venc_poll
	.word	venc_ioctl
	.word	venc_compat_ioctl
	.word	0
	.space	4
	.word	venc_open
	.space	4
	.word	venc_release
	.space	60
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	gmpi_buf_ops, %object
	.size	gmpi_buf_ops, 68
gmpi_buf_ops:
	.word	mpi_buf_alloc
	.word	mpi_buf_map
	.word	mpi_buf_unmap
	.word	mpi_buf_ref
	.word	mpi_buf_unref
	.word	mpi_buf_get_dmabuf
	.word	mpi_buf_get_paddr
	.word	mpi_buffer_queue_create
	.word	mpi_buffer_queue_destroy
	.word	mpi_buffer_queue_push
	.word	mpi_buffer_queue_pop
	.word	dma_buf_import_mpi_buf
	.word	get_mpi_buf_frm_info
	.word	mpi_buffer_pool_create
	.word	mpi_buffer_pool_destroy
	.word	mpi_buffer_pool_request_buf
	.word	mpi_buffer_pool_get_free_num
	.type	gmpidev_ops, %object
	.size	gmpidev_ops, 36
gmpidev_ops:
	.word	vcodec_create_dev
	.word	vcodec_destory_dev
	.word	vcodec_handle_message
	.word	vcodec_get_chnl_ctx
	.word	vcodec_get_chnl_id
	.word	vcodec_get_chnl_type
	.word	vcodec_set_intra_info
	.word	vcodec_notify_drop_frm
	.word	vcodec_notify
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	frm_cnt.38133, %object
	.size	frm_cnt.38133, 4
frm_cnt.38133:
	.space	4
	.type	__func____LINE__.37362, %object
	.size	__func____LINE__.37362, 4
__func____LINE__.37362:
	.space	4
	.type	__func____LINE__.37372, %object
	.size	__func____LINE__.37372, 4
__func____LINE__.37372:
	.space	4
	.type	__key.38206, %object
	.size	__key.38206, 0
__key.38206:
	.space	4
	.type	g_venc_dev, %object
	.size	g_venc_dev, 37808
g_venc_dev:
	.space	37808
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct venc_pp_md_attr mismatching\033[0m"
	.ascii	"\000"
.LC1:
	.ascii	"\033[1;31mchnId %d need less than %d\033[0m\000"
.LC2:
	.ascii	"\033[1;31mchnId %d and %d need less than %d\033[0m\000"
.LC3:
	.ascii	"chn %d wrap trigger again\000"
.LC4:
	.ascii	"chn %d wrap trigger again fail\000"
.LC5:
	.ascii	"\033[1;31mrequest thumbnail more than %d\033[0m\000"
.LC6:
	.ascii	"wrap trigger again, seq: %llu\000"
.LC7:
	.ascii	"wrap trigger again fail, seq: %llu\000"
.LC8:
	.ascii	"valloc\000"
.LC9:
	.ascii	"venc\000"
.LC10:
	.ascii	"buf(%d)\000"
.LC11:
	.ascii	"rkv_enc\000"
.LC12:
	.ascii	"\033[1;31mstruct venc_info mismatching\033[0m\000"
.LC13:
	.ascii	"\033[1;31merror getting vdev  %p\033[0m\000"
.LC14:
	.ascii	"\033[1;31m====== error create venc node\033[0m\000"
.LC15:
	.ascii	"\0013%s[%d] struct venc_frame mismatching\000"
.LC16:
	.ascii	"ch = %d, warp enable = %d, wrap line = %d\000"
.LC17:
	.ascii	"\033[1;32msend first buf to venc %d, %d, %d ,%d\033"
	.ascii	"[0m\000"
.LC18:
	.ascii	"\033[1;31msend first buf to venc fail: queue is NUL"
	.ascii	"L!\033[0m\000"
.LC19:
	.ascii	"\033[1;31msend first buf to venc fail: push queue e"
	.ascii	"rror!\033[0m\000"
.LC20:
	.ascii	"\033[1;31mstruct venc_frame mismatching\033[0m\000"
.LC21:
	.ascii	"\033[1;31mchnId %d send frame fail: node %px, enc_d"
	.ascii	"ev %px, frameFd %d\033[0m\000"
.LC22:
	.ascii	"\033[1;31mchnId %d send frame fail: pp_node %px, en"
	.ascii	"c_dev %px, frameFd %d\033[0m\000"
.LC23:
	.ascii	"%s register ok = %p\000"
.LC24:
	.ascii	"\033[1;32mthread exit\012\033[0m\000"
.LC25:
	.ascii	"venc_pp(%s-%d) buf(%d) ready, pending: %d\000"
.LC26:
	.ascii	"venc(%s-%d) drop buf(%d)\000"
.LC27:
	.ascii	"%s %d\000"
.LC28:
	.ascii	"\033[1;32mstop thread %p\012\033[0m\000"
.LC29:
	.ascii	"\033[1;32mstop thread %p ok\012\033[0m\000"
.LC30:
	.ascii	"======error: index = %d\000"
.LC31:
	.ascii	"======error: ioctl is null\000"
.LC32:
	.ascii	"======error venc ioctl\000"
.LC33:
	.ascii	"\033[1;31mstruct venc_combo mismatching\033[0m\000"
.LC34:
	.ascii	"\033[1;31mstruct venc_snap mismatching\033[0m\000"
.LC35:
	.ascii	"\033[1;31mstruct venc_framerate mismatching\033[0m\000"
.LC36:
	.ascii	"\033[1;32mvdev->wrap_in %d, vdev->wrap_out %d\012\033"
	.ascii	"[0m\000"
.LC37:
	.ascii	"\033[1;31mstruct venc_version mismatching\033[0m\000"
.LC38:
	.ascii	"\033[1;31mstruct venc_crop mismatching\033[0m\000"
.LC39:
	.ascii	"\033[1;31mstruct venc_pp_info mismatching\033[0m\000"
.LC40:
	.ascii	"\033[1;31merror\033[0m\000"
.LC41:
	.ascii	"\033[1;31m====== error create venc pp node\033[0m\000"
.LC42:
	.ascii	"\033[1;32mcreate thread %p\012\033[0m\000"
.LC43:
	.ascii	"\033[1;31mstruct venc_pp_result mismatching\033[0m\000"
.LC44:
	.ascii	"Inverted cells do not support size\012\000"
.LC45:
	.ascii	"\033[1;31mcreate light lut failed!\033[0m\000"
.LC46:
	.ascii	"rbuv_swap not support\000"
.LC47:
	.ascii	"alpha_swap not support\000"
.LC48:
	.ascii	"\033[1;31merror format!\033[0m\000"
.LC49:
	.ascii	"\033[1;31mchn %d error!\033[0m\000"
.LC50:
	.ascii	"\033[1;31mchn %d queue is NULL!\033[0m\000"
.LC51:
	.ascii	"\033[1;32mseq lost = %d, %d\033[0m\000"
.LC52:
	.ascii	"\033[1;31mwrap mode lost buf, seq = %d\033[0m\000"
.LC53:
	.ascii	"\033[1;32mvenc lost a buf pts = %d\033[0m\000"
.LC54:
	.ascii	"\033[1;32mvenc(%s-%d) drop buf(%d)\033[0m\000"
.LC55:
	.ascii	"\033[1;32mstart wrap buf: %d, %d, %d ,%d, seq_id = "
	.ascii	"%d\033[0m\000"
.LC56:
	.ascii	"wrap trigger fail, seq: %d, result %d\000"
.LC57:
	.ascii	"venc(%s-%d) buf(%d) ready, pending: %d\000"
.LC58:
	.ascii	"\033[1;31mre send a buf fail seq = %d, pts = %d\033"
	.ascii	"[0m\000"
.LC59:
	.ascii	"\033[1;31mbuf %px get osd data failed!\033[0m\000"
.LC60:
	.ascii	"&vdev->wait\000"
.LC61:
	.ascii	"VENC_IOCTL_VERSION\000"
.LC62:
	.ascii	"VENC_IOCTL_NODE_CREATE\000"
.LC63:
	.ascii	"VENC_IOCTL_NODE_DELETE\000"
.LC64:
	.ascii	"VENC_IOCTL_NODE_START\000"
.LC65:
	.ascii	"VENC_IOCTL_NODE_SEND_FRAME\000"
.LC66:
	.ascii	"VENC_IOCTL_NODE_SET_CROP\000"
.LC67:
	.ascii	"VENC_IOCTL_NODE_SET_COMBO\000"
.LC68:
	.ascii	"VENC_IOCTL_NODE_SET_SNAP\000"
.LC69:
	.ascii	"VENC_IOCTL_NODE_PP_CREATE\000"
.LC70:
	.ascii	"VENC_IOCTL_NODE_PP_DELETE\000"
.LC71:
	.ascii	"VENC_IOCTL_NODE_PP_START\000"
.LC72:
	.ascii	"VENC_IOCTL_NODE_PP_SEND_FRAME\000"
.LC73:
	.ascii	"VENC_IOCTL_NODE_PP_GET_RESULT\000"
.LC74:
	.ascii	"VENC_IOCTL_NODE_ENABLE_TB\000"
.LC75:
	.ascii	"VENC_IOCTL_NODE_TB_BIND\000"
.LC76:
	.ascii	"VENC_IOCTL_NODE_TB_REQUEST\000"
.LC77:
	.ascii	"VENC_IOCTL_NODE_GET_CROP\000"
.LC78:
	.ascii	"VENC_IOCTL_NODE_SET_VCODEC_ATTR\000"
.LC79:
	.ascii	"VENC_IOCTL_NODE_GET_VCODEC_ATTR\000"
.LC80:
	.ascii	"VENC_IOCTL_NODE_PP_SET_MD_ATTR\000"
.LC81:
	.ascii	"VENC_IOCTL_NODE_PP_GET_MD_ATTR\000"
.LC82:
	.ascii	"VENC_IOCTL_NODE_CHECK\000"
.LC83:
	.ascii	"VENC_IOCTL_NODE_SET_FRAMERATE\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
