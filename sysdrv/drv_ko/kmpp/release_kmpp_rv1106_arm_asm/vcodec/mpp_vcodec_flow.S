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
	.file	"mpp_vcodec_flow.c"
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
	.type	frame_add_osd, %function
frame_add_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r6, r1
	bl	mpp_frame_add_osd
	ldr	r7, .L12
	mov	r4, r6
	movs	r5, #0
.L2:
	ldr	r3, [r6, #4]
	cmp	r3, r5
	bhi	.L5
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L5:
	ldr	r0, [r4, #136]
	cbz	r0, .L3
	mov	r2, r7
	movs	r1, #0
	bl	mpi_buf_unref_with_tag
.L3:
	ldr	r0, [r4, #88]
	cbz	r0, .L4
	mov	r2, r7
	movs	r1, #0
	bl	mpi_buf_unref_with_tag
.L4:
	adds	r5, r5, #1
	adds	r4, r4, #140
	b	.L2
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.fnend
	.size	frame_add_osd, .-frame_add_osd
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_sub.constprop.0, %function
atomic_sub.constprop.0:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	pld	[r0]
	.syntax unified
@ 224 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r0]
	sub	r3, r3, #1
	strex	r2, r3, [r0]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	atomic_sub.constprop.0, .-atomic_sub.constprop.0
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_add.constprop.1, %function
atomic_add.constprop.1:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	pld	[r0]
	.syntax unified
@ 223 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r0]
	add	r3, r3, #1
	strex	r2, r3, [r0]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	atomic_add.constprop.1, .-atomic_add.constprop.1
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	enc_chan_process_single_chan, %function
enc_chan_process_single_chan:
	.fnstart
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movs	r1, #1
	.pad #172
	sub	sp, sp, #172
	mov	r6, r0
	bl	mpp_vcodec_get_chan_entry
	movs	r5, #0
	mov	r4, r0
	strd	r5, r5, [sp, #20]
	str	r5, [sp, #28]
	bl	get_mpibuf_ops
	mov	r8, r0
	cbnz	r4, .L17
	ldr	r1, .L127
	movs	r2, #102
	ldr	r0, .L127+4
.L126:
	bl	printk
	mov	r0, #-1
.L16:
	add	sp, sp, #172
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L17:
	cbnz	r0, .L19
	movs	r2, #106
	ldr	r1, .L127
	ldr	r0, .L127+8
	b	.L126
.L19:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #28]
	cmp	r3, #3
	beq	.L20
	mov	r2, r6
	movs	r1, #112
	ldr	r0, .L127+12
	bl	printk
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L125:
	movs	r0, #0
	b	.L16
.L20:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #36]
	ldr	r9, .L127+44
	cmp	r3, #0
	ble	.L21
	ldr	r0, [r9]
	ands	r0, r0, #32
	beq	.L16
	mov	r3, r6
	movs	r2, #119
	ldr	r1, .L127
	ldr	r0, .L127+16
	bl	printk
	b	.L125
.L21:
	ldr	r3, [r9]
	lsls	r2, r3, #26
	bpl	.L22
	mov	r3, r6
	movs	r2, #123
	ldr	r1, .L127
	ldr	r0, .L127+20
	bl	printk
.L22:
	ldr	r5, [r4, #40]
	cmp	r5, #0
	bne	.L55
	ldr	r0, [r4, #44]
	bl	mpp_enc_check_pkt_pool
	cbnz	r0, .L24
	mov	r2, r6
	movs	r1, #128
	ldr	r0, .L127+24
	bl	printk
	b	.L125
.L24:
	ldr	r3, [r8, #40]
	cmp	r3, #0
	beq	.L125
	ldr	r0, [r4, #48]
	blx	r3
	mov	r7, r0
	cmp	r0, #0
	beq	.L125
	bl	mpp_time
	ldr	r3, [r4, #96]
	subs	r0, r0, r3
	str	r0, [r4, #120]
	bl	mpp_time
	ldr	fp, [r4]
	strd	r0, [r4, #96]
	bl	get_mpibuf_ops
	movs	r2, #104
	mov	r1, r5
	mov	r10, r0
	add	r0, sp, #64
	bl	memset
	cmp	r10, #0
	beq	.L27
	ldr	r3, [r10, #48]
	cbnz	r3, .L28
.L27:
	movs	r1, #59
	ldr	r0, .L127+28
	bl	printk
.L29:
	ldr	r2, .L127+32
	movs	r1, #0
	mov	r0, r7
	bl	mpi_buf_unref_with_tag
	b	.L125
.L28:
	mov	r2, fp
	add	r1, sp, #64
	mov	r0, r7
	blx	r3
	cmp	r0, #0
	bne	.L29
	add	r0, sp, #20
	bl	mpp_frame_init
	ldr	r1, [sp, #64]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_width
	ldr	r1, [sp, #68]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_height
	ldr	r1, [sp, #72]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_hor_stride
	ldr	r1, [sp, #76]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_ver_stride
	ldrd	r2, [sp, #104]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_pts
	ldrd	r2, [sp, #144]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_dts
	ldr	r1, [sp, #92]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_fmt
	ldr	r1, [sp, #84]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_offset_x
	ldr	r1, [sp, #88]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_offset_y
	ldr	r1, [sp, #128]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_is_gray
	ldr	r1, [sp, #132]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_is_full
	ldr	r1, [sp, #136]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_phy_addr
	ldr	r1, [sp, #156]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_idr_request
	ldr	r1, [sp, #116]
	cbz	r1, .L30
	ldr	r0, [sp, #20]
	bl	frame_add_osd
.L30:
	ldr	r1, [sp, #152]
	cbz	r1, .L31
	ldr	r0, [sp, #20]
	bl	mpp_frame_add_ppinfo
.L31:
	movs	r2, #32
	movs	r1, #0
	add	r0, sp, r2
	ldr	r5, .L127+32
	bl	memset
	movs	r3, #0
	mov	r0, r3
	str	r5, [sp]
	add	r2, sp, #28
	add	r1, sp, #32
	str	r7, [sp, #44]
	bl	mpp_buffer_import_with_tag
	ldr	r3, [r9]
	lsls	r3, r3, #25
	bpl	.L32
	ldr	r3, [sp, #112]
	movs	r2, #147
	sub	r1, r5, #29
	ldr	r0, .L127+36
	bl	printk
.L32:
	ldr	r0, [sp, #112]
	cmp	r0, #0
	bgt	.L33
.L35:
	movs	r5, #0
.L34:
	ldr	r1, [sp, #28]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_buffer
	ldr	r3, [r8, #16]
	cbz	r3, .L23
	mov	r0, r7
	blx	r3
.L23:
	ldr	r3, [sp, #20]
	cbnz	r3, .L38
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L39
.L38:
	bl	mpp_time
	add	r9, r4, #36
	str	r0, [sp, #12]
	mov	r0, r9
	bl	atomic_add.constprop.1
	ldr	r3, [r4, #84]
	ldr	r2, [r4, #88]
	add	r3, r3, r2
	ldr	r2, .L127+40
	ldr	r2, [r2]
	cmp	r3, r2
	ble	.L40
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L40
	add	r0, sp, #20
	bl	mpp_frame_deinit
	ldr	r0, [r4, #44]
	bl	mpp_enc_pkt_full_inc
.L41:
	bl	get_mpidev_ops
	mov	r7, r0
	bl	mpp_vcodec_get_enc_module_entry
	mov	r8, r0
	mov	r0, r9
	bl	atomic_sub.constprop.0
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	add	r0, r4, #60
	bl	__wake_up
	cbz	r7, .L50
	ldr	r3, [r7, #28]
	cbz	r3, .L50
	ldr	r0, [r4]
	blx	r3
.L50:
	ldr	r3, [sp, #24]
	cbz	r3, .L51
	cbz	r7, .L52
	ldr	r3, [r7, #28]
	cbz	r3, .L52
	cbz	r5, .L52
	ldr	r0, [r5]
	blx	r3
.L52:
	add	r0, sp, #24
	bl	mpp_frame_deinit
.L51:
	movw	r3, #10784
	ldr	r0, [r8, r3]
	bl	vcodec_thread_trigger
	b	.L46
.L128:
	.align	2
.L127:
	.word	.LANCHOR0+14
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LANCHOR0+43
	.word	.LC7
	.word	.LANCHOR1
	.word	mpp_vcodec_debug
.L33:
	movs	r1, #1
	bl	mpp_vcodec_get_chan_entry
	ldr	r3, [r0, #28]
	mov	r5, r0
	cmp	r3, #3
	bne	.L35
	cmp	r0, #0
	beq	.L35
	ldr	r3, [r0, #44]
	cmp	r3, #0
	beq	.L34
	bl	mpp_time
	ldr	r3, [r4, #104]
	subs	r0, r0, r3
	str	r0, [r4, #124]
	bl	mpp_time
	ldr	r3, [sp, #112]
	strd	r0, [r4, #104]
	add	r0, sp, #24
	str	r3, [r4, #4]
	bl	mpp_frame_init
	ldrd	r1, r0, [sp, #20]
	bl	mpp_frame_copy
	ldr	r1, [sp, #124]
	cbz	r1, .L36
	ldr	r0, [sp, #24]
	bl	frame_add_osd
.L36:
	ldrd	r0, r1, [sp, #24]
	bl	mpp_frame_set_buffer
	b	.L34
.L55:
	movs	r5, #0
	b	.L23
.L40:
	ldr	r1, [sp, #20]
	ldr	r0, [r4, #44]
	bl	mpp_enc_cfg_reg
	mov	fp, r0
	cmp	r0, #0
	bne	.L41
	cmp	r5, #0
	beq	.L43
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L43
	add	r8, r5, #36
	add	r7, r4, #24
	mov	r0, r8
	bl	atomic_add.constprop.1
	mov	r0, r7
	bl	atomic_add.constprop.1
	ldr	r0, [r5, #44]
	ldr	r1, [sp, #24]
	bl	mpp_enc_cfg_reg
	mov	r10, r0
	cbnz	r0, .L44
	ldr	r1, [r5, #44]
	ldr	r0, [r4, #44]
	bl	mpp_enc_hw_start
	cbz	r0, .L45
	movs	r1, #193
	ldr	r0, .L129
	bl	printk
	mov	r0, r7
	bl	atomic_sub.constprop.0
	mov	r0, r8
	bl	atomic_sub.constprop.0
	mov	r3, r10
	movs	r2, #1
	movs	r1, #3
	add	r0, r5, #60
	bl	__wake_up
	b	.L41
.L45:
	ldr	r3, [r4]
	str	r3, [r5, #8]
.L46:
	bl	mpp_time
	ldr	r3, [sp, #12]
	subs	r0, r0, r3
	str	r0, [r4, #92]
.L39:
	ldr	r0, [sp, #28]
	cbz	r0, .L53
	ldr	r1, .L129+4
	bl	mpp_buffer_put_with_caller
.L53:
	mov	r0, r6
	bl	enc_chan_update_tab_after_enc
	b	.L125
.L44:
	bl	get_mpidev_ops
	movs	r1, #203
	mov	r10, r0
	ldr	r0, .L129+8
	bl	printk
	mov	r0, r8
	bl	atomic_sub.constprop.0
	mov	r0, r7
	bl	atomic_sub.constprop.0
	mov	r3, fp
	movs	r2, #1
	movs	r1, #3
	add	r0, r5, #60
	bl	__wake_up
	cmp	r10, #0
	beq	.L43
	ldr	r3, [r10, #28]
	cbz	r3, .L43
	ldr	r0, [r5]
	blx	r3
.L43:
	movs	r1, #0
	ldr	r0, [r4, #44]
	bl	mpp_enc_hw_start
	cmp	r0, #0
	beq	.L46
	b	.L41
.L130:
	.align	2
.L129:
	.word	.LC8
	.word	.LANCHOR0+43
	.word	.LC9
	.fnend
	.size	enc_chan_process_single_chan, .-enc_chan_process_single_chan
	.align	1
	.global	mpp_vcodec_enc_add_packet_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_add_packet_list, %function
mpp_vcodec_enc_add_packet_list:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L138
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	ldr	r3, [r3]
	mov	r5, r1
	str	r1, [sp, #4]
	lsls	r3, r3, #26
	bpl	.L132
	mov	r0, r1
	bl	mpp_packet_get_length
	movs	r2, #248
	ldr	r1, .L138+4
	mov	r3, r0
	ldr	r0, .L138+8
	bl	printk
.L132:
	bl	get_vsm_ops
	mov	r1, r0
	cbnz	r0, .L133
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #72]
	add	r2, r5, #12
	add	r0, r4, #68
	str	r2, [r4, #72]
	strd	r0, r3, [r5, #12]
	add	r0, r4, #84
	str	r2, [r3]
	bl	atomic_add.constprop.1
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r2, #1
	mov	r3, r1
	add	r0, r4, #52
	movs	r1, #3
	bl	__wake_up
.L134:
	movs	r3, #0
	str	r3, [r4, #40]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L133:
	add	r0, sp, #4
	bl	mpp_packet_deinit
	b	.L134
.L139:
	.align	2
.L138:
	.word	mpp_vcodec_debug
	.word	.LANCHOR0+72
	.word	.LC10
	.fnend
	.size	mpp_vcodec_enc_add_packet_list, .-mpp_vcodec_enc_add_packet_list
	.align	1
	.global	mpp_vcodec_enc_int_handle
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_int_handle, %function
mpp_vcodec_enc_int_handle:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	movs	r1, #1
	movs	r3, #0
	strd	r3, r3, [sp]
	bl	mpp_vcodec_get_chan_entry
	movs	r5, #1
	str	r5, [r0, #40]
	mov	r4, r0
	bl	mpp_vcodec_get_enc_module_entry
	mov	r7, r0
	cbnz	r0, .L141
	movw	r2, #273
	ldr	r1, .L163
	ldr	r0, .L163+4
	bl	printk
.L140:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L141:
	ldr	r1, [r4, #24]
	cmp	r1, #0
	beq	.L143
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	mpp_vcodec_get_chan_entry
	mov	r5, r0
	cmp	r0, #0
	beq	.L149
	ldr	r6, [r0, #44]
	cbz	r6, .L144
	bl	get_mpidev_ops
	mov	r8, r0
	bl	mpp_time
	strd	r0, [r4, #112]
	add	r3, sp, #4
	ldr	r1, [r5, #44]
	mov	r2, sp
	ldr	r0, [r4, #44]
	bl	mpp_enc_int_process
	ldr	r1, [sp, #4]
	mov	r6, r0
	cbz	r1, .L145
	mov	r0, r5
	bl	mpp_vcodec_enc_add_packet_list
.L144:
	add	r0, r4, #24
	bl	atomic_sub.constprop.0
	add	r0, r5, #36
	bl	atomic_sub.constprop.0
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	add	r0, r5, #60
	bl	__wake_up
	mov	r3, #-1
	str	r3, [r4, #4]
	str	r3, [r5, #8]
.L146:
	ldr	r1, [sp]
	cbz	r1, .L147
	mov	r0, r4
	bl	mpp_vcodec_enc_add_packet_list
.L147:
	cbz	r6, .L148
	movs	r3, #0
	str	r3, [r4, #40]
.L148:
	add	r0, r4, #36
	bl	atomic_sub.constprop.0
	add	r0, r4, #60
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	bl	__wake_up
	movw	r3, #10784
	ldr	r0, [r7, r3]
	bl	vcodec_thread_trigger
	b	.L140
.L145:
	cmp	r8, #0
	beq	.L144
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L144
	ldr	r0, [r5]
	blx	r3
	b	.L144
.L149:
	mov	r6, r0
	b	.L144
.L143:
	add	r3, sp, #4
	mov	r2, sp
	ldr	r0, [r4, #44]
	bl	mpp_enc_int_process
	mov	r6, r0
	b	.L146
.L164:
	.align	2
.L163:
	.word	.LANCHOR0+103
	.word	.LC11
	.fnend
	.size	mpp_vcodec_enc_int_handle, .-mpp_vcodec_enc_int_handle
	.align	1
	.global	mpp_vcodec_enc_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_run_task, %function
mpp_vcodec_enc_run_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	movs	r1, #1
	bl	mpp_vcodec_get_chan_entry
	cbz	r0, .L168
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r0, #28]
	cmp	r2, #3
	beq	.L167
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, #-1
.L165:
	pop	{r3, pc}
.L167:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, [r0, #44]
	pop	{r3, lr}
	b	mpp_enc_run_task
.L168:
	mvn	r0, #21
	b	.L165
	.fnend
	.size	mpp_vcodec_enc_run_task, .-mpp_vcodec_enc_run_task
	.align	1
	.global	mpp_vcodec_enc_routine
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_routine, %function
mpp_vcodec_enc_routine:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	bl	mpp_vcodec_get_enc_module_entry
	mov	r4, r0
	cbnz	r0, .L170
	mov	r2, #340
	ldr	r1, .L185
	ldr	r0, .L185+4
	bl	printk
	mvn	r0, #5
.L169:
	pop	{r4, r5, r6, pc}
.L170:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r2, #10260
	movs	r1, #0
	ldr	r6, [r0, r2]
	movw	r2, #10264
	str	r1, [r0, r2]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L185+8
	ldr	r2, [r5]
	lsls	r3, r2, #26
	bpl	.L172
	mov	r3, r6
	mov	r2, #348
	ldr	r1, .L185
	ldr	r0, .L185+12
	bl	printk
.L172:
	add	r4, r4, #10240
	adds	r4, r4, #28
.L173:
	cbz	r6, .L178
	bl	enc_chan_get_high_prior_chan
	ldr	r0, [r4]
	cmp	r0, #63
	bls	.L174
.L175:
	subs	r6, r6, #1
	b	.L173
.L174:
	bl	enc_chan_process_single_chan
	cmp	r0, #0
	beq	.L175
.L178:
	ldr	r0, [r5]
	ands	r0, r0, #32
	beq	.L169
	mov	r2, #358
	ldr	r1, .L185
	ldr	r0, .L185+16
	bl	printk
	movs	r0, #0
	b	.L169
.L186:
	.align	2
.L185:
	.word	.LANCHOR0+129
	.word	.LC12
	.word	mpp_vcodec_debug
	.word	.LC13
	.word	.LC14
	.fnend
	.size	mpp_vcodec_enc_routine, .-mpp_vcodec_enc_routine
	.align	1
	.global	mpp_vcodec_dec_routine
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_dec_routine, %function
mpp_vcodec_dec_routine:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpp_vcodec_dec_routine, .-mpp_vcodec_dec_routine
	.global	max_packet_num
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.26160, %object
	.size	__FUNCTION__.26160, 14
__FUNCTION__.26160:
	.ascii	"frame_add_osd\000"
	.type	__func__.26185, %object
	.size	__func__.26185, 29
__func__.26185:
	.ascii	"enc_chan_process_single_chan\000"
	.type	__FUNCTION__.26197, %object
	.size	__FUNCTION__.26197, 29
__FUNCTION__.26197:
	.ascii	"enc_chan_process_single_chan\000"
	.type	__func__.26216, %object
	.size	__func__.26216, 31
__func__.26216:
	.ascii	"mpp_vcodec_enc_add_packet_list\000"
	.type	__func__.26232, %object
	.size	__func__.26232, 26
__func__.26232:
	.ascii	"mpp_vcodec_enc_int_handle\000"
	.type	__func__.26256, %object
	.size	__func__.26256, 23
__func__.26256:
	.ascii	"mpp_vcodec_enc_routine\000"
	.type	__param_str_max_packet_num, %object
	.size	__param_str_max_packet_num, 26
__param_str_max_packet_num:
	.ascii	"mpp_vcodec.max_packet_num\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	max_packet_num, %object
	.size	max_packet_num, 4
max_packet_num:
	.word	100
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_max_packet_numtype162, %object
	.size	__UNIQUE_ID_max_packet_numtype162, 39
__UNIQUE_ID_max_packet_numtype162:
	.ascii	"mpp_vcodec.parmtype=max_packet_num:int\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013mpp_vcodec: %s:%d: chan_entry is NULL\012\000"
.LC1:
	.ascii	"\0013mpp_vcodec: %s:%d: mpibuf_ops get fail\012\000"
.LC2:
	.ascii	"\0013mpp_vcodec: %d: cur chnl %d state is no runing"
	.ascii	"\012\000"
.LC3:
	.ascii	"\0016mpp_vcodec: %s:%d: cur chnl %d state is wating"
	.ascii	" irq\012\000"
.LC4:
	.ascii	"\0016mpp_vcodec: %s:%d: enc_chan_process_single_cha"
	.ascii	"n id %d\012\000"
.LC5:
	.ascii	"\0016mpp_vcodec: %d: cur chnl %d pkt pool non free "
	.ascii	"buf\012\000"
.LC6:
	.ascii	"\0013mpp_vcodec: %d: get buf info fail\000"
.LC7:
	.ascii	"\0016mpp_vcodec: %s:%d: attach jpeg id %d\012\000"
.LC8:
	.ascii	"\0013mpp_vcodec: %d: combo start fail \012\000"
.LC9:
	.ascii	"\0013mpp_vcodec: %d: combo cfg fail \012\000"
.LC10:
	.ascii	"\0016mpp_vcodec: %s:%d: packet size %zu\012\000"
.LC11:
	.ascii	"\0013mpp_vcodec: %s:%d: get_enc_module_entry fail\000"
.LC12:
	.ascii	"\0013mpp_vcodec: %s:%d: get_enc_module_entry fail\012"
	.ascii	"\000"
.LC13:
	.ascii	"\0016mpp_vcodec: %s:%d: mpp_vcodec_enc_routine star"
	.ascii	"ted_chan_num %d\012\000"
.LC14:
	.ascii	"\0016mpp_vcodec: %s:%d: mpp_vcodec_enc_routine end\012"
	.ascii	"\000"
	.section	__param,"a"
	.align	2
	.type	__param_max_packet_num, %object
	.size	__param_max_packet_num, 20
__param_max_packet_num:
	.word	__param_str_max_packet_num
	.word	0
	.word	param_ops_int
	.short	420
	.byte	-1
	.byte	0
	.word	max_packet_num
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
