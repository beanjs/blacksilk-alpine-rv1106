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
	.file	"mpp_vcodec_base.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpp_vcodec_clear_buf_resource:					
	.asciz 	"mpp_vcodec_clear_buf_resource"					
__kstrtabns_mpp_vcodec_clear_buf_resource:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpp_vcodec_run_task:					
	.asciz 	"mpp_vcodec_run_task"					
__kstrtabns_mpp_vcodec_run_task:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_unbind, %function
mpp_vcodec_unbind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpp_vcodec_unbind, .-mpp_vcodec_unbind
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_msg_handle, %function
mpp_vcodec_msg_handle:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	mov	r7, r1
	mov	r8, r2
	bl	get_mpidev_ops
	mov	r6, r0
	cbnz	r0, .L3
	movs	r1, #102
	ldr	r0, .L24
	bl	printk
.L23:
	mov	r0, #-1
.L2:
	pop	{r4, r5, r6, r7, r8, pc}
.L3:
	bl	get_mpidev_ops
	cbnz	r0, .L5
	movs	r1, #80
	ldr	r0, .L24
	bl	printk
.L6:
	b	.L23
.L5:
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L6
	mov	r0, r5
	blx	r3
	cmp	r0, #0
	beq	.L6
	cmp	r0, #48
	beq	.L6
	ldr	r2, [r0, #-32]
	cmp	r2, #1
	bne	.L8
	ldr	r2, .L24+4
	movw	r3, #10784
	ldr	r4, [r2, r3]
.L9:
	ldr	r3, [r6, #8]
	cmp	r3, #0
	beq	.L6
	mov	r2, r8
	mov	r1, r7
	mov	r0, r5
	blx	r3
	cmp	r0, #1
	bne	.L2
	cmp	r4, #0
	beq	.L2
	mov	r0, r4
	bl	vcodec_thread_trigger
	movs	r0, #0
	b	.L2
.L8:
	movs	r1, #115
	ldr	r0, .L24+8
	bl	printk
	b	.L9
.L25:
	.align	2
.L24:
	.word	.LC0
	.word	g_vcodec_entry
	.word	.LC1
	.fnend
	.size	mpp_vcodec_msg_handle, .-mpp_vcodec_msg_handle
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chan_clear_buf_resource, %function
mpp_chan_clear_buf_resource:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #140]
	cbz	r0, .L27
	bl	hal_bufs_deinit
	movs	r3, #0
	str	r3, [r4, #140]
.L27:
	ldr	r0, [r4, #144]
	cbz	r0, .L28
	ldr	r1, .L43
	bl	mpp_buffer_put_with_caller
	movs	r3, #0
	str	r3, [r4, #144]
.L28:
	ldr	r0, [r4, #152]
	cbz	r0, .L29
	ldr	r1, .L43
	bl	mpp_buffer_put_with_caller
	movs	r3, #0
	str	r3, [r4, #152]
.L29:
	ldr	r0, [r4, #148]
	cbz	r0, .L30
	ldr	r1, .L43
	bl	mpp_buffer_put_with_caller
	movs	r3, #0
	str	r3, [r4, #148]
.L30:
	movs	r3, #0
	strd	r3, r3, [r4, #128]
	str	r3, [r4, #156]
	str	r3, [r4, #136]
	pop	{r4, pc}
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.fnend
	.size	mpp_chan_clear_buf_resource, .-mpp_chan_clear_buf_resource
	.align	1
	.global	mpp_vcodec_clear_buf_resource
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_clear_buf_resource, %function
mpp_vcodec_clear_buf_resource:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movs	r4, #0
	ldr	r5, .L48
.L46:
	adds	r0, r5, r4
	adds	r4, r4, #160
	bl	mpp_chan_clear_buf_resource
	cmp	r4, #10240
	bne	.L46
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L49:
	.align	2
.L48:
	.word	g_vcodec_entry+16
	.fnend
	.size	mpp_vcodec_clear_buf_resource, .-mpp_vcodec_clear_buf_resource
	.align	1
	.global	mpp_vcodec_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_run_task, %function
mpp_vcodec_run_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	mpp_vcodec_enc_run_task
	.fnend
	.size	mpp_vcodec_run_task, .-mpp_vcodec_run_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__refcount_sub_and_test.constprop.5, %function
__refcount_sub_and_test.constprop.5:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r0, r1
	pld	[r1]
	.syntax unified
@ 224 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_fetch_sub
1:	ldrex	r3, [r0]
	sub	r2, r3, #1
	strex	r1, r2, [r0]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r3, #1
	bne	.L52
	mov	r0, r3
.L53:
	pop	{r3, pc}
.L52:
	cmp	r3, #0
	bgt	.L54
	movs	r1, #3
	bl	refcount_warn_saturate
.L54:
	movs	r0, #0
	b	.L53
	.fnend
	.size	__refcount_sub_and_test.constprop.5, .-__refcount_sub_and_test.constprop.5
	.align	1
	.global	vcodec_create_mpi_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_create_mpi_dev, %function
vcodec_create_mpi_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	bl	get_mpidev_ops
	ldr	r4, .L63
	ldr	r3, [r0]
	cbz	r3, .L56
	ldr	r2, [r4, #8]
	cbnz	r2, .L58
	ldr	r1, .L63+4
	ldr	r0, [r4, #4]
	blx	r3
	str	r0, [r4, #8]
.L56:
	ldr	r3, [r4, #8]
	cbnz	r3, .L58
	movs	r1, #152
	ldr	r0, .L63+8
	bl	printk
.L58:
	movs	r0, #0
	pop	{r4, pc}
.L64:
	.align	2
.L63:
	.word	g_vcodec_entry
	.word	.LANCHOR1
	.word	.LC2
	.fnend
	.size	vcodec_create_mpi_dev, .-vcodec_create_mpi_dev
	.align	1
	.global	mpp_vcodec_get_free_chan
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_get_free_chan, %function
mpp_vcodec_get_free_chan:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	mov	r2, r0
	push	{r4, lr}
	.save {r4, lr}
	bne	.L66
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L74
	movs	r4, #0
.L68:
	ldr	r1, [r3, #60]
	cbz	r1, .L67
	adds	r4, r4, #1
	adds	r3, r3, #160
	cmp	r4, #64
	bne	.L68
	mov	r4, #-1
.L67:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L65:
	mov	r0, r4
	pop	{r4, pc}
.L66:
	movs	r1, #211
	ldr	r0, .L74+4
	bl	printk
	b	.L65
.L75:
	.align	2
.L74:
	.word	g_vcodec_entry
	.word	.LC1
	.fnend
	.size	mpp_vcodec_get_free_chan, .-mpp_vcodec_get_free_chan
	.align	1
	.global	mpp_vcodec_get_chan_entry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_get_chan_entry, %function
mpp_vcodec_get_chan_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	mov	r2, r1
	push	{r3, lr}
	.save {r3, lr}
	bne	.L77
	cmp	r0, #64
	bls	.L78
	mov	r2, r0
	movs	r3, #64
	movs	r1, #228
	ldr	r0, .L81
	bl	printk
.L80:
	movs	r0, #0
	b	.L76
.L78:
	ldr	r2, .L81+4
	movs	r3, #160
	mla	r0, r3, r0, r2
.L76:
	pop	{r3, pc}
.L77:
	movs	r1, #234
	ldr	r0, .L81+8
	bl	printk
	b	.L80
.L82:
	.align	2
.L81:
	.word	.LC3
	.word	g_vcodec_entry+16
	.word	.LC1
	.fnend
	.size	mpp_vcodec_get_chan_entry, .-mpp_vcodec_get_chan_entry
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_bind, %function
mpp_vcodec_bind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	bl	get_mpidev_ops
	mov	r4, r0
	cbnz	r0, .L84
	movs	r1, #50
	ldr	r0, .L91
	bl	printk
.L83:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L84:
	ldr	r3, [r0, #16]
	cbz	r3, .L89
	mov	r0, r5
	blx	r3
	mov	r6, r0
.L86:
	ldr	r3, [r4, #20]
	cbz	r3, .L90
	mov	r0, r5
	blx	r3
	mov	r5, r0
.L87:
	mov	r1, r5
	mov	r0, r6
	bl	mpp_vcodec_get_chan_entry
	ldr	r4, [r0, #44]
	cbnz	r4, .L88
	mov	r3, r6
	mov	r2, r5
	movs	r1, #61
	ldr	r0, .L91+4
	bl	printk
	b	.L83
.L89:
	mov	r6, #-1
	b	.L86
.L90:
	movs	r5, #1
	b	.L87
.L88:
	add	r4, r0, #48
	b	.L83
.L92:
	.align	2
.L91:
	.word	.LC0
	.word	.LC4
	.fnend
	.size	mpp_vcodec_bind, .-mpp_vcodec_bind
	.align	1
	.global	mpp_vcodec_get_chan_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_get_chan_num, %function
mpp_vcodec_get_chan_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	mov	r2, r0
	push	{r3, lr}
	.save {r3, lr}
	bne	.L94
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, .L96
	movw	r2, #10256
	ldr	r0, [r1, r2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L93:
	pop	{r3, pc}
.L94:
	movs	r1, #254
	ldr	r0, .L96+4
	bl	printk
	movs	r0, #0
	b	.L93
.L97:
	.align	2
.L96:
	.word	g_vcodec_entry
	.word	.LC1
	.fnend
	.size	mpp_vcodec_get_chan_num, .-mpp_vcodec_get_chan_num
	.align	1
	.global	mpp_vcodec_inc_chan_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_inc_chan_num, %function
mpp_vcodec_inc_chan_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	mov	r2, r0
	bne	.L99
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, .L102
	movw	r2, #10256
	ldr	r3, [r1, r2]
	adds	r3, r3, #1
	str	r3, [r1, r2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L99:
	mov	r1, #272
	ldr	r0, .L102+4
	b	printk
.L103:
	.align	2
.L102:
	.word	g_vcodec_entry
	.word	.LC1
	.fnend
	.size	mpp_vcodec_inc_chan_num, .-mpp_vcodec_inc_chan_num
	.align	1
	.global	mpp_vcodec_dec_chan_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_dec_chan_num, %function
mpp_vcodec_dec_chan_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	mov	r2, r0
	bne	.L105
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, .L108
	movw	r2, #10256
	ldr	r3, [r1, r2]
	subs	r3, r3, #1
	str	r3, [r1, r2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L105:
	mov	r1, #292
	ldr	r0, .L108+4
	b	printk
.L109:
	.align	2
.L108:
	.word	g_vcodec_entry
	.word	.LC1
	.fnend
	.size	mpp_vcodec_dec_chan_num, .-mpp_vcodec_dec_chan_num
	.align	1
	.global	mpp_vcodec_chan_setup_hal_bufs
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_chan_setup_hal_bufs, %function
mpp_vcodec_chan_setup_hal_bufs:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	ldrd	r6, r7, [r1, #32]
	.pad #36
	sub	sp, sp, #36
	ldrd	r1, r3, [r0, #128]
	mov	r4, r0
	mul	r2, r7, r6
	muls	r3, r1, r3
	cmp	r2, r3
	bhi	.L111
	ldr	r2, [r5, #40]
	ldr	r3, [r0, #156]
	cmp	r2, r3
	bls	.L112
.L111:
	ldr	r3, [r5, #4]
	cmp	r3, #8
	beq	.L112
	mov	r3, r7
	mov	r2, r6
	movw	r1, #387
	ldr	r0, .L161
	ldr	r9, [r5, #40]
	bl	printk
	ldr	r0, [r4, #140]
	cbz	r0, .L113
	bl	hal_bufs_deinit
	movs	r3, #0
	str	r3, [r4, #140]
.L113:
	add	fp, r6, #63
	add	r10, r7, #63
	bic	r3, fp, #63
	bic	r6, r10, #63
	addw	r2, r3, #511
	addw	r7, r6, #1023
	add	r0, r4, #140
	str	r3, [sp, #12]
	asrs	r7, r7, #10
	asrs	r2, r2, #9
	muls	r7, r3, r7
	it	mi
	addmi	r7, r7, #15
	muls	r2, r6, r2
	it	mi
	addmi	r2, r2, #31
	bic	r7, r7, #15
	asr	fp, fp, #6
	asrs	r2, r2, #5
	add	r8, r9, #2
	lsls	r2, r2, #4
	cmp	r7, r2
	it	cc
	movcc	r7, r2
	addw	r2, r3, #1023
	asrs	r2, r2, #10
	muls	r2, r6, r2
	it	mi
	addmi	r2, r2, #15
	bic	r2, r2, #15
	cmp	r7, r2
	it	cc
	movcc	r7, r2
	addw	r2, r6, #511
	asrs	r2, r2, #9
	muls	r2, r3, r2
	it	mi
	addmi	r2, r2, #31
	asrs	r2, r2, #5
	lsls	r2, r2, #4
	cmp	r7, r2
	it	cc
	movcc	r7, r2
	bl	hal_bufs_init
	mov	r1, fp
	muls	r1, r6, r1
	it	mi
	addmi	r1, r1, #63
	ldr	r2, [r5, #24]
	asrs	r1, r1, #6
	lsls	r1, r1, #8
	add	r1, r1, #8160
	adds	r1, r1, #31
	bic	r1, r1, #8160
	bic	r1, r1, #31
	ldr	r3, [sp, #12]
	cmp	r2, #0
	beq	.L119
	movs	r3, #0
	str	r1, [sp, #16]
	strd	r3, r7, [sp, #20]
	movs	r2, #4
	str	r3, [sp, #28]
	mov	r1, r8
	add	r3, sp, #16
	ldr	r0, [r4, #140]
	bl	hal_bufs_setup
	ldr	r3, [r5, #32]
	ldr	r2, [r5, #36]
	adds	r3, r3, #63
	adds	r2, r2, #63
	bic	r1, r3, #63
	bic	r3, r2, #63
	cmp	r3, r1
	mul	r0, r3, r1
	it	lt
	movlt	r3, r1
	movs	r1, #48
	asrs	r6, r3, #1
	muls	r1, r3, r1
	add	r2, r0, r0, lsl #1
	cmp	r0, #0
	it	lt
	addlt	r0, r0, #63
	addw	r1, r1, #4095
	add	r1, r1, r2, asr #1
	ldr	r2, .L161+4
	add	r0, r6, r0, asr #6
	movs	r6, #240
	muls	r6, r3, r6
	add	r3, r3, r3, lsl #1
	addw	r3, r3, #4095
	ands	r1, r1, r2
	ands	r3, r3, r2
	addw	r0, r0, #4095
	addw	r6, r6, #4095
	cmp	r9, #0
	and	r6, r6, r2
	and	r0, r0, r2
	add	r6, r6, r3
	add	r6, r6, r1
	add	r6, r6, r0
	ble	.L121
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L122
	add	r1, r1, r0
	add	r6, r6, r1
.L121:
	ldr	r0, [r4, #144]
	cbz	r0, .L123
	ldr	r1, .L161+8
	bl	mpp_buffer_put_with_caller
.L123:
	ldr	r3, .L161+8
	mov	r2, r6
	add	r1, r4, #144
	str	r3, [sp]
	movs	r3, #0
	mov	r0, r3
	bl	mpp_buffer_get_with_tag
	cmp	r0, #0
	bne	.L125
.L128:
	movs	r6, #0
.L126:
	cmp	r8, r6
	bhi	.L130
	ldrd	r2, r3, [r5, #32]
	cmp	r2, r3
	it	cc
	strdcc	r3, r2, [r5, #32]
	ldr	r6, [r5, #32]
	ldr	r3, [r4, #128]
	cmp	r6, r3
	bhi	.L132
.L133:
	ldr	r3, [r5, #32]
	str	r3, [r4, #128]
	ldr	r3, [r5, #36]
	str	r3, [r4, #132]
	ldr	r3, [r5, #40]
	str	r3, [r4, #156]
.L112:
	bl	get_vsm_ops
	mov	r6, r0
	cmp	r0, #0
	bne	.L138
	ldr	r5, [r5, #16]
	ldr	r3, [r4, #136]
	cmp	r5, r3
	bls	.L110
	ldr	r0, [r4, #152]
	cmp	r5, #16384
	it	cc
	movcc	r5, #16384
	cbz	r0, .L137
	ldr	r1, .L161+12
	bl	mpp_buffer_put_with_caller
	str	r6, [r4, #152]
.L137:
	ldr	r3, .L161+12
	addw	r2, r5, #4095
	bic	r2, r2, #4080
	add	r1, r4, #152
	bic	r2, r2, #15
	str	r3, [sp]
	movs	r3, #0
	mov	r0, r3
	bl	mpp_ring_buffer_get_with_tag
	cmp	r0, #0
	bne	.L125
	str	r5, [r4, #136]
.L110:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L122:
	lsls	r6, r6, #1
	b	.L121
.L119:
	asr	r10, r10, #6
	strd	r1, r2, [sp, #16]
	muls	r6, r3, r6
	ldr	r3, .L161+16
	mul	fp, fp, r10
	movw	r1, #8191
	cmp	r6, #0
	ldr	r0, [r4, #140]
	str	r7, [sp, #24]
	mov	r2, r6
	it	lt
	addlt	r2, r6, #63
	add	r6, r6, r6, lsl #1
	lsl	r10, fp, #13
	add	r2, r1, r2, asr #6
	add	r1, r1, fp, lsl #6
	add	fp, r10, fp, lsl #12
	ands	r2, r2, r3
	ands	r1, r1, r3
	add	r6, r2, r6, asr #1
	add	r1, r1, fp, asr #1
	add	r3, sp, #16
	cmp	r1, r6
	ite	ge
	strge	r1, [sp, #28]
	strlt	r6, [sp, #28]
	movs	r2, #4
	mov	r1, r8
	bl	hal_bufs_setup
	b	.L128
.L130:
	mov	r1, r6
	ldr	r0, [r4, #140]
	bl	hal_bufs_get_buf
	cbz	r0, .L125
	adds	r6, r6, #1
	b	.L126
.L132:
	cmp	r6, #3072
	bls	.L133
	ldr	r0, [r4, #148]
	cbz	r0, .L134
	ldr	r1, .L161+12
	bl	mpp_buffer_put_with_caller
	movs	r3, #0
	str	r3, [r4, #148]
.L134:
	adds	r6, r6, #63
	ldr	r3, .L161+12
	bics	r1, r6, #63
	it	mi
	addmi	r1, r1, #31
	asrs	r6, r6, #6
	str	r3, [sp]
	movs	r3, #0
	asrs	r2, r1, #5
	mov	r1, #416
	mov	r0, r3
	muls	r1, r2, r1
	mov	r2, #896
	muls	r6, r2, r6
	sub	r1, r1, #37632
	subs	r1, r1, #224
	sub	r2, r6, #32256
	cmp	r2, r1
	it	lt
	movlt	r2, r1
	add	r1, r4, #148
	bl	mpp_buffer_get_with_tag
	cmp	r0, #0
	beq	.L133
.L125:
	mov	r0, r4
	bl	mpp_chan_clear_buf_resource
	mov	r0, #-1
	b	.L110
.L138:
	movs	r0, #0
	b	.L110
.L162:
	.align	2
.L161:
	.word	.LC5
	.word	-4096
	.word	.LANCHOR0+28
	.word	.LANCHOR0+41
	.word	-8192
	.fnend
	.size	mpp_vcodec_chan_setup_hal_bufs, .-mpp_vcodec_chan_setup_hal_bufs
	.align	1
	.global	mpp_vcodec_chan_entry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_chan_entry_init, %function
mpp_vcodec_chan_entry_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	mov	r7, r1
	mov	r8, r2
	mov	r9, r3
	bl	get_mpibuf_ops
	mov	r5, r0
	cbnz	r0, .L164
	movw	r2, #485
	ldr	r1, .L170
	ldr	r0, .L170+4
	bl	printk
	mov	r0, #-1
.L163:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L164:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, #-1
	ldr	r2, .L170+8
	strd	r3, r3, [r4, #4]
	add	r0, r4, #52
	movs	r3, #0
	ldr	r1, .L170+12
	str	r3, [r4, #84]
	str	r9, [r4, #44]
	str	r3, [r4, #88]
	strd	r8, r7, [r4, #12]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	add	r3, r4, #68
	str	r3, [r4, #68]
	str	r3, [r4, #72]
	add	r3, r4, #76
	str	r3, [r4, #76]
	str	r3, [r4, #80]
	bl	__init_waitqueue_head
	ldr	r2, .L170+8
	ldr	r1, .L170+16
	add	r0, r4, #60
	bl	__init_waitqueue_head
	ldr	r3, [r5, #28]
	cbz	r3, .L166
	ldr	r2, [r4, #48]
	cbnz	r2, .L166
	movs	r0, #1
	blx	r3
	str	r0, [r4, #48]
.L166:
	movs	r3, #1
	str	r3, [r4, #28]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L163
.L171:
	.align	2
.L170:
	.word	.LANCHOR0+72
	.word	.LC6
	.word	.LANCHOR2
	.word	.LC7
	.word	.LC8
	.fnend
	.size	mpp_vcodec_chan_entry_init, .-mpp_vcodec_chan_entry_init
	.align	1
	.global	mpp_vcodec_chan_entry_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_chan_entry_deinit, %function
mpp_vcodec_chan_entry_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	cbnz	r0, .L173
	movw	r2, #522
	ldr	r1, .L179
	ldr	r0, .L179+4
	bl	printk
	mov	r0, #-1
.L172:
	pop	{r4, r5, r6, pc}
.L173:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r5, #0
	mov	r3, #-1
	str	r5, [r4, #44]
	str	r5, [r4, #28]
	str	r5, [r4, #40]
	strd	r3, r3, [r4, #4]
	ldr	r3, [r0, #32]
	cbz	r3, .L175
	ldr	r0, [r4, #48]
	blx	r3
	str	r5, [r4, #48]
.L175:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r5, #0
	mov	r0, r4
	str	r5, [r4, #36]
	bl	mpp_chan_clear_buf_resource
	mov	r0, r5
	b	.L172
.L180:
	.align	2
.L179:
	.word	.LANCHOR0+99
	.word	.LC6
	.fnend
	.size	mpp_vcodec_chan_entry_deinit, .-mpp_vcodec_chan_entry_deinit
	.align	1
	.global	stream_packet_free
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	stream_packet_free, %function
stream_packet_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	subs	r0, r0, #20
	str	r0, [sp, #4]
	cbnz	r0, .L182
	movw	r2, #554
	ldr	r1, .L184
	ldr	r0, .L184+4
	bl	printk
.L181:
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L182:
	add	r0, sp, #4
	bl	mpp_packet_deinit
	b	.L181
.L185:
	.align	2
.L184:
	.word	.LANCHOR0+128
	.word	.LC9
	.fnend
	.size	stream_packet_free, .-stream_packet_free
	.align	1
	.global	mpp_vcodec_stream_clear
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_stream_clear, %function
mpp_vcodec_stream_clear:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r8, r0
	ldr	r4, [r8, #68]!
	ldr	r6, [r4], #-12
	subs	r6, r6, #12
.L187:
	add	r3, r4, #12
	cmp	r3, r8
	bne	.L189
	mov	r8, r5
	ldr	r4, [r8, #76]!
	ldr	r6, [r4], #-12
	subs	r6, r6, #12
.L190:
	add	r3, r4, #12
	cmp	r3, r8
	bne	.L192
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7, r8, pc}
.L189:
	ldrd	r1, r2, [r4, #12]
	adds	r4, r4, #20
	movs	r0, #1
	str	r2, [r1, #4]
	str	r1, [r2]
	movs	r2, #0
	str	r3, [r4, #-8]
	str	r3, [r4, #-4]
	mov	r1, r4
	bl	__refcount_sub_and_test.constprop.5
	cbz	r0, .L188
	mov	r0, r4
	bl	stream_packet_free
.L188:
	add	r3, r5, #84
	pld	[r3]
	.syntax unified
@ 224 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r6, #12]
	mov	r4, r6
	sub	r6, r3, #12
	b	.L187
.L192:
	ldrd	r1, r2, [r4, #12]
	adds	r4, r4, #20
	movs	r0, #1
	str	r2, [r1, #4]
	str	r1, [r2]
	movs	r2, #0
	str	r3, [r4, #-8]
	str	r3, [r4, #-4]
	mov	r1, r4
	bl	__refcount_sub_and_test.constprop.5
	cbz	r0, .L191
	mov	r0, r4
	bl	stream_packet_free
.L191:
	add	r3, r5, #88
	pld	[r3]
	.syntax unified
@ 224 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r6, #12]
	mov	r4, r6
	sub	r6, r3, #12
	b	.L190
	.fnend
	.size	mpp_vcodec_stream_clear, .-mpp_vcodec_stream_clear
	.align	1
	.global	mpp_vcodec_get_enc_module_entry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_get_enc_module_entry, %function
mpp_vcodec_get_enc_module_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L200
	bx	lr
.L201:
	.align	2
.L200:
	.word	g_vcodec_entry
	.fnend
	.size	mpp_vcodec_get_enc_module_entry, .-mpp_vcodec_get_enc_module_entry
	.align	1
	.global	enc_chan_update_chan_prior_tab
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	enc_chan_update_chan_prior_tab, %function
enc_chan_update_chan_prior_tab:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L221
	movw	r3, #10264
	movs	r1, #0
	movw	r6, #10276
	mov	r0, r1
	mov	r4, r1
	str	r1, [r2, r3]
	movw	r3, #10260
	str	r1, [r2, r3]
	mov	r3, r2
.L204:
	ldr	r7, [r2, #44]
	cmp	r7, #3
	bne	.L203
	ldrb	r1, [r2, #36]	@ zero_extendqisi2
	add	r7, r3, r0, lsl #3
	adds	r1, r1, #1
	str	r1, [r7, r6]
	addw	r1, r0, #1284
	adds	r0, r0, #1
	str	r4, [r3, r1, lsl #3]
	movs	r1, #1
.L203:
	adds	r4, r4, #1
	adds	r2, r2, #160
	cmp	r4, #64
	bne	.L204
	cbz	r1, .L205
	movw	r2, #10260
	str	r0, [r3, r2]
.L205:
	movw	r2, #10260
	ldr	r2, [r3, r2]
	addw	r1, r2, #1284
	add	r3, r3, r1, lsl #3
	movs	r1, #0
.L206:
	cmp	r2, #63
	add	r3, r3, #8
	ble	.L207
	ldr	r3, .L221+4
	movs	r1, #0
.L211:
	adds	r1, r1, #1
	mov	r2, r3
	movs	r4, #0
	mov	r0, r1
.L209:
	ldr	r6, [r3, #-4]
	ldr	r7, [r2, #4]
	cmp	r6, r7
	bge	.L208
	ldr	r7, [r2]
	ldr	r4, [r3, #-8]
	str	r7, [r3, #-8]
	ldr	r7, [r2, #4]
	str	r7, [r3, #-4]
	strd	r4, r6, [r2]
	mov	r4, #-1
.L208:
	adds	r0, r0, #1
	adds	r2, r2, #8
	cmp	r0, #64
	bne	.L209
	cbz	r4, .L210
	cmp	r1, #63
	add	r3, r3, #8
	bne	.L211
.L210:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7, pc}
.L207:
	strd	r1, r1, [r3, #-8]
	adds	r2, r2, #1
	b	.L206
.L222:
	.align	2
.L221:
	.word	g_vcodec_entry
	.word	g_vcodec_entry+10280
	.fnend
	.size	enc_chan_update_chan_prior_tab, .-enc_chan_update_chan_prior_tab
	.align	1
	.global	enc_chan_update_tab_after_enc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	enc_chan_update_tab_after_enc, %function
enc_chan_update_tab_after_enc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L232
	movw	r1, #10264
	movs	r3, #0
	ldr	r4, .L232+4
	str	r3, [r2, r1]
	movw	r1, #10260
	ldr	r1, [r2, r1]
.L224:
	cmp	r1, r3
	bne	.L227
	cbz	r1, .L229
	movs	r3, #0
	b	.L228
.L227:
	ldr	r6, [r4, r3, lsl #3]
	cmp	r6, r0
	bne	.L225
.L228:
	addw	r4, r3, #1285
	subs	r6, r1, #1
	add	r4, r2, r4, lsl #3
.L226:
	cmp	r6, r3
	add	r4, r4, #8
	bhi	.L230
	addw	r1, r1, #1283
	str	r0, [r2, r1, lsl #3]
.L229:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, r7, pc}
.L225:
	adds	r3, r3, #1
	b	.L224
.L230:
	ldr	r7, [r4, #-8]
	adds	r3, r3, #1
	str	r7, [r4, #-16]
	b	.L226
.L233:
	.align	2
.L232:
	.word	g_vcodec_entry
	.word	g_vcodec_entry+10272
	.fnend
	.size	enc_chan_update_tab_after_enc, .-enc_chan_update_tab_after_enc
	.align	1
	.global	enc_chan_get_high_prior_chan
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	enc_chan_get_high_prior_chan, %function
enc_chan_get_high_prior_chan:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L235
	movw	r1, #10264
	ldr	r2, [r3, r1]
	addw	r4, r2, #1284
	adds	r2, r2, #1
	str	r2, [r3, r1]
	ldr	r5, [r3, r4, lsl #3]
	movw	r4, #10268
	str	r5, [r3, r4]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, pc}
.L236:
	.align	2
.L235:
	.word	g_vcodec_entry
	.fnend
	.size	enc_chan_get_high_prior_chan, .-enc_chan_get_high_prior_chan
	.align	1
	.global	mpp_vcodec_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_init, %function
mpp_vcodec_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	movw	r2, #10792
	ldr	r4, .L240
	movs	r1, #0
	mov	r0, r4
	str	r4, [sp, #4]
	bl	memset
	mov	r1, #3264
	ldr	r0, .L240+4
	bl	kstrdup
	movs	r3, #0
	mov	r1, r3
	str	r0, [r4, #4]
	mov	r4, #-1
	ldr	r0, [sp, #4]
	mov	r2, r0
.L238:
	str	r3, [r2, #16]
	adds	r3, r3, #1
	cmp	r3, #64
	str	r4, [r2, #28]
	str	r1, [r2, #60]
	add	r2, r2, #160
	bne	.L238
	movw	r3, #10256
	ldr	r5, .L240+8
	str	r1, [r0, r3]
	bl	vcodec_thread_create
	movs	r1, #1
	mov	r4, r0
	bl	vcodec_thread_set_count
	ldr	r1, .L240+12
	mov	r0, r4
	ldr	r2, [sp, #4]
	bl	vcodec_thread_set_callback
	ldr	r0, [r5, #12]
	bl	mpp_packet_pool_init
	ldr	r0, [r5, #12]
	bl	mpp_frame_pool_init
	ldr	r0, [r5, #12]
	bl	mpp_buffer_pool_init
	mov	r0, r4
	bl	vcodec_thread_start
	movs	r0, #0
	ldr	r3, [sp, #4]
	add	r2, sp, #4
	str	r2, [r3]
	movw	r3, #10784
	ldr	r2, [sp, #4]
	str	r4, [r2, r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L241:
	.align	2
.L240:
	.word	g_vcodec_entry
	.word	.LC10
	.word	.LANCHOR1
	.word	mpp_vcodec_enc_routine
	.fnend
	.size	mpp_vcodec_init, .-mpp_vcodec_init
	.align	1
	.global	mpp_vcodec_unregister_mpidev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_unregister_mpidev, %function
mpp_vcodec_unregister_mpidev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	bl	get_mpidev_ops
	cbz	r0, .L244
	ldr	r3, [r0, #4]
	cbz	r3, .L245
	ldr	r5, .L247
	movs	r4, #0
	ldr	r0, [r5, #8]
	cbz	r0, .L242
	blx	r3
	mov	r0, r4
	str	r4, [r5, #8]
.L242:
	pop	{r3, r4, r5, pc}
.L244:
	mov	r0, #-1
	b	.L242
.L245:
	mov	r0, r3
	b	.L242
.L248:
	.align	2
.L247:
	.word	g_vcodec_entry
	.fnend
	.size	mpp_vcodec_unregister_mpidev, .-mpp_vcodec_unregister_mpidev
	.align	1
	.global	mpp_vcodec_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_deinit, %function
mpp_vcodec_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movs	r5, #0
	ldr	r4, .L256
	add	r6, r4, #16
.L250:
	adds	r0, r6, r5
	adds	r5, r5, #160
	bl	mpp_chan_clear_buf_resource
	cmp	r5, #10240
	bne	.L250
	movw	r5, #10784
	ldr	r0, [r4, r5]
	cbz	r0, .L251
	bl	vcodec_thread_stop
	ldr	r0, [r4, r5]
	bl	vcodec_thread_destroy
	movs	r3, #0
	str	r3, [r4, r5]
.L251:
	bl	mpp_packet_pool_deinit
	bl	mpp_frame_pool_deinit
	bl	mpp_buffer_pool_deinit
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L257:
	.align	2
.L256:
	.word	g_vcodec_entry
	.fnend
	.size	mpp_vcodec_deinit, .-mpp_vcodec_deinit
	.global	gdev_fn
	.global	max_stream_cnt
	.global	mpp_vcodec_debug
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.25455, %object
	.size	__FUNCTION__.25455, 28
__FUNCTION__.25455:
	.ascii	"mpp_chan_clear_buf_resource\000"
	.type	__FUNCTION__.25450, %object
	.size	__FUNCTION__.25450, 13
__FUNCTION__.25450:
	.ascii	"get_wrap_buf\000"
	.type	__FUNCTION__.25489, %object
	.size	__FUNCTION__.25489, 31
__FUNCTION__.25489:
	.ascii	"mpp_vcodec_chan_setup_hal_bufs\000"
	.type	__func__.25500, %object
	.size	__func__.25500, 27
__func__.25500:
	.ascii	"mpp_vcodec_chan_entry_init\000"
	.type	__func__.25527, %object
	.size	__func__.25527, 29
__func__.25527:
	.ascii	"mpp_vcodec_chan_entry_deinit\000"
	.type	__func__.25546, %object
	.size	__func__.25546, 19
__func__.25546:
	.ascii	"stream_packet_free\000"
	.type	__param_str_max_stream_cnt, %object
	.size	__param_str_max_stream_cnt, 26
__param_str_max_stream_cnt:
	.ascii	"mpp_vcodec.max_stream_cnt\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	gdev_fn, %object
	.size	gdev_fn, 12
gdev_fn:
	.word	mpp_vcodec_bind
	.word	mpp_vcodec_unbind
	.word	mpp_vcodec_msg_handle
	.type	max_stream_cnt, %object
	.size	max_stream_cnt, 4
max_stream_cnt:
	.word	512
	.bss
	.align	3
	.set	.LANCHOR2,. + 0
	.type	__key.25520, %object
	.size	__key.25520, 0
__key.25520:
	.type	__key.25521, %object
	.size	__key.25521, 0
__key.25521:
	.type	g_vcodec_entry, %object
	.size	g_vcodec_entry, 10792
g_vcodec_entry:
	.space	10792
	.type	mpp_vcodec_debug, %object
	.size	mpp_vcodec_debug, 4
mpp_vcodec_debug:
	.space	4
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_max_stream_cnttype162, %object
	.size	__UNIQUE_ID_max_stream_cnttype162, 39
__UNIQUE_ID_max_stream_cnttype162:
	.ascii	"mpp_vcodec.parmtype=max_stream_cnt:int\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013mpp_vcodec: %d: get_mpidev_ops fail\000"
.LC1:
	.ascii	"\0013mpp_vcodec: %d: MppCtxType error %d\000"
.LC2:
	.ascii	"\0013mpp_vcodec: %d: creat mpi dev & register fail "
	.ascii	"\012\000"
.LC3:
	.ascii	"\0013mpp_vcodec: %d: chan id %d is over, full max i"
	.ascii	"s %d \012\000"
.LC4:
	.ascii	"\0013mpp_vcodec: %d: type %d chnl %d is no create\000"
.LC5:
	.ascii	"\0016mpp_vcodec: %d: attr->max_width = %d, attr->ma"
	.ascii	"x_height = %d\000"
.LC6:
	.ascii	"\0013mpp_vcodec: %s:%d: mpibuf_ops get fail\000"
.LC7:
	.ascii	"&entry->wait\000"
.LC8:
	.ascii	"&entry->stop_wait\000"
.LC9:
	.ascii	"\0016mpp_vcodec: %s:%d: packet is null\012\000"
.LC10:
	.ascii	"rkv_enc\000"
	.section	___ksymtab+mpp_vcodec_clear_buf_resource,"a"
	.align	2
	.type	__ksymtab_mpp_vcodec_clear_buf_resource, %object
	.size	__ksymtab_mpp_vcodec_clear_buf_resource, 12
__ksymtab_mpp_vcodec_clear_buf_resource:
	.word	mpp_vcodec_clear_buf_resource
	.word	__kstrtab_mpp_vcodec_clear_buf_resource
	.word	__kstrtabns_mpp_vcodec_clear_buf_resource
	.section	___ksymtab+mpp_vcodec_run_task,"a"
	.align	2
	.type	__ksymtab_mpp_vcodec_run_task, %object
	.size	__ksymtab_mpp_vcodec_run_task, 12
__ksymtab_mpp_vcodec_run_task:
	.word	mpp_vcodec_run_task
	.word	__kstrtab_mpp_vcodec_run_task
	.word	__kstrtabns_mpp_vcodec_run_task
	.section	__param,"a"
	.align	2
	.type	__param_max_stream_cnt, %object
	.size	__param_max_stream_cnt, 20
__param_max_stream_cnt:
	.word	__param_str_max_stream_cnt
	.word	0
	.word	param_ops_int
	.short	420
	.byte	-1
	.byte	0
	.word	max_stream_cnt
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
