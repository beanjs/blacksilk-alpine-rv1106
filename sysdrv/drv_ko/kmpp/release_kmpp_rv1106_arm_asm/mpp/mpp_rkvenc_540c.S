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
	.file	"mpp_rkvenc_540c.c"
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
	.type	____atomic_set_bit, %function
____atomic_set_bit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r3, #1
	ldr	r4, [r1]
	lsls	r3, r3, r0
	orrs	r3, r3, r4
	str	r3, [r1]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, pc}
	.fnend
	.size	____atomic_set_bit, .-____atomic_set_bit
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	list_move_tail, %function
list_move_tail:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r2, r3, [r0]
	str	r3, [r2, #4]
	str	r2, [r3]
	ldr	r3, [r1, #4]
	str	r0, [r1, #4]
	strd	r1, r3, [r0]
	str	r0, [r3]
	bx	lr
	.fnend
	.size	list_move_tail, .-list_move_tail
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_invalid_class_msg, %function
rkvenc_invalid_class_msg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #2324]
	movs	r2, #12
	ldr	r3, [r3, #24]
	mla	r3, r2, r3, r0
	movs	r2, #0
.L4:
	cmp	r0, r3
	bne	.L6
	movs	r0, #0
	bx	lr
.L6:
	ldr	r1, [r0, #2332]
	cbz	r1, .L5
	str	r2, [r0, #2332]
	str	r2, [r0, #2328]
.L5:
	adds	r0, r0, #12
	b	.L4
	.fnend
	.size	rkvenc_invalid_class_msg, .-rkvenc_invalid_class_msg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_read, %function
mpp_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r2, r1
	ldr	r3, [r0, #60]
	add	r3, r3, r1
	.syntax unified
@ 113 "./arch/arm/include/asm/io.h" 1
	ldr r4, [r3]
@ 0 "" 2
@ 728 "drivers/kmpp/mpp/mpp_common.h" 1
	dsb 
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L15
	ldr	r3, [r3]
	lsls	r3, r3, #18
	bpl	.L10
	mov	r3, r4
	lsrs	r1, r1, #2
	ldr	r0, .L15+4
	bl	printk
.L10:
	mov	r0, r4
	pop	{r4, pc}
.L16:
	.align	2
.L15:
	.word	mpp_dev_debug
	.word	.LC0
	.fnend
	.size	mpp_read, .-mpp_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_read_relaxed, %function
mpp_read_relaxed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r2, r1
	ldr	r3, [r0, #60]
	add	r3, r3, r1
	.syntax unified
@ 113 "./arch/arm/include/asm/io.h" 1
	ldr r4, [r3]
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L22
	ldr	r3, [r3]
	lsls	r3, r3, #18
	bpl	.L17
	mov	r3, r4
	lsrs	r1, r1, #2
	ldr	r0, .L22+4
	bl	printk
.L17:
	mov	r0, r4
	pop	{r4, pc}
.L23:
	.align	2
.L22:
	.word	mpp_dev_debug
	.word	.LC1
	.fnend
	.size	mpp_read_relaxed, .-mpp_read_relaxed
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_write_relaxed, %function
mpp_write_relaxed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L29
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #19
	bpl	.L25
	mov	r3, r2
	ldr	r0, .L29+4
	mov	r2, r1
	lsrs	r1, r1, #2
	bl	printk
.L25:
	ldr	r1, [r6, #60]
	add	r1, r1, r4
	.syntax unified
@ 95 "./arch/arm/include/asm/io.h" 1
	str r5, [r1]
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L30:
	.align	2
.L29:
	.word	mpp_dev_debug
	.word	.LC2
	.fnend
	.size	mpp_write_relaxed, .-mpp_write_relaxed
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_update_req, %function
rkvenc_update_req:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	ldr	r4, [r0, #2324]
	movs	r0, #20
	mla	r1, r0, r1, r4
	ldrd	r5, r6, [r1, #28]
	ldrd	r0, r1, [r2, #8]
	add	r0, r0, r1
	cmp	r1, r5
	sub	r0, r0, #4
	mov	r4, r6
	it	cc
	movcc	r1, r5
	cmp	r6, r0
	str	r1, [r3, #12]
	it	cs
	movcs	r4, r0
	adds	r4, r4, #4
	subs	r4, r4, r1
	str	r4, [r3, #8]
	ldr	r4, [r2, #12]
	subs	r1, r1, r4
	ldr	r4, [r2, #16]
	add	r1, r1, r4
	str	r1, [r3, #16]
	ldr	r3, [r2, #12]
	cmp	r3, r5
	bcc	.L32
	cmp	r6, r0
	bcs	.L33
.L32:
	ldr	r2, [r2, #8]
	ldr	r1, .L34
	ldr	r0, .L34+4
	str	r2, [sp]
	movw	r2, #529
	bl	printk
.L33:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	.LC3
	.fnend
	.size	rkvenc_update_req, .-rkvenc_update_req
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_write, %function
mpp_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L41
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #19
	bpl	.L37
	mov	r3, r2
	ldr	r0, .L41+4
	mov	r2, r1
	lsrs	r1, r1, #2
	bl	printk
.L37:
	.syntax unified
@ 707 "drivers/kmpp/mpp/mpp_common.h" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	bl	arm_heavy_mb
	ldr	r1, [r6, #60]
	add	r1, r1, r4
	.syntax unified
@ 95 "./arch/arm/include/asm/io.h" 1
	str r5, [r1]
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L42:
	.align	2
.L41:
	.word	mpp_dev_debug
	.word	.LC2
	.fnend
	.size	mpp_write, .-mpp_write
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_check_bs_overflow, %function
rkvenc_check_bs_overflow:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r4, r0
	ldr	r3, [r0, #52]
	lsls	r5, r3, #31
	bmi	.L52
	ldr	r7, [r0, #88]
	ands	r3, r3, #8192
	ldr	r2, [r7]
	ldr	r5, [r2, #184]
	beq	.L53
	movw	r1, #1036
	bl	mpp_read
	mov	r1, #1024
	mov	r6, r0
	mov	r0, r4
	bl	mpp_read
	movw	r1, #1028
	mov	r8, r0
	mov	r0, r4
	bl	mpp_read
	strd	r8, r0, [r5, #212]
	mov	r3, r0
	ldr	r2, [r4, #288]
	strd	r2, r6, [r5, #220]
	ldr	r2, .L63
	ldr	r2, [r2]
	lsls	r0, r2, #13
	bpl	.L46
	ldr	r2, [r4, #288]
	str	r6, [sp, #4]
	ldr	r0, .L63+4
	str	r2, [sp]
	mov	r2, r8
	ldr	r1, [r7, #2276]
	bl	printk
.L46:
	ldr	r3, [r4, #288]
	cmp	r3, r6
	itt	eq
	addeq	r3, r6, #1
	streq	r3, [r4, #288]
	ldr	r3, [r4, #288]
	cmp	r3, r8
	bcc	.L48
	movw	r1, #1028
	mov	r0, r4
	bl	mpp_read
	str	r0, [r4, #288]
.L48:
	ldr	r2, [r4, #288]
	movw	r1, #1036
	mov	r0, r4
	bl	mpp_write
	add	r2, r6, #12
	mov	r1, #1032
	mov	r0, r4
	bl	mpp_write
	ldr	r3, [r4, #52]
	movs	r0, #1
	str	r3, [r4, #56]
.L45:
	ldr	r3, [r4, #52]
	lsls	r1, r3, #27
	bpl	.L43
	mov	r1, #700
	mov	r0, r4
	bl	mpp_read
	mov	r1, #688
	mov	r6, r0
	mov	r0, r4
	bl	mpp_read
	mov	r1, #692
	mov	r8, r0
	mov	r0, r4
	bl	mpp_read
	strd	r8, r0, [r5, #212]
	mov	r3, r0
	ldr	r2, [r4, #284]
	strd	r2, r6, [r5, #220]
	ldr	r2, .L63
	ldr	r2, [r2]
	lsls	r2, r2, #13
	bpl	.L49
	ldr	r2, [r4, #284]
	str	r6, [sp, #4]
	ldr	r0, .L63+8
	str	r2, [sp]
	mov	r2, r8
	ldr	r1, [r7, #2276]
	bl	printk
.L49:
	ldr	r3, [r4, #284]
	cmp	r3, r6
	itt	eq
	addeq	r3, r6, #1
	streq	r3, [r4, #284]
	ldr	r3, [r4, #284]
	cmp	r3, r8
	bcc	.L51
	mov	r1, #692
	mov	r0, r4
	bl	mpp_read
	str	r0, [r4, #284]
.L51:
	ldr	r2, [r4, #284]
	mov	r1, #696
	mov	r0, r4
	bl	mpp_write
	add	r2, r6, #12
	mov	r1, #700
	mov	r0, r4
	bl	mpp_write
	ldr	r3, [r4, #52]
	movs	r0, #1
	str	r3, [r4, #56]
.L43:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L53:
	mov	r0, r3
	b	.L45
.L52:
	movs	r0, #0
	b	.L43
.L64:
	.align	2
.L63:
	.word	mpp_dev_debug
	.word	.LC4
	.word	.LC5
	.fnend
	.size	rkvenc_check_bs_overflow, .-rkvenc_check_bs_overflow
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_clear_dvbm_info, %function
rkvenc_clear_dvbm_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movs	r2, #0
	mov	r4, r0
	movs	r1, #96
	bl	mpp_write
	movs	r2, #0
	movs	r1, #24
	mov	r0, r4
	bl	mpp_write
	movs	r1, #24
	mov	r0, r4
	bl	mpp_read
	movs	r1, #96
	mov	r5, r0
	mov	r0, r4
	bl	mpp_read
	orrs	r3, r5, r0
	mov	r2, r0
	beq	.L65
	mov	r1, r5
	ldr	r0, .L67
	pop	{r3, r4, r5, lr}
	b	printk
.L65:
	pop	{r3, r4, r5, pc}
.L68:
	.align	2
.L67:
	.word	.LC6
	.fnend
	.size	rkvenc_clear_dvbm_info, .-rkvenc_clear_dvbm_info
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_reset, %function
rkvenc_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, .L78
	ldr	r5, [r0, #132]
	ldr	r2, [r6]
	lsls	r2, r2, #26
	bpl	.L70
	movw	r2, #2265
	ldr	r1, .L78+4
	ldr	r0, .L78+8
	bl	printk
.L70:
	movw	r2, #1023
	ldr	r1, [r5, #256]
	mov	r0, r4
	bl	mpp_write
	movs	r2, #1
	ldr	r1, [r5, #248]
	mov	r0, r4
	bl	mpp_write
	ldr	r3, .L78+12
	ldr	r0, .L78+16
	ldr	r3, [r3, #4]
	blx	r3
	movs	r2, #3
	ldr	r1, [r5, #248]
	mov	r0, r4
	bl	mpp_write
	mov	r2, #-1
	ldr	r1, [r5, #260]
	mov	r0, r4
	bl	mpp_write
	movs	r2, #0
	ldr	r1, [r5, #264]
	mov	r0, r4
	bl	mpp_write
	movs	r2, #0
	ldr	r1, [r5, #248]
	mov	r0, r4
	bl	mpp_write
	mov	r0, r4
	bl	rkvenc_clear_dvbm_info
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L71
	movw	r2, #2277
	ldr	r1, .L78+4
	ldr	r0, .L78+20
	bl	printk
.L71:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L79:
	.align	2
.L78:
	.word	mpp_dev_debug
	.word	.LANCHOR0+18
	.word	.LC7
	.word	arm_delay_ops
	.word	1073740
	.word	.LC8
	.fnend
	.size	rkvenc_reset, .-rkvenc_reset
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_irq, %function
rkvenc_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L90
	ldr	r6, [r0, #132]
	ldr	r2, [r5]
	lsls	r2, r2, #26
	bpl	.L81
	movw	r2, #1333
	ldr	r1, .L90+4
	ldr	r0, .L90+8
	bl	printk
.L81:
	ldr	r1, [r6, #264]
	mov	r0, r4
	bl	mpp_read
	str	r0, [r4, #52]
	cbz	r0, .L80
	mov	r2, #256
	ldr	r1, [r6, #256]
	mov	r0, r4
	bl	mpp_write
	ldr	r2, [r4, #52]
	ldr	r1, [r6, #260]
	mov	r0, r4
	bl	mpp_write
	movs	r2, #0
	ldr	r1, [r6, #264]
	mov	r0, r4
	bl	mpp_write
	ldr	r3, [r4, #52]
	cmp	r3, #32768
	bne	.L83
.L84:
	movs	r0, #1
.L80:
	pop	{r4, r5, r6, pc}
.L83:
	mov	r0, r4
	bl	rkvenc_check_bs_overflow
	cmp	r0, #0
	bne	.L84
	movs	r1, #24
	mov	r0, r4
	bl	mpp_read
	ubfx	r0, r0, #0, #14
	str	r0, [r4, #252]
	mov	r0, r4
	bl	rkvenc_clear_dvbm_info
	ldr	r3, [r5]
	lsls	r3, r3, #26
	bpl	.L86
	movw	r2, #1349
	ldr	r1, .L90+4
	ldr	r0, .L90+12
	bl	printk
.L86:
	movs	r0, #2
	b	.L80
.L91:
	.align	2
.L90:
	.word	mpp_dev_debug
	.word	.LANCHOR0+31
	.word	.LC7
	.word	.LC8
	.fnend
	.size	rkvenc_irq, .-rkvenc_irq
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_run_start_link, %function
rkvenc_run_start_link:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r6, r0
	ldr	r5, [r0, #132]
	mov	r8, r1
	ldr	r9, [r1, #2332]
	ldr	r4, [r5, #28]
	ldr	r3, [r5, #32]
	lsrs	r4, r4, #2
	lsrs	r7, r3, #2
.L93:
	cmp	r4, r7
	bls	.L95
	ldr	r1, [r5, #252]
	movw	r2, #65535
	mov	r0, r6
	bl	mpp_write
	ldr	r3, [r8, #3576]
	ldr	r1, [r5, #288]
	mov	r0, r6
	ldr	r2, [r3, #32]
	bl	mpp_write
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L95:
	ldr	r3, [r5, #20]
	cmp	r3, r4
	beq	.L94
	ldr	r2, [r9, r4, lsl #2]
	lsls	r1, r4, #2
	mov	r0, r6
	bl	mpp_write
.L94:
	adds	r4, r4, #1
	b	.L93
	.fnend
	.size	rkvenc_run_start_link, .-rkvenc_run_start_link
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_dump_session, %function
rkvenc_dump_session:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r4, r1
	ldr	r5, [r0, #184]
	mov	r7, r0
	ldr	r9, .L117+92
	movs	r6, #0
	ldr	r10, .L117+12
	add	r8, r5, #24
	mov	r0, r5
	bl	down_read
	ldr	r1, .L117
	mov	r0, r4
	bl	seq_puts
	ldr	r1, .L117+4
	mov	r0, r4
	bl	seq_puts
	ldr	r2, .L117+8
	ldr	r1, .L117+12
	mov	r0, r4
	bl	seq_printf
	ldr	r2, .L117+16
	ldr	r1, .L117+12
	mov	r0, r4
	bl	seq_printf
.L98:
	lsls	r3, r6, #4
	ldr	r3, [r8, r3]
	cbz	r3, .L97
	ldr	r2, [r9, r6, lsl #2]
	mov	r1, r10
	mov	r0, r4
	bl	seq_printf
.L97:
	adds	r6, r6, #1
	cmp	r6, #11
	bne	.L98
	ldr	r3, .L117+20
	mov	r0, r4
	ldr	r2, .L117+24
	add	r6, r5, #32
	ldr	r1, .L117+28
	add	r8, r5, #208
	str	r3, [sp, #12]
	ldr	r3, .L117+32
	ldr	r9, .L117+96
	ldr	r10, .L117+52
	str	r3, [sp, #8]
	ldr	r3, .L117+36
	str	r3, [sp, #4]
	ldr	r3, .L117+40
	str	r3, [sp]
	ldr	r3, .L117+44
	bl	seq_printf
	ldr	r1, .L117+48
	mov	r0, r4
	bl	seq_puts
	ldr	r2, [r7, #196]
	ldr	r1, .L117+52
	mov	r0, r4
	bl	seq_printf
	ldr	r2, [r7]
	ldr	r3, .L117+56
	mov	r0, r4
	ldr	r1, .L117+12
	ldr	r7, .L117+12
	ldr	r2, [r3, r2, lsl #2]
	bl	seq_printf
.L102:
	ldr	r3, [r6, #-8]
	cbz	r3, .L99
	cmp	r3, #1
	bne	.L100
	ldr	r2, [r6]
	mov	r1, r10
.L115:
	mov	r0, r4
	bl	seq_printf
.L99:
	adds	r6, r6, #16
	cmp	r6, r8
	bne	.L102
	ldr	r2, [r5, #232]
	mov	r0, r4
	ldr	r3, [r5, #16]
	ldr	r1, .L117+60
	str	r2, [sp, #12]
	adds	r3, r3, #0
	ldr	r2, [r5, #228]
	it	ne
	movne	r3, #1
	str	r2, [sp, #8]
	ldr	r2, [r5, #208]
	str	r2, [sp, #4]
	ldr	r2, [r5, #204]
	str	r2, [sp]
	ldr	r2, [r5, #200]
	bl	seq_printf
	ldr	r1, .L117+48
	mov	r0, r4
	bl	seq_puts
	ldr	r3, [r5, #208]
	cbz	r3, .L103
	ldr	r1, .L117+64
	mov	r0, r4
	bl	seq_puts
	ldr	r1, .L117+4
	mov	r0, r4
	bl	seq_puts
	ldr	r3, .L117+68
	ldr	r2, .L117+72
	mov	r0, r4
	ldr	r1, .L117+76
	str	r3, [sp, #4]
	ldr	r3, .L117+80
	str	r3, [sp]
	ldr	r3, .L117+84
	bl	seq_printf
	ldr	r3, [r5, #224]
	ldr	r1, .L117+88
	mov	r0, r4
	str	r3, [sp, #4]
	ldr	r3, [r5, #220]
	str	r3, [sp]
	ldrd	r2, r3, [r5, #212]
	bl	seq_printf
.L103:
	mov	r0, r5
	bl	up_read
	movs	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L100:
	cmp	r3, #2
	mov	r1, r7
	ite	eq
	moveq	r2, r6
	movne	r2, r9
	b	.L115
.L118:
	.align	2
.L117:
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC17
	.word	.LC15
	.word	.LC16
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC14
	.word	.LC21
	.word	.LC22
	.word	mpp_device_name
	.word	.LC24
	.word	.LC25
	.word	.LC29
	.word	.LC27
	.word	.LC28
	.word	.LC30
	.word	.LC26
	.word	.LC31
	.word	enc_info_item_name
	.word	.LC23
	.fnend
	.size	rkvenc_dump_session, .-rkvenc_dump_session
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_free_session, %function
rkvenc_free_session:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbz	r0, .L140
	ldr	r5, [r0, #188]
	cbz	r5, .L122
	mov	r0, r5
	bl	rkvenc_invalid_class_msg
	mov	r0, r5
	bl	kfree
.L122:
	ldr	r5, [r4, #192]
	cbz	r5, .L123
	mov	r0, r5
	bl	rkvenc_invalid_class_msg
	mov	r0, r5
	bl	kfree
.L123:
	ldr	r5, [r4, #184]
	ldr	r3, [r5, #20]
	cbz	r3, .L124
	ldr	r3, [r4, #12]
	ldr	r0, [r3, #244]
	bl	rk_dvbm_unlink
	movs	r3, #0
	str	r3, [r5, #20]
.L124:
	ldr	r3, [r5, #16]
	cbz	r3, .L125
	ldr	r3, [r4, #12]
	movs	r2, #0
	str	r2, [r3, #128]
.L125:
	ldr	r0, [r4, #184]
	cbz	r0, .L140
	bl	kfree
	movs	r3, #0
	str	r3, [r4, #184]
.L140:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
	.fnend
	.size	rkvenc_free_session, .-rkvenc_free_session
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_free_task, %function
rkvenc_free_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r1
	bl	mpp_task_finalize
	mov	r0, r4
	bl	rkvenc_invalid_class_msg
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	rkvenc_free_task, .-rkvenc_free_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_result, %function
rkvenc_result:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, r0
	ldr	r6, .L173
	mov	r4, r1
	ldr	r3, [r6]
	mov	r10, r6
	tst	r3, #32
	beq	.L143
	movw	r2, #1747
	ldr	r1, .L173+4
	ldr	r0, .L173+8
	bl	printk
.L143:
	ldr	r3, [r7, #272]
	cmp	r3, #1
	beq	.L144
	cbz	r3, .L145
	cmp	r3, #2
	bne	.L146
.L145:
	ldr	r3, [r4, #2200]
	lsls	r3, r3, #25
	bpl	.L146
	mov	r0, #-1
	b	.L142
.L144:
	ldr	r8, .L173+20
	mov	r5, r4
	mov	r9, #0
.L147:
	ldr	r3, [r4, #3252]
	cmp	r3, r9
	bhi	.L158
.L146:
	ldr	r0, [r10]
	ands	r0, r0, #32
	beq	.L142
	movw	r2, #1778
	ldr	r1, .L173+4
	ldr	r0, .L173+12
	bl	printk
	movs	r0, #0
	b	.L142
.L158:
	ldr	r3, [r4, #2324]
	movs	r2, #0
	ldr	r1, [r7, #268]
	ldr	ip, [r5, #3268]
	ldr	r0, [r3, #24]
.L149:
	cmp	r0, r2
	beq	.L161
	ldr	lr, [r3, #28]
	cmp	ip, lr
	bcc	.L150
	ldr	r6, [r3, #32]
	cmp	ip, r6
	bcs	.L150
	add	r2, r1, r2, lsl #2
	ldr	r3, [r4, #3576]
	ldr	r1, [r2, #12]
	ldr	r3, [r3, #40]
	sub	r1, r1, lr
	add	r1, r1, ip
	adds	r1, r3, r1
	bne	.L172
.L161:
	mvn	r0, #21
	b	.L142
.L150:
	adds	r2, r2, #1
	adds	r3, r3, #20
	b	.L149
.L172:
	ldr	r3, [r4]
	ldr	r0, [r5, #3272]
	ldr	r2, [r5, #3264]
	ldr	r3, [r3, #200]
	cbnz	r3, .L153
	cmp	r2, #0
	bge	.L154
.L156:
	movw	r2, #1767
	ldr	r1, .L173+4
	ldr	r0, .L173+16
	bl	printk
	mvn	r0, #4
.L142:
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L154:
	mov	r3, sp
	and	r3, r3, r8
	ldr	r3, [r3, #8]
	.syntax unified
@ 177 "./include/linux/uaccess.h" 1
	.syntax unified
adds ip, r0, r2; sbcscc ip, ip, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L155
	bl	arm_copy_to_user
	mov	r2, r0
.L155:
	cmp	r2, #0
	bne	.L156
.L157:
	add	r9, r9, #1
	adds	r5, r5, #20
	b	.L147
.L153:
	bl	memcpy
	b	.L157
.L174:
	.align	2
.L173:
	.word	mpp_dev_debug
	.word	.LANCHOR0+42
	.word	.LC7
	.word	.LC8
	.word	.LC32
	.word	-8192
	.fnend
	.size	rkvenc_result, .-rkvenc_result
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_show_session_info, %function
rkvenc_show_session_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r5, [r0, #64]
	ldr	r0, [r5, #104]
	add	r0, r0, #700
	bl	mutex_lock
	ldr	r3, [r5, #104]
	ldr	r0, [r3, #712]
	ldr	r4, [r0], #-176
	subs	r4, r4, #176
.L176:
	ldr	r2, [r5, #104]
	add	r3, r0, #176
	add	r1, r2, #712
	cmp	r3, r1
	bne	.L178
	add	r0, r2, #700
	bl	mutex_unlock
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L178:
	ldr	r3, [r0]
	cmp	r3, #16
	bne	.L177
	ldr	r3, [r0, #184]
	cbz	r3, .L177
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #60]
	cbz	r3, .L177
	mov	r1, r6
	blx	r3
.L177:
	ldr	r3, [r4, #176]
	mov	r0, r4
	sub	r4, r3, #176
	b	.L176
	.fnend
	.size	rkvenc_show_session_info, .-rkvenc_show_session_info
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_link_fill_table, %function
rkvenc_link_fill_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r7, r2
	ldr	r4, [r2, #40]
	mov	r8, r0
	ldr	r3, [r1]
	mov	r5, r1
	ldr	fp, [r1, #2324]
	mov	r10, r1
	mov	r9, #0
	str	r3, [sp]
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r6, fp
	orr	r3, r3, #4
	strb	r3, [r4]
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	ldr	r2, [r1, #2340]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #4]
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	ldr	r2, [r1, #2352]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #8]
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	ldr	r2, [r1, #2364]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #12]
	ldrb	r3, [r4, #16]	@ zero_extendqisi2
	ldr	r2, [r1, #2376]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #16]
	ldrb	r3, [r4, #20]	@ zero_extendqisi2
	ldr	r2, [r1, #2388]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #20]
	ldrb	r3, [r4, #24]	@ zero_extendqisi2
	ldr	r2, [r1, #2400]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #24]
	ldrb	r3, [r4, #28]	@ zero_extendqisi2
	ldr	r2, [r1, #2412]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #28]
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r4, #32]
	add	r3, r0, #12
	str	r3, [sp, #4]
.L186:
	ldr	r2, [fp, #24]
	cmp	r2, r9
	bhi	.L190
	ldr	r0, [r8, #40]
	movs	r1, #0
	ldr	r2, [fp, #184]
	bic	r0, r0, #3
	add	r0, r0, r4
	bl	memset
	ldr	r3, [r5, #2332]
	ldr	r3, [r3, #96]
	cbz	r3, .L191
	ldr	r2, [r8]
	ldr	r1, [sp]
	str	r3, [r1, #16]
	ldr	r0, [r2, #244]
	bl	rk_dvbm_link
.L191:
	ldr	r0, [r8]
	movs	r3, #2
	ldrd	r1, r2, [r7, #32]
	ldr	r0, [r0]
	bl	dma_sync_single_for_device
	ldr	r0, [r8]
	movs	r3, #2
	ldrd	r1, r2, [r7, #32]
	ldr	r0, [r0]
	bl	dma_sync_single_for_cpu
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L190:
	ldr	r2, [r6, #44]
	cbz	r2, .L187
	ldr	r2, [r10, #2328]
	cbz	r2, .L187
	ldr	r3, [sp, #4]
	ldr	r2, [r6, #40]
	ldr	r1, [r6, #36]
	ldr	r0, [r3, r9, lsl #2]
	ldr	r3, [r6, #28]
	cmp	r1, #0
	it	eq
	moveq	r1, r3
	cbnz	r2, .L189
	ldr	r2, [r6, #32]
.L189:
	rsb	ip, r1, #4
	subs	r1, r1, r3
	ldr	r3, [r10, #2332]
	bic	r0, r0, #3
	bic	r1, r1, #3
	add	r2, r2, ip
	add	r1, r1, r3
	add	r0, r0, r4
	bl	memcpy
.L187:
	add	r9, r9, #1
	adds	r6, r6, #20
	add	r10, r10, #12
	b	.L186
	.fnend
	.size	rkvenc_link_fill_table, .-rkvenc_link_fill_table
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_prepare, %function
rkvenc_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r6, r0
	ldr	r7, .L236
	mov	r5, r1
	ldr	r4, [r0, #96]
	ldr	r3, [r7]
	lsls	r2, r3, #26
	bpl	.L203
	movw	r2, #1027
	ldr	r1, .L236+4
	ldr	r0, .L236+8
	bl	printk
.L203:
	ldr	r3, [r6, #72]
	cmp	r3, #0
	ble	.L204
.L233:
	movs	r4, #0
.L205:
	ldr	r3, [r7]
	lsls	r3, r3, #26
	bpl	.L202
	movw	r2, #1095
	ldr	r1, .L236+4
	ldr	r0, .L236+12
	bl	printk
.L202:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L204:
	ldr	r3, [r5]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bgt	.L233
	ldr	r3, [r6, #272]
	cmp	r3, #1
	beq	.L207
	cbz	r3, .L208
	cmp	r3, #2
	bne	.L233
	ldr	r8, [r6, #268]
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r4, #60]!
	cmp	r2, r4
	ite	eq
	moveq	r4, r5
	movne	r4, #0
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r4, #0
	beq	.L233
	add	r9, r8, #64
	mov	r0, r9
	bl	mutex_lock
	mov	r3, r8
	ldr	r6, [r3, #56]!
	cmp	r6, r3
	beq	.L214
	cbz	r6, .L214
	mov	r2, r6
	mov	r1, r5
	mov	r0, r8
	bl	rkvenc_link_fill_table
	add	r1, r8, #48
	mov	r0, r6
	bl	list_move_tail
	str	r6, [r5, #3576]
.L235:
	mov	r4, r5
.L214:
	mov	r0, r9
	bl	mutex_unlock
	b	.L205
.L208:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r4, #60]!
	cmp	r2, r4
	it	ne
	movne	r5, #0
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L234:
	mov	r4, r5
	b	.L205
.L207:
	ldr	r8, [r6, #268]
	ldr	r6, [r5, #2200]
	ubfx	r6, r6, #12, #1
	cbz	r6, .L213
	ldr	r3, [r5, #2200]
	mov	r2, #1072
	ldr	r1, .L236+4
	ldr	r0, .L236+16
	bl	printk
	b	.L234
.L213:
	add	r9, r8, #64
	mov	r0, r9
	bl	mutex_lock
	mov	r3, r8
	ldr	r4, [r3, #56]!
	cmp	r4, r3
	beq	.L217
	cmp	r4, #0
	beq	.L214
	mov	r2, r4
	mov	r1, r5
	mov	r0, r8
	bl	rkvenc_link_fill_table
	add	r1, r8, #48
	mov	r0, r4
	bl	list_move_tail
	str	r4, [r5, #3576]
	addw	r1, r5, #2200
	movs	r0, #12
	bl	____atomic_set_bit
	b	.L235
.L217:
	mov	r4, r6
	b	.L214
.L237:
	.align	2
.L236:
	.word	mpp_dev_debug
	.word	.LANCHOR0+56
	.word	.LC7
	.word	.LC8
	.word	.LC33
	.fnend
	.size	rkvenc_prepare, .-rkvenc_prepare
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_set_freq, %function
rkvenc_set_freq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	adds	r0, r0, #136
	ldr	r1, [r1, #2920]
	bl	mpp_clk_set_rate
	ldr	r1, [r5, #2920]
	add	r0, r4, #192
	bl	mpp_clk_set_rate
	movs	r0, #0
	pop	{r3, r4, r5, pc}
	.fnend
	.size	rkvenc_set_freq, .-rkvenc_set_freq
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	clk_prepare_enable, %function
clk_prepare_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	bl	clk_prepare
	mov	r4, r0
	cbnz	r0, .L239
	mov	r0, r5
	bl	clk_enable
	mov	r4, r0
	cbz	r0, .L239
	mov	r0, r5
	bl	clk_unprepare
.L239:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
	.fnend
	.size	clk_prepare_enable, .-clk_prepare_enable
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_rkvenc_wait_result, %function
mpp_rkvenc_wait_result:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #28
	sub	sp, sp, #28
	mov	r5, r0
	mov	r7, r1
	bl	mpp_session_get_pending_task
	mov	r4, r0
	cbnz	r0, .L245
	mov	r3, r5
	movw	r2, #2050
	ldr	r1, .L257
	ldr	r0, .L257+4
	bl	printk
.L256:
	mvn	r6, #4
.L244:
	mov	r0, r6
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L245:
	ldr	r3, [r0, #2200]
	lsls	r2, r3, #28
	bmi	.L247
	ldr	r3, [r0, #2200]
	movw	r2, #2055
	ldr	r1, .L257
	str	r3, [sp]
	ldr	r3, [r0, #2276]
	ldr	r0, .L257+8
	bl	printk
	b	.L256
.L247:
	ldr	r0, [r5, #12]
	ldr	r3, [r0, #12]
	ldr	r3, [r3, #40]
	cbz	r3, .L248
	mov	r2, r7
	mov	r1, r4
	blx	r3
	mov	r6, r0
.L248:
	ldr	r3, .L257+12
	ldr	r3, [r3]
	lsls	r3, r3, #22
	bpl	.L249
	ldr	r3, [r4, #2252]
	movw	r2, #2067
	ldr	r1, .L257
	ldr	r0, .L257+16
	strd	r3, r6, [sp, #12]
	ldr	r3, [r4, #2200]
	str	r3, [sp, #8]
	ldr	r3, [r4, #2276]
	str	r3, [sp, #4]
	ldr	r3, [r5, #4]
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L249:
	mov	r1, r4
	mov	r0, r5
	bl	mpp_session_pop_pending
	b	.L244
.L258:
	.align	2
.L257:
	.word	.LANCHOR0+71
	.word	.LC34
	.word	.LC35
	.word	mpp_dev_debug
	.word	.LC36
	.fnend
	.size	mpp_rkvenc_wait_result, .-mpp_rkvenc_wait_result
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_init, %function
rkvenc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	add	r7, r0, #136
	ldr	r3, [r0, #104]
	mov	r4, r0
	ldr	r2, .L275
	mov	r1, r7
	adds	r3, r3, #172
	str	r3, [r0, #64]
	bl	mpp_get_clk_info
	cbz	r0, .L260
	movw	r2, #2231
	ldr	r1, .L275+4
	ldr	r0, .L275+8
	bl	printk
.L260:
	ldr	r2, .L275+12
	add	r1, r4, #164
	mov	r0, r4
	bl	mpp_get_clk_info
	cbz	r0, .L261
	movw	r2, #2234
	ldr	r1, .L275+4
	ldr	r0, .L275+16
	bl	printk
.L261:
	add	r6, r4, #192
	ldr	r2, .L275+20
	mov	r0, r4
	mov	r1, r6
	bl	mpp_get_clk_info
	cbz	r0, .L262
	movw	r2, #2237
	ldr	r1, .L275+4
	ldr	r0, .L275+24
	bl	printk
.L262:
	mov	r2, r4
	movs	r5, #0
	ldr	r0, [r2], #220
	movs	r3, #1
	str	r5, [sp]
	ldr	r1, .L275+28
	ldr	r0, [r0, #380]
	bl	of_property_read_variable_u32_array
	ldr	r2, .L275+32
	mov	r1, r5
	mov	r0, r7
	bl	mpp_set_clk_info_rate_hz
	ldr	r2, .L275+36
	mov	r1, r5
	mov	r0, r6
	bl	mpp_set_clk_info_rate_hz
	ldr	r2, .L275+40
	mov	r1, r5
	mov	r0, r4
	bl	mpp_reset_control_get
	str	r0, [r4, #228]
	cbnz	r0, .L263
	movw	r2, #2249
	ldr	r1, .L275+4
	ldr	r0, .L275+44
	bl	printk
.L263:
	ldr	r2, .L275+48
	movs	r1, #1
	mov	r0, r4
	bl	mpp_reset_control_get
	str	r0, [r4, #232]
	cbnz	r0, .L264
	movw	r2, #2252
	ldr	r1, .L275+4
	ldr	r0, .L275+52
	bl	printk
.L264:
	ldr	r2, .L275+56
	movs	r1, #4
	mov	r0, r4
	bl	mpp_reset_control_get
	str	r0, [r4, #236]
	cbnz	r0, .L265
	movw	r2, #2255
	ldr	r1, .L275+4
	ldr	r0, .L275+60
	bl	printk
.L265:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L276:
	.align	2
.L275:
	.word	.LC37
	.word	.LANCHOR0+94
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	300000000
	.word	600000000
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.fnend
	.size	rkvenc_init, .-rkvenc_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_add.constprop.15, %function
atomic_add.constprop.15:
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
	.size	atomic_add.constprop.15, .-atomic_add.constprop.15
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_shutdown, %function
rkvenc_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	add	r4, r0, #16
	ldr	r5, [r0, #80]
	ldr	r1, .L289
	mov	r0, r4
	bl	_dev_info
	ldr	r0, [r5, #104]
	adds	r0, r0, #84
	bl	atomic_add.constprop.15
	bl	ktime_get
	ldr	r3, .L289+4
	adds	r6, r0, r3
	mov	r3, #0
	adc	r7, r1, r3
.L284:
	ldr	r3, [r5, #80]
	cbz	r3, .L280
	bl	ktime_get
	cmp	r6, r0
	sbcs	r3, r7, r1
	bge	.L281
	ldr	r3, [r5, #80]
	cbz	r3, .L280
	ldr	r1, .L289+8
	mov	r0, r4
	bl	_dev_err
.L280:
	mov	r0, r4
	ldr	r1, .L289+12
	pop	{r3, r4, r5, r6, r7, lr}
	b	_dev_info
.L281:
	mov	r1, #1000
	movs	r0, #251
	bl	usleep_range
	b	.L284
.L290:
	.align	2
.L289:
	.word	.LC50
	.word	200000000
	.word	.LC51
	.word	.LC52
	.fnend
	.size	rkvenc_shutdown, .-rkvenc_shutdown
	.text
	.align	1
	.global	mpp_rkvenc_irq
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_rkvenc_irq, %function
mpp_rkvenc_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r4, r1
	ldr	r0, [r1, #96]
	ldr	r6, [r1, #132]
	bl	mpp_taskqueue_get_running_task
	ldr	r7, .L343
	ldr	r3, [r7]
	lsls	r2, r3, #26
	mov	r5, r0
	bpl	.L292
	movw	r2, #1364
	ldr	r1, .L343+4
	ldr	r0, .L343+8
	bl	printk
.L292:
	ldr	r1, [r6, #264]
	mov	r0, r4
	bl	mpp_read
	str	r0, [r4, #52]
	cbz	r0, .L291
	mov	r2, #256
	ldr	r1, [r6, #256]
	mov	r0, r4
	bl	mpp_write
	ldr	r2, [r4, #52]
	ldr	r1, [r6, #260]
	mov	r0, r4
	bl	mpp_write
	movs	r2, #0
	ldr	r1, [r6, #264]
	mov	r0, r4
	bl	mpp_write
	ldr	r3, [r4, #52]
	cmp	r3, #32768
	bne	.L294
.L342:
	movs	r0, #1
.L291:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L294:
	mov	r0, r4
	bl	rkvenc_check_bs_overflow
	cmp	r0, #0
	bne	.L342
	cbnz	r5, .L296
	ldr	r1, .L343+12
	ldr	r0, [r4]
	bl	_dev_err
	b	.L342
.L296:
	ldr	r8, [r5]
	addw	r9, r5, #2200
	ldr	r6, [r8, #184]
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #2200]
	orr	r1, r3, #8
	str	r1, [r5, #2200]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	lsls	r3, r3, #28
	bpl	.L297
	ldr	r3, [r5, #2200]
	mov	r2, #1392
	ldr	r1, .L343+4
	ldr	r0, .L343+16
	str	r3, [sp]
	ldr	r3, [r5, #2276]
	bl	printk
	b	.L342
.L297:
	add	r0, r5, #2208
	bl	cancel_delayed_work
	mov	r1, r9
	movs	r0, #4
	bl	____atomic_set_bit
	movs	r1, #24
	mov	r0, r4
	bl	mpp_read
	ubfx	r0, r0, #0, #14
	str	r0, [r4, #252]
	mov	r0, r4
	bl	rkvenc_clear_dvbm_info
	ldr	r3, [r6, #16]
	cbz	r3, .L299
	ldr	r2, [r4, #252]
	movw	r3, #16383
	cmp	r2, r3
	bne	.L300
	ldr	r3, [r7]
	movs	r2, #1
	str	r2, [r4, #248]
	lsls	r0, r3, #13
	bmi	.L301
.L302:
	ldr	r3, [r4, #52]
	orr	r3, r3, #64
	str	r3, [r4, #52]
	movs	r3, #0
	str	r3, [r4, #248]
	ldr	r3, [r6, #204]
	adds	r3, r3, #1
	str	r3, [r6, #204]
.L299:
	ldr	r3, [r4, #56]
	cbz	r3, .L304
	ldr	r3, [r6, #208]
	adds	r3, r3, #1
	str	r3, [r6, #208]
.L304:
	ldrd	r3, r2, [r4, #52]
	orrs	r3, r3, r2
	ldr	r2, [r7]
	str	r3, [r5, #2924]
	lsls	r1, r2, #29
	bpl	.L305
	str	r3, [sp]
	ldr	r0, .L343+20
	ldr	r3, [r6, #16]
	ldr	r2, [r5, #2320]
	ldr	r1, [r5, #2276]
	bl	printk
.L305:
	mov	r0, r5
	bl	mpp_time_diff
	mov	r1, r9
	movs	r0, #7
	bl	____atomic_set_bit
	mov	r1, r5
	ldr	r0, [r4, #96]
	bl	mpp_taskqueue_pop_running
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	cbz	r3, .L306
	mov	r1, r5
	mov	r0, r4
	blx	r3
.L306:
	ldr	r3, [r4, #132]
	ldr	r2, [r3, #272]
	ldr	r3, [r4, #52]
	tst	r2, r3
	beq	.L308
	ldr	r3, [r7]
	lsls	r2, r3, #13
	bpl	.L309
	ldr	r3, [r5, #2924]
	ldr	r0, .L343+20
	str	r3, [sp]
	ldr	r3, [r6, #16]
	ldr	r2, [r5, #2320]
	ldr	r1, [r5, #2276]
	bl	printk
.L309:
	ldr	r3, [r5, #2924]
	str	r3, [r6, #232]
	ldr	r3, [r6, #228]
	adds	r3, r3, #1
	str	r3, [r6, #228]
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #28]
	cbz	r3, .L308
	mov	r0, r4
	blx	r3
.L308:
	movs	r3, #0
	mov	r0, r4
	str	r3, [r6, #200]
	str	r3, [r4, #56]
	bl	mpp_taskqueue_trigger_work
	ldr	r3, [r8, #240]
	cbz	r3, .L311
	ldr	r2, [r5, #2308]
	cbz	r2, .L311
	ldr	r0, [r8, #196]
	blx	r3
.L311:
	ldr	r3, [r7]
	lsls	r3, r3, #26
	bpl	.L342
	movw	r2, #1445
	ldr	r1, .L343+4
	ldr	r0, .L343+24
	bl	printk
	b	.L342
.L301:
	ldr	r0, .L343+28
	bl	printk
.L300:
	ldr	r3, [r4, #248]
	cmp	r3, #0
	beq	.L299
	b	.L302
.L344:
	.align	2
.L343:
	.word	mpp_dev_debug
	.word	.LANCHOR0+106
	.word	.LC7
	.word	.LC53
	.word	.LC54
	.word	.LC56
	.word	.LC8
	.word	.LC55
	.fnend
	.size	mpp_rkvenc_irq, .-mpp_rkvenc_irq
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_control, %function
rkvenc_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r2, #1027
	ldr	r3, [r1]
	.pad #24
	sub	sp, sp, #24
	mov	r7, r1
	cmp	r3, r2
	beq	.L346
	movw	r2, #1028
	cmp	r3, r2
	beq	.L347
	movw	r2, #1854
	ldr	r1, .L372
	ldr	r0, .L372+4
	bl	printk
	b	.L371
.L346:
	cbz	r0, .L349
	ldr	r6, [r0, #184]
	cbnz	r6, .L350
.L349:
	movw	r2, #1826
	ldr	r1, .L372
	ldr	r0, .L372+8
	bl	printk
	mvn	r0, #21
.L345:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L350:
	ldr	r4, [r1, #8]
	ldr	r3, .L372+12
	lsrs	r4, r4, #4
	cmp	r4, #11
	ldr	r3, [r3]
	it	ge
	movge	r4, #11
	lsls	r2, r3, #27
	bpl	.L352
	mov	r1, r4
	ldr	r0, .L372+16
	bl	printk
.L352:
	ldr	r9, .L372+24
	movs	r5, #0
	ldr	r8, .L372
	ldr	r10, .L372+28
.L353:
	cmp	r4, r5
	bne	.L358
.L371:
	movs	r0, #0
	b	.L345
.L358:
	ldr	r1, [r7, #16]
	mov	r3, sp
	and	r3, r3, r9
	add	r1, r1, r5, lsl #4
	ldr	r3, [r3, #8]
	.syntax unified
@ 157 "./include/linux/uaccess.h" 1
	.syntax unified
adds r2, r1, #16; sbcscc r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r2, #16
	cbnz	r3, .L354
	add	r0, sp, #8
	bl	arm_copy_from_user
	mov	r2, r0
	cmp	r0, #0
	beq	.L355
.L354:
	rsb	r0, r2, #16
	add	r3, sp, #8
	movs	r1, #0
	add	r0, r0, r3
	bl	memset
	movw	r2, #1836
	mov	r1, r8
	mov	r0, r10
	bl	printk
.L356:
	adds	r5, r5, #1
	b	.L353
.L362:
	subs	r1, r2, #1
	cmp	r1, #1
	bhi	.L357
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r3, #11
	sbc	r1, r3, r3
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r3, r3, r1
	str	r3, [sp, #8]
	add	r1, r6, r3, lsl #4
	str	r2, [r1, #24]
	ldrd	r2, [sp, #16]
	strd	r2, [r1, #32]
	b	.L356
.L347:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r4, r0
	ldr	r9, .L372+32
	ldr	r6, [r4, #20]!
	mov	r10, #1
	ldr	r5, [r6], #-4
	subs	r5, r5, #4
.L359:
	adds	r3, r6, #4
	cmp	r3, r4
	bne	.L361
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L371
.L361:
	ldr	r3, [r6, #2200]
	lsls	r3, r3, #30
	bmi	.L360
	ldr	r1, [r6, #2276]
	mov	r0, r9
	bl	printk
	str	r10, [r6, #2312]
.L360:
	ldr	r3, [r5, #4]
	mov	r6, r5
	subs	r5, r3, #4
	b	.L359
.L355:
	ldrd	r3, r2, [sp, #8]
	subs	r1, r3, #1
	cmp	r1, #9
	bls	.L362
.L357:
	str	r2, [sp]
	mov	r1, r8
	movw	r2, #1846
	ldr	r0, .L372+20
	bl	printk
	b	.L356
.L373:
	.align	2
.L372:
	.word	.LANCHOR0+121
	.word	.LC62
	.word	.LC57
	.word	mpp_dev_debug
	.word	.LC58
	.word	.LC60
	.word	-8192
	.word	.LC59
	.word	.LC61
	.fnend
	.size	rkvenc_control, .-rkvenc_control
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_init_session, %function
rkvenc_init_session:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	cbnz	r0, .L375
	movw	r2, #1903
	ldr	r1, .L397
	ldr	r0, .L397+4
	bl	printk
	mvn	r0, #21
.L374:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L375:
	ldr	r5, .L397+8
	mov	r1, #3520
	ldr	r8, [r0, #12]
	ldr	r0, [r5, #32]
	bl	kmem_cache_alloc
	mov	r6, r0
	cbnz	r0, .L377
.L396:
	mvn	r0, #11
	b	.L374
.L377:
	ldr	r2, .L397+12
	add	r7, r4, #196
	ldr	r1, .L397+16
	bl	__init_rwsem
	str	r6, [r4, #184]
	add	r6, r4, #188
.L382:
	mov	r1, #3520
	ldr	r0, [r5, #48]
	bl	kmem_cache_alloc
	cbz	r0, .L378
	ldr	r3, [r8, #4]
	mov	ip, r0
	mov	lr, #0
	ldr	r9, [r3, #4]
	mov	r2, r9
	str	r9, [r0, #2324]
.L379:
	ldr	r3, [r9, #24]
	cmp	r3, lr
	bhi	.L381
	str	r0, [r6], #4
	cmp	r6, r7
	bne	.L382
	movs	r0, #0
	b	.L374
.L381:
	ldr	r3, [ip, #2332]
	cbnz	r3, .L380
	ldr	r3, [r2, #32]
	ldr	r1, [r2, #28]
	adds	r3, r3, #4
	subs	r1, r3, r1
	str	r1, [ip, #2336]
.L380:
	add	lr, lr, #1
	adds	r2, r2, #20
	add	ip, ip, #12
	b	.L379
.L378:
	ldr	r0, [r4, #184]
	cbz	r0, .L383
	bl	kfree
.L383:
	ldr	r5, [r4, #188]
	cbz	r5, .L384
	mov	r0, r5
	bl	rkvenc_invalid_class_msg
	mov	r0, r5
	bl	kfree
.L384:
	ldr	r4, [r4, #192]
	cmp	r4, #0
	beq	.L396
	mov	r0, r4
	bl	rkvenc_invalid_class_msg
	mov	r0, r4
	bl	kfree
	b	.L396
.L398:
	.align	2
.L397:
	.word	.LANCHOR0+136
	.word	.LC63
	.word	kmalloc_caches
	.word	.LANCHOR1
	.word	.LC64
	.fnend
	.size	rkvenc_init_session, .-rkvenc_init_session
	.section	.text.unlikely
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_link_remove.constprop.3, %function
rkvenc_link_remove.constprop.3:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r5, .L414
	ldr	r3, [r5]
	lsls	r2, r3, #26
	bpl	.L400
	movw	r2, #2357
	ldr	r1, .L414+4
	ldr	r0, .L414+8
	bl	printk
	cbz	r4, .L401
.L408:
	add	r8, r4, #64
	mov	r6, r4
	mov	r0, r8
	bl	mutex_lock
	ldr	r0, [r6, #48]!
	ldr	r7, [r0]
.L402:
	cmp	r0, r6
	bne	.L403
	mov	r6, r4
	ldr	r0, [r6, #56]!
	ldr	r7, [r0]
.L404:
	cmp	r0, r6
	bne	.L405
	mov	r0, r8
	bl	mutex_unlock
	movs	r3, #0
	str	r3, [r4, #4]
.L401:
	ldr	r3, [r5]
	lsls	r3, r3, #26
	bpl	.L413
	movw	r2, #2375
	ldr	r1, .L414+4
	ldr	r0, .L414+12
	bl	printk
.L413:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L403:
	ldrd	r2, r3, [r0]
	str	r3, [r2, #4]
	str	r2, [r3]
	str	r0, [r0]
	str	r0, [r0, #4]
	bl	mpp_dma_free
	mov	r0, r7
	ldr	r7, [r7]
	b	.L402
.L405:
	ldrd	r2, r3, [r0]
	str	r3, [r2, #4]
	str	r2, [r3]
	str	r0, [r0]
	str	r0, [r0, #4]
	bl	mpp_dma_free
	mov	r0, r7
	ldr	r7, [r7]
	b	.L404
.L400:
	cmp	r0, #0
	bne	.L408
	b	.L413
.L415:
	.align	2
.L414:
	.word	mpp_dev_debug
	.word	.LANCHOR0+156
	.word	.LC7
	.word	.LC8
	.fnend
	.size	rkvenc_link_remove.constprop.3, .-rkvenc_link_remove.constprop.3
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_remove, %function
rkvenc_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	adds	r0, r0, #16
	ldr	r4, [r0, #64]
	ldr	r1, .L425
	bl	_dev_info
	ldr	r0, [r4, #244]
	cbz	r0, .L417
	bl	rk_dvbm_put
	movs	r3, #0
	str	r3, [r4, #244]
.L417:
	mov	r0, r4
	bl	mpp_dev_remove
	ldr	r0, [r4, #224]
	cbz	r0, .L418
	bl	proc_remove
	movs	r3, #0
	str	r3, [r4, #224]
.L418:
	ldr	r0, [r4, #268]
	bl	rkvenc_link_remove.constprop.3
	movs	r0, #0
	pop	{r4, pc}
.L426:
	.align	2
.L425:
	.word	.LC65
	.fnend
	.size	rkvenc_remove, .-rkvenc_remove
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_clk_on, %function
rkvenc_clk_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #136]
	cbz	r0, .L428
	bl	clk_prepare_enable
.L428:
	ldr	r0, [r4, #164]
	cbz	r0, .L429
	bl	clk_prepare_enable
.L429:
	ldr	r0, [r4, #192]
	cbz	r0, .L430
	bl	clk_prepare_enable
.L430:
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	rkvenc_clk_on, .-rkvenc_clk_on
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_clk_off, %function
rkvenc_clk_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, [r0, #136]
	mov	r0, r5
	bl	clk_disable
	mov	r0, r5
	bl	clk_unprepare
	ldr	r5, [r4, #164]
	mov	r0, r5
	bl	clk_disable
	mov	r0, r5
	bl	clk_unprepare
	ldr	r4, [r4, #192]
	mov	r0, r4
	bl	clk_disable
	mov	r0, r4
	bl	clk_unprepare
	movs	r0, #0
	pop	{r3, r4, r5, pc}
	.fnend
	.size	rkvenc_clk_off, .-rkvenc_clk_off
	.section	.text.unlikely
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_probe, %function
rkvenc_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r7, r0, #16
	ldr	r6, .L514
	.pad #84
	sub	sp, sp, #84
	ldr	r1, .L514+4
	mov	r5, r0
	mov	r0, r7
	ldr	r3, [r6]
	str	r3, [sp, #76]
	bl	_dev_info
	mov	r2, #3520
	mov	r1, #292
	mov	r0, r7
	bl	devm_kmalloc
	mov	r4, r0
	str	r6, [sp, #28]
	cmp	r0, #0
	beq	.L470
	ldr	r1, [r5, #396]
	str	r0, [r5, #80]
	cbz	r1, .L443
	ldr	r0, .L514+8
	bl	of_match_node
	cbz	r0, .L444
	ldr	r3, [r0, #192]
	str	r3, [r4, #4]
.L443:
	mov	r1, r5
	mov	r0, r4
	bl	mpp_dev_probe
	mov	r9, r0
	cbnz	r0, .L442
	add	r3, r4, #16
	movs	r2, #20
	mov	r1, r0
	mov	r0, r3
	bl	memset
	ldr	r3, .L514+12
	ldr	r2, .L514+16
	str	r3, [r4, #24]
	ldr	r3, [r4, #12]
	str	r0, [r4, #16]
	str	r0, [r4, #20]
	str	r2, [r3, #4]
	ldr	r3, [r5, #60]
	cbnz	r3, .L445
	ldr	r3, [r5, #16]
.L445:
	strd	r3, r4, [sp, #4]
	mov	r0, r7
	movs	r3, #128
	ldr	r2, .L514+20
	str	r3, [sp]
	movs	r3, #0
	ldr	r1, [r4, #48]
	bl	devm_request_threaded_irq
	mov	r9, r0
	cbz	r0, .L446
	mov	r0, r7
	ldr	r1, .L514+24
	bl	_dev_err
	mov	r0, r4
	bl	mpp_dev_remove
	b	.L442
.L444:
	ldr	r1, .L514+28
	mov	r0, r7
	bl	_dev_err
	mvn	r9, #18
.L442:
	mov	r0, r7
	ldr	r1, .L514+32
	bl	_dev_info
	mov	r0, r9
	ldr	r3, [sp, #28]
	ldr	r2, [sp, #76]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L469
	bl	__stack_chk_fail
.L446:
	movs	r3, #40
	str	r3, [r4, #92]
	ldr	r3, [r4, #4]
	ldr	r3, [r3, #4]
	str	r3, [r4, #132]
	ldr	r3, [r4]
	cbz	r3, .L447
	ldr	r3, [r3, #380]
	cbz	r3, .L447
	ldr	r3, [r3]
	cbz	r3, .L447
	ldr	r2, [r4, #104]
	cbz	r2, .L447
	ldr	r2, [r2, #76]
	cbz	r2, .L447
	ldr	r2, [r4, #116]
	movs	r1, #31
	add	r0, sp, #44
	str	r2, [sp]
	ldr	r2, .L514+36
	bl	snprintf
	ldr	r3, [r4, #104]
	ldr	r1, [r3, #76]
	add	r0, sp, #44
	bl	proc_mkdir
	mov	r2, r0
	str	r0, [r4, #224]
	cbz	r0, .L448
	cmn	r0, #4096
	bls	.L449
.L448:
	movw	r2, #2182
	ldr	r1, .L514+40
	ldr	r0, .L514+44
	bl	printk
	movs	r3, #0
	str	r3, [r4, #224]
.L447:
	ldr	r1, [r4, #104]
	mov	r0, r4
	bl	mpp_dev_register_srv
	movs	r2, #0
	ldr	r1, .L514+48
	ldr	r0, [r5, #396]
	bl	of_parse_phandle
	mov	r6, r0
	cmp	r0, #0
	bne	.L450
.L452:
	movw	r2, #2549
	ldr	r1, .L514+52
	ldr	r0, .L514+56
	bl	printk
.L451:
	movs	r3, #0
	str	r3, [r4, #272]
	ldr	r3, .L514+60
	ldr	r6, [r5, #396]
	ldr	r2, [r3]
	mov	r10, r3
	tst	r2, #32
	beq	.L453
	movw	r2, #2460
	ldr	r1, .L514+64
	ldr	r0, .L514+68
	bl	printk
.L453:
	movs	r5, #0
	movs	r3, #1
	str	r5, [sp]
	add	r2, r4, #264
	ldr	r1, .L514+72
	mov	r0, r6
	bl	of_property_read_variable_u32_array
	cmp	r0, r5
	bge	.L454
	str	r5, [r4, #272]
.L455:
	movs	r3, #1
	str	r3, [r4, #280]
	b	.L442
.L449:
	add	r3, r4, #140
	mov	r1, #420
	ldr	r0, .L514+76
	bl	mpp_procfs_create_u32
	add	r3, r4, #196
	ldr	r2, [r4, #224]
	mov	r1, #420
	ldr	r0, .L514+80
	bl	mpp_procfs_create_u32
	add	r3, r4, #92
	ldr	r2, [r4, #224]
	mov	r1, #420
	ldr	r0, .L514+84
	bl	mpp_procfs_create_u32
	add	r3, r4, #120
	ldr	r2, [r4, #224]
	mov	r1, #420
	ldr	r0, .L514+88
	bl	mpp_procfs_create_u32
	ldr	r3, .L514+92
	mov	r1, #292
	ldr	r0, .L514+96
	str	r4, [sp]
	ldr	r2, [r4, #224]
	bl	proc_create_single_data
	add	r3, r4, #272
	ldr	r2, [r4, #224]
	mov	r1, #420
	ldr	r0, .L514+100
	bl	mpp_procfs_create_u32
	b	.L447
.L450:
	bl	of_device_is_available
	cmp	r0, #0
	beq	.L452
	mov	r0, r6
	bl	of_find_device_by_node
	movs	r1, #1
	bl	rk_dvbm_get_port
	str	r0, [r4, #244]
	cmp	r0, #0
	beq	.L451
	ldr	r3, .L514+104
	add	r1, sp, #32
	strd	r3, r4, [sp, #32]
	bl	rk_dvbm_set_cb
	b	.L451
.L515:
	.align	2
.L514:
	.word	__stack_chk_guard
	.word	.LC66
	.word	.LANCHOR0+176
	.word	mpp_rkvenc_worker
	.word	mpp_rkvenc_wait_result
	.word	mpp_rkvenc_irq
	.word	.LC68
	.word	.LC67
	.word	.LC82
	.word	.LC69
	.word	.LANCHOR0+568
	.word	.LC70
	.word	.LC76
	.word	.LANCHOR0+587
	.word	.LC77
	.word	mpp_dev_debug
	.word	.LANCHOR0+608
	.word	.LC7
	.word	.LC78
	.word	.LC71
	.word	.LC41
	.word	.LC72
	.word	.LC73
	.word	rkvenc_show_session_info
	.word	.LC74
	.word	.LC75
	.word	rkvenc_callback
.L454:
	ldr	r2, [r4, #264]
	movs	r3, #1
	cmp	r2, #1
	bls	.L456
	str	r3, [r4, #272]
	mov	r0, r7
	ldr	r1, .L516
	bl	_dev_info
.L457:
	mov	r2, #3520
	movs	r1, #76
	mov	r0, r7
	bl	devm_kmalloc
	mov	r5, r0
	cmp	r0, #0
	beq	.L455
	add	fp, r0, #64
	movs	r3, #0
	ldr	r1, .L516+4
	str	r3, [r4, #276]
	mov	r0, fp
	ldr	r2, .L516+8
	bl	__mutex_init
	add	r3, r5, #48
	str	r3, [r5, #48]
	str	r3, [r5, #52]
	add	r3, r5, #56
	str	r3, [r5, #56]
	str	r3, [r5, #60]
	ldr	r6, [r4, #132]
	str	r3, [sp, #20]
	ldr	r3, [r10]
	lsls	r1, r3, #26
	bpl	.L459
	movw	r2, #2391
	ldr	r1, .L516+12
	ldr	r0, .L516+16
	bl	printk
.L459:
	add	r3, r5, #12
	movs	r1, #0
	movs	r2, #36
	mov	r8, #128
	mov	r0, r3
	bl	memset
	movs	r1, #0
	mov	r3, r0
	mov	r0, r6
.L460:
	ldr	r2, [r6, #24]
	cmp	r1, r2
	bcc	.L462
	ldr	r3, [r4, #264]
	str	r3, [r5, #4]
	movs	r3, #0
.L513:
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	ldr	r3, [r5, #4]
	cmp	r2, r3
	bcc	.L466
	mov	r0, fp
	bl	mutex_lock
	ldrd	r1, r3, [r5, #56]
	mov	r0, fp
	ldr	r3, [r3, #40]
	ldrb	r2, [r3, #32]	@ zero_extendqisi2
	orr	r2, r2, #1
	strb	r2, [r3, #32]
	ldr	r2, [r1, #32]
	str	r2, [r3, #32]
	bl	mutex_unlock
	ldr	r3, [r10]
	lsls	r2, r3, #26
	bpl	.L467
	movw	r2, #2443
	ldr	r1, .L516+12
	ldr	r0, .L516+20
	bl	printk
.L467:
	ldr	r3, [r10]
	str	r5, [r4, #268]
	lsls	r3, r3, #26
	str	r4, [r5]
	bpl	.L455
	movw	r2, #2493
	ldr	r1, .L516+24
	ldr	r0, .L516+20
	bl	printk
	b	.L455
.L456:
	str	r3, [r4, #264]
	movs	r3, #2
	str	r3, [r4, #272]
	b	.L457
.L462:
	ldr	r2, [r0, #44]
	cbz	r2, .L461
	str	r8, [r3, r1, lsl #2]
	ldr	r2, [r0, #44]
	adds	r2, r2, #127
	bic	r2, r2, #127
	add	r8, r8, r2
.L461:
	adds	r1, r1, #1
	adds	r0, r0, #20
	b	.L460
.L466:
	mov	r1, r8
	ldr	r0, [r4]
	bl	mpp_dma_alloc
	mov	r6, r0
	cbnz	r0, .L464
	ldr	r0, [r4]
	ldr	r1, .L516+28
	bl	_dev_err
	mov	r0, r5
	bl	rkvenc_link_remove.constprop.3
	b	.L455
.L464:
	ldr	r3, [r0, #40]
	ldr	r2, [r0, #32]
	ldr	r1, [r5, #16]
	add	r2, r2, r1
	str	r2, [r3, #4]
	ldr	r2, [r0, #32]
	ldr	r1, [r5, #20]
	add	r2, r2, r1
	str	r2, [r3, #8]
	ldr	r2, [r0, #32]
	ldr	r1, [r5, #24]
	add	r2, r2, r1
	str	r2, [r3, #12]
	ldr	r2, [r0, #32]
	ldr	r1, [r5, #28]
	add	r2, r2, r1
	str	r2, [r3, #16]
	ldr	r2, [r0, #32]
	ldr	r1, [r5, #32]
	add	r2, r2, r1
	str	r2, [r3, #20]
	ldr	r2, [r0, #32]
	ldr	r1, [r5, #36]
	add	r2, r2, r1
	str	r2, [r3, #24]
	ldr	r2, [r0, #32]
	ldr	r1, [r5, #40]
	add	r2, r2, r1
	str	r2, [r3, #28]
	str	r0, [r6]
	str	r0, [r6, #4]
	mov	r0, fp
	bl	mutex_lock
	ldr	r3, [r5, #56]
	ldr	r2, [sp, #20]
	cmp	r2, r3
	beq	.L465
	ldr	r3, [r5, #60]
	ldr	r3, [r3, #40]
	ldrb	r2, [r3, #32]	@ zero_extendqisi2
	orr	r2, r2, #1
	strb	r2, [r3, #32]
	ldr	r2, [r6, #32]
	str	r2, [r3, #32]
.L465:
	ldr	r3, [r5, #60]
	mov	r0, fp
	ldr	r2, [sp, #20]
	str	r6, [r5, #60]
	strd	r2, r3, [r6]
	str	r6, [r3]
	bl	mutex_unlock
	ldr	r3, [sp, #24]
	adds	r3, r3, #1
	b	.L513
.L470:
	mvn	r9, #11
	b	.L442
.L469:
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L517:
	.align	2
.L516:
	.word	.LC79
	.word	.LC80
	.word	.LANCHOR1
	.word	.LANCHOR0+625
	.word	.LC7
	.word	.LC8
	.word	.LANCHOR0+608
	.word	.LC81
	.fnend
	.size	rkvenc_probe, .-rkvenc_probe
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_alloc_task, %function
rkvenc_alloc_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r6, .L572
	mov	r7, r0
	str	r1, [sp, #8]
	ldr	r8, [r0, #12]
	ldr	r3, [r6]
	lsls	r4, r3, #26
	bpl	.L519
	movw	r2, #890
	ldr	r1, .L572+4
	ldr	r0, .L572+8
	bl	printk
.L519:
	ldr	r4, [r7, #188]
	ldr	r3, [r4, #2200]
	cbz	r3, .L520
	ldr	r4, [r7, #192]
.L520:
	cmp	r4, #0
	beq	.L544
	add	r2, r4, #108
	mov	r3, r4
	movs	r5, #0
.L522:
	str	r5, [r3, #2328]
	adds	r3, r3, #12
	cmp	r3, r2
	bne	.L522
	str	r5, [r4, #2924]
	mov	r1, r4
	str	r5, [r4, #2928]
	mov	r0, r7
	str	r5, [r4, #3252]
	str	r4, [sp, #4]
	bl	mpp_task_init
	ldr	r3, [r8, #4]
	ldr	r9, [r3, #4]
	movs	r3, #1
	str	r3, [r4, #2308]
	ldr	r3, [r6]
	str	r9, [r4, #2272]
	lsls	r0, r3, #26
	str	r5, [r4, #2312]
	str	r9, [r4, #2324]
	bpl	.L523
	movw	r2, #607
	ldr	r1, .L572+12
	ldr	r0, .L572+8
	bl	printk
.L523:
	ldr	r3, [sp, #8]
	mov	r8, #20
	add	r5, r3, #60
	movs	r3, #0
	str	r3, [sp]
.L524:
	ldr	r3, [sp, #8]
	ldr	r2, [sp]
	ldr	r3, [r3, #48]
	cmp	r2, r3
	bcc	.L539
	ldr	r3, [r6]
	lsls	r1, r3, #22
	bpl	.L540
	ldr	r2, [r4, #3252]
	ldr	r1, [r4, #2928]
	ldr	r0, .L572+16
	bl	printk
.L540:
	ldr	r3, [r6]
	lsls	r2, r3, #26
	bpl	.L541
	movw	r2, #653
	ldr	r1, .L572+12
	ldr	r0, .L572+8
	bl	printk
.L541:
	ldr	r3, [r4, #2332]
	movs	r1, #12
	ldr	r2, [r4, #2324]
	str	r3, [r4, #2280]
	ldr	r3, [r2, #228]
	mla	r1, r1, r3, r4
	ldr	r0, [r1, #2332]
	cmp	r0, #0
	beq	.L542
	ldr	r1, [r1, #2336]
	cmp	r1, #0
	beq	.L542
	movs	r1, #20
	mla	r1, r1, r3, r2
	ldr	r3, [r2, #232]
	ldr	r1, [r1, #28]
	subs	r3, r3, r1
	ldr	r1, [r2, #236]
	bic	r3, r3, #3
	ldr	r3, [r0, r3]
	lsrs	r3, r3, r1
	ldr	r1, [r2, #240]
	movs	r2, #1
	lsls	r2, r2, r1
	subs	r2, r2, #1
	ands	r3, r3, r2
	str	r3, [r4, #2320]
	ldr	r3, [r4, #2344]
	ldr	r3, [r3, #144]
	cmp	r3, #0
	itt	lt
	movlt	r3, #0
	strlt	r3, [r4, #2308]
	movs	r3, #3
	str	r3, [r4, #2920]
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L518
	movw	r2, #931
	ldr	r1, .L572+4
	ldr	r0, .L572+20
	bl	printk
.L518:
	ldr	r0, [sp, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L539:
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L526
	ldr	r3, [r5]
	movw	r2, #513
	cmp	r3, r2
	beq	.L545
	movw	r2, #514
	cmp	r3, r2
	beq	.L528
	cmp	r3, #512
	bne	.L526
	addw	r3, r4, #2328
	movs	r7, #0
	str	r3, [sp, #12]
	b	.L529
.L535:
	ldr	r2, [r4, #2324]
	ldr	r3, [r5, #12]
	mla	r2, r8, r7, r2
	ldr	r1, [r2, #32]
	cmp	r1, r3
	bcc	.L530
	ldr	r1, [r5, #8]
	ldr	r2, [r2, #28]
	add	r3, r3, r1
	subs	r3, r3, #4
	cmp	r2, r3
	bhi	.L530
	ldr	fp, [r4, #2928]
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	mul	r10, r8, fp
	addw	r3, r10, #2932
	add	r10, r10, r4
	add	r3, r3, r4
	bl	rkvenc_update_req
	ldr	r2, [r4, #2324]
	ldr	r1, [r10, #2944]
	movs	r3, #0
	ldr	lr, [r2, #24]
.L531:
	cmp	lr, r3
	beq	.L533
	ldr	ip, [r2, #28]
	cmp	r1, ip
	bcc	.L532
	ldr	r0, [r2, #32]
	cmp	r1, r0
	bcs	.L532
	cmp	r1, ip
	bne	.L533
	mla	fp, r8, fp, r4
	movs	r2, #12
	mla	r3, r2, r3, r4
	ldr	r2, [fp, #2948]
	str	r2, [r3, #2332]
.L533:
	movs	r3, #12
	ldr	r1, [sp, #12]
	muls	r3, r7, r3
	movs	r2, #1
	str	r2, [r1, r3]
	ldr	r3, [r4, #2928]
	add	r3, r3, r2
	str	r3, [r4, #2928]
.L530:
	adds	r7, r7, #1
.L529:
	ldr	r3, [r9, #24]
	cmp	r7, r3
	bcc	.L535
.L526:
	ldr	r3, [sp]
	adds	r5, r5, #20
	adds	r3, r3, #1
	str	r3, [sp]
	b	.L524
.L532:
	adds	r3, r3, #1
	adds	r2, r2, #20
	b	.L531
.L538:
	ldr	r2, [r4, #2324]
	ldr	r3, [r5, #12]
	mla	r2, r8, r7, r2
	ldr	r1, [r2, #32]
	cmp	r1, r3
	bcc	.L537
	ldr	r1, [r5, #8]
	ldr	r2, [r2, #28]
	add	r3, r3, r1
	subs	r3, r3, #4
	cmp	r2, r3
	bhi	.L537
	ldr	r3, [r4, #3252]
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	mla	r3, r8, r3, r4
	addw	r3, r3, #3256
	bl	rkvenc_update_req
	mul	r3, fp, r7
	movs	r2, #1
	str	r2, [r10, r3]
	ldr	r3, [r4, #3252]
	add	r3, r3, r2
	str	r3, [r4, #3252]
.L537:
	adds	r7, r7, #1
.L527:
	ldr	r3, [r9, #24]
	cmp	r7, r3
	bcc	.L538
	b	.L526
.L545:
	movs	r7, #0
	addw	r10, r4, #2328
	mov	fp, #12
	b	.L527
.L528:
	mov	r1, r5
	addw	r0, r4, #2436
	bl	mpp_extract_reg_offset_info
	b	.L526
.L542:
	mov	r0, r4
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #4]
	b	.L518
.L544:
	str	r4, [sp, #4]
	b	.L518
.L573:
	.align	2
.L572:
	.word	mpp_dev_debug
	.word	.LANCHOR0+649
	.word	.LC7
	.word	.LANCHOR0+667
	.word	.LC83
	.word	.LC8
	.fnend
	.size	rkvenc_alloc_task, .-rkvenc_alloc_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_run, %function
rkvenc_run:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #92
	sub	sp, sp, #92
	ldr	r3, [r1]
	mov	r4, r0
	ldr	r7, [r0, #132]
	mov	r5, r1
	ldr	r3, [r3, #184]
	str	r3, [sp, #24]
	ldr	r3, .L633
	ldr	r3, [r3]
	lsls	r0, r3, #26
	bpl	.L575
	movw	r2, #1138
	ldr	r1, .L633+4
	ldr	r0, .L633+8
	bl	printk
.L575:
	ldr	r8, [r4, #272]
	movs	r3, #0
	str	r3, [r4, #252]
	cmp	r8, #1
	beq	.L576
	cmp	r8, #0
	beq	.L577
	cmp	r8, #2
	beq	.L578
.L579:
	ldr	r3, .L633
	ldr	r0, [r3]
	ands	r0, r0, #32
	beq	.L574
	mov	r2, #1256
	ldr	r1, .L633+4
	ldr	r0, .L633+12
	bl	printk
	movs	r0, #0
	b	.L574
.L577:
	mov	fp, r5
	mov	r9, r8
	str	r8, [sp, #20]
.L580:
	ldr	r2, [r5, #2928]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bhi	.L591
	ldr	r3, .L633
	str	r5, [r4, #88]
	ldr	r3, [r3]
	lsls	r1, r3, #24
	bpl	.L592
	ldr	r3, [r5]
	movw	r1, #1148
	mov	r0, r4
	ldr	r10, [r5, #2276]
	ldr	fp, [r5, #2320]
	ldr	r6, [r3, #4]
	bl	mpp_read
	mov	r3, r10
	ldr	r1, .L633+4
	mov	r2, r6
	lsrs	r0, r0, #31
	str	r9, [sp, #8]
	strd	fp, r0, [sp]
	ldr	r0, .L633+16
	bl	printk
.L592:
	movw	r1, #20484
	mov	r0, r4
	bl	mpp_read
	lsls	r2, r0, #21
	mov	r3, r0
	bpl	.L593
	movw	r2, #1194
	ldr	r1, .L633+4
	ldr	r0, .L633+20
	bl	printk
.L593:
	cmp	r9, #0
	beq	.L594
	movs	r6, #0
	ldr	r0, [r4, #244]
	str	r6, [r4, #248]
	bl	rk_dvbm_link
	movs	r1, #19
	mov	r0, r6
	add	r2, sp, #52
	bl	rk_dvbm_ctrl
	ldr	r3, [sp, #56]
	cbz	r3, .L595
	ldr	r3, [sp, #68]
	cbnz	r3, .L596
.L595:
	ldr	r1, .L633+24
	ldr	r0, [r4]
	bl	_dev_err
.L596:
	ldr	r2, [sp, #52]
	mov	r1, #624
	mov	r0, r4
	bl	mpp_write
	mov	r1, #628
	mov	r0, r4
	ldr	r2, [sp, #64]
	bl	mpp_write
	mov	r1, #632
	mov	r0, r4
	ldr	r2, [sp, #56]
	bl	mpp_write
	mov	r1, #636
	mov	r0, r4
	ldr	r2, [sp, #68]
	bl	mpp_write
	mov	r1, #640
	mov	r0, r4
	ldr	r2, [sp, #60]
	bl	mpp_write
	mov	r1, #644
	mov	r0, r4
	ldr	r2, [sp, #72]
	bl	mpp_write
	mov	r1, #648
	mov	r0, r4
	ldr	r2, [sp, #72]
	bl	mpp_write
	movw	r1, #1148
	mov	r0, r4
	bl	mpp_read
	cmp	r0, #0
	bge	.L597
	ldr	r2, [sp, #56]
	mov	r1, #1040
	mov	r0, r4
	bl	mpp_write
	movw	r1, #1044
	mov	r0, r4
	ldr	r2, [sp, #68]
	bl	mpp_write
	mov	r1, #1048
	mov	r0, r4
	ldr	r2, [sp, #52]
	bl	mpp_write
	movw	r1, #1052
	mov	r0, r4
	ldr	r2, [sp, #64]
	bl	mpp_write
	mov	r1, #1056
	mov	r0, r4
	ldr	r2, [sp, #60]
	bl	mpp_write
	movw	r1, #1060
	mov	r0, r4
	ldr	r2, [sp, #72]
	bl	mpp_write
	mov	r1, #1064
	mov	r0, r4
	ldr	r2, [sp, #72]
	bl	mpp_write
.L597:
	ldr	r3, [sp, #24]
	movs	r6, #1
	mov	r2, r9
	mov	r0, r4
	str	r6, [r3, #20]
	ldr	r1, [r7, #280]
	bl	mpp_write_relaxed
	str	r6, [r4, #128]
.L594:
	ldr	r3, [sp, #24]
	movs	r6, #1
	str	r9, [r3, #16]
	str	r6, [r3, #200]
	.syntax unified
@ 1209 "drivers/kmpp/mpp/mpp_rkvenc_540c.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	bl	arm_heavy_mb
	mvn	r3, #31
	str	r3, [r5, #2208]
	addw	r3, r5, #2212
	str	r3, [r5, #2212]
	str	r3, [r5, #2216]
	mov	r2, #2097152
	ldr	r3, .L633+28
	add	r0, r5, #2224
	ldr	r1, .L633+32
	str	r3, [r5, #2220]
	movs	r3, #0
	str	r3, [sp]
	bl	init_timer_key
	ldr	r1, .L633+36
	movs	r3, #20
	add	r2, r5, #2208
	mov	r0, r6
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	addw	r1, r5, #2200
	mov	r0, r6
	bl	____atomic_set_bit
	cmp	r9, #0
	bne	.L598
	mov	r2, r8
	ldr	r1, [r7, #244]
	mov	r0, r4
	bl	mpp_write
.L598:
	movs	r3, #1
	str	r3, [r4, #240]
	b	.L579
.L591:
	ldr	r10, [r5, #2324]
	movs	r2, #20
	movs	r1, #0
	add	r0, sp, #32
	ldr	r6, [fp, #2944]
	bl	memset
	ldr	r3, [r10, #24]
	movs	r0, #0
.L581:
	cmp	r3, r0
	bne	.L584
	mvn	r0, #21
.L574:
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L584:
	ldr	r2, [r10, #28]
	cmp	r6, r2
	bcc	.L582
	ldr	r1, [r10, #32]
	cmp	r6, r1
	bcs	.L582
	movs	r1, #12
	subs	r6, r6, r2
	mla	r0, r1, r0, r5
	str	r2, [sp, #44]
	ldr	r2, [fp, #2940]
	lsrs	r6, r6, #2
	add	r3, r6, r2, lsr #2
	str	r3, [sp, #28]
	ldr	r1, [r0, #2336]
	ldr	r10, [r0, #2332]
	str	r1, [sp, #40]
	str	r10, [sp, #48]
.L583:
	ldr	r3, [sp, #28]
	cmp	r6, r3
	bcc	.L590
	ldr	r3, [sp, #20]
	add	fp, fp, #20
	adds	r3, r3, #1
	str	r3, [sp, #20]
	b	.L580
.L582:
	adds	r0, r0, #1
	add	r10, r10, #20
	b	.L581
.L590:
	ldr	r1, [sp, #44]
	ldr	r0, [r7, #244]
	add	r1, r1, r6, lsl #2
	ldr	r2, [r10, r6, lsl #2]
	cmp	r0, r1
	beq	.L602
	cmp	r1, #696
	bne	.L587
	str	r2, [r4, #284]
.L588:
	ldr	r0, [r7, #280]
	ldr	r2, [r10, r6, lsl #2]
	cmp	r0, r1
	beq	.L603
	ldr	r0, [r5, #2312]
	cbz	r0, .L589
	movw	r3, #1148
	cmp	r1, r3
	itt	eq
	biceq	r2, r2, #-2147483648
	streq	r2, [r10, r6, lsl #2]
.L589:
	ldr	r2, [r10, r6, lsl #2]
	mov	r0, r4
	bl	mpp_write_relaxed
.L586:
	adds	r6, r6, #1
	b	.L583
.L587:
	movw	r3, #1036
	cmp	r1, r3
	it	eq
	streq	r2, [r4, #288]
	b	.L588
.L602:
	mov	r8, r2
	b	.L586
.L603:
	mov	r9, r2
	b	.L586
.L634:
	.align	2
.L633:
	.word	mpp_dev_debug
	.word	.LANCHOR0+691
	.word	.LC7
	.word	.LC8
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	rkvenc_task_timeout
	.word	delayed_work_timer_fn
	.word	system_wq
.L578:
	str	r3, [r4, #276]
	mov	r1, r5
	mov	r0, r4
	bl	rkvenc_run_start_link
	add	r3, r4, #276
	pld	[r3]
	.syntax unified
@ 223 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_add_return
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	str	r2, [r5, #3580]
	str	r5, [r4, #88]
.L632:
	.syntax unified
@ 1240 "drivers/kmpp/mpp/mpp_rkvenc_540c.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	bl	arm_heavy_mb
	ldr	r3, [r4, #280]
	cmp	r3, #0
	beq	.L579
	movw	r2, #513
.L629:
	ldr	r1, [r7, #244]
	mov	r0, r4
	bl	mpp_write
	b	.L579
.L576:
	ldr	r1, [r7, #292]
	mov	r0, r4
	bl	mpp_read
	add	r6, r4, #276
	cbnz	r0, .L600
	str	r0, [r4, #276]
	mov	r1, r5
	mov	r0, r4
	bl	rkvenc_run_start_link
	pld	[r6]
	.syntax unified
@ 223 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_add_return
1:	ldrex	r3, [r6]
	add	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r5, #3580]
	b	.L632
.L600:
	pld	[r6]
	.syntax unified
@ 223 "./arch/arm/include/asm/atomic.h" 1
	@ atomic_add_return
1:	ldrex	r3, [r6]
	add	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r5, #3580]
	.syntax unified
@ 1246 "drivers/kmpp/mpp/mpp_rkvenc_540c.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	bl	arm_heavy_mb
	ldr	r3, [r4, #280]
	cmp	r3, #0
	beq	.L579
	movw	r2, #769
	b	.L629
	.fnend
	.size	rkvenc_run, .-rkvenc_run
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_rkvenc_worker, %function
mpp_rkvenc_worker:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L651
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r3, [r3]
	sub	r6, r0, #16
	ldr	r4, [r0, #80]
	lsls	r3, r3, #26
	bpl	.L636
	movw	r2, #2005
	ldr	r1, .L651+4
	ldr	r0, .L651+8
	bl	printk
.L636:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #56]
	add	r7, r4, #60
	cbz	r3, .L637
	ldr	r3, [r4, #60]
	cmp	r7, r3
	beq	.L637
	ldr	r0, [r5, #32]
	bl	disable_irq
	mov	r0, r6
	bl	mpp_dev_reset
	ldr	r0, [r5, #32]
	bl	enable_irq
.L637:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r6
	bl	mpp_power_on
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #60]
	cmp	r7, r3
	bne	.L639
	mov	r0, r4
	bl	mpp_taskqueue_get_pending_task
	mov	r5, r0
	cbz	r0, .L639
	mov	r1, r7
	adds	r0, r0, #20
	bl	list_move_tail
	mov	r0, r5
	bl	mpp_time_record
	addw	r1, r5, #2200
	movs	r0, #2
	bl	____atomic_set_bit
	mov	r1, r5
	mov	r0, r6
	bl	rkvenc_run
.L639:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #60]
	cmp	r7, r3
	bne	.L641
	mov	r0, r6
	bl	mpp_power_off
.L641:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpp_session_clean_detach
.L652:
	.align	2
.L651:
	.word	mpp_dev_debug
	.word	.LANCHOR0+702
	.word	.LC7
	.fnend
	.size	mpp_rkvenc_worker, .-mpp_rkvenc_worker
	.align	1
	.global	rkvenc_dump_dbg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_dump_dbg, %function
rkvenc_dump_dbg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movs	r1, #96
	mov	r4, r0
	bl	mpp_read
	and	r1, r0, #1
	ldr	r0, .L663
	bl	printk
	mov	r1, #768
	mov	r0, r4
	bl	mpp_read
	and	r1, r0, #3
	ldr	r0, .L663+4
	bl	printk
	movw	r1, #1148
	mov	r0, r4
	bl	mpp_read
	lsrs	r1, r0, #31
	ldr	r0, .L663+8
	bl	printk
	movs	r1, #24
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L663+12
	bl	printk
	mov	r1, #20480
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L663+16
	bl	printk
	movw	r1, #20484
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L663+20
	bl	printk
	movw	r1, #20488
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L663+24
	bl	printk
	movw	r1, #20492
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L663+28
	bl	printk
	mov	r1, #20992
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L663+32
	bl	printk
	ldr	r3, .L663+36
	ldr	r3, [r3]
	lsls	r3, r3, #21
	bpl	.L653
	ldr	r1, .L663+40
	mvn	r7, #1
	ldr	r0, .L663+44
	bl	printk
	ldr	r6, .L663+48
	ldr	r9, .L663+52
.L656:
	cmp	r7, #4
	bhi	.L655
.L660:
	adds	r7, r7, #1
	adds	r6, r6, #20
	cmp	r7, #7
	bne	.L656
	ldr	r1, .L663+40
	ldr	r0, .L663+44
	pop	{r3, r4, r5, r6, r7, r8, r9, lr}
	b	printk
.L655:
	ldrd	r5, r8, [r6, #28]
.L658:
	cmp	r8, r5
	bcc	.L660
	mov	r1, r5
	mov	r0, r4
	bl	mpp_read
	mov	r1, r5
	adds	r5, r5, #4
	mov	r2, r0
	mov	r0, r9
	bl	printk
	b	.L658
.L653:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L664:
	.align	2
.L663:
	.word	.LC87
	.word	.LC88
	.word	.LC89
	.word	.LC90
	.word	.LC91
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.word	.LC95
	.word	mpp_dev_debug
	.word	.LANCHOR0+720
	.word	.LC96
	.word	.LANCHOR2
	.word	.LC97
	.fnend
	.size	rkvenc_dump_dbg, .-rkvenc_dump_dbg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_finish, %function
rkvenc_finish:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r5, r0
	ldr	r6, .L697
	mov	r4, r1
	ldr	r3, [r6]
	str	r6, [sp]
	tst	r3, #32
	beq	.L666
	mov	r2, #1672
	ldr	r1, .L697+4
	ldr	r0, .L697+8
	bl	printk
.L666:
	ldr	r3, [r5, #272]
	cbz	r3, .L667
	cmp	r3, #2
	bne	.L668
.L667:
	ldr	r3, [r5, #52]
	ldr	r7, [r4]
	lsls	r2, r3, #23
	bmi	.L669
	ldr	r3, [r5, #120]
	cbz	r3, .L670
.L669:
	mov	r0, r5
	bl	rkvenc_dump_dbg
.L670:
	mov	r9, r4
	mov	fp, #0
.L671:
	ldr	r3, [r4, #3252]
	cmp	r3, fp
	bhi	.L675
	ldr	r3, [r4, #2324]
	movs	r1, #0
	ldr	r2, [r3, #264]
	ldr	r0, [r3, #24]
.L676:
	cmp	r1, r0
	beq	.L679
	ldr	ip, [r3, #28]
	cmp	r2, ip
	bcc	.L677
	ldr	r6, [r3, #32]
	cmp	r2, r6
	bcs	.L677
	movs	r3, #12
	sub	r2, r2, ip
	mla	r1, r3, r1, r4
	ldr	r3, [r1, #2332]
	cmn	r3, r2
	bne	.L678
.L679:
	ldr	r3, [r7, #184]
	ldr	r3, [r3, #16]
	cbz	r3, .L668
	ldr	r0, [r5, #244]
	bl	rk_dvbm_unlink
.L668:
	movs	r3, #0
	str	r3, [r5, #240]
	ldr	r3, [sp]
	ldr	r3, [r3]
	lsls	r3, r3, #26
	bpl	.L681
	movw	r2, #1714
	ldr	r1, .L697+4
	ldr	r0, .L697+12
	bl	printk
.L681:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L675:
	ldr	r3, [r9, #3272]
	mov	r8, #0
.L672:
	ldr	r2, [r9, #3264]
	cmp	r8, r2, lsr #2
	bcc	.L674
	add	fp, fp, #1
	add	r9, r9, #20
	b	.L671
.L674:
	ldr	r2, [r9, #3268]
	mov	r0, r5
	str	r3, [sp, #4]
	add	r10, r2, r8, lsl #2
	mov	r1, r10
	bl	mpp_read_relaxed
	ldr	r3, [sp, #4]
	str	r0, [r3, r8, lsl #2]
	ldr	r2, [r4, #2324]
	ldr	r2, [r2, #264]
	cmp	r2, r10
	itt	eq
	ldreq	r2, [r4, #2924]
	streq	r2, [r3, r8, lsl #2]
	add	r8, r8, #1
	b	.L672
.L677:
	adds	r1, r1, #1
	adds	r3, r3, #20
	b	.L676
.L678:
	ldr	r1, [r4, #2924]
	str	r1, [r3, r2]
	b	.L679
.L698:
	.align	2
.L697:
	.word	mpp_dev_debug
	.word	.LANCHOR0+736
	.word	.LC7
	.word	.LC8
	.fnend
	.size	rkvenc_finish, .-rkvenc_finish
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_isr, %function
rkvenc_isr:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, .L769
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r6]
	lsls	r0, r3, #26
	bpl	.L700
	movw	r2, #1575
	ldr	r1, .L769+4
	ldr	r0, .L769+8
	bl	printk
.L700:
	ldr	r7, [r4, #272]
	cmp	r7, #1
	beq	.L701
	cbz	r7, .L702
	cmp	r7, #2
	beq	.L703
.L704:
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L706
	movw	r2, #1661
	ldr	r1, .L769+4
	ldr	r0, .L769+12
	bl	printk
	b	.L706
.L702:
	ldr	r5, [r4, #88]
	cmp	r5, #0
	beq	.L706
	ldr	r3, [r5]
	mov	r0, r5
	ldr	r8, [r3, #184]
	bl	mpp_time_diff
	str	r7, [r4, #88]
	ldr	r3, [r8, #16]
	cbz	r3, .L708
	ldr	r2, [r4, #252]
	movw	r3, #16383
	cmp	r2, r3
	bne	.L709
	movs	r3, #1
	ldr	r1, .L769+16
	str	r3, [r4, #248]
	ldr	r0, [r4]
	bl	_dev_err
.L709:
	ldr	r3, [r4, #248]
	cbz	r3, .L708
	ldr	r3, [r4, #52]
	orr	r3, r3, #64
	str	r3, [r4, #52]
	movs	r3, #0
	str	r3, [r4, #248]
.L708:
	ldrd	r3, r2, [r4, #52]
	orrs	r3, r3, r2
	str	r3, [r5, #2924]
	movs	r3, #0
	str	r3, [r4, #56]
	ldr	r3, [r6]
	lsls	r1, r3, #29
	bpl	.L711
	ldr	r3, [r5, #2924]
	ldr	r0, .L769+20
	str	r3, [sp]
	ldr	r3, [r8, #16]
	ldr	r2, [r5, #2320]
	ldr	r1, [r5, #2276]
	bl	printk
.L711:
	ldr	r3, [r4, #132]
	ldr	r2, [r3, #272]
	ldr	r3, [r4, #52]
	tst	r2, r3
	beq	.L713
	ldr	r3, [r5, #2924]
	mov	r7, r4
	ldr	r1, .L769+24
	str	r3, [sp, #4]
	ldr	r3, [r8, #16]
	str	r3, [sp]
	ldr	r0, [r7], #72
	ldr	r3, [r5, #2320]
	ldr	r2, [r5, #2276]
	bl	_dev_err
	mov	r0, r7
	bl	atomic_add.constprop.15
	ldr	r3, [r6]
	lsls	r2, r3, #21
	bpl	.L713
	ldr	r1, [r5, #2924]
	ldr	r0, .L769+28
	bl	printk
	mov	r0, r4
	bl	rkvenc_dump_dbg
.L713:
	mov	r1, r5
	ldr	r0, [r5]
	bl	mpp_task_finish
	b	.L704
.L703:
	ldr	r5, [r4, #88]
	cbnz	r5, .L715
	ldr	r1, .L769+32
	ldr	r0, [r4]
	bl	_dev_err
.L706:
	movs	r0, #1
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L715:
	mov	r0, r5
	bl	mpp_time_diff
	movs	r3, #0
	str	r3, [r4, #88]
	ldr	r3, [r6]
	ldr	r1, [r4, #52]
	lsls	r3, r3, #29
	str	r1, [r5, #2924]
	bpl	.L716
	ldr	r0, .L769+28
	bl	printk
.L716:
	ldr	r3, [r4, #132]
	ldr	r2, [r3, #272]
	ldr	r3, [r5, #2924]
	tst	r2, r3
	beq	.L718
	add	r0, r4, #72
	bl	atomic_add.constprop.15
	ldr	r3, [r6]
	lsls	r7, r3, #21
	bpl	.L718
	ldr	r1, [r5, #2924]
	ldr	r0, .L769+28
	bl	printk
.L718:
	mov	r1, r5
	ldr	r0, [r5]
	bl	mpp_task_finish
	ldr	r0, [r4, #268]
	adds	r0, r0, #64
	bl	mutex_lock
	ldr	r1, [r4, #268]
	ldr	r0, [r5, #3576]
	adds	r1, r1, #56
	bl	list_move_tail
	ldr	r0, [r4, #268]
	adds	r0, r0, #64
	bl	mutex_unlock
	b	.L704
.L701:
	ldr	r3, [r4, #52]
	lsls	r5, r3, #23
	bmi	.L720
	ldr	r3, [r4, #120]
	cbz	r3, .L721
.L720:
	mov	r0, r4
	bl	rkvenc_dump_dbg
.L721:
	ldr	r10, [r4, #132]
	movs	r3, #0
	ldr	r3, [r3]
	mov	r0, r4
	ldr	r9, [r4, #268]
	ldr	r1, [r10, #292]
	str	r3, [sp, #12]
	bl	mpp_read_relaxed
	ldr	r3, [r4, #96]
	ldr	r5, [r3, #60]
	ldr	r7, [r5], #-20
	subs	r7, r7, #20
	lsrs	r3, r0, #24
	str	r3, [sp, #16]
.L722:
	ldr	r1, [r4, #96]
	add	r8, r5, #20
	add	r2, r1, #60
	cmp	r8, r2
	bne	.L728
.L723:
	ldr	r3, [r1, #60]
	cmp	r2, r3
	bne	.L730
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #16]
	cbz	r3, .L730
	ldr	r0, [r4, #244]
	bl	rk_dvbm_unlink
	ldr	r2, [r4, #52]
	ldr	r3, [r10, #272]
	tst	r2, r3
	beq	.L730
	mov	r0, r4
	bl	rkvenc_reset
.L730:
	ldr	r3, [r6]
	lsls	r2, r3, #26
	bpl	.L704
	movw	r2, #1566
	ldr	r1, .L769+36
	ldr	r0, .L769+12
	bl	printk
	b	.L704
.L728:
	ldr	r3, [r5, #3580]
	ldr	r0, [sp, #16]
	subs	r3, r3, r0
	tst	r3, #255
	bne	.L723
	add	r0, r5, #2208
	bl	cancel_delayed_work
	mov	r0, r5
	bl	mpp_time_diff
	ldr	r3, [r6]
	ldr	r1, [r4, #52]
	lsls	r0, r3, #29
	str	r1, [r5, #2924]
	bpl	.L724
	ldr	r0, .L769+40
	bl	printk
.L724:
	ldr	r3, [r5, #2324]
	addw	fp, r5, #2200
	ldr	r1, [r5, #3576]
	ldr	r0, [r9, #12]
	ldr	r3, [r3, #264]
	ldr	r2, [r5, #2924]
	add	r3, r3, r0
	ldr	r1, [r1, #40]
	bic	r3, r3, #3
	str	r2, [r1, r3]
	ldr	r3, [r5, #2204]
	cbnz	r3, .L725
	mov	r1, fp
	movs	r0, #7
	str	r3, [sp, #20]
	bl	____atomic_set_bit
	movs	r2, #1
	movs	r1, #3
	addw	r0, r5, #2284
	ldr	r3, [sp, #20]
	bl	__wake_up
.L725:
	add	r3, r9, #64
	str	r3, [sp, #20]
	mov	r0, r3
	bl	mutex_lock
	add	r1, r9, #56
	ldr	r0, [r5, #3576]
	bl	list_move_tail
	ldr	r3, [sp, #20]
	mov	r0, r3
	bl	mutex_unlock
	mov	r1, fp
	movs	r0, #5
	bl	____atomic_set_bit
	ldrd	r2, r3, [r5, #20]
	addw	r0, r5, #2252
	str	r3, [r2, #4]
	str	r2, [r3]
	str	r8, [r5, #20]
	str	r8, [r5, #24]
	pld	[r0]
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
	bne	.L726
	bl	mpp_free_task
.L727:
	ldr	r3, [r7, #20]
	mov	r5, r7
	sub	r7, r3, #20
	b	.L722
.L726:
	cmp	r3, #0
	bgt	.L727
	movs	r1, #3
	bl	refcount_warn_saturate
	b	.L727
.L770:
	.align	2
.L769:
	.word	mpp_dev_debug
	.word	.LANCHOR0+750
	.word	.LC7
	.word	.LC8
	.word	.LC98
	.word	.LC56
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LANCHOR0+761
	.word	.LC102
	.fnend
	.size	rkvenc_isr, .-rkvenc_isr
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_task_timeout, %function
rkvenc_task_timeout:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	sub	r5, r0, #2208
	mov	r6, r0
	ldr	r8, [r5, #2308]
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #-8]
	orr	r1, r3, #8
	str	r1, [r0, #-8]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	lsls	r3, r3, #28
	bpl	.L772
	movw	r2, #1961
	ldr	r1, .L787
	ldr	r0, .L787+4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	printk
.L772:
	ldr	r3, [r5, #2200]
	movw	r2, #1966
	ldr	r1, .L787
	ldr	r0, .L787+8
	str	r3, [sp]
	ldr	r3, [r5, #2276]
	bl	printk
	ldr	r7, [r5]
	cbnz	r7, .L773
	ldr	r1, .L787
	mov	r3, r5
	ldr	r0, .L787+12
	movw	r2, #1969
.L786:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	printk
.L773:
	ldr	r4, [r7, #12]
	cbnz	r4, .L774
	mov	r3, r7
	movw	r2, #1975
	ldr	r1, .L787
	ldr	r0, .L787+16
	b	.L786
.L774:
	subs	r6, r6, #8
	ldr	r0, [r4, #48]
	bl	disable_irq
	mov	r0, r4
	bl	rkvenc_dump_dbg
	mov	r1, r6
	movs	r0, #6
	bl	____atomic_set_bit
	mov	r0, r5
	bl	mpp_time_diff
	mov	r1, r6
	movs	r0, #7
	bl	____atomic_set_bit
	mov	r1, r5
	ldr	r0, [r4, #96]
	bl	mpp_taskqueue_pop_running
	ldr	r3, [r7, #240]
	cbz	r3, .L775
	cmp	r8, #0
	beq	.L775
	ldr	r0, [r7, #196]
	blx	r3
.L775:
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #28]
	cbz	r3, .L776
	mov	r0, r4
	blx	r3
.L776:
	mov	r0, r4
	bl	mpp_taskqueue_trigger_work
	ldr	r0, [r4, #48]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	enable_irq
.L788:
	.align	2
.L787:
	.word	.LANCHOR0+777
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.fnend
	.size	rkvenc_task_timeout, .-rkvenc_task_timeout
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_callback, %function
rkvenc_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r2
	.pad #24
	sub	sp, sp, #24
	mov	r4, r0
	cbz	r0, .L791
	subs	r1, r1, #18
	cmp	r1, #4
	bhi	.L791
	tbb	[pc, r1]
.L793:
	.byte	(.L797-.L793)/2
	.byte	(.L796-.L793)/2
	.byte	(.L795-.L793)/2
	.byte	(.L794-.L793)/2
	.byte	(.L792-.L793)/2
	.p2align 1
.L796:
	movs	r1, #24
	ldr	r5, [r2]
	bl	mpp_read
	str	r0, [sp, #20]
	cbnz	r5, .L798
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [sp, #20]
	bic	r3, r3, #16777216
	str	r3, [sp, #20]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L798:
	ldr	r2, [sp, #20]
	movs	r1, #24
	mov	r0, r4
	bl	mpp_write
.L791:
	movs	r0, #0
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L795:
	ldr	r3, [r2]
	str	r3, [r0, #256]
	b	.L791
.L794:
	ldr	r3, [r2]
	str	r3, [r0, #260]
	b	.L791
.L792:
	movs	r1, #24
	bl	mpp_read
	movw	r1, #20488
	ubfx	r7, r0, #14, #8
	mov	r6, r0
	ubfx	r8, r0, #0, #14
	mov	r0, r4
	bl	mpp_read
	movw	r1, #20492
	mov	r9, r0
	mov	r0, r4
	bl	mpp_read
	movw	r1, #20484
	mov	r10, r0
	mov	r0, r4
	bl	mpp_read
	lsr	r2, r9, #16
	lsr	r9, r10, #16
	ldr	r1, [r5]
	cmp	r9, r2
	ldr	r3, [r5, #4]
	it	cc
	movcc	r9, r2
	cmp	r7, r1
	lsl	r2, r9, #4
	bne	.L799
	cmp	r8, r3
	bcc	.L800
.L799:
	cbz	r3, .L801
	cmp	r7, r1
	beq	.L801
	ldr	r0, [r5, #8]
	cmp	r3, r0
	bcc	.L802
	strd	r1, r3, [sp]
	mov	r3, r8
	mov	r1, r7
	ldr	r0, .L816
	bl	printk
	movs	r3, #1
	str	r3, [r4, #248]
.L802:
	mov	r0, r4
	bl	rkvenc_dump_dbg
.L801:
	ldr	r3, [r5, #12]
	cmp	r8, r3
	bcs	.L791
	movs	r1, #24
	mov	r0, r4
	bl	mpp_read
	ldr	r2, [r5, #12]
	movs	r1, #24
	bic	r0, r0, #16320
	bic	r0, r0, #63
	orrs	r2, r2, r0
	mov	r0, r4
	bl	mpp_write
	.syntax unified
@ 770 "drivers/kmpp/mpp/mpp_rkvenc_540c.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	bl	arm_heavy_mb
	ldr	r3, [r5, #4]
	mov	r2, r7
	ldr	r0, .L816+4
	str	r3, [sp, #4]
	ldr	r3, [r5]
	str	r3, [sp]
	mov	r3, r8
	ldr	r1, [r5, #12]
	bl	printk
	b	.L791
.L800:
	ldr	ip, [r4, #240]
	ldr	r1, [r5, #8]
	cmp	ip, #0
	beq	.L804
	sub	ip, r3, r2
	cmp	r1, ip
.L815:
	bcs	.L805
	strd	r3, r0, [sp, #4]
	mov	r1, r7
	mov	r3, r8
	str	r7, [sp]
	ldr	r0, .L816+8
	bl	printk
	movs	r3, #1
	str	r3, [r4, #248]
.L805:
	ldr	r3, [r5, #4]
	bic	r6, r6, #16320
	bic	r6, r6, #63
	movs	r1, #24
	orrs	r6, r6, r3
	mov	r0, r4
	str	r3, [r4, #252]
	mov	r2, r6
	bl	mpp_write
	.syntax unified
@ 838 "drivers/kmpp/mpp/mpp_rkvenc_540c.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	bl	arm_heavy_mb
	ldr	r3, .L816+12
	ldr	r3, [r3]
	lsls	r3, r3, #15
	bpl	.L806
	ldrd	r1, r2, [r5]
	ldr	r0, .L816+16
	bl	printk
.L806:
	movs	r1, #24
	mov	r0, r4
	bl	mpp_read
	cmp	r0, r6
	beq	.L791
	ldr	r3, [r5, #4]
	mov	r2, r8
	mov	r1, r7
	ldr	r0, .L816+20
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
	b	.L791
.L804:
	cmp	r1, r3
	b	.L815
.L797:
	bl	rkvenc_dump_dbg
	b	.L791
.L817:
	.align	2
.L816:
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	mpp_dev_debug
	.word	.LC110
	.word	.LC111
	.fnend
	.size	rkvenc_callback, .-rkvenc_callback
	.global	rockchip_rkvenc540c_driver
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.48979, %object
	.size	__func__.48979, 18
__func__.48979:
	.ascii	"rkvenc_update_req\000"
	.type	__func__.49797, %object
	.size	__func__.49797, 13
__func__.49797:
	.ascii	"rkvenc_reset\000"
	.type	__func__.49361, %object
	.size	__func__.49361, 11
__func__.49361:
	.ascii	"rkvenc_irq\000"
	.type	__func__.49530, %object
	.size	__func__.49530, 14
__func__.49530:
	.ascii	"rkvenc_result\000"
	.type	__func__.49199, %object
	.size	__func__.49199, 15
__func__.49199:
	.ascii	"rkvenc_prepare\000"
	.type	__func__.49712, %object
	.size	__func__.49712, 23
__func__.49712:
	.ascii	"mpp_rkvenc_wait_result\000"
	.type	__func__.49786, %object
	.size	__func__.49786, 12
__func__.49786:
	.ascii	"rkvenc_init\000"
	.type	__func__.49378, %object
	.size	__func__.49378, 15
__func__.49378:
	.ascii	"mpp_rkvenc_irq\000"
	.type	__func__.49601, %object
	.size	__func__.49601, 15
__func__.49601:
	.ascii	"rkvenc_control\000"
	.type	__func__.49643, %object
	.size	__func__.49643, 20
__func__.49643:
	.ascii	"rkvenc_init_session\000"
	.type	__func__.49840, %object
	.size	__func__.49840, 19
__func__.49840:
	.ascii	"rkvenc_link_remove\000"
	.space	1
	.type	mpp_rkvenc_dt_match, %object
	.size	mpp_rkvenc_dt_match, 392
mpp_rkvenc_dt_match:
	.space	64
	.ascii	"rockchip,rkv-encoder-rv1106\000"
	.space	100
	.word	rkvenc_rv1106_data
	.space	196
	.type	__func__.49775, %object
	.size	__func__.49775, 19
__func__.49775:
	.ascii	"rkvenc_procfs_init\000"
	.type	__func__.49948, %object
	.size	__func__.49948, 21
__func__.49948:
	.ascii	"rkvenc_probe_default\000"
	.type	__func__.49927, %object
	.size	__func__.49927, 17
__func__.49927:
	.ascii	"rkvenc_link_init\000"
	.type	__func__.49891, %object
	.size	__func__.49891, 24
__func__.49891:
	.ascii	"rkvenc_link_alloc_table\000"
	.type	__func__.49147, %object
	.size	__func__.49147, 18
__func__.49147:
	.ascii	"rkvenc_alloc_task\000"
	.type	__func__.49027, %object
	.size	__func__.49027, 24
__func__.49027:
	.ascii	"rkvenc_extract_task_msg\000"
	.type	__func__.49295, %object
	.size	__func__.49295, 11
__func__.49295:
	.ascii	"rkvenc_run\000"
	.type	__func__.49687, %object
	.size	__func__.49687, 18
__func__.49687:
	.ascii	"mpp_rkvenc_worker\000"
	.type	__func__.49074, %object
	.size	__func__.49074, 16
__func__.49074:
	.ascii	"rkvenc_dump_dbg\000"
	.type	__func__.49478, %object
	.size	__func__.49478, 14
__func__.49478:
	.ascii	"rkvenc_finish\000"
	.type	__func__.49443, %object
	.size	__func__.49443, 11
__func__.49443:
	.ascii	"rkvenc_isr\000"
	.type	__func__.49432, %object
	.size	__func__.49432, 16
__func__.49432:
	.ascii	"rkvenc_link_isr\000"
	.type	__func__.49674, %object
	.size	__func__.49674, 20
__func__.49674:
	.ascii	"rkvenc_task_timeout\000"
	.space	3
	.type	rkvenc_rv1106_data, %object
	.size	rkvenc_rv1106_data, 20
rkvenc_rv1106_data:
	.word	16
	.word	rkvenc_rv1106_hw_info
	.word	trans_rkvenc_rv1106
	.word	rkvenc_hw_ops
	.word	rkvenc_dev_ops_v2
	.type	trans_tbl_jpege_osd_rv1106, %object
	.size	trans_tbl_jpege_osd_rv1106, 32
trans_tbl_jpege_osd_rv1106:
	.short	81
	.short	82
	.short	90
	.short	91
	.short	99
	.short	100
	.short	108
	.short	109
	.short	117
	.short	118
	.short	126
	.short	127
	.short	135
	.short	136
	.short	144
	.short	145
	.type	trans_tbl_jpege_rv1106, %object
	.size	trans_tbl_jpege_rv1106, 8
trans_tbl_jpege_rv1106:
	.short	100
	.short	101
	.short	102
	.short	103
	.type	trans_tbl_h265e_rv1106_osd, %object
	.size	trans_tbl_h265e_rv1106_osd, 32
trans_tbl_h265e_rv1106_osd:
	.short	3
	.short	4
	.short	12
	.short	13
	.short	21
	.short	22
	.short	30
	.short	31
	.short	39
	.short	40
	.short	48
	.short	49
	.short	57
	.short	58
	.short	66
	.short	67
	.type	trans_tbl_h265e_rv1106, %object
	.size	trans_tbl_h265e_rv1106, 42
trans_tbl_h265e_rv1106:
	.short	7
	.short	8
	.short	9
	.short	10
	.short	11
	.short	12
	.short	13
	.short	14
	.short	15
	.short	16
	.short	17
	.short	18
	.short	19
	.short	20
	.short	21
	.short	22
	.short	23
	.short	100
	.short	101
	.short	102
	.short	103
	.type	trans_tbl_h264e_rv1106_osd, %object
	.size	trans_tbl_h264e_rv1106_osd, 32
trans_tbl_h264e_rv1106_osd:
	.short	3
	.short	4
	.short	12
	.short	13
	.short	21
	.short	22
	.short	30
	.short	31
	.short	39
	.short	40
	.short	48
	.short	49
	.short	57
	.short	58
	.short	66
	.short	67
	.type	trans_tbl_h264e_rv1106, %object
	.size	trans_tbl_h264e_rv1106, 42
trans_tbl_h264e_rv1106:
	.short	7
	.short	8
	.short	9
	.short	10
	.short	11
	.short	12
	.short	13
	.short	14
	.short	15
	.short	16
	.short	17
	.short	18
	.short	19
	.short	20
	.short	21
	.short	22
	.short	23
	.short	100
	.short	101
	.short	102
	.short	103
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	rkvenc_rv1106_hw_info, %object
	.size	rkvenc_rv1106_hw_info, 300
rkvenc_rv1106_hw_info:
	.word	254
	.word	0
	.space	4
	.word	160
	.word	253
	.word	4
	.word	9
	.word	0
	.word	288
	.space	12
	.word	624
	.word	1152
	.space	8
	.word	532
	.word	4096
	.word	4364
	.space	8
	.word	272
	.word	5888
	.word	6604
	.space	8
	.word	720
	.word	8192
	.word	8444
	.space	8
	.word	256
	.word	8672
	.word	11772
	.space	8
	.word	3104
	.word	12288
	.word	12908
	.space	8
	.word	624
	.word	16384
	.word	16972
	.space	8
	.word	592
	.word	20480
	.word	21332
	.space	12
	.word	2
	.word	1
	.word	0
	.word	6
	.word	3
	.word	1
	.word	768
	.word	0
	.word	2
	.word	16
	.word	20
	.word	32
	.word	36
	.word	40
	.word	44
	.word	56
	.word	10192
	.word	16416
	.word	96
	.word	320
	.word	112
	.word	16420
	.word	16424
	.type	rockchip_rkvenc540c_driver, %object
	.size	rockchip_rkvenc540c_driver, 104
rockchip_rkvenc540c_driver:
	.word	rkvenc_probe
	.word	rkvenc_remove
	.word	rkvenc_shutdown
	.space	8
	.word	.LC112
	.space	20
	.word	mpp_rkvenc_dt_match
	.space	48
	.space	8
	.type	rkvenc_dev_ops_v2, %object
	.size	rkvenc_dev_ops_v2, 68
rkvenc_dev_ops_v2:
	.space	16
	.word	rkvenc_alloc_task
	.word	rkvenc_prepare
	.word	rkvenc_run
	.word	rkvenc_irq
	.word	rkvenc_isr
	.word	rkvenc_finish
	.word	rkvenc_result
	.word	rkvenc_free_task
	.word	rkvenc_control
	.word	rkvenc_init_session
	.word	rkvenc_free_session
	.word	rkvenc_dump_session
	.space	4
	.type	rkvenc_hw_ops, %object
	.size	rkvenc_hw_ops, 36
rkvenc_hw_ops:
	.word	rkvenc_init
	.space	4
	.word	rkvenc_clk_on
	.word	rkvenc_clk_off
	.space	4
	.word	rkvenc_set_freq
	.space	4
	.word	rkvenc_reset
	.space	4
	.type	trans_rkvenc_rv1106, %object
	.size	trans_rkvenc_rv1106, 48
trans_rkvenc_rv1106:
	.word	21
	.word	trans_tbl_h264e_rv1106
	.word	21
	.word	trans_tbl_h265e_rv1106
	.word	4
	.word	trans_tbl_jpege_rv1106
	.word	16
	.word	trans_tbl_h264e_rv1106_osd
	.word	16
	.word	trans_tbl_h265e_rv1106_osd
	.word	16
	.word	trans_tbl_jpege_osd_rv1106
	.bss
	.set	.LANCHOR1,. + 0
	.type	__key.49644, %object
	.size	__key.49644, 0
__key.49644:
	.type	__key.49931, %object
	.size	__key.49931, 0
__key.49931:
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016rkvenc_540c: read reg[%03d]: %04x: 0x%08x\012\000"
.LC1:
	.ascii	"\0016rkvenc_540c: read reg[%03d] %04x: 0x%08x\012\000"
.LC2:
	.ascii	"\0016rkvenc_540c: write reg[%03d]: %04x: 0x%08x\012"
	.ascii	"\000"
.LC3:
	.ascii	"\0013rkvenc_540c: %s:%d: warning over class, req of"
	.ascii	"f 0x%08x size %d\012\000"
.LC4:
	.ascii	"\0016rkvenc_540c: task %d jpeg bs overflow, buf[t:%"
	.ascii	"#x b:%#x w:%#x r:%#x]\012\000"
.LC5:
	.ascii	"\0016rkvenc_540c: task %d video bs overflow, buf[t:"
	.ascii	"%#x b:%#x w:%#x r:%#x]\012\000"
.LC6:
	.ascii	"\0013rkvenc_540c: clear dvbm info failed 0x%08x 0x%"
	.ascii	"08x\012\000"
.LC7:
	.ascii	"\0016rkvenc_540c: %s:%d: enter\012\000"
.LC8:
	.ascii	"\0016rkvenc_540c: %s:%d: leave\012\000"
.LC9:
	.ascii	"\012--------hw session infos\000"
.LC10:
	.ascii	"---------------------------------------------------"
	.ascii	"---\012\000"
.LC11:
	.ascii	"ID\000"
.LC12:
	.ascii	"%8s|\000"
.LC13:
	.ascii	"device\000"
.LC14:
	.ascii	"online\000"
.LC15:
	.ascii	"hw_running\000"
.LC16:
	.ascii	"%15s|%10s|%12s|%10s|%13s|%13s\000"
.LC17:
	.ascii	"enc_err_st\000"
.LC18:
	.ascii	"enc_err_cnt\000"
.LC19:
	.ascii	"bs_ovfl\000"
.LC20:
	.ascii	"wrap_ovfl\000"
.LC21:
	.ascii	"\012\000"
.LC22:
	.ascii	"%8d|\000"
.LC23:
	.ascii	"null\000"
.LC24:
	.ascii	"%15d|%10d|%12d|%10d|%13d|%13x\000"
.LC25:
	.ascii	"\012--------bitstream buffer addr\000"
.LC26:
	.ascii	"bot\000"
.LC27:
	.ascii	"top\000"
.LC28:
	.ascii	"%10s|%10s|%10s|%10s|\012\000"
.LC29:
	.ascii	"rd\000"
.LC30:
	.ascii	"wr\000"
.LC31:
	.ascii	"%10x|%10x|%10x|%10x|\012\000"
.LC32:
	.ascii	"\0013rkvenc_540c: %s:%d: copy_to_user reg fail\012\000"
.LC33:
	.ascii	"\0013rkvenc_540c: %s:%d: xxxx task filled, mpp_stat"
	.ascii	"e=%lx\012\000"
.LC34:
	.ascii	"\0013rkvenc_540c: %s:%d: session %p pending list is"
	.ascii	" empty!\012\000"
.LC35:
	.ascii	"\0013rkvenc_540c: %s:%d: task %d wrong state %#lx\012"
	.ascii	"\000"
.LC36:
	.ascii	"\0016rkvenc_540c: %s:%d: session %d:%d task %d stat"
	.ascii	"e 0x%lx kref_rd %d ret %d\012\000"
.LC37:
	.ascii	"aclk_vcodec\000"
.LC38:
	.ascii	"\0013rkvenc_540c: %s:%d: failed on clk_get aclk_vco"
	.ascii	"dec\012\000"
.LC39:
	.ascii	"hclk_vcodec\000"
.LC40:
	.ascii	"\0013rkvenc_540c: %s:%d: failed on clk_get hclk_vco"
	.ascii	"dec\012\000"
.LC41:
	.ascii	"clk_core\000"
.LC42:
	.ascii	"\0013rkvenc_540c: %s:%d: failed on clk_get clk_core"
	.ascii	"\012\000"
.LC43:
	.ascii	"rockchip,default-max-load\000"
.LC44:
	.ascii	"video_a\000"
.LC45:
	.ascii	"\0013rkvenc_540c: %s:%d: No aclk reset resource def"
	.ascii	"ine\012\000"
.LC46:
	.ascii	"video_h\000"
.LC47:
	.ascii	"\0013rkvenc_540c: %s:%d: No hclk reset resource def"
	.ascii	"ine\012\000"
.LC48:
	.ascii	"video_core\000"
.LC49:
	.ascii	"\0013rkvenc_540c: %s:%d: No core reset resource def"
	.ascii	"ine\012\000"
.LC50:
	.ascii	"shutdown device\012\000"
.LC51:
	.ascii	"wait total running time out\012\000"
.LC52:
	.ascii	"shutdown success\012\000"
.LC53:
	.ascii	"found null task in irq\012\000"
.LC54:
	.ascii	"\0013rkvenc_540c: %s:%d: task %d has been handled s"
	.ascii	"tate %#lx\012\000"
.LC55:
	.ascii	"\0016rkvenc_540c: current frame has overflow\012\000"
.LC56:
	.ascii	"\0016rkvenc_540c: task %d fmt %d dvbm_en %d irq_sta"
	.ascii	"tus 0x%08x\012\000"
.LC57:
	.ascii	"\0013rkvenc_540c: %s:%d: session info null\012\000"
.LC58:
	.ascii	"\0016rkvenc_540c: codec info count %d\012\000"
.LC59:
	.ascii	"\0013rkvenc_540c: %s:%d: copy_from_user failed\012\000"
.LC60:
	.ascii	"\0013rkvenc_540c: %s:%d: codec info invalid, type %"
	.ascii	"d, flag %d\012\000"
.LC61:
	.ascii	"\0013rkvenc_540c: task %d disable_jpeg\012\000"
.LC62:
	.ascii	"\0013rkvenc_540c: %s:%d: unknown mpp ioctl cmd %x\012"
	.ascii	"\000"
.LC63:
	.ascii	"\0013rkvenc_540c: %s:%d: session is null\012\000"
.LC64:
	.ascii	"&priv->rw_sem\000"
.LC65:
	.ascii	"remove device\012\000"
.LC66:
	.ascii	"probing start\012\000"
.LC67:
	.ascii	"dt match failed!\012\000"
.LC68:
	.ascii	"register interrupter runtime failed\012\000"
.LC69:
	.ascii	"%s%d\000"
.LC70:
	.ascii	"\0013rkvenc_540c: %s:%d: failed on open procfs\012\000"
.LC71:
	.ascii	"aclk\000"
.LC72:
	.ascii	"session_buffers\000"
.LC73:
	.ascii	"dump_regs\000"
.LC74:
	.ascii	"sessions-info\000"
.LC75:
	.ascii	"link_mode\000"
.LC76:
	.ascii	"dvbm\000"
.LC77:
	.ascii	"\0013rkvenc_540c: %s:%d: failed to get device node\012"
	.ascii	"\000"
.LC78:
	.ascii	"rockchip,task-capacity\000"
.LC79:
	.ascii	"%d task capacity link mode detected\012\000"
.LC80:
	.ascii	"&link->list_mutex\000"
.LC81:
	.ascii	"dma alloc failed\012\000"
.LC82:
	.ascii	"probing finish\012\000"
.LC83:
	.ascii	"\0016rkvenc_540c: w_req_cnt=%d, r_req_cnt=%d\012\000"
.LC84:
	.ascii	"\0016rkvenc_540c: %s session %d task %d fmt %d jpeg"
	.ascii	"_en %08x dvbm_en %d\012\000"
.LC85:
	.ascii	"\0013rkvenc_540c: %s:%d: enc started status %08x\012"
	.ascii	"\000"
.LC86:
	.ascii	"the dvbm address do not ready!\012\000"
.LC87:
	.ascii	"\0013rkvenc_540c: dvbm_en     -   %d\012\000"
.LC88:
	.ascii	"\0013rkvenc_540c: fmt         -   %d\012\000"
.LC89:
	.ascii	"\0013rkvenc_540c: jpg_en      -   %d\012\000"
.LC90:
	.ascii	"\0013rkvenc_540c: vsldy       -   0x%08x\012\000"
.LC91:
	.ascii	"\0013rkvenc_540c: st_wdg      -   0x%08x\012\000"
.LC92:
	.ascii	"\0013rkvenc_540c: st_ppl      -   0x%08x\012\000"
.LC93:
	.ascii	"\0013rkvenc_540c: st_vsp0     -   0x%08x\012\000"
.LC94:
	.ascii	"\0013rkvenc_540c: st_vsp1     -   0x%08x\012\000"
.LC95:
	.ascii	"\0013rkvenc_540c: vepu_cycle  -   0x%08x\012\000"
.LC96:
	.ascii	"\0016rkvenc_540c: === %s ===\012\000"
.LC97:
	.ascii	"\0016rkvenc_540c: reg[0x%0x] = 0x%08x\012\000"
.LC98:
	.ascii	"current frame has overflow\012\000"
.LC99:
	.ascii	"task %d fmt %d dvbm_en %d irq_status 0x%08x\012\000"
.LC100:
	.ascii	"\0016rkvenc_540c: irq_status: %08x\012\000"
.LC101:
	.ascii	"no current task\012\000"
.LC102:
	.ascii	"\0016rkvenc_540c: link_irq_status: %08x\012\000"
.LC103:
	.ascii	"\0013rkvenc_540c: %s:%d: task has been handled\012\000"
.LC104:
	.ascii	"\0013rkvenc_540c: %s:%d: task %d state %#lx process"
	.ascii	"ing time out!\012\000"
.LC105:
	.ascii	"\0013rkvenc_540c: %s:%d: task %p, task->session is "
	.ascii	"null.\012\000"
.LC106:
	.ascii	"\0013rkvenc_540c: %s:%d: session %p, session->mpp i"
	.ascii	"s null.\012\000"
.LC107:
	.ascii	"\0013rkvenc_540c: overflow vepu[frm: %d line: %d %d"
	.ascii	"] isp[frm: %d line: %d]\012\000"
.LC108:
	.ascii	"\0013rkvenc_540c: line cnt disorder set max %d [%d "
	.ascii	"%d]->[%d %d]\012\000"
.LC109:
	.ascii	"\0013rkvenc_540c: overflow vepu[frm: %d line: %d %d"
	.ascii	"] isp[frm: %d line: %d] wrk 0x%08x\012\000"
.LC110:
	.ascii	"\0016rkvenc_540c: frame cnt %d line cnt %d\012\000"
.LC111:
	.ascii	"\0013rkvenc_540c: set frame info failed! [%d %d] ->"
	.ascii	" [%d %d]\012\000"
.LC112:
	.ascii	"mpp_rkvenc_540c\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
