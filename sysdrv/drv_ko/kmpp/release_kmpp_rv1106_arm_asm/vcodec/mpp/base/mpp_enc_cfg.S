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
	.file	"mpp_enc_cfg.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	set_base_low_delay
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_base_low_delay, %function
set_base_low_delay:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L10
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2
	movs	r2, #244
	ldr	r1, .L10+4
	ldr	r0, .L10+8
	bl	printk
.L2:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L3
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L3:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC0
	.fnend
	.size	set_base_low_delay, .-set_base_low_delay
	.align	1
	.global	get_base_low_delay
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_base_low_delay, %function
get_base_low_delay:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L17
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L13
	movs	r2, #244
	ldr	r1, .L17+4
	ldr	r0, .L17+8
	bl	printk
.L13:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	.LANCHOR1+19
	.word	.LC0
	.fnend
	.size	get_base_low_delay, .-get_base_low_delay
	.align	1
	.global	set_rc_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_mode, %function
set_rc_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L28
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L20
	movs	r2, #244
	ldr	r1, .L28+4
	ldr	r0, .L28+8
	bl	printk
.L20:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L21
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L21:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.word	.LANCHOR1+38
	.word	.LC0
	.fnend
	.size	set_rc_mode, .-set_rc_mode
	.align	1
	.global	get_rc_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_mode, %function
get_rc_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L31
	movs	r2, #244
	ldr	r1, .L35+4
	ldr	r0, .L35+8
	bl	printk
.L31:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L36:
	.align	2
.L35:
	.word	.LANCHOR0
	.word	.LANCHOR1+50
	.word	.LC0
	.fnend
	.size	get_rc_mode, .-get_rc_mode
	.align	1
	.global	set_rc_bps_target
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_bps_target, %function
set_rc_bps_target:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L46
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L38
	movs	r2, #244
	ldr	r1, .L46+4
	ldr	r0, .L46+8
	bl	printk
.L38:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L39
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L39:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L47:
	.align	2
.L46:
	.word	.LANCHOR0
	.word	.LANCHOR1+62
	.word	.LC0
	.fnend
	.size	set_rc_bps_target, .-set_rc_bps_target
	.align	1
	.global	get_rc_bps_target
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_bps_target, %function
get_rc_bps_target:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L53
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L49
	movs	r2, #244
	ldr	r1, .L53+4
	ldr	r0, .L53+8
	bl	printk
.L49:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.word	.LANCHOR1+80
	.word	.LC0
	.fnend
	.size	get_rc_bps_target, .-get_rc_bps_target
	.align	1
	.global	set_rc_bps_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_bps_max, %function
set_rc_bps_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L64
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L56
	movs	r2, #244
	ldr	r1, .L64+4
	ldr	r0, .L64+8
	bl	printk
.L56:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L57
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L57:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.word	.LANCHOR1+98
	.word	.LC0
	.fnend
	.size	set_rc_bps_max, .-set_rc_bps_max
	.align	1
	.global	get_rc_bps_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_bps_max, %function
get_rc_bps_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L71
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L67
	movs	r2, #244
	ldr	r1, .L71+4
	ldr	r0, .L71+8
	bl	printk
.L67:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L72:
	.align	2
.L71:
	.word	.LANCHOR0
	.word	.LANCHOR1+113
	.word	.LC0
	.fnend
	.size	get_rc_bps_max, .-get_rc_bps_max
	.align	1
	.global	set_rc_bps_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_bps_min, %function
set_rc_bps_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L82
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L74
	movs	r2, #244
	ldr	r1, .L82+4
	ldr	r0, .L82+8
	bl	printk
.L74:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L75
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L75:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L83:
	.align	2
.L82:
	.word	.LANCHOR0
	.word	.LANCHOR1+128
	.word	.LC0
	.fnend
	.size	set_rc_bps_min, .-set_rc_bps_min
	.align	1
	.global	get_rc_bps_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_bps_min, %function
get_rc_bps_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L89
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L85
	movs	r2, #244
	ldr	r1, .L89+4
	ldr	r0, .L89+8
	bl	printk
.L85:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
	.word	.LANCHOR1+143
	.word	.LC0
	.fnend
	.size	get_rc_bps_min, .-get_rc_bps_min
	.align	1
	.global	set_rc_fps_in_flex
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fps_in_flex, %function
set_rc_fps_in_flex:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L100
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L92
	movs	r2, #244
	ldr	r1, .L100+4
	ldr	r0, .L100+8
	bl	printk
.L92:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L93
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32
	str	r3, [r6, r2]
.L93:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L101:
	.align	2
.L100:
	.word	.LANCHOR0
	.word	.LANCHOR1+158
	.word	.LC0
	.fnend
	.size	set_rc_fps_in_flex, .-set_rc_fps_in_flex
	.align	1
	.global	get_rc_fps_in_flex
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fps_in_flex, %function
get_rc_fps_in_flex:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L107
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L103
	movs	r2, #244
	ldr	r1, .L107+4
	ldr	r0, .L107+8
	bl	printk
.L103:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L108:
	.align	2
.L107:
	.word	.LANCHOR0
	.word	.LANCHOR1+177
	.word	.LC0
	.fnend
	.size	get_rc_fps_in_flex, .-get_rc_fps_in_flex
	.align	1
	.global	set_rc_fps_in_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fps_in_num, %function
set_rc_fps_in_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L118
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L110
	movs	r2, #244
	ldr	r1, .L118+4
	ldr	r0, .L118+8
	bl	printk
.L110:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L111
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32
	str	r3, [r6, r2]
.L111:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L119:
	.align	2
.L118:
	.word	.LANCHOR0
	.word	.LANCHOR1+196
	.word	.LC0
	.fnend
	.size	set_rc_fps_in_num, .-set_rc_fps_in_num
	.align	1
	.global	get_rc_fps_in_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fps_in_num, %function
get_rc_fps_in_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L125
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L121
	movs	r2, #244
	ldr	r1, .L125+4
	ldr	r0, .L125+8
	bl	printk
.L121:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L126:
	.align	2
.L125:
	.word	.LANCHOR0
	.word	.LANCHOR1+214
	.word	.LC0
	.fnend
	.size	get_rc_fps_in_num, .-get_rc_fps_in_num
	.align	1
	.global	set_rc_fps_in_denorm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fps_in_denorm, %function
set_rc_fps_in_denorm:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L136
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L128
	movs	r2, #244
	ldr	r1, .L136+4
	ldr	r0, .L136+8
	bl	printk
.L128:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L129
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32
	str	r3, [r6, r2]
.L129:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L137:
	.align	2
.L136:
	.word	.LANCHOR0
	.word	.LANCHOR1+232
	.word	.LC0
	.fnend
	.size	set_rc_fps_in_denorm, .-set_rc_fps_in_denorm
	.align	1
	.global	get_rc_fps_in_denorm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fps_in_denorm, %function
get_rc_fps_in_denorm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L143
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L139
	movs	r2, #244
	ldr	r1, .L143+4
	ldr	r0, .L143+8
	bl	printk
.L139:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
	.word	.LANCHOR1+253
	.word	.LC0
	.fnend
	.size	get_rc_fps_in_denorm, .-get_rc_fps_in_denorm
	.align	1
	.global	set_rc_fps_out_flex
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fps_out_flex, %function
set_rc_fps_out_flex:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L154
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L146
	movs	r2, #244
	ldr	r1, .L154+4
	ldr	r0, .L154+8
	bl	printk
.L146:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L147
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #64
	str	r3, [r6, r2]
.L147:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L155:
	.align	2
.L154:
	.word	.LANCHOR0
	.word	.LANCHOR1+274
	.word	.LC0
	.fnend
	.size	set_rc_fps_out_flex, .-set_rc_fps_out_flex
	.align	1
	.global	get_rc_fps_out_flex
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fps_out_flex, %function
get_rc_fps_out_flex:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L161
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L157
	movs	r2, #244
	ldr	r1, .L161+4
	ldr	r0, .L161+8
	bl	printk
.L157:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L162:
	.align	2
.L161:
	.word	.LANCHOR0
	.word	.LANCHOR1+294
	.word	.LC0
	.fnend
	.size	get_rc_fps_out_flex, .-get_rc_fps_out_flex
	.align	1
	.global	set_rc_fps_out_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fps_out_num, %function
set_rc_fps_out_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L172
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L164
	movs	r2, #244
	ldr	r1, .L172+4
	ldr	r0, .L172+8
	bl	printk
.L164:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L165
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #64
	str	r3, [r6, r2]
.L165:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L173:
	.align	2
.L172:
	.word	.LANCHOR0
	.word	.LANCHOR1+314
	.word	.LC0
	.fnend
	.size	set_rc_fps_out_num, .-set_rc_fps_out_num
	.align	1
	.global	get_rc_fps_out_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fps_out_num, %function
get_rc_fps_out_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L179
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L175
	movs	r2, #244
	ldr	r1, .L179+4
	ldr	r0, .L179+8
	bl	printk
.L175:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L180:
	.align	2
.L179:
	.word	.LANCHOR0
	.word	.LANCHOR1+333
	.word	.LC0
	.fnend
	.size	get_rc_fps_out_num, .-get_rc_fps_out_num
	.align	1
	.global	set_rc_fps_out_denorm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fps_out_denorm, %function
set_rc_fps_out_denorm:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L190
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L182
	movs	r2, #244
	ldr	r1, .L190+4
	ldr	r0, .L190+8
	bl	printk
.L182:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L183
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #64
	str	r3, [r6, r2]
.L183:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L191:
	.align	2
.L190:
	.word	.LANCHOR0
	.word	.LANCHOR1+352
	.word	.LC0
	.fnend
	.size	set_rc_fps_out_denorm, .-set_rc_fps_out_denorm
	.align	1
	.global	get_rc_fps_out_denorm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fps_out_denorm, %function
get_rc_fps_out_denorm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L197
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L193
	movs	r2, #244
	ldr	r1, .L197+4
	ldr	r0, .L197+8
	bl	printk
.L193:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L198:
	.align	2
.L197:
	.word	.LANCHOR0
	.word	.LANCHOR1+374
	.word	.LC0
	.fnend
	.size	get_rc_fps_out_denorm, .-get_rc_fps_out_denorm
	.align	1
	.global	set_rc_gop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_gop, %function
set_rc_gop:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L208
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L200
	movs	r2, #244
	ldr	r1, .L208+4
	ldr	r0, .L208+8
	bl	printk
.L200:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L201
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #128
	str	r3, [r6, r2]
.L201:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L209:
	.align	2
.L208:
	.word	.LANCHOR0
	.word	.LANCHOR1+396
	.word	.LC0
	.fnend
	.size	set_rc_gop, .-set_rc_gop
	.align	1
	.global	get_rc_gop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_gop, %function
get_rc_gop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L215
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L211
	movs	r2, #244
	ldr	r1, .L215+4
	ldr	r0, .L215+8
	bl	printk
.L211:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L216:
	.align	2
.L215:
	.word	.LANCHOR0
	.word	.LANCHOR1+407
	.word	.LC0
	.fnend
	.size	get_rc_gop, .-get_rc_gop
	.align	1
	.global	set_rc_max_reenc_times
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_max_reenc_times, %function
set_rc_max_reenc_times:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L226
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L218
	movs	r2, #244
	ldr	r1, .L226+4
	ldr	r0, .L226+8
	bl	printk
.L218:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L219
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #512
	str	r3, [r6, r2]
.L219:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L227:
	.align	2
.L226:
	.word	.LANCHOR0
	.word	.LANCHOR1+418
	.word	.LC0
	.fnend
	.size	set_rc_max_reenc_times, .-set_rc_max_reenc_times
	.align	1
	.global	get_rc_max_reenc_times
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_max_reenc_times, %function
get_rc_max_reenc_times:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L233
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L229
	movs	r2, #244
	ldr	r1, .L233+4
	ldr	r0, .L233+8
	bl	printk
.L229:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L234:
	.align	2
.L233:
	.word	.LANCHOR0
	.word	.LANCHOR1+441
	.word	.LC0
	.fnend
	.size	get_rc_max_reenc_times, .-get_rc_max_reenc_times
	.align	1
	.global	set_rc_priority
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_priority, %function
set_rc_priority:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L244
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L236
	movs	r2, #244
	ldr	r1, .L244+4
	ldr	r0, .L244+8
	bl	printk
.L236:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L237
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16384
	str	r3, [r6, r2]
.L237:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L245:
	.align	2
.L244:
	.word	.LANCHOR0
	.word	.LANCHOR1+464
	.word	.LC0
	.fnend
	.size	set_rc_priority, .-set_rc_priority
	.align	1
	.global	get_rc_priority
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_priority, %function
get_rc_priority:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L251
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L247
	movs	r2, #244
	ldr	r1, .L251+4
	ldr	r0, .L251+8
	bl	printk
.L247:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L252:
	.align	2
.L251:
	.word	.LANCHOR0
	.word	.LANCHOR1+480
	.word	.LC0
	.fnend
	.size	get_rc_priority, .-get_rc_priority
	.align	1
	.global	set_rc_drop_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_drop_mode, %function
set_rc_drop_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L262
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L254
	movs	r2, #244
	ldr	r1, .L262+4
	ldr	r0, .L262+8
	bl	printk
.L254:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L255
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1024
	str	r3, [r6, r2]
.L255:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L263:
	.align	2
.L262:
	.word	.LANCHOR0
	.word	.LANCHOR1+496
	.word	.LC0
	.fnend
	.size	set_rc_drop_mode, .-set_rc_drop_mode
	.align	1
	.global	get_rc_drop_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_drop_mode, %function
get_rc_drop_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L269
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L265
	movs	r2, #244
	ldr	r1, .L269+4
	ldr	r0, .L269+8
	bl	printk
.L265:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L270:
	.align	2
.L269:
	.word	.LANCHOR0
	.word	.LANCHOR1+513
	.word	.LC0
	.fnend
	.size	get_rc_drop_mode, .-get_rc_drop_mode
	.align	1
	.global	set_rc_drop_thd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_drop_thd, %function
set_rc_drop_thd:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L280
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L272
	movs	r2, #244
	ldr	r1, .L280+4
	ldr	r0, .L280+8
	bl	printk
.L272:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L273
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1024
	str	r3, [r6, r2]
.L273:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L281:
	.align	2
.L280:
	.word	.LANCHOR0
	.word	.LANCHOR1+530
	.word	.LC0
	.fnend
	.size	set_rc_drop_thd, .-set_rc_drop_thd
	.align	1
	.global	get_rc_drop_thd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_drop_thd, %function
get_rc_drop_thd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L287
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L283
	movs	r2, #244
	ldr	r1, .L287+4
	ldr	r0, .L287+8
	bl	printk
.L283:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L288:
	.align	2
.L287:
	.word	.LANCHOR0
	.word	.LANCHOR1+546
	.word	.LC0
	.fnend
	.size	get_rc_drop_thd, .-get_rc_drop_thd
	.align	1
	.global	set_rc_drop_gap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_drop_gap, %function
set_rc_drop_gap:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L298
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L290
	movs	r2, #244
	ldr	r1, .L298+4
	ldr	r0, .L298+8
	bl	printk
.L290:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L291
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1024
	str	r3, [r6, r2]
.L291:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L299:
	.align	2
.L298:
	.word	.LANCHOR0
	.word	.LANCHOR1+562
	.word	.LC0
	.fnend
	.size	set_rc_drop_gap, .-set_rc_drop_gap
	.align	1
	.global	get_rc_drop_gap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_drop_gap, %function
get_rc_drop_gap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L305
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L301
	movs	r2, #244
	ldr	r1, .L305+4
	ldr	r0, .L305+8
	bl	printk
.L301:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L306:
	.align	2
.L305:
	.word	.LANCHOR0
	.word	.LANCHOR1+578
	.word	.LC0
	.fnend
	.size	get_rc_drop_gap, .-get_rc_drop_gap
	.align	1
	.global	set_rc_max_i_prop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_max_i_prop, %function
set_rc_max_i_prop:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L316
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L308
	movs	r2, #244
	ldr	r1, .L316+4
	ldr	r0, .L316+8
	bl	printk
.L308:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L309
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2048
	str	r3, [r6, r2]
.L309:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L317:
	.align	2
.L316:
	.word	.LANCHOR0
	.word	.LANCHOR1+594
	.word	.LC0
	.fnend
	.size	set_rc_max_i_prop, .-set_rc_max_i_prop
	.align	1
	.global	get_rc_max_i_prop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_max_i_prop, %function
get_rc_max_i_prop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L323
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L319
	movs	r2, #244
	ldr	r1, .L323+4
	ldr	r0, .L323+8
	bl	printk
.L319:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L324:
	.align	2
.L323:
	.word	.LANCHOR0
	.word	.LANCHOR1+612
	.word	.LC0
	.fnend
	.size	get_rc_max_i_prop, .-get_rc_max_i_prop
	.align	1
	.global	set_rc_min_i_prop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_min_i_prop, %function
set_rc_min_i_prop:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L334
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L326
	movs	r2, #244
	ldr	r1, .L334+4
	ldr	r0, .L334+8
	bl	printk
.L326:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L327
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4096
	str	r3, [r6, r2]
.L327:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L335:
	.align	2
.L334:
	.word	.LANCHOR0
	.word	.LANCHOR1+630
	.word	.LC0
	.fnend
	.size	set_rc_min_i_prop, .-set_rc_min_i_prop
	.align	1
	.global	get_rc_min_i_prop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_min_i_prop, %function
get_rc_min_i_prop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L341
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L337
	movs	r2, #244
	ldr	r1, .L341+4
	ldr	r0, .L341+8
	bl	printk
.L337:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L342:
	.align	2
.L341:
	.word	.LANCHOR0
	.word	.LANCHOR1+648
	.word	.LC0
	.fnend
	.size	get_rc_min_i_prop, .-get_rc_min_i_prop
	.align	1
	.global	set_rc_init_ip_ratio
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_init_ip_ratio, %function
set_rc_init_ip_ratio:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L352
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L344
	movs	r2, #244
	ldr	r1, .L352+4
	ldr	r0, .L352+8
	bl	printk
.L344:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L345
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #8192
	str	r3, [r6, r2]
.L345:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L353:
	.align	2
.L352:
	.word	.LANCHOR0
	.word	.LANCHOR1+666
	.word	.LC0
	.fnend
	.size	set_rc_init_ip_ratio, .-set_rc_init_ip_ratio
	.align	1
	.global	get_rc_init_ip_ratio
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_init_ip_ratio, %function
get_rc_init_ip_ratio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L359
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L355
	movs	r2, #244
	ldr	r1, .L359+4
	ldr	r0, .L359+8
	bl	printk
.L355:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L360:
	.align	2
.L359:
	.word	.LANCHOR0
	.word	.LANCHOR1+687
	.word	.LC0
	.fnend
	.size	get_rc_init_ip_ratio, .-get_rc_init_ip_ratio
	.align	1
	.global	set_rc_super_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_super_mode, %function
set_rc_super_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L370
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L362
	movs	r2, #244
	ldr	r1, .L370+4
	ldr	r0, .L370+8
	bl	printk
.L362:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L363
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32768
	str	r3, [r6, r2]
.L363:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L371:
	.align	2
.L370:
	.word	.LANCHOR0
	.word	.LANCHOR1+708
	.word	.LC0
	.fnend
	.size	set_rc_super_mode, .-set_rc_super_mode
	.align	1
	.global	get_rc_super_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_super_mode, %function
get_rc_super_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L377
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L373
	movs	r2, #244
	ldr	r1, .L377+4
	ldr	r0, .L377+8
	bl	printk
.L373:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L378:
	.align	2
.L377:
	.word	.LANCHOR0
	.word	.LANCHOR1+726
	.word	.LC0
	.fnend
	.size	get_rc_super_mode, .-get_rc_super_mode
	.align	1
	.global	set_rc_super_i_thd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_super_i_thd, %function
set_rc_super_i_thd:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L388
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L380
	movs	r2, #244
	ldr	r1, .L388+4
	ldr	r0, .L388+8
	bl	printk
.L380:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L381
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32768
	str	r3, [r6, r2]
.L381:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L389:
	.align	2
.L388:
	.word	.LANCHOR0
	.word	.LANCHOR1+744
	.word	.LC0
	.fnend
	.size	set_rc_super_i_thd, .-set_rc_super_i_thd
	.align	1
	.global	get_rc_super_i_thd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_super_i_thd, %function
get_rc_super_i_thd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L395
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L391
	movs	r2, #244
	ldr	r1, .L395+4
	ldr	r0, .L395+8
	bl	printk
.L391:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L396:
	.align	2
.L395:
	.word	.LANCHOR0
	.word	.LANCHOR1+763
	.word	.LC0
	.fnend
	.size	get_rc_super_i_thd, .-get_rc_super_i_thd
	.align	1
	.global	set_rc_super_p_thd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_super_p_thd, %function
set_rc_super_p_thd:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L406
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L398
	movs	r2, #244
	ldr	r1, .L406+4
	ldr	r0, .L406+8
	bl	printk
.L398:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L399
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32768
	str	r3, [r6, r2]
.L399:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L407:
	.align	2
.L406:
	.word	.LANCHOR0
	.word	.LANCHOR1+782
	.word	.LC0
	.fnend
	.size	set_rc_super_p_thd, .-set_rc_super_p_thd
	.align	1
	.global	get_rc_super_p_thd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_super_p_thd, %function
get_rc_super_p_thd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L413
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L409
	movs	r2, #244
	ldr	r1, .L413+4
	ldr	r0, .L413+8
	bl	printk
.L409:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L414:
	.align	2
.L413:
	.word	.LANCHOR0
	.word	.LANCHOR1+801
	.word	.LC0
	.fnend
	.size	get_rc_super_p_thd, .-get_rc_super_p_thd
	.align	1
	.global	set_rc_debreath_en
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_debreath_en, %function
set_rc_debreath_en:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L424
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L416
	movs	r2, #244
	ldr	r1, .L424+4
	ldr	r0, .L424+8
	bl	printk
.L416:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L417
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16777216
	str	r3, [r6, r2]
.L417:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L425:
	.align	2
.L424:
	.word	.LANCHOR0
	.word	.LANCHOR1+820
	.word	.LC0
	.fnend
	.size	set_rc_debreath_en, .-set_rc_debreath_en
	.align	1
	.global	get_rc_debreath_en
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_debreath_en, %function
get_rc_debreath_en:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L431
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L427
	movs	r2, #244
	ldr	r1, .L431+4
	ldr	r0, .L431+8
	bl	printk
.L427:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L432:
	.align	2
.L431:
	.word	.LANCHOR0
	.word	.LANCHOR1+839
	.word	.LC0
	.fnend
	.size	get_rc_debreath_en, .-get_rc_debreath_en
	.align	1
	.global	set_rc_debreath_strength
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_debreath_strength, %function
set_rc_debreath_strength:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L442
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L434
	movs	r2, #244
	ldr	r1, .L442+4
	ldr	r0, .L442+8
	bl	printk
.L434:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L435
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16777216
	str	r3, [r6, r2]
.L435:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L443:
	.align	2
.L442:
	.word	.LANCHOR0
	.word	.LANCHOR1+858
	.word	.LC0
	.fnend
	.size	set_rc_debreath_strength, .-set_rc_debreath_strength
	.align	1
	.global	get_rc_debreath_strength
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_debreath_strength, %function
get_rc_debreath_strength:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L449
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L445
	movs	r2, #244
	ldr	r1, .L449+4
	ldr	r0, .L449+8
	bl	printk
.L445:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L450:
	.align	2
.L449:
	.word	.LANCHOR0
	.word	.LANCHOR1+883
	.word	.LC0
	.fnend
	.size	get_rc_debreath_strength, .-get_rc_debreath_strength
	.align	1
	.global	set_rc_qp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_qp_init, %function
set_rc_qp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L460
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L452
	movs	r2, #244
	ldr	r1, .L460+4
	ldr	r0, .L460+8
	bl	printk
.L452:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L453
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #65536
	str	r3, [r6, r2]
.L453:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L461:
	.align	2
.L460:
	.word	.LANCHOR0
	.word	.LANCHOR1+908
	.word	.LC0
	.fnend
	.size	set_rc_qp_init, .-set_rc_qp_init
	.align	1
	.global	get_rc_qp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_qp_init, %function
get_rc_qp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L467
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L463
	movs	r2, #244
	ldr	r1, .L467+4
	ldr	r0, .L467+8
	bl	printk
.L463:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L468:
	.align	2
.L467:
	.word	.LANCHOR0
	.word	.LANCHOR1+923
	.word	.LC0
	.fnend
	.size	get_rc_qp_init, .-get_rc_qp_init
	.align	1
	.global	set_rc_qp_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_qp_min, %function
set_rc_qp_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L478
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L470
	movs	r2, #244
	ldr	r1, .L478+4
	ldr	r0, .L478+8
	bl	printk
.L470:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L471
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L471:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L479:
	.align	2
.L478:
	.word	.LANCHOR0
	.word	.LANCHOR1+938
	.word	.LC0
	.fnend
	.size	set_rc_qp_min, .-set_rc_qp_min
	.align	1
	.global	get_rc_qp_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_qp_min, %function
get_rc_qp_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L485
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L481
	movs	r2, #244
	ldr	r1, .L485+4
	ldr	r0, .L485+8
	bl	printk
.L481:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L486:
	.align	2
.L485:
	.word	.LANCHOR0
	.word	.LANCHOR1+952
	.word	.LC0
	.fnend
	.size	get_rc_qp_min, .-get_rc_qp_min
	.align	1
	.global	set_rc_qp_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_qp_max, %function
set_rc_qp_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L496
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L488
	movs	r2, #244
	ldr	r1, .L496+4
	ldr	r0, .L496+8
	bl	printk
.L488:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L489
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L489:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L497:
	.align	2
.L496:
	.word	.LANCHOR0
	.word	.LANCHOR1+966
	.word	.LC0
	.fnend
	.size	set_rc_qp_max, .-set_rc_qp_max
	.align	1
	.global	get_rc_qp_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_qp_max, %function
get_rc_qp_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L503
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L499
	movs	r2, #244
	ldr	r1, .L503+4
	ldr	r0, .L503+8
	bl	printk
.L499:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L504:
	.align	2
.L503:
	.word	.LANCHOR0
	.word	.LANCHOR1+980
	.word	.LC0
	.fnend
	.size	get_rc_qp_max, .-get_rc_qp_max
	.align	1
	.global	set_rc_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_qp_min_i, %function
set_rc_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L514
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L506
	movs	r2, #244
	ldr	r1, .L514+4
	ldr	r0, .L514+8
	bl	printk
.L506:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L507
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L507:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L515:
	.align	2
.L514:
	.word	.LANCHOR0
	.word	.LANCHOR1+994
	.word	.LC0
	.fnend
	.size	set_rc_qp_min_i, .-set_rc_qp_min_i
	.align	1
	.global	get_rc_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_qp_min_i, %function
get_rc_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L521
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L517
	movs	r2, #244
	ldr	r1, .L521+4
	ldr	r0, .L521+8
	bl	printk
.L517:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L522:
	.align	2
.L521:
	.word	.LANCHOR0
	.word	.LANCHOR1+1010
	.word	.LC0
	.fnend
	.size	get_rc_qp_min_i, .-get_rc_qp_min_i
	.align	1
	.global	set_rc_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_qp_max_i, %function
set_rc_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L532
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L524
	movs	r2, #244
	ldr	r1, .L532+4
	ldr	r0, .L532+8
	bl	printk
.L524:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L525
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L525:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L533:
	.align	2
.L532:
	.word	.LANCHOR0
	.word	.LANCHOR1+1026
	.word	.LC0
	.fnend
	.size	set_rc_qp_max_i, .-set_rc_qp_max_i
	.align	1
	.global	get_rc_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_qp_max_i, %function
get_rc_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L539
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L535
	movs	r2, #244
	ldr	r1, .L539+4
	ldr	r0, .L539+8
	bl	printk
.L535:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L540:
	.align	2
.L539:
	.word	.LANCHOR0
	.word	.LANCHOR1+1042
	.word	.LC0
	.fnend
	.size	get_rc_qp_max_i, .-get_rc_qp_max_i
	.align	1
	.global	set_rc_qp_step
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_qp_step, %function
set_rc_qp_step:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L550
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L542
	movs	r2, #244
	ldr	r1, .L550+4
	ldr	r0, .L550+8
	bl	printk
.L542:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L543
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #524288
	str	r3, [r6, r2]
.L543:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L551:
	.align	2
.L550:
	.word	.LANCHOR0
	.word	.LANCHOR1+1058
	.word	.LC0
	.fnend
	.size	set_rc_qp_step, .-set_rc_qp_step
	.align	1
	.global	get_rc_qp_step
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_qp_step, %function
get_rc_qp_step:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L557
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L553
	movs	r2, #244
	ldr	r1, .L557+4
	ldr	r0, .L557+8
	bl	printk
.L553:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L558:
	.align	2
.L557:
	.word	.LANCHOR0
	.word	.LANCHOR1+1073
	.word	.LC0
	.fnend
	.size	get_rc_qp_step, .-get_rc_qp_step
	.align	1
	.global	set_rc_qp_ip
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_qp_ip, %function
set_rc_qp_ip:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L568
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L560
	movs	r2, #244
	ldr	r1, .L568+4
	ldr	r0, .L568+8
	bl	printk
.L560:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L561
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1048576
	str	r3, [r6, r2]
.L561:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L569:
	.align	2
.L568:
	.word	.LANCHOR0
	.word	.LANCHOR1+1088
	.word	.LC0
	.fnend
	.size	set_rc_qp_ip, .-set_rc_qp_ip
	.align	1
	.global	get_rc_qp_ip
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_qp_ip, %function
get_rc_qp_ip:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L575
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L571
	movs	r2, #244
	ldr	r1, .L575+4
	ldr	r0, .L575+8
	bl	printk
.L571:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L576:
	.align	2
.L575:
	.word	.LANCHOR0
	.word	.LANCHOR1+1101
	.word	.LC0
	.fnend
	.size	get_rc_qp_ip, .-get_rc_qp_ip
	.align	1
	.global	set_rc_qp_vi
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_qp_vi, %function
set_rc_qp_vi:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L586
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L578
	movs	r2, #244
	ldr	r1, .L586+4
	ldr	r0, .L586+8
	bl	printk
.L578:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L579
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2097152
	str	r3, [r6, r2]
.L579:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L587:
	.align	2
.L586:
	.word	.LANCHOR0
	.word	.LANCHOR1+1114
	.word	.LC0
	.fnend
	.size	set_rc_qp_vi, .-set_rc_qp_vi
	.align	1
	.global	get_rc_qp_vi
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_qp_vi, %function
get_rc_qp_vi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L593
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L589
	movs	r2, #244
	ldr	r1, .L593+4
	ldr	r0, .L593+8
	bl	printk
.L589:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L594:
	.align	2
.L593:
	.word	.LANCHOR0
	.word	.LANCHOR1+1127
	.word	.LC0
	.fnend
	.size	get_rc_qp_vi, .-get_rc_qp_vi
	.align	1
	.global	set_rc_hier_qp_en
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_hier_qp_en, %function
set_rc_hier_qp_en:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L604
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L596
	movs	r2, #244
	ldr	r1, .L604+4
	ldr	r0, .L604+8
	bl	printk
.L596:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L597
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #33554432
	str	r3, [r6, r2]
.L597:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L605:
	.align	2
.L604:
	.word	.LANCHOR0
	.word	.LANCHOR1+1140
	.word	.LC0
	.fnend
	.size	set_rc_hier_qp_en, .-set_rc_hier_qp_en
	.align	1
	.global	get_rc_hier_qp_en
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_hier_qp_en, %function
get_rc_hier_qp_en:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L611
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L607
	movs	r2, #244
	ldr	r1, .L611+4
	ldr	r0, .L611+8
	bl	printk
.L607:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L612:
	.align	2
.L611:
	.word	.LANCHOR0
	.word	.LANCHOR1+1158
	.word	.LC0
	.fnend
	.size	get_rc_hier_qp_en, .-get_rc_hier_qp_en
	.align	1
	.global	set_rc_hier_qp_delta
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_hier_qp_delta, %function
set_rc_hier_qp_delta:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L622
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	mov	r8, r2
	lsls	r3, r3, #31
	bpl	.L614
	movs	r2, #244
	ldr	r1, .L622+4
	ldr	r0, .L622+8
	bl	printk
.L614:
	ldrh	r5, [r7, #4]
	mov	r1, r8
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L615
	mov	r2, r5
	mov	r1, r8
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #33554432
	str	r3, [r6, r2]
.L615:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L623:
	.align	2
.L622:
	.word	.LANCHOR0
	.word	.LANCHOR1+1176
	.word	.LC0
	.fnend
	.size	set_rc_hier_qp_delta, .-set_rc_hier_qp_delta
	.align	1
	.global	get_rc_hier_qp_delta
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_hier_qp_delta, %function
get_rc_hier_qp_delta:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L629
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L625
	movs	r2, #244
	ldr	r1, .L629+4
	ldr	r0, .L629+8
	bl	printk
.L625:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L630:
	.align	2
.L629:
	.word	.LANCHOR0
	.word	.LANCHOR1+1197
	.word	.LC0
	.fnend
	.size	get_rc_hier_qp_delta, .-get_rc_hier_qp_delta
	.align	1
	.global	set_rc_hier_frame_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_hier_frame_num, %function
set_rc_hier_frame_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L640
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	mov	r8, r2
	lsls	r3, r3, #31
	bpl	.L632
	movs	r2, #244
	ldr	r1, .L640+4
	ldr	r0, .L640+8
	bl	printk
.L632:
	ldrh	r5, [r7, #4]
	mov	r1, r8
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L633
	mov	r2, r5
	mov	r1, r8
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #33554432
	str	r3, [r6, r2]
.L633:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L641:
	.align	2
.L640:
	.word	.LANCHOR0
	.word	.LANCHOR1+1218
	.word	.LC0
	.fnend
	.size	set_rc_hier_frame_num, .-set_rc_hier_frame_num
	.align	1
	.global	get_rc_hier_frame_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_hier_frame_num, %function
get_rc_hier_frame_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L647
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L643
	movs	r2, #244
	ldr	r1, .L647+4
	ldr	r0, .L647+8
	bl	printk
.L643:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L648:
	.align	2
.L647:
	.word	.LANCHOR0
	.word	.LANCHOR1+1240
	.word	.LC0
	.fnend
	.size	get_rc_hier_frame_num, .-get_rc_hier_frame_num
	.align	1
	.global	set_rc_stats_time
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_stats_time, %function
set_rc_stats_time:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L658
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L650
	movs	r2, #244
	ldr	r1, .L658+4
	ldr	r0, .L658+8
	bl	printk
.L650:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L651
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #67108864
	str	r3, [r6, r2]
.L651:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L659:
	.align	2
.L658:
	.word	.LANCHOR0
	.word	.LANCHOR1+1262
	.word	.LC0
	.fnend
	.size	set_rc_stats_time, .-set_rc_stats_time
	.align	1
	.global	get_rc_stats_time
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_stats_time, %function
get_rc_stats_time:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L665
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L661
	movs	r2, #244
	ldr	r1, .L665+4
	ldr	r0, .L665+8
	bl	printk
.L661:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L666:
	.align	2
.L665:
	.word	.LANCHOR0
	.word	.LANCHOR1+1280
	.word	.LC0
	.fnend
	.size	get_rc_stats_time, .-get_rc_stats_time
	.align	1
	.global	set_rc_fm_lvl_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fm_lvl_qp_min_i, %function
set_rc_fm_lvl_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L676
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L668
	movs	r2, #244
	ldr	r1, .L676+4
	ldr	r0, .L676+8
	bl	printk
.L668:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L669
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #134217728
	str	r3, [r6, r2]
.L669:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L677:
	.align	2
.L676:
	.word	.LANCHOR0
	.word	.LANCHOR1+1298
	.word	.LC0
	.fnend
	.size	set_rc_fm_lvl_qp_min_i, .-set_rc_fm_lvl_qp_min_i
	.align	1
	.global	get_rc_fm_lvl_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fm_lvl_qp_min_i, %function
get_rc_fm_lvl_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L683
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L679
	movs	r2, #244
	ldr	r1, .L683+4
	ldr	r0, .L683+8
	bl	printk
.L679:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L684:
	.align	2
.L683:
	.word	.LANCHOR0
	.word	.LANCHOR1+1321
	.word	.LC0
	.fnend
	.size	get_rc_fm_lvl_qp_min_i, .-get_rc_fm_lvl_qp_min_i
	.align	1
	.global	set_rc_fm_lvl_qp_min_p
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fm_lvl_qp_min_p, %function
set_rc_fm_lvl_qp_min_p:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L694
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L686
	movs	r2, #244
	ldr	r1, .L694+4
	ldr	r0, .L694+8
	bl	printk
.L686:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L687
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #134217728
	str	r3, [r6, r2]
.L687:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L695:
	.align	2
.L694:
	.word	.LANCHOR0
	.word	.LANCHOR1+1344
	.word	.LC0
	.fnend
	.size	set_rc_fm_lvl_qp_min_p, .-set_rc_fm_lvl_qp_min_p
	.align	1
	.global	get_rc_fm_lvl_qp_min_p
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fm_lvl_qp_min_p, %function
get_rc_fm_lvl_qp_min_p:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L701
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L697
	movs	r2, #244
	ldr	r1, .L701+4
	ldr	r0, .L701+8
	bl	printk
.L697:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L702:
	.align	2
.L701:
	.word	.LANCHOR0
	.word	.LANCHOR1+1367
	.word	.LC0
	.fnend
	.size	get_rc_fm_lvl_qp_min_p, .-get_rc_fm_lvl_qp_min_p
	.align	1
	.global	set_rc_fm_lvl_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fm_lvl_qp_max_i, %function
set_rc_fm_lvl_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L712
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L704
	movs	r2, #244
	ldr	r1, .L712+4
	ldr	r0, .L712+8
	bl	printk
.L704:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L705
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #134217728
	str	r3, [r6, r2]
.L705:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L713:
	.align	2
.L712:
	.word	.LANCHOR0
	.word	.LANCHOR1+1390
	.word	.LC0
	.fnend
	.size	set_rc_fm_lvl_qp_max_i, .-set_rc_fm_lvl_qp_max_i
	.align	1
	.global	get_rc_fm_lvl_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fm_lvl_qp_max_i, %function
get_rc_fm_lvl_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L719
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L715
	movs	r2, #244
	ldr	r1, .L719+4
	ldr	r0, .L719+8
	bl	printk
.L715:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L720:
	.align	2
.L719:
	.word	.LANCHOR0
	.word	.LANCHOR1+1413
	.word	.LC0
	.fnend
	.size	get_rc_fm_lvl_qp_max_i, .-get_rc_fm_lvl_qp_max_i
	.align	1
	.global	set_rc_fm_lvl_qp_max_p
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_fm_lvl_qp_max_p, %function
set_rc_fm_lvl_qp_max_p:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L730
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L722
	movs	r2, #244
	ldr	r1, .L730+4
	ldr	r0, .L730+8
	bl	printk
.L722:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L723
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #134217728
	str	r3, [r6, r2]
.L723:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L731:
	.align	2
.L730:
	.word	.LANCHOR0
	.word	.LANCHOR1+1436
	.word	.LC0
	.fnend
	.size	set_rc_fm_lvl_qp_max_p, .-set_rc_fm_lvl_qp_max_p
	.align	1
	.global	get_rc_fm_lvl_qp_max_p
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_fm_lvl_qp_max_p, %function
get_rc_fm_lvl_qp_max_p:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L737
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L733
	movs	r2, #244
	ldr	r1, .L737+4
	ldr	r0, .L737+8
	bl	printk
.L733:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L738:
	.align	2
.L737:
	.word	.LANCHOR0
	.word	.LANCHOR1+1459
	.word	.LC0
	.fnend
	.size	get_rc_fm_lvl_qp_max_p, .-get_rc_fm_lvl_qp_max_p
	.align	1
	.global	set_rc_mt_st_swth_frm_qp
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_rc_mt_st_swth_frm_qp, %function
set_rc_mt_st_swth_frm_qp:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L748
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L740
	movs	r2, #244
	ldr	r1, .L748+4
	ldr	r0, .L748+8
	bl	printk
.L740:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L741
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #134217728
	str	r3, [r6, r2]
.L741:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L749:
	.align	2
.L748:
	.word	.LANCHOR0
	.word	.LANCHOR1+1482
	.word	.LC0
	.fnend
	.size	set_rc_mt_st_swth_frm_qp, .-set_rc_mt_st_swth_frm_qp
	.align	1
	.global	get_rc_mt_st_swth_frm_qp
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_rc_mt_st_swth_frm_qp, %function
get_rc_mt_st_swth_frm_qp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L755
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L751
	movs	r2, #244
	ldr	r1, .L755+4
	ldr	r0, .L755+8
	bl	printk
.L751:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L756:
	.align	2
.L755:
	.word	.LANCHOR0
	.word	.LANCHOR1+1507
	.word	.LC0
	.fnend
	.size	get_rc_mt_st_swth_frm_qp, .-get_rc_mt_st_swth_frm_qp
	.align	1
	.global	set_prep_width
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_width, %function
set_prep_width:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L766
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L758
	movs	r2, #244
	ldr	r1, .L766+4
	ldr	r0, .L766+8
	bl	printk
.L758:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L759
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L759:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L767:
	.align	2
.L766:
	.word	.LANCHOR0
	.word	.LANCHOR1+1532
	.word	.LC0
	.fnend
	.size	set_prep_width, .-set_prep_width
	.align	1
	.global	get_prep_width
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_width, %function
get_prep_width:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L773
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L769
	movs	r2, #244
	ldr	r1, .L773+4
	ldr	r0, .L773+8
	bl	printk
.L769:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L774:
	.align	2
.L773:
	.word	.LANCHOR0
	.word	.LANCHOR1+1547
	.word	.LC0
	.fnend
	.size	get_prep_width, .-get_prep_width
	.align	1
	.global	set_prep_height
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_height, %function
set_prep_height:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L784
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L776
	movs	r2, #244
	ldr	r1, .L784+4
	ldr	r0, .L784+8
	bl	printk
.L776:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L777
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L777:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L785:
	.align	2
.L784:
	.word	.LANCHOR0
	.word	.LANCHOR1+1562
	.word	.LC0
	.fnend
	.size	set_prep_height, .-set_prep_height
	.align	1
	.global	get_prep_height
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_height, %function
get_prep_height:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L791
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L787
	movs	r2, #244
	ldr	r1, .L791+4
	ldr	r0, .L791+8
	bl	printk
.L787:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L792:
	.align	2
.L791:
	.word	.LANCHOR0
	.word	.LANCHOR1+1578
	.word	.LC0
	.fnend
	.size	get_prep_height, .-get_prep_height
	.align	1
	.global	set_prep_hor_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_hor_stride, %function
set_prep_hor_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L802
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L794
	movs	r2, #244
	ldr	r1, .L802+4
	ldr	r0, .L802+8
	bl	printk
.L794:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L795
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L795:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L803:
	.align	2
.L802:
	.word	.LANCHOR0
	.word	.LANCHOR1+1594
	.word	.LC0
	.fnend
	.size	set_prep_hor_stride, .-set_prep_hor_stride
	.align	1
	.global	get_prep_hor_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_hor_stride, %function
get_prep_hor_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L809
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L805
	movs	r2, #244
	ldr	r1, .L809+4
	ldr	r0, .L809+8
	bl	printk
.L805:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L810:
	.align	2
.L809:
	.word	.LANCHOR0
	.word	.LANCHOR1+1614
	.word	.LC0
	.fnend
	.size	get_prep_hor_stride, .-get_prep_hor_stride
	.align	1
	.global	set_prep_ver_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_ver_stride, %function
set_prep_ver_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L820
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L812
	movs	r2, #244
	ldr	r1, .L820+4
	ldr	r0, .L820+8
	bl	printk
.L812:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L813
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L813:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L821:
	.align	2
.L820:
	.word	.LANCHOR0
	.word	.LANCHOR1+1634
	.word	.LC0
	.fnend
	.size	set_prep_ver_stride, .-set_prep_ver_stride
	.align	1
	.global	get_prep_ver_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_ver_stride, %function
get_prep_ver_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L827
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L823
	movs	r2, #244
	ldr	r1, .L827+4
	ldr	r0, .L827+8
	bl	printk
.L823:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L828:
	.align	2
.L827:
	.word	.LANCHOR0
	.word	.LANCHOR1+1654
	.word	.LC0
	.fnend
	.size	get_prep_ver_stride, .-get_prep_ver_stride
	.align	1
	.global	set_prep_max_width
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_max_width, %function
set_prep_max_width:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L838
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L830
	movs	r2, #244
	ldr	r1, .L838+4
	ldr	r0, .L838+8
	bl	printk
.L830:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L831
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L831:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L839:
	.align	2
.L838:
	.word	.LANCHOR0
	.word	.LANCHOR1+1674
	.word	.LC0
	.fnend
	.size	set_prep_max_width, .-set_prep_max_width
	.align	1
	.global	get_prep_max_width
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_max_width, %function
get_prep_max_width:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L845
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L841
	movs	r2, #244
	ldr	r1, .L845+4
	ldr	r0, .L845+8
	bl	printk
.L841:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L846:
	.align	2
.L845:
	.word	.LANCHOR0
	.word	.LANCHOR1+1693
	.word	.LC0
	.fnend
	.size	get_prep_max_width, .-get_prep_max_width
	.align	1
	.global	set_prep_max_height
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_max_height, %function
set_prep_max_height:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L856
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L848
	movs	r2, #244
	ldr	r1, .L856+4
	ldr	r0, .L856+8
	bl	printk
.L848:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L849
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L849:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L857:
	.align	2
.L856:
	.word	.LANCHOR0
	.word	.LANCHOR1+1712
	.word	.LC0
	.fnend
	.size	set_prep_max_height, .-set_prep_max_height
	.align	1
	.global	get_prep_max_height
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_max_height, %function
get_prep_max_height:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L863
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L859
	movs	r2, #244
	ldr	r1, .L863+4
	ldr	r0, .L863+8
	bl	printk
.L859:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L864:
	.align	2
.L863:
	.word	.LANCHOR0
	.word	.LANCHOR1+1732
	.word	.LC0
	.fnend
	.size	get_prep_max_height, .-get_prep_max_height
	.align	1
	.global	set_prep_format
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_format, %function
set_prep_format:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L874
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L866
	movs	r2, #244
	ldr	r1, .L874+4
	ldr	r0, .L874+8
	bl	printk
.L866:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L867
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L867:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L875:
	.align	2
.L874:
	.word	.LANCHOR0
	.word	.LANCHOR1+1752
	.word	.LC0
	.fnend
	.size	set_prep_format, .-set_prep_format
	.align	1
	.global	get_prep_format
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_format, %function
get_prep_format:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L881
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L877
	movs	r2, #244
	ldr	r1, .L881+4
	ldr	r0, .L881+8
	bl	printk
.L877:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L882:
	.align	2
.L881:
	.word	.LANCHOR0
	.word	.LANCHOR1+1768
	.word	.LC0
	.fnend
	.size	get_prep_format, .-get_prep_format
	.align	1
	.global	set_prep_colorspace
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_colorspace, %function
set_prep_colorspace:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L892
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L884
	movs	r2, #244
	ldr	r1, .L892+4
	ldr	r0, .L892+8
	bl	printk
.L884:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L885
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L885:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L893:
	.align	2
.L892:
	.word	.LANCHOR0
	.word	.LANCHOR1+1784
	.word	.LC0
	.fnend
	.size	set_prep_colorspace, .-set_prep_colorspace
	.align	1
	.global	get_prep_colorspace
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_colorspace, %function
get_prep_colorspace:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L899
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L895
	movs	r2, #244
	ldr	r1, .L899+4
	ldr	r0, .L899+8
	bl	printk
.L895:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L900:
	.align	2
.L899:
	.word	.LANCHOR0
	.word	.LANCHOR1+1804
	.word	.LC0
	.fnend
	.size	get_prep_colorspace, .-get_prep_colorspace
	.align	1
	.global	set_prep_colorprim
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_colorprim, %function
set_prep_colorprim:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L910
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L902
	movs	r2, #244
	ldr	r1, .L910+4
	ldr	r0, .L910+8
	bl	printk
.L902:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L903
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L903:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L911:
	.align	2
.L910:
	.word	.LANCHOR0
	.word	.LANCHOR1+1824
	.word	.LC0
	.fnend
	.size	set_prep_colorprim, .-set_prep_colorprim
	.align	1
	.global	get_prep_colorprim
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_colorprim, %function
get_prep_colorprim:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L917
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L913
	movs	r2, #244
	ldr	r1, .L917+4
	ldr	r0, .L917+8
	bl	printk
.L913:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L918:
	.align	2
.L917:
	.word	.LANCHOR0
	.word	.LANCHOR1+1843
	.word	.LC0
	.fnend
	.size	get_prep_colorprim, .-get_prep_colorprim
	.align	1
	.global	set_prep_colortrc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_colortrc, %function
set_prep_colortrc:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L928
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L920
	movs	r2, #244
	ldr	r1, .L928+4
	ldr	r0, .L928+8
	bl	printk
.L920:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L921
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #524288
	str	r3, [r6, r2]
.L921:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L929:
	.align	2
.L928:
	.word	.LANCHOR0
	.word	.LANCHOR1+1862
	.word	.LC0
	.fnend
	.size	set_prep_colortrc, .-set_prep_colortrc
	.align	1
	.global	get_prep_colortrc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_colortrc, %function
get_prep_colortrc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L935
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L931
	movs	r2, #244
	ldr	r1, .L935+4
	ldr	r0, .L935+8
	bl	printk
.L931:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L936:
	.align	2
.L935:
	.word	.LANCHOR0
	.word	.LANCHOR1+1880
	.word	.LC0
	.fnend
	.size	get_prep_colortrc, .-get_prep_colortrc
	.align	1
	.global	set_prep_colorrange
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_colorrange, %function
set_prep_colorrange:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L946
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L938
	movs	r2, #244
	ldr	r1, .L946+4
	ldr	r0, .L946+8
	bl	printk
.L938:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L939
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #65536
	str	r3, [r6, r2]
.L939:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L947:
	.align	2
.L946:
	.word	.LANCHOR0
	.word	.LANCHOR1+1898
	.word	.LC0
	.fnend
	.size	set_prep_colorrange, .-set_prep_colorrange
	.align	1
	.global	get_prep_colorrange
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_colorrange, %function
get_prep_colorrange:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L953
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L949
	movs	r2, #244
	ldr	r1, .L953+4
	ldr	r0, .L953+8
	bl	printk
.L949:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L954:
	.align	2
.L953:
	.word	.LANCHOR0
	.word	.LANCHOR1+1918
	.word	.LC0
	.fnend
	.size	get_prep_colorrange, .-get_prep_colorrange
	.align	1
	.global	set_prep_range
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_range, %function
set_prep_range:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L964
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L956
	movs	r2, #244
	ldr	r1, .L964+4
	ldr	r0, .L964+8
	bl	printk
.L956:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L957
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #65536
	str	r3, [r6, r2]
.L957:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L965:
	.align	2
.L964:
	.word	.LANCHOR0
	.word	.LANCHOR1+1938
	.word	.LC0
	.fnend
	.size	set_prep_range, .-set_prep_range
	.align	1
	.global	get_prep_range
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_range, %function
get_prep_range:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L971
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L967
	movs	r2, #244
	ldr	r1, .L971+4
	ldr	r0, .L971+8
	bl	printk
.L967:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L972:
	.align	2
.L971:
	.word	.LANCHOR0
	.word	.LANCHOR1+1953
	.word	.LC0
	.fnend
	.size	get_prep_range, .-get_prep_range
	.align	1
	.global	set_prep_rotation
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_rotation, %function
set_prep_rotation:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L982
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L974
	movs	r2, #244
	ldr	r1, .L982+4
	ldr	r0, .L982+8
	bl	printk
.L974:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L975
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16
	str	r3, [r6, r2]
.L975:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L983:
	.align	2
.L982:
	.word	.LANCHOR0
	.word	.LANCHOR1+1968
	.word	.LC0
	.fnend
	.size	set_prep_rotation, .-set_prep_rotation
	.align	1
	.global	get_prep_rotation
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_rotation, %function
get_prep_rotation:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L989
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L985
	movs	r2, #244
	ldr	r1, .L989+4
	ldr	r0, .L989+8
	bl	printk
.L985:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L990:
	.align	2
.L989:
	.word	.LANCHOR0
	.word	.LANCHOR1+1986
	.word	.LC0
	.fnend
	.size	get_prep_rotation, .-get_prep_rotation
	.align	1
	.global	set_prep_mirroring
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_prep_mirroring, %function
set_prep_mirroring:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1000
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L992
	movs	r2, #244
	ldr	r1, .L1000+4
	ldr	r0, .L1000+8
	bl	printk
.L992:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L993
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32
	str	r3, [r6, r2]
.L993:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1001:
	.align	2
.L1000:
	.word	.LANCHOR0
	.word	.LANCHOR1+2004
	.word	.LC0
	.fnend
	.size	set_prep_mirroring, .-set_prep_mirroring
	.align	1
	.global	get_prep_mirroring
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_prep_mirroring, %function
get_prep_mirroring:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1007
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1003
	movs	r2, #244
	ldr	r1, .L1007+4
	ldr	r0, .L1007+8
	bl	printk
.L1003:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1008:
	.align	2
.L1007:
	.word	.LANCHOR0
	.word	.LANCHOR1+2023
	.word	.LC0
	.fnend
	.size	get_prep_mirroring, .-get_prep_mirroring
	.align	1
	.global	set_codec_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_codec_type, %function
set_codec_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1018
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r3]
	mov	r5, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1010
	movs	r2, #244
	ldr	r1, .L1018+4
	ldr	r0, .L1018+8
	bl	printk
.L1010:
	ldrh	r3, [r5, #6]
	add	r1, sp, #4
	ldrh	r5, [r5, #4]
	add	r4, r4, r3
	lsrs	r5, r5, #4
	mov	r0, r4
	mov	r2, r5
	bl	memcmp
	cbz	r0, .L1011
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
.L1011:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L1019:
	.align	2
.L1018:
	.word	.LANCHOR0
	.word	.LANCHOR1+2042
	.word	.LC0
	.fnend
	.size	set_codec_type, .-set_codec_type
	.align	1
	.global	get_codec_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_codec_type, %function
get_codec_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1025
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1021
	movs	r2, #244
	ldr	r1, .L1025+4
	ldr	r0, .L1025+8
	bl	printk
.L1021:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1026:
	.align	2
.L1025:
	.word	.LANCHOR0
	.word	.LANCHOR1+2057
	.word	.LC0
	.fnend
	.size	get_codec_type, .-get_codec_type
	.align	1
	.global	set_h264_stream_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_stream_type, %function
set_h264_stream_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1036
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1028
	movs	r2, #244
	ldr	r1, .L1036+4
	ldr	r0, .L1036+8
	bl	printk
.L1028:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1029
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L1029:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1037:
	.align	2
.L1036:
	.word	.LANCHOR0
	.word	.LANCHOR1+2072
	.word	.LC0
	.fnend
	.size	set_h264_stream_type, .-set_h264_stream_type
	.align	1
	.global	get_h264_stream_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_stream_type, %function
get_h264_stream_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1043
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1039
	movs	r2, #244
	ldr	r1, .L1043+4
	ldr	r0, .L1043+8
	bl	printk
.L1039:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1044:
	.align	2
.L1043:
	.word	.LANCHOR0
	.word	.LANCHOR1+2093
	.word	.LC0
	.fnend
	.size	get_h264_stream_type, .-get_h264_stream_type
	.align	1
	.global	set_h264_profile
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_profile, %function
set_h264_profile:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1054
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1046
	movs	r2, #244
	ldr	r1, .L1054+4
	ldr	r0, .L1054+8
	bl	printk
.L1046:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1047
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2
	str	r3, [r6, r2]
.L1047:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1055:
	.align	2
.L1054:
	.word	.LANCHOR0
	.word	.LANCHOR1+2114
	.word	.LC0
	.fnend
	.size	set_h264_profile, .-set_h264_profile
	.align	1
	.global	get_h264_profile
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_profile, %function
get_h264_profile:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1061
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1057
	movs	r2, #244
	ldr	r1, .L1061+4
	ldr	r0, .L1061+8
	bl	printk
.L1057:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1062:
	.align	2
.L1061:
	.word	.LANCHOR0
	.word	.LANCHOR1+2131
	.word	.LC0
	.fnend
	.size	get_h264_profile, .-get_h264_profile
	.align	1
	.global	set_h264_level
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_level, %function
set_h264_level:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1072
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1064
	movs	r2, #244
	ldr	r1, .L1072+4
	ldr	r0, .L1072+8
	bl	printk
.L1064:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1065
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2
	str	r3, [r6, r2]
.L1065:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1073:
	.align	2
.L1072:
	.word	.LANCHOR0
	.word	.LANCHOR1+2148
	.word	.LC0
	.fnend
	.size	set_h264_level, .-set_h264_level
	.align	1
	.global	get_h264_level
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_level, %function
get_h264_level:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1079
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1075
	movs	r2, #244
	ldr	r1, .L1079+4
	ldr	r0, .L1079+8
	bl	printk
.L1075:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1080:
	.align	2
.L1079:
	.word	.LANCHOR0
	.word	.LANCHOR1+2163
	.word	.LC0
	.fnend
	.size	get_h264_level, .-get_h264_level
	.align	1
	.global	set_h264_poc_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_poc_type, %function
set_h264_poc_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1090
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1082
	movs	r2, #244
	ldr	r1, .L1090+4
	ldr	r0, .L1090+8
	bl	printk
.L1082:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1083
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1024
	str	r3, [r6, r2]
.L1083:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1091:
	.align	2
.L1090:
	.word	.LANCHOR0
	.word	.LANCHOR1+2178
	.word	.LC0
	.fnend
	.size	set_h264_poc_type, .-set_h264_poc_type
	.align	1
	.global	get_h264_poc_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_poc_type, %function
get_h264_poc_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1097
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1093
	movs	r2, #244
	ldr	r1, .L1097+4
	ldr	r0, .L1097+8
	bl	printk
.L1093:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1098:
	.align	2
.L1097:
	.word	.LANCHOR0
	.word	.LANCHOR1+2196
	.word	.LC0
	.fnend
	.size	get_h264_poc_type, .-get_h264_poc_type
	.align	1
	.global	set_h264_log2_max_poc_lsb
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_log2_max_poc_lsb, %function
set_h264_log2_max_poc_lsb:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1108
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1100
	movs	r2, #244
	ldr	r1, .L1108+4
	ldr	r0, .L1108+8
	bl	printk
.L1100:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1101
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2048
	str	r3, [r6, r2]
.L1101:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1109:
	.align	2
.L1108:
	.word	.LANCHOR0
	.word	.LANCHOR1+2214
	.word	.LC0
	.fnend
	.size	set_h264_log2_max_poc_lsb, .-set_h264_log2_max_poc_lsb
	.align	1
	.global	get_h264_log2_max_poc_lsb
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_log2_max_poc_lsb, %function
get_h264_log2_max_poc_lsb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1115
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1111
	movs	r2, #244
	ldr	r1, .L1115+4
	ldr	r0, .L1115+8
	bl	printk
.L1111:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1116:
	.align	2
.L1115:
	.word	.LANCHOR0
	.word	.LANCHOR1+2240
	.word	.LC0
	.fnend
	.size	get_h264_log2_max_poc_lsb, .-get_h264_log2_max_poc_lsb
	.align	1
	.global	set_h264_log2_max_frm_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_log2_max_frm_num, %function
set_h264_log2_max_frm_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1126
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1118
	movs	r2, #244
	ldr	r1, .L1126+4
	ldr	r0, .L1126+8
	bl	printk
.L1118:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1119
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4096
	str	r3, [r6, r2]
.L1119:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1127:
	.align	2
.L1126:
	.word	.LANCHOR0
	.word	.LANCHOR1+2266
	.word	.LC0
	.fnend
	.size	set_h264_log2_max_frm_num, .-set_h264_log2_max_frm_num
	.align	1
	.global	get_h264_log2_max_frm_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_log2_max_frm_num, %function
get_h264_log2_max_frm_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1133
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1129
	movs	r2, #244
	ldr	r1, .L1133+4
	ldr	r0, .L1133+8
	bl	printk
.L1129:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1134:
	.align	2
.L1133:
	.word	.LANCHOR0
	.word	.LANCHOR1+2292
	.word	.LC0
	.fnend
	.size	get_h264_log2_max_frm_num, .-get_h264_log2_max_frm_num
	.align	1
	.global	set_h264_gaps_not_allowed
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_gaps_not_allowed, %function
set_h264_gaps_not_allowed:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1144
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1136
	movs	r2, #244
	ldr	r1, .L1144+4
	ldr	r0, .L1144+8
	bl	printk
.L1136:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1137
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #8192
	str	r3, [r6, r2]
.L1137:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1145:
	.align	2
.L1144:
	.word	.LANCHOR0
	.word	.LANCHOR1+2318
	.word	.LC0
	.fnend
	.size	set_h264_gaps_not_allowed, .-set_h264_gaps_not_allowed
	.align	1
	.global	get_h264_gaps_not_allowed
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_gaps_not_allowed, %function
get_h264_gaps_not_allowed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1151
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1147
	movs	r2, #244
	ldr	r1, .L1151+4
	ldr	r0, .L1151+8
	bl	printk
.L1147:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1152:
	.align	2
.L1151:
	.word	.LANCHOR0
	.word	.LANCHOR1+2344
	.word	.LC0
	.fnend
	.size	get_h264_gaps_not_allowed, .-get_h264_gaps_not_allowed
	.align	1
	.global	set_h264_cabac_en
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_cabac_en, %function
set_h264_cabac_en:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1162
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1154
	movs	r2, #244
	ldr	r1, .L1162+4
	ldr	r0, .L1162+8
	bl	printk
.L1154:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1155
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L1155:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1163:
	.align	2
.L1162:
	.word	.LANCHOR0
	.word	.LANCHOR1+2370
	.word	.LC0
	.fnend
	.size	set_h264_cabac_en, .-set_h264_cabac_en
	.align	1
	.global	get_h264_cabac_en
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_cabac_en, %function
get_h264_cabac_en:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1169
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1165
	movs	r2, #244
	ldr	r1, .L1169+4
	ldr	r0, .L1169+8
	bl	printk
.L1165:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1170:
	.align	2
.L1169:
	.word	.LANCHOR0
	.word	.LANCHOR1+2388
	.word	.LC0
	.fnend
	.size	get_h264_cabac_en, .-get_h264_cabac_en
	.align	1
	.global	set_h264_cabac_idc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_cabac_idc, %function
set_h264_cabac_idc:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1180
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1172
	movs	r2, #244
	ldr	r1, .L1180+4
	ldr	r0, .L1180+8
	bl	printk
.L1172:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1173
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L1173:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1181:
	.align	2
.L1180:
	.word	.LANCHOR0
	.word	.LANCHOR1+2406
	.word	.LC0
	.fnend
	.size	set_h264_cabac_idc, .-set_h264_cabac_idc
	.align	1
	.global	get_h264_cabac_idc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_cabac_idc, %function
get_h264_cabac_idc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1187
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1183
	movs	r2, #244
	ldr	r1, .L1187+4
	ldr	r0, .L1187+8
	bl	printk
.L1183:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1188:
	.align	2
.L1187:
	.word	.LANCHOR0
	.word	.LANCHOR1+2425
	.word	.LC0
	.fnend
	.size	get_h264_cabac_idc, .-get_h264_cabac_idc
	.align	1
	.global	set_h264_trans8x8
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_trans8x8, %function
set_h264_trans8x8:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1198
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1190
	movs	r2, #244
	ldr	r1, .L1198+4
	ldr	r0, .L1198+8
	bl	printk
.L1190:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1191
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16
	str	r3, [r6, r2]
.L1191:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1199:
	.align	2
.L1198:
	.word	.LANCHOR0
	.word	.LANCHOR1+2444
	.word	.LC0
	.fnend
	.size	set_h264_trans8x8, .-set_h264_trans8x8
	.align	1
	.global	get_h264_trans8x8
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_trans8x8, %function
get_h264_trans8x8:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1205
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1201
	movs	r2, #244
	ldr	r1, .L1205+4
	ldr	r0, .L1205+8
	bl	printk
.L1201:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1206:
	.align	2
.L1205:
	.word	.LANCHOR0
	.word	.LANCHOR1+2462
	.word	.LC0
	.fnend
	.size	get_h264_trans8x8, .-get_h264_trans8x8
	.align	1
	.global	set_h264_const_intra
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_const_intra, %function
set_h264_const_intra:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1216
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1208
	movs	r2, #244
	ldr	r1, .L1216+4
	ldr	r0, .L1216+8
	bl	printk
.L1208:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1209
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32
	str	r3, [r6, r2]
.L1209:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1217:
	.align	2
.L1216:
	.word	.LANCHOR0
	.word	.LANCHOR1+2480
	.word	.LC0
	.fnend
	.size	set_h264_const_intra, .-set_h264_const_intra
	.align	1
	.global	get_h264_const_intra
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_const_intra, %function
get_h264_const_intra:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1223
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1219
	movs	r2, #244
	ldr	r1, .L1223+4
	ldr	r0, .L1223+8
	bl	printk
.L1219:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1224:
	.align	2
.L1223:
	.word	.LANCHOR0
	.word	.LANCHOR1+2501
	.word	.LC0
	.fnend
	.size	get_h264_const_intra, .-get_h264_const_intra
	.align	1
	.global	set_h264_scaling_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_scaling_list, %function
set_h264_scaling_list:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1234
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1226
	movs	r2, #244
	ldr	r1, .L1234+4
	ldr	r0, .L1234+8
	bl	printk
.L1226:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1227
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #512
	str	r3, [r6, r2]
.L1227:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1235:
	.align	2
.L1234:
	.word	.LANCHOR0
	.word	.LANCHOR1+2522
	.word	.LC0
	.fnend
	.size	set_h264_scaling_list, .-set_h264_scaling_list
	.align	1
	.global	get_h264_scaling_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_scaling_list, %function
get_h264_scaling_list:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1241
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1237
	movs	r2, #244
	ldr	r1, .L1241+4
	ldr	r0, .L1241+8
	bl	printk
.L1237:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1242:
	.align	2
.L1241:
	.word	.LANCHOR0
	.word	.LANCHOR1+2544
	.word	.LC0
	.fnend
	.size	get_h264_scaling_list, .-get_h264_scaling_list
	.align	1
	.global	set_h264_cb_qp_offset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_cb_qp_offset, %function
set_h264_cb_qp_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1252
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1244
	movs	r2, #244
	ldr	r1, .L1252+4
	ldr	r0, .L1252+8
	bl	printk
.L1244:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1245
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #64
	str	r3, [r6, r2]
.L1245:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1253:
	.align	2
.L1252:
	.word	.LANCHOR0
	.word	.LANCHOR1+2566
	.word	.LC0
	.fnend
	.size	set_h264_cb_qp_offset, .-set_h264_cb_qp_offset
	.align	1
	.global	get_h264_cb_qp_offset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_cb_qp_offset, %function
get_h264_cb_qp_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1259
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1255
	movs	r2, #244
	ldr	r1, .L1259+4
	ldr	r0, .L1259+8
	bl	printk
.L1255:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1260:
	.align	2
.L1259:
	.word	.LANCHOR0
	.word	.LANCHOR1+2588
	.word	.LC0
	.fnend
	.size	get_h264_cb_qp_offset, .-get_h264_cb_qp_offset
	.align	1
	.global	set_h264_cr_qp_offset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_cr_qp_offset, %function
set_h264_cr_qp_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1270
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1262
	movs	r2, #244
	ldr	r1, .L1270+4
	ldr	r0, .L1270+8
	bl	printk
.L1262:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1263
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #64
	str	r3, [r6, r2]
.L1263:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1271:
	.align	2
.L1270:
	.word	.LANCHOR0
	.word	.LANCHOR1+2610
	.word	.LC0
	.fnend
	.size	set_h264_cr_qp_offset, .-set_h264_cr_qp_offset
	.align	1
	.global	get_h264_cr_qp_offset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_cr_qp_offset, %function
get_h264_cr_qp_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1277
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1273
	movs	r2, #244
	ldr	r1, .L1277+4
	ldr	r0, .L1277+8
	bl	printk
.L1273:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1278:
	.align	2
.L1277:
	.word	.LANCHOR0
	.word	.LANCHOR1+2632
	.word	.LC0
	.fnend
	.size	get_h264_cr_qp_offset, .-get_h264_cr_qp_offset
	.align	1
	.global	set_h264_dblk_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_dblk_disable, %function
set_h264_dblk_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1288
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1280
	movs	r2, #244
	ldr	r1, .L1288+4
	ldr	r0, .L1288+8
	bl	printk
.L1280:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1281
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #128
	str	r3, [r6, r2]
.L1281:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1289:
	.align	2
.L1288:
	.word	.LANCHOR0
	.word	.LANCHOR1+2654
	.word	.LC0
	.fnend
	.size	set_h264_dblk_disable, .-set_h264_dblk_disable
	.align	1
	.global	get_h264_dblk_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_dblk_disable, %function
get_h264_dblk_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1295
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1291
	movs	r2, #244
	ldr	r1, .L1295+4
	ldr	r0, .L1295+8
	bl	printk
.L1291:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1296:
	.align	2
.L1295:
	.word	.LANCHOR0
	.word	.LANCHOR1+2676
	.word	.LC0
	.fnend
	.size	get_h264_dblk_disable, .-get_h264_dblk_disable
	.align	1
	.global	set_h264_dblk_alpha
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_dblk_alpha, %function
set_h264_dblk_alpha:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1306
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1298
	movs	r2, #244
	ldr	r1, .L1306+4
	ldr	r0, .L1306+8
	bl	printk
.L1298:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1299
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #128
	str	r3, [r6, r2]
.L1299:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1307:
	.align	2
.L1306:
	.word	.LANCHOR0
	.word	.LANCHOR1+2698
	.word	.LC0
	.fnend
	.size	set_h264_dblk_alpha, .-set_h264_dblk_alpha
	.align	1
	.global	get_h264_dblk_alpha
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_dblk_alpha, %function
get_h264_dblk_alpha:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1313
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1309
	movs	r2, #244
	ldr	r1, .L1313+4
	ldr	r0, .L1313+8
	bl	printk
.L1309:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1314:
	.align	2
.L1313:
	.word	.LANCHOR0
	.word	.LANCHOR1+2718
	.word	.LC0
	.fnend
	.size	get_h264_dblk_alpha, .-get_h264_dblk_alpha
	.align	1
	.global	set_h264_dblk_beta
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_dblk_beta, %function
set_h264_dblk_beta:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1324
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1316
	movs	r2, #244
	ldr	r1, .L1324+4
	ldr	r0, .L1324+8
	bl	printk
.L1316:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1317
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #128
	str	r3, [r6, r2]
.L1317:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1325:
	.align	2
.L1324:
	.word	.LANCHOR0
	.word	.LANCHOR1+2738
	.word	.LC0
	.fnend
	.size	set_h264_dblk_beta, .-set_h264_dblk_beta
	.align	1
	.global	get_h264_dblk_beta
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_dblk_beta, %function
get_h264_dblk_beta:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1331
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1327
	movs	r2, #244
	ldr	r1, .L1331+4
	ldr	r0, .L1331+8
	bl	printk
.L1327:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1332:
	.align	2
.L1331:
	.word	.LANCHOR0
	.word	.LANCHOR1+2757
	.word	.LC0
	.fnend
	.size	get_h264_dblk_beta, .-get_h264_dblk_beta
	.align	1
	.global	set_h264_qp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_qp_init, %function
set_h264_qp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1342
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1334
	movs	r2, #244
	ldr	r1, .L1342+4
	ldr	r0, .L1342+8
	bl	printk
.L1334:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1335
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #65536
	str	r3, [r6, r2]
.L1335:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1343:
	.align	2
.L1342:
	.word	.LANCHOR0
	.word	.LANCHOR1+2776
	.word	.LC0
	.fnend
	.size	set_h264_qp_init, .-set_h264_qp_init
	.align	1
	.global	get_h264_qp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_qp_init, %function
get_h264_qp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1349
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1345
	movs	r2, #244
	ldr	r1, .L1349+4
	ldr	r0, .L1349+8
	bl	printk
.L1345:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1350:
	.align	2
.L1349:
	.word	.LANCHOR0
	.word	.LANCHOR1+2793
	.word	.LC0
	.fnend
	.size	get_h264_qp_init, .-get_h264_qp_init
	.align	1
	.global	set_h264_qp_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_qp_min, %function
set_h264_qp_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1360
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1352
	movs	r2, #244
	ldr	r1, .L1360+4
	ldr	r0, .L1360+8
	bl	printk
.L1352:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1353
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L1353:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1361:
	.align	2
.L1360:
	.word	.LANCHOR0
	.word	.LANCHOR1+2810
	.word	.LC0
	.fnend
	.size	set_h264_qp_min, .-set_h264_qp_min
	.align	1
	.global	get_h264_qp_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_qp_min, %function
get_h264_qp_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1367
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1363
	movs	r2, #244
	ldr	r1, .L1367+4
	ldr	r0, .L1367+8
	bl	printk
.L1363:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1368:
	.align	2
.L1367:
	.word	.LANCHOR0
	.word	.LANCHOR1+2826
	.word	.LC0
	.fnend
	.size	get_h264_qp_min, .-get_h264_qp_min
	.align	1
	.global	set_h264_qp_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_qp_max, %function
set_h264_qp_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1378
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1370
	movs	r2, #244
	ldr	r1, .L1378+4
	ldr	r0, .L1378+8
	bl	printk
.L1370:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1371
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L1371:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1379:
	.align	2
.L1378:
	.word	.LANCHOR0
	.word	.LANCHOR1+2842
	.word	.LC0
	.fnend
	.size	set_h264_qp_max, .-set_h264_qp_max
	.align	1
	.global	get_h264_qp_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_qp_max, %function
get_h264_qp_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1385
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1381
	movs	r2, #244
	ldr	r1, .L1385+4
	ldr	r0, .L1385+8
	bl	printk
.L1381:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1386:
	.align	2
.L1385:
	.word	.LANCHOR0
	.word	.LANCHOR1+2858
	.word	.LC0
	.fnend
	.size	get_h264_qp_max, .-get_h264_qp_max
	.align	1
	.global	set_h264_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_qp_min_i, %function
set_h264_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1396
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1388
	movs	r2, #244
	ldr	r1, .L1396+4
	ldr	r0, .L1396+8
	bl	printk
.L1388:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1389
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L1389:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1397:
	.align	2
.L1396:
	.word	.LANCHOR0
	.word	.LANCHOR1+2874
	.word	.LC0
	.fnend
	.size	set_h264_qp_min_i, .-set_h264_qp_min_i
	.align	1
	.global	get_h264_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_qp_min_i, %function
get_h264_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1403
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1399
	movs	r2, #244
	ldr	r1, .L1403+4
	ldr	r0, .L1403+8
	bl	printk
.L1399:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1404:
	.align	2
.L1403:
	.word	.LANCHOR0
	.word	.LANCHOR1+2892
	.word	.LC0
	.fnend
	.size	get_h264_qp_min_i, .-get_h264_qp_min_i
	.align	1
	.global	set_h264_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_qp_max_i, %function
set_h264_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1414
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1406
	movs	r2, #244
	ldr	r1, .L1414+4
	ldr	r0, .L1414+8
	bl	printk
.L1406:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1407
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L1407:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1415:
	.align	2
.L1414:
	.word	.LANCHOR0
	.word	.LANCHOR1+2910
	.word	.LC0
	.fnend
	.size	set_h264_qp_max_i, .-set_h264_qp_max_i
	.align	1
	.global	get_h264_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_qp_max_i, %function
get_h264_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1421
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1417
	movs	r2, #244
	ldr	r1, .L1421+4
	ldr	r0, .L1421+8
	bl	printk
.L1417:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1422:
	.align	2
.L1421:
	.word	.LANCHOR0
	.word	.LANCHOR1+2928
	.word	.LC0
	.fnend
	.size	get_h264_qp_max_i, .-get_h264_qp_max_i
	.align	1
	.global	set_h264_qp_step
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_qp_step, %function
set_h264_qp_step:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1432
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1424
	movs	r2, #244
	ldr	r1, .L1432+4
	ldr	r0, .L1432+8
	bl	printk
.L1424:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1425
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #524288
	str	r3, [r6, r2]
.L1425:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1433:
	.align	2
.L1432:
	.word	.LANCHOR0
	.word	.LANCHOR1+2946
	.word	.LC0
	.fnend
	.size	set_h264_qp_step, .-set_h264_qp_step
	.align	1
	.global	get_h264_qp_step
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_qp_step, %function
get_h264_qp_step:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1439
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1435
	movs	r2, #244
	ldr	r1, .L1439+4
	ldr	r0, .L1439+8
	bl	printk
.L1435:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1440:
	.align	2
.L1439:
	.word	.LANCHOR0
	.word	.LANCHOR1+2963
	.word	.LC0
	.fnend
	.size	get_h264_qp_step, .-get_h264_qp_step
	.align	1
	.global	set_h264_qp_delta_ip
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_qp_delta_ip, %function
set_h264_qp_delta_ip:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1450
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1442
	movs	r2, #244
	ldr	r1, .L1450+4
	ldr	r0, .L1450+8
	bl	printk
.L1442:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1443
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1048576
	str	r3, [r6, r2]
.L1443:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1451:
	.align	2
.L1450:
	.word	.LANCHOR0
	.word	.LANCHOR1+2980
	.word	.LC0
	.fnend
	.size	set_h264_qp_delta_ip, .-set_h264_qp_delta_ip
	.align	1
	.global	get_h264_qp_delta_ip
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_qp_delta_ip, %function
get_h264_qp_delta_ip:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1457
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1453
	movs	r2, #244
	ldr	r1, .L1457+4
	ldr	r0, .L1457+8
	bl	printk
.L1453:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1458:
	.align	2
.L1457:
	.word	.LANCHOR0
	.word	.LANCHOR1+3001
	.word	.LC0
	.fnend
	.size	get_h264_qp_delta_ip, .-get_h264_qp_delta_ip
	.align	1
	.global	set_h264_max_tid
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_max_tid, %function
set_h264_max_tid:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1468
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1460
	movs	r2, #244
	ldr	r1, .L1468+4
	ldr	r0, .L1468+8
	bl	printk
.L1460:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1461
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4194304
	str	r3, [r6, r2]
.L1461:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1469:
	.align	2
.L1468:
	.word	.LANCHOR0
	.word	.LANCHOR1+3022
	.word	.LC0
	.fnend
	.size	set_h264_max_tid, .-set_h264_max_tid
	.align	1
	.global	get_h264_max_tid
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_max_tid, %function
get_h264_max_tid:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1475
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1471
	movs	r2, #244
	ldr	r1, .L1475+4
	ldr	r0, .L1475+8
	bl	printk
.L1471:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1476:
	.align	2
.L1475:
	.word	.LANCHOR0
	.word	.LANCHOR1+3039
	.word	.LC0
	.fnend
	.size	get_h264_max_tid, .-get_h264_max_tid
	.align	1
	.global	set_h264_max_ltr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_max_ltr, %function
set_h264_max_ltr:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1486
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1478
	movs	r2, #244
	ldr	r1, .L1486+4
	ldr	r0, .L1486+8
	bl	printk
.L1478:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1479
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2097152
	str	r3, [r6, r2]
.L1479:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1487:
	.align	2
.L1486:
	.word	.LANCHOR0
	.word	.LANCHOR1+3056
	.word	.LC0
	.fnend
	.size	set_h264_max_ltr, .-set_h264_max_ltr
	.align	1
	.global	get_h264_max_ltr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_max_ltr, %function
get_h264_max_ltr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1493
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1489
	movs	r2, #244
	ldr	r1, .L1493+4
	ldr	r0, .L1493+8
	bl	printk
.L1489:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1494:
	.align	2
.L1493:
	.word	.LANCHOR0
	.word	.LANCHOR1+3073
	.word	.LC0
	.fnend
	.size	get_h264_max_ltr, .-get_h264_max_ltr
	.align	1
	.global	set_h264_prefix_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_prefix_mode, %function
set_h264_prefix_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1504
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1496
	movs	r2, #244
	ldr	r1, .L1504+4
	ldr	r0, .L1504+8
	bl	printk
.L1496:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1497
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #8388608
	str	r3, [r6, r2]
.L1497:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1505:
	.align	2
.L1504:
	.word	.LANCHOR0
	.word	.LANCHOR1+3090
	.word	.LC0
	.fnend
	.size	set_h264_prefix_mode, .-set_h264_prefix_mode
	.align	1
	.global	get_h264_prefix_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_prefix_mode, %function
get_h264_prefix_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1511
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1507
	movs	r2, #244
	ldr	r1, .L1511+4
	ldr	r0, .L1511+8
	bl	printk
.L1507:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1512:
	.align	2
.L1511:
	.word	.LANCHOR0
	.word	.LANCHOR1+3111
	.word	.LC0
	.fnend
	.size	get_h264_prefix_mode, .-get_h264_prefix_mode
	.align	1
	.global	set_h264_base_layer_pid
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h264_base_layer_pid, %function
set_h264_base_layer_pid:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1522
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1514
	movs	r2, #244
	ldr	r1, .L1522+4
	ldr	r0, .L1522+8
	bl	printk
.L1514:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1515
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16777216
	str	r3, [r6, r2]
.L1515:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1523:
	.align	2
.L1522:
	.word	.LANCHOR0
	.word	.LANCHOR1+3132
	.word	.LC0
	.fnend
	.size	set_h264_base_layer_pid, .-set_h264_base_layer_pid
	.align	1
	.global	get_h264_base_layer_pid
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h264_base_layer_pid, %function
get_h264_base_layer_pid:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1529
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1525
	movs	r2, #244
	ldr	r1, .L1529+4
	ldr	r0, .L1529+8
	bl	printk
.L1525:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1530:
	.align	2
.L1529:
	.word	.LANCHOR0
	.word	.LANCHOR1+3156
	.word	.LC0
	.fnend
	.size	get_h264_base_layer_pid, .-get_h264_base_layer_pid
	.align	1
	.global	set_h265_profile
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_profile, %function
set_h265_profile:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1540
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1532
	movs	r2, #244
	ldr	r1, .L1540+4
	ldr	r0, .L1540+8
	bl	printk
.L1532:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1533
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L1533:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1541:
	.align	2
.L1540:
	.word	.LANCHOR0
	.word	.LANCHOR1+3180
	.word	.LC0
	.fnend
	.size	set_h265_profile, .-set_h265_profile
	.align	1
	.global	get_h265_profile
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_profile, %function
get_h265_profile:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1547
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1543
	movs	r2, #244
	ldr	r1, .L1547+4
	ldr	r0, .L1547+8
	bl	printk
.L1543:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1548:
	.align	2
.L1547:
	.word	.LANCHOR0
	.word	.LANCHOR1+3197
	.word	.LC0
	.fnend
	.size	get_h265_profile, .-get_h265_profile
	.align	1
	.global	set_h265_level
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_level, %function
set_h265_level:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1558
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1550
	movs	r2, #244
	ldr	r1, .L1558+4
	ldr	r0, .L1558+8
	bl	printk
.L1550:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1551
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L1551:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1559:
	.align	2
.L1558:
	.word	.LANCHOR0
	.word	.LANCHOR1+3214
	.word	.LC0
	.fnend
	.size	set_h265_level, .-set_h265_level
	.align	1
	.global	get_h265_level
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_level, %function
get_h265_level:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1565
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1561
	movs	r2, #244
	ldr	r1, .L1565+4
	ldr	r0, .L1565+8
	bl	printk
.L1561:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1566:
	.align	2
.L1565:
	.word	.LANCHOR0
	.word	.LANCHOR1+3229
	.word	.LC0
	.fnend
	.size	get_h265_level, .-get_h265_level
	.align	1
	.global	set_h265_scaling_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_scaling_list, %function
set_h265_scaling_list:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1576
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1568
	movs	r2, #244
	ldr	r1, .L1576+4
	ldr	r0, .L1576+8
	bl	printk
.L1568:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1569
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16384
	str	r3, [r6, r2]
.L1569:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1577:
	.align	2
.L1576:
	.word	.LANCHOR0
	.word	.LANCHOR1+3244
	.word	.LC0
	.fnend
	.size	set_h265_scaling_list, .-set_h265_scaling_list
	.align	1
	.global	get_h265_scaling_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_scaling_list, %function
get_h265_scaling_list:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1583
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1579
	movs	r2, #244
	ldr	r1, .L1583+4
	ldr	r0, .L1583+8
	bl	printk
.L1579:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1584:
	.align	2
.L1583:
	.word	.LANCHOR0
	.word	.LANCHOR1+3266
	.word	.LC0
	.fnend
	.size	get_h265_scaling_list, .-get_h265_scaling_list
	.align	1
	.global	set_h265_cb_qp_offset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_cb_qp_offset, %function
set_h265_cb_qp_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1594
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1586
	movs	r2, #244
	ldr	r1, .L1594+4
	ldr	r0, .L1594+8
	bl	printk
.L1586:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1587
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16384
	str	r3, [r6, r2]
.L1587:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1595:
	.align	2
.L1594:
	.word	.LANCHOR0
	.word	.LANCHOR1+3288
	.word	.LC0
	.fnend
	.size	set_h265_cb_qp_offset, .-set_h265_cb_qp_offset
	.align	1
	.global	get_h265_cb_qp_offset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_cb_qp_offset, %function
get_h265_cb_qp_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1601
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1597
	movs	r2, #244
	ldr	r1, .L1601+4
	ldr	r0, .L1601+8
	bl	printk
.L1597:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1602:
	.align	2
.L1601:
	.word	.LANCHOR0
	.word	.LANCHOR1+3310
	.word	.LC0
	.fnend
	.size	get_h265_cb_qp_offset, .-get_h265_cb_qp_offset
	.align	1
	.global	set_h265_cr_qp_offset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_cr_qp_offset, %function
set_h265_cr_qp_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1612
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1604
	movs	r2, #244
	ldr	r1, .L1612+4
	ldr	r0, .L1612+8
	bl	printk
.L1604:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1605
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16384
	str	r3, [r6, r2]
.L1605:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1613:
	.align	2
.L1612:
	.word	.LANCHOR0
	.word	.LANCHOR1+3332
	.word	.LC0
	.fnend
	.size	set_h265_cr_qp_offset, .-set_h265_cr_qp_offset
	.align	1
	.global	get_h265_cr_qp_offset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_cr_qp_offset, %function
get_h265_cr_qp_offset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1619
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1615
	movs	r2, #244
	ldr	r1, .L1619+4
	ldr	r0, .L1619+8
	bl	printk
.L1615:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1620:
	.align	2
.L1619:
	.word	.LANCHOR0
	.word	.LANCHOR1+3354
	.word	.LC0
	.fnend
	.size	get_h265_cr_qp_offset, .-get_h265_cr_qp_offset
	.align	1
	.global	set_h265_dblk_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_dblk_disable, %function
set_h265_dblk_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1630
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1622
	movs	r2, #244
	ldr	r1, .L1630+4
	ldr	r0, .L1630+8
	bl	printk
.L1622:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1623
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4096
	str	r3, [r6, r2]
.L1623:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1631:
	.align	2
.L1630:
	.word	.LANCHOR0
	.word	.LANCHOR1+3376
	.word	.LC0
	.fnend
	.size	set_h265_dblk_disable, .-set_h265_dblk_disable
	.align	1
	.global	get_h265_dblk_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_dblk_disable, %function
get_h265_dblk_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1637
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1633
	movs	r2, #244
	ldr	r1, .L1637+4
	ldr	r0, .L1637+8
	bl	printk
.L1633:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1638:
	.align	2
.L1637:
	.word	.LANCHOR0
	.word	.LANCHOR1+3398
	.word	.LC0
	.fnend
	.size	get_h265_dblk_disable, .-get_h265_dblk_disable
	.align	1
	.global	set_h265_dblk_alpha
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_dblk_alpha, %function
set_h265_dblk_alpha:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1648
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1640
	movs	r2, #244
	ldr	r1, .L1648+4
	ldr	r0, .L1648+8
	bl	printk
.L1640:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1641
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4096
	str	r3, [r6, r2]
.L1641:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1649:
	.align	2
.L1648:
	.word	.LANCHOR0
	.word	.LANCHOR1+3420
	.word	.LC0
	.fnend
	.size	set_h265_dblk_alpha, .-set_h265_dblk_alpha
	.align	1
	.global	get_h265_dblk_alpha
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_dblk_alpha, %function
get_h265_dblk_alpha:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1655
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1651
	movs	r2, #244
	ldr	r1, .L1655+4
	ldr	r0, .L1655+8
	bl	printk
.L1651:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1656:
	.align	2
.L1655:
	.word	.LANCHOR0
	.word	.LANCHOR1+3440
	.word	.LC0
	.fnend
	.size	get_h265_dblk_alpha, .-get_h265_dblk_alpha
	.align	1
	.global	set_h265_dblk_beta
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_dblk_beta, %function
set_h265_dblk_beta:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1666
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1658
	movs	r2, #244
	ldr	r1, .L1666+4
	ldr	r0, .L1666+8
	bl	printk
.L1658:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1659
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4096
	str	r3, [r6, r2]
.L1659:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1667:
	.align	2
.L1666:
	.word	.LANCHOR0
	.word	.LANCHOR1+3460
	.word	.LC0
	.fnend
	.size	set_h265_dblk_beta, .-set_h265_dblk_beta
	.align	1
	.global	get_h265_dblk_beta
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_dblk_beta, %function
get_h265_dblk_beta:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1673
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1669
	movs	r2, #244
	ldr	r1, .L1673+4
	ldr	r0, .L1673+8
	bl	printk
.L1669:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1674:
	.align	2
.L1673:
	.word	.LANCHOR0
	.word	.LANCHOR1+3479
	.word	.LC0
	.fnend
	.size	get_h265_dblk_beta, .-get_h265_dblk_beta
	.align	1
	.global	set_h265_qp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_qp_init, %function
set_h265_qp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1684
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1676
	movs	r2, #244
	ldr	r1, .L1684+4
	ldr	r0, .L1684+8
	bl	printk
.L1676:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1677
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #65536
	str	r3, [r6, r2]
.L1677:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1685:
	.align	2
.L1684:
	.word	.LANCHOR0
	.word	.LANCHOR1+3498
	.word	.LC0
	.fnend
	.size	set_h265_qp_init, .-set_h265_qp_init
	.align	1
	.global	get_h265_qp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_qp_init, %function
get_h265_qp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1691
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1687
	movs	r2, #244
	ldr	r1, .L1691+4
	ldr	r0, .L1691+8
	bl	printk
.L1687:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1692:
	.align	2
.L1691:
	.word	.LANCHOR0
	.word	.LANCHOR1+3515
	.word	.LC0
	.fnend
	.size	get_h265_qp_init, .-get_h265_qp_init
	.align	1
	.global	set_h265_qp_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_qp_min, %function
set_h265_qp_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1702
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1694
	movs	r2, #244
	ldr	r1, .L1702+4
	ldr	r0, .L1702+8
	bl	printk
.L1694:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1695
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L1695:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1703:
	.align	2
.L1702:
	.word	.LANCHOR0
	.word	.LANCHOR1+3532
	.word	.LC0
	.fnend
	.size	set_h265_qp_min, .-set_h265_qp_min
	.align	1
	.global	get_h265_qp_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_qp_min, %function
get_h265_qp_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1709
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1705
	movs	r2, #244
	ldr	r1, .L1709+4
	ldr	r0, .L1709+8
	bl	printk
.L1705:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1710:
	.align	2
.L1709:
	.word	.LANCHOR0
	.word	.LANCHOR1+3548
	.word	.LC0
	.fnend
	.size	get_h265_qp_min, .-get_h265_qp_min
	.align	1
	.global	set_h265_qp_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_qp_max, %function
set_h265_qp_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1720
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1712
	movs	r2, #244
	ldr	r1, .L1720+4
	ldr	r0, .L1720+8
	bl	printk
.L1712:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1713
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L1713:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1721:
	.align	2
.L1720:
	.word	.LANCHOR0
	.word	.LANCHOR1+3564
	.word	.LC0
	.fnend
	.size	set_h265_qp_max, .-set_h265_qp_max
	.align	1
	.global	get_h265_qp_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_qp_max, %function
get_h265_qp_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1727
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1723
	movs	r2, #244
	ldr	r1, .L1727+4
	ldr	r0, .L1727+8
	bl	printk
.L1723:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1728:
	.align	2
.L1727:
	.word	.LANCHOR0
	.word	.LANCHOR1+3580
	.word	.LC0
	.fnend
	.size	get_h265_qp_max, .-get_h265_qp_max
	.align	1
	.global	set_h265_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_qp_min_i, %function
set_h265_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1738
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1730
	movs	r2, #244
	ldr	r1, .L1738+4
	ldr	r0, .L1738+8
	bl	printk
.L1730:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1731
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L1731:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1739:
	.align	2
.L1738:
	.word	.LANCHOR0
	.word	.LANCHOR1+3596
	.word	.LC0
	.fnend
	.size	set_h265_qp_min_i, .-set_h265_qp_min_i
	.align	1
	.global	get_h265_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_qp_min_i, %function
get_h265_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1745
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1741
	movs	r2, #244
	ldr	r1, .L1745+4
	ldr	r0, .L1745+8
	bl	printk
.L1741:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1746:
	.align	2
.L1745:
	.word	.LANCHOR0
	.word	.LANCHOR1+3614
	.word	.LC0
	.fnend
	.size	get_h265_qp_min_i, .-get_h265_qp_min_i
	.align	1
	.global	set_h265_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_qp_max_i, %function
set_h265_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1756
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1748
	movs	r2, #244
	ldr	r1, .L1756+4
	ldr	r0, .L1756+8
	bl	printk
.L1748:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1749
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L1749:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1757:
	.align	2
.L1756:
	.word	.LANCHOR0
	.word	.LANCHOR1+3632
	.word	.LC0
	.fnend
	.size	set_h265_qp_max_i, .-set_h265_qp_max_i
	.align	1
	.global	get_h265_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_qp_max_i, %function
get_h265_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1763
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1759
	movs	r2, #244
	ldr	r1, .L1763+4
	ldr	r0, .L1763+8
	bl	printk
.L1759:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1764:
	.align	2
.L1763:
	.word	.LANCHOR0
	.word	.LANCHOR1+3650
	.word	.LC0
	.fnend
	.size	get_h265_qp_max_i, .-get_h265_qp_max_i
	.align	1
	.global	set_h265_qp_step
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_qp_step, %function
set_h265_qp_step:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1774
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1766
	movs	r2, #244
	ldr	r1, .L1774+4
	ldr	r0, .L1774+8
	bl	printk
.L1766:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1767
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #524288
	str	r3, [r6, r2]
.L1767:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1775:
	.align	2
.L1774:
	.word	.LANCHOR0
	.word	.LANCHOR1+3668
	.word	.LC0
	.fnend
	.size	set_h265_qp_step, .-set_h265_qp_step
	.align	1
	.global	get_h265_qp_step
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_qp_step, %function
get_h265_qp_step:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1781
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1777
	movs	r2, #244
	ldr	r1, .L1781+4
	ldr	r0, .L1781+8
	bl	printk
.L1777:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1782:
	.align	2
.L1781:
	.word	.LANCHOR0
	.word	.LANCHOR1+3685
	.word	.LC0
	.fnend
	.size	get_h265_qp_step, .-get_h265_qp_step
	.align	1
	.global	set_h265_qp_delta_ip
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_qp_delta_ip, %function
set_h265_qp_delta_ip:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1792
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1784
	movs	r2, #244
	ldr	r1, .L1792+4
	ldr	r0, .L1792+8
	bl	printk
.L1784:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1785
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1048576
	str	r3, [r6, r2]
.L1785:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1793:
	.align	2
.L1792:
	.word	.LANCHOR0
	.word	.LANCHOR1+3702
	.word	.LC0
	.fnend
	.size	set_h265_qp_delta_ip, .-set_h265_qp_delta_ip
	.align	1
	.global	get_h265_qp_delta_ip
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_qp_delta_ip, %function
get_h265_qp_delta_ip:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1799
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1795
	movs	r2, #244
	ldr	r1, .L1799+4
	ldr	r0, .L1799+8
	bl	printk
.L1795:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1800:
	.align	2
.L1799:
	.word	.LANCHOR0
	.word	.LANCHOR1+3723
	.word	.LC0
	.fnend
	.size	get_h265_qp_delta_ip, .-get_h265_qp_delta_ip
	.align	1
	.global	set_h265_sao_luma_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_sao_luma_disable, %function
set_h265_sao_luma_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1810
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1802
	movs	r2, #244
	ldr	r1, .L1810+4
	ldr	r0, .L1810+8
	bl	printk
.L1802:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1803
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #8192
	str	r3, [r6, r2]
.L1803:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1811:
	.align	2
.L1810:
	.word	.LANCHOR0
	.word	.LANCHOR1+3744
	.word	.LC0
	.fnend
	.size	set_h265_sao_luma_disable, .-set_h265_sao_luma_disable
	.align	1
	.global	get_h265_sao_luma_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_sao_luma_disable, %function
get_h265_sao_luma_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1817
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1813
	movs	r2, #244
	ldr	r1, .L1817+4
	ldr	r0, .L1817+8
	bl	printk
.L1813:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1818:
	.align	2
.L1817:
	.word	.LANCHOR0
	.word	.LANCHOR1+3770
	.word	.LC0
	.fnend
	.size	get_h265_sao_luma_disable, .-get_h265_sao_luma_disable
	.align	1
	.global	set_h265_sao_chroma_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_sao_chroma_disable, %function
set_h265_sao_chroma_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1828
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1820
	movs	r2, #244
	ldr	r1, .L1828+4
	ldr	r0, .L1828+8
	bl	printk
.L1820:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1821
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #8192
	str	r3, [r6, r2]
.L1821:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1829:
	.align	2
.L1828:
	.word	.LANCHOR0
	.word	.LANCHOR1+3796
	.word	.LC0
	.fnend
	.size	set_h265_sao_chroma_disable, .-set_h265_sao_chroma_disable
	.align	1
	.global	get_h265_sao_chroma_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_sao_chroma_disable, %function
get_h265_sao_chroma_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1835
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1831
	movs	r2, #244
	ldr	r1, .L1835+4
	ldr	r0, .L1835+8
	bl	printk
.L1831:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1836:
	.align	2
.L1835:
	.word	.LANCHOR0
	.word	.LANCHOR1+3824
	.word	.LC0
	.fnend
	.size	get_h265_sao_chroma_disable, .-get_h265_sao_chroma_disable
	.align	1
	.global	set_h265_sao_bit_ratio
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_h265_sao_bit_ratio, %function
set_h265_sao_bit_ratio:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1846
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1838
	movs	r2, #244
	ldr	r1, .L1846+4
	ldr	r0, .L1846+8
	bl	printk
.L1838:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1839
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #8192
	str	r3, [r6, r2]
.L1839:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1847:
	.align	2
.L1846:
	.word	.LANCHOR0
	.word	.LANCHOR1+3852
	.word	.LC0
	.fnend
	.size	set_h265_sao_bit_ratio, .-set_h265_sao_bit_ratio
	.align	1
	.global	get_h265_sao_bit_ratio
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_h265_sao_bit_ratio, %function
get_h265_sao_bit_ratio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1853
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1849
	movs	r2, #244
	ldr	r1, .L1853+4
	ldr	r0, .L1853+8
	bl	printk
.L1849:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1854:
	.align	2
.L1853:
	.word	.LANCHOR0
	.word	.LANCHOR1+3875
	.word	.LC0
	.fnend
	.size	get_h265_sao_bit_ratio, .-get_h265_sao_bit_ratio
	.align	1
	.global	set_vp8_qp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_vp8_qp_init, %function
set_vp8_qp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1864
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1856
	movs	r2, #244
	ldr	r1, .L1864+4
	ldr	r0, .L1864+8
	bl	printk
.L1856:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1857
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #65536
	str	r3, [r6, r2]
.L1857:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1865:
	.align	2
.L1864:
	.word	.LANCHOR0
	.word	.LANCHOR1+3898
	.word	.LC0
	.fnend
	.size	set_vp8_qp_init, .-set_vp8_qp_init
	.align	1
	.global	get_vp8_qp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vp8_qp_init, %function
get_vp8_qp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1871
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1867
	movs	r2, #244
	ldr	r1, .L1871+4
	ldr	r0, .L1871+8
	bl	printk
.L1867:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1872:
	.align	2
.L1871:
	.word	.LANCHOR0
	.word	.LANCHOR1+3914
	.word	.LC0
	.fnend
	.size	get_vp8_qp_init, .-get_vp8_qp_init
	.align	1
	.global	set_vp8_qp_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_vp8_qp_min, %function
set_vp8_qp_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1882
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1874
	movs	r2, #244
	ldr	r1, .L1882+4
	ldr	r0, .L1882+8
	bl	printk
.L1874:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1875
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L1875:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1883:
	.align	2
.L1882:
	.word	.LANCHOR0
	.word	.LANCHOR1+3930
	.word	.LC0
	.fnend
	.size	set_vp8_qp_min, .-set_vp8_qp_min
	.align	1
	.global	get_vp8_qp_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vp8_qp_min, %function
get_vp8_qp_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1889
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1885
	movs	r2, #244
	ldr	r1, .L1889+4
	ldr	r0, .L1889+8
	bl	printk
.L1885:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1890:
	.align	2
.L1889:
	.word	.LANCHOR0
	.word	.LANCHOR1+3945
	.word	.LC0
	.fnend
	.size	get_vp8_qp_min, .-get_vp8_qp_min
	.align	1
	.global	set_vp8_qp_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_vp8_qp_max, %function
set_vp8_qp_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1900
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1892
	movs	r2, #244
	ldr	r1, .L1900+4
	ldr	r0, .L1900+8
	bl	printk
.L1892:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1893
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #131072
	str	r3, [r6, r2]
.L1893:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1901:
	.align	2
.L1900:
	.word	.LANCHOR0
	.word	.LANCHOR1+3960
	.word	.LC0
	.fnend
	.size	set_vp8_qp_max, .-set_vp8_qp_max
	.align	1
	.global	get_vp8_qp_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vp8_qp_max, %function
get_vp8_qp_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1907
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1903
	movs	r2, #244
	ldr	r1, .L1907+4
	ldr	r0, .L1907+8
	bl	printk
.L1903:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1908:
	.align	2
.L1907:
	.word	.LANCHOR0
	.word	.LANCHOR1+3975
	.word	.LC0
	.fnend
	.size	get_vp8_qp_max, .-get_vp8_qp_max
	.align	1
	.global	set_vp8_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_vp8_qp_min_i, %function
set_vp8_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1918
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1910
	movs	r2, #244
	ldr	r1, .L1918+4
	ldr	r0, .L1918+8
	bl	printk
.L1910:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1911
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L1911:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1919:
	.align	2
.L1918:
	.word	.LANCHOR0
	.word	.LANCHOR1+3990
	.word	.LC0
	.fnend
	.size	set_vp8_qp_min_i, .-set_vp8_qp_min_i
	.align	1
	.global	get_vp8_qp_min_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vp8_qp_min_i, %function
get_vp8_qp_min_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1925
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1921
	movs	r2, #244
	ldr	r1, .L1925+4
	ldr	r0, .L1925+8
	bl	printk
.L1921:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1926:
	.align	2
.L1925:
	.word	.LANCHOR0
	.word	.LANCHOR1+4007
	.word	.LC0
	.fnend
	.size	get_vp8_qp_min_i, .-get_vp8_qp_min_i
	.align	1
	.global	set_vp8_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_vp8_qp_max_i, %function
set_vp8_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1936
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1928
	movs	r2, #244
	ldr	r1, .L1936+4
	ldr	r0, .L1936+8
	bl	printk
.L1928:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1929
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #262144
	str	r3, [r6, r2]
.L1929:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1937:
	.align	2
.L1936:
	.word	.LANCHOR0
	.word	.LANCHOR1+4024
	.word	.LC0
	.fnend
	.size	set_vp8_qp_max_i, .-set_vp8_qp_max_i
	.align	1
	.global	get_vp8_qp_max_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vp8_qp_max_i, %function
get_vp8_qp_max_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1943
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1939
	movs	r2, #244
	ldr	r1, .L1943+4
	ldr	r0, .L1943+8
	bl	printk
.L1939:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1944:
	.align	2
.L1943:
	.word	.LANCHOR0
	.word	.LANCHOR1+4041
	.word	.LC0
	.fnend
	.size	get_vp8_qp_max_i, .-get_vp8_qp_max_i
	.align	1
	.global	set_vp8_qp_step
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_vp8_qp_step, %function
set_vp8_qp_step:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1954
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1946
	movs	r2, #244
	ldr	r1, .L1954+4
	ldr	r0, .L1954+8
	bl	printk
.L1946:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1947
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #524288
	str	r3, [r6, r2]
.L1947:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1955:
	.align	2
.L1954:
	.word	.LANCHOR0
	.word	.LANCHOR1+4058
	.word	.LC0
	.fnend
	.size	set_vp8_qp_step, .-set_vp8_qp_step
	.align	1
	.global	get_vp8_qp_step
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vp8_qp_step, %function
get_vp8_qp_step:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1961
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1957
	movs	r2, #244
	ldr	r1, .L1961+4
	ldr	r0, .L1961+8
	bl	printk
.L1957:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1962:
	.align	2
.L1961:
	.word	.LANCHOR0
	.word	.LANCHOR1+4074
	.word	.LC0
	.fnend
	.size	get_vp8_qp_step, .-get_vp8_qp_step
	.align	1
	.global	set_vp8_qp_delta_ip
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_vp8_qp_delta_ip, %function
set_vp8_qp_delta_ip:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1972
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1964
	movs	r2, #244
	ldr	r1, .L1972+4
	ldr	r0, .L1972+8
	bl	printk
.L1964:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1965
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1048576
	str	r3, [r6, r2]
.L1965:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1973:
	.align	2
.L1972:
	.word	.LANCHOR0
	.word	.LANCHOR1+4090
	.word	.LC0
	.fnend
	.size	set_vp8_qp_delta_ip, .-set_vp8_qp_delta_ip
	.align	1
	.global	get_vp8_qp_delta_ip
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vp8_qp_delta_ip, %function
get_vp8_qp_delta_ip:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1979
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1975
	movs	r2, #244
	ldr	r1, .L1979+4
	ldr	r0, .L1979+8
	bl	printk
.L1975:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1980:
	.align	2
.L1979:
	.word	.LANCHOR0
	.word	.LANCHOR2-234
	.word	.LC0
	.fnend
	.size	get_vp8_qp_delta_ip, .-get_vp8_qp_delta_ip
	.align	1
	.global	set_vp8_disable_ivf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_vp8_disable_ivf, %function
set_vp8_disable_ivf:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1990
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L1982
	movs	r2, #244
	ldr	r1, .L1990+4
	ldr	r0, .L1990+8
	bl	printk
.L1982:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L1983
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2
	str	r3, [r6, r2]
.L1983:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1991:
	.align	2
.L1990:
	.word	.LANCHOR0
	.word	.LANCHOR2-214
	.word	.LC0
	.fnend
	.size	set_vp8_disable_ivf, .-set_vp8_disable_ivf
	.align	1
	.global	get_vp8_disable_ivf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vp8_disable_ivf, %function
get_vp8_disable_ivf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1997
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L1993
	movs	r2, #244
	ldr	r1, .L1997+4
	ldr	r0, .L1997+8
	bl	printk
.L1993:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1998:
	.align	2
.L1997:
	.word	.LANCHOR0
	.word	.LANCHOR2-194
	.word	.LC0
	.fnend
	.size	get_vp8_disable_ivf, .-get_vp8_disable_ivf
	.align	1
	.global	set_jpeg_quant
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_jpeg_quant, %function
set_jpeg_quant:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2008
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2000
	movs	r2, #244
	ldr	r1, .L2008+4
	ldr	r0, .L2008+8
	bl	printk
.L2000:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2001
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L2001:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2009:
	.align	2
.L2008:
	.word	.LANCHOR0
	.word	.LANCHOR2-174
	.word	.LC0
	.fnend
	.size	set_jpeg_quant, .-set_jpeg_quant
	.align	1
	.global	get_jpeg_quant
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_jpeg_quant, %function
get_jpeg_quant:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2015
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2011
	movs	r2, #244
	ldr	r1, .L2015+4
	ldr	r0, .L2015+8
	bl	printk
.L2011:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2016:
	.align	2
.L2015:
	.word	.LANCHOR0
	.word	.LANCHOR2-159
	.word	.LC0
	.fnend
	.size	get_jpeg_quant, .-get_jpeg_quant
	.align	1
	.global	set_jpeg_qtable_y
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_jpeg_qtable_y, %function
set_jpeg_qtable_y:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2022
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r3]
	mov	r5, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2018
	movs	r2, #244
	ldr	r1, .L2022+4
	ldr	r0, .L2022+8
	bl	printk
.L2018:
	ldrh	r2, [r5, #4]
	add	r1, sp, #4
	ldrh	r0, [r5, #6]
	lsrs	r2, r2, #4
	add	r0, r0, r4
	bl	memcpy
	ldrh	r2, [r5, #10]
	movs	r0, #0
	ldr	r3, [r4, r2]
	orr	r3, r3, #2
	str	r3, [r4, r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L2023:
	.align	2
.L2022:
	.word	.LANCHOR0
	.word	.LANCHOR2-144
	.word	.LC0
	.fnend
	.size	set_jpeg_qtable_y, .-set_jpeg_qtable_y
	.align	1
	.global	get_jpeg_qtable_y
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_jpeg_qtable_y, %function
get_jpeg_qtable_y:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2029
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2025
	movs	r2, #244
	ldr	r1, .L2029+4
	ldr	r0, .L2029+8
	bl	printk
.L2025:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2030:
	.align	2
.L2029:
	.word	.LANCHOR0
	.word	.LANCHOR2-126
	.word	.LC0
	.fnend
	.size	get_jpeg_qtable_y, .-get_jpeg_qtable_y
	.align	1
	.global	set_jpeg_qtable_u
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_jpeg_qtable_u, %function
set_jpeg_qtable_u:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2036
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r3]
	mov	r5, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2032
	movs	r2, #244
	ldr	r1, .L2036+4
	ldr	r0, .L2036+8
	bl	printk
.L2032:
	ldrh	r2, [r5, #4]
	add	r1, sp, #4
	ldrh	r0, [r5, #6]
	lsrs	r2, r2, #4
	add	r0, r0, r4
	bl	memcpy
	ldrh	r2, [r5, #10]
	movs	r0, #0
	ldr	r3, [r4, r2]
	orr	r3, r3, #2
	str	r3, [r4, r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L2037:
	.align	2
.L2036:
	.word	.LANCHOR0
	.word	.LANCHOR2-108
	.word	.LC0
	.fnend
	.size	set_jpeg_qtable_u, .-set_jpeg_qtable_u
	.align	1
	.global	get_jpeg_qtable_u
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_jpeg_qtable_u, %function
get_jpeg_qtable_u:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2043
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2039
	movs	r2, #244
	ldr	r1, .L2043+4
	ldr	r0, .L2043+8
	bl	printk
.L2039:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2044:
	.align	2
.L2043:
	.word	.LANCHOR0
	.word	.LANCHOR2-90
	.word	.LC0
	.fnend
	.size	get_jpeg_qtable_u, .-get_jpeg_qtable_u
	.align	1
	.global	set_jpeg_qtable_v
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_jpeg_qtable_v, %function
set_jpeg_qtable_v:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2050
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r3]
	mov	r5, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2046
	movs	r2, #244
	ldr	r1, .L2050+4
	ldr	r0, .L2050+8
	bl	printk
.L2046:
	ldrh	r2, [r5, #4]
	add	r1, sp, #4
	ldrh	r0, [r5, #6]
	lsrs	r2, r2, #4
	add	r0, r0, r4
	bl	memcpy
	ldrh	r2, [r5, #10]
	movs	r0, #0
	ldr	r3, [r4, r2]
	orr	r3, r3, #2
	str	r3, [r4, r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L2051:
	.align	2
.L2050:
	.word	.LANCHOR0
	.word	.LANCHOR2-72
	.word	.LC0
	.fnend
	.size	set_jpeg_qtable_v, .-set_jpeg_qtable_v
	.align	1
	.global	get_jpeg_qtable_v
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_jpeg_qtable_v, %function
get_jpeg_qtable_v:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2057
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2053
	movs	r2, #244
	ldr	r1, .L2057+4
	ldr	r0, .L2057+8
	bl	printk
.L2053:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2058:
	.align	2
.L2057:
	.word	.LANCHOR0
	.word	.LANCHOR2-54
	.word	.LC0
	.fnend
	.size	get_jpeg_qtable_v, .-get_jpeg_qtable_v
	.align	1
	.global	set_jpeg_q_factor
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_jpeg_q_factor, %function
set_jpeg_q_factor:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2068
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2060
	movs	r2, #244
	ldr	r1, .L2068+4
	ldr	r0, .L2068+8
	bl	printk
.L2060:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2061
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L2061:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2069:
	.align	2
.L2068:
	.word	.LANCHOR0
	.word	.LANCHOR2-36
	.word	.LC0
	.fnend
	.size	set_jpeg_q_factor, .-set_jpeg_q_factor
	.align	1
	.global	get_jpeg_q_factor
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_jpeg_q_factor, %function
get_jpeg_q_factor:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2075
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2071
	movs	r2, #244
	ldr	r1, .L2075+4
	ldr	r0, .L2075+8
	bl	printk
.L2071:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2076:
	.align	2
.L2075:
	.word	.LANCHOR0
	.word	.LANCHOR2-18
	.word	.LC0
	.fnend
	.size	get_jpeg_q_factor, .-get_jpeg_q_factor
	.align	1
	.global	set_jpeg_qf_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_jpeg_qf_max, %function
set_jpeg_qf_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2086
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2078
	movs	r2, #244
	ldr	r1, .L2086+4
	ldr	r0, .L2086+8
	bl	printk
.L2078:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2079
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L2079:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2087:
	.align	2
.L2086:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	.LC0
	.fnend
	.size	set_jpeg_qf_max, .-set_jpeg_qf_max
	.align	1
	.global	get_jpeg_qf_max
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_jpeg_qf_max, %function
get_jpeg_qf_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2093
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2089
	movs	r2, #244
	ldr	r1, .L2093+4
	ldr	r0, .L2093+8
	bl	printk
.L2089:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2094:
	.align	2
.L2093:
	.word	.LANCHOR0
	.word	.LANCHOR2+16
	.word	.LC0
	.fnend
	.size	get_jpeg_qf_max, .-get_jpeg_qf_max
	.align	1
	.global	set_jpeg_qf_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_jpeg_qf_min, %function
set_jpeg_qf_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2104
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2096
	movs	r2, #244
	ldr	r1, .L2104+4
	ldr	r0, .L2104+8
	bl	printk
.L2096:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2097
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L2097:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2105:
	.align	2
.L2104:
	.word	.LANCHOR0
	.word	.LANCHOR2+32
	.word	.LC0
	.fnend
	.size	set_jpeg_qf_min, .-set_jpeg_qf_min
	.align	1
	.global	get_jpeg_qf_min
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_jpeg_qf_min, %function
get_jpeg_qf_min:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2111
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2107
	movs	r2, #244
	ldr	r1, .L2111+4
	ldr	r0, .L2111+8
	bl	printk
.L2107:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2112:
	.align	2
.L2111:
	.word	.LANCHOR0
	.word	.LANCHOR2+48
	.word	.LC0
	.fnend
	.size	get_jpeg_qf_min, .-get_jpeg_qf_min
	.align	1
	.global	set_split_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_split_mode, %function
set_split_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2122
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2114
	movs	r2, #244
	ldr	r1, .L2122+4
	ldr	r0, .L2122+8
	bl	printk
.L2114:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2115
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L2115:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2123:
	.align	2
.L2122:
	.word	.LANCHOR0
	.word	.LANCHOR2+64
	.word	.LC0
	.fnend
	.size	set_split_mode, .-set_split_mode
	.align	1
	.global	get_split_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_split_mode, %function
get_split_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2129
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2125
	movs	r2, #244
	ldr	r1, .L2129+4
	ldr	r0, .L2129+8
	bl	printk
.L2125:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2130:
	.align	2
.L2129:
	.word	.LANCHOR0
	.word	.LANCHOR2+79
	.word	.LC0
	.fnend
	.size	get_split_mode, .-get_split_mode
	.align	1
	.global	set_split_arg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_split_arg, %function
set_split_arg:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2140
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2132
	movs	r2, #244
	ldr	r1, .L2140+4
	ldr	r0, .L2140+8
	bl	printk
.L2132:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2133
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2
	str	r3, [r6, r2]
.L2133:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2141:
	.align	2
.L2140:
	.word	.LANCHOR0
	.word	.LANCHOR2+94
	.word	.LC0
	.fnend
	.size	set_split_arg, .-set_split_arg
	.align	1
	.global	get_split_arg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_split_arg, %function
get_split_arg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2147
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2143
	movs	r2, #244
	ldr	r1, .L2147+4
	ldr	r0, .L2147+8
	bl	printk
.L2143:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2148:
	.align	2
.L2147:
	.word	.LANCHOR0
	.word	.LANCHOR2+108
	.word	.LC0
	.fnend
	.size	get_split_arg, .-get_split_arg
	.align	1
	.global	set_hw_qp_row
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_hw_qp_row, %function
set_hw_qp_row:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2158
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2150
	movs	r2, #244
	ldr	r1, .L2158+4
	ldr	r0, .L2158+8
	bl	printk
.L2150:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2151
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L2151:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2159:
	.align	2
.L2158:
	.word	.LANCHOR0
	.word	.LANCHOR2+122
	.word	.LC0
	.fnend
	.size	set_hw_qp_row, .-set_hw_qp_row
	.align	1
	.global	get_hw_qp_row
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_hw_qp_row, %function
get_hw_qp_row:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2165
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2161
	movs	r2, #244
	ldr	r1, .L2165+4
	ldr	r0, .L2165+8
	bl	printk
.L2161:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2166:
	.align	2
.L2165:
	.word	.LANCHOR0
	.word	.LANCHOR2+136
	.word	.LC0
	.fnend
	.size	get_hw_qp_row, .-get_hw_qp_row
	.align	1
	.global	set_hw_qp_row_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_hw_qp_row_i, %function
set_hw_qp_row_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2176
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2168
	movs	r2, #244
	ldr	r1, .L2176+4
	ldr	r0, .L2176+8
	bl	printk
.L2168:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2169
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2
	str	r3, [r6, r2]
.L2169:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2177:
	.align	2
.L2176:
	.word	.LANCHOR0
	.word	.LANCHOR2+150
	.word	.LC0
	.fnend
	.size	set_hw_qp_row_i, .-set_hw_qp_row_i
	.align	1
	.global	get_hw_qp_row_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_hw_qp_row_i, %function
get_hw_qp_row_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2183
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2179
	movs	r2, #244
	ldr	r1, .L2183+4
	ldr	r0, .L2183+8
	bl	printk
.L2179:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2184:
	.align	2
.L2183:
	.word	.LANCHOR0
	.word	.LANCHOR2+166
	.word	.LC0
	.fnend
	.size	get_hw_qp_row_i, .-get_hw_qp_row_i
	.align	1
	.global	set_hw_aq_thrd_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_hw_aq_thrd_i, %function
set_hw_aq_thrd_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2194
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	mov	r8, r2
	lsls	r3, r3, #31
	bpl	.L2186
	movs	r2, #244
	ldr	r1, .L2194+4
	ldr	r0, .L2194+8
	bl	printk
.L2186:
	ldrh	r5, [r7, #4]
	mov	r1, r8
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2187
	mov	r2, r5
	mov	r1, r8
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #4
	str	r3, [r6, r2]
.L2187:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L2195:
	.align	2
.L2194:
	.word	.LANCHOR0
	.word	.LANCHOR2+182
	.word	.LC0
	.fnend
	.size	set_hw_aq_thrd_i, .-set_hw_aq_thrd_i
	.align	1
	.global	get_hw_aq_thrd_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_hw_aq_thrd_i, %function
get_hw_aq_thrd_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2201
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2197
	movs	r2, #244
	ldr	r1, .L2201+4
	ldr	r0, .L2201+8
	bl	printk
.L2197:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2202:
	.align	2
.L2201:
	.word	.LANCHOR0
	.word	.LANCHOR2+199
	.word	.LC0
	.fnend
	.size	get_hw_aq_thrd_i, .-get_hw_aq_thrd_i
	.align	1
	.global	set_hw_aq_thrd_p
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_hw_aq_thrd_p, %function
set_hw_aq_thrd_p:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2212
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	mov	r8, r2
	lsls	r3, r3, #31
	bpl	.L2204
	movs	r2, #244
	ldr	r1, .L2212+4
	ldr	r0, .L2212+8
	bl	printk
.L2204:
	ldrh	r5, [r7, #4]
	mov	r1, r8
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2205
	mov	r2, r5
	mov	r1, r8
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #8
	str	r3, [r6, r2]
.L2205:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L2213:
	.align	2
.L2212:
	.word	.LANCHOR0
	.word	.LANCHOR2+216
	.word	.LC0
	.fnend
	.size	set_hw_aq_thrd_p, .-set_hw_aq_thrd_p
	.align	1
	.global	get_hw_aq_thrd_p
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_hw_aq_thrd_p, %function
get_hw_aq_thrd_p:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2219
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2215
	movs	r2, #244
	ldr	r1, .L2219+4
	ldr	r0, .L2219+8
	bl	printk
.L2215:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2220:
	.align	2
.L2219:
	.word	.LANCHOR0
	.word	.LANCHOR2+233
	.word	.LC0
	.fnend
	.size	get_hw_aq_thrd_p, .-get_hw_aq_thrd_p
	.align	1
	.global	set_hw_aq_step_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_hw_aq_step_i, %function
set_hw_aq_step_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2230
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	mov	r8, r2
	lsls	r3, r3, #31
	bpl	.L2222
	movs	r2, #244
	ldr	r1, .L2230+4
	ldr	r0, .L2230+8
	bl	printk
.L2222:
	ldrh	r5, [r7, #4]
	mov	r1, r8
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2223
	mov	r2, r5
	mov	r1, r8
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #16
	str	r3, [r6, r2]
.L2223:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L2231:
	.align	2
.L2230:
	.word	.LANCHOR0
	.word	.LANCHOR2+250
	.word	.LC0
	.fnend
	.size	set_hw_aq_step_i, .-set_hw_aq_step_i
	.align	1
	.global	get_hw_aq_step_i
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_hw_aq_step_i, %function
get_hw_aq_step_i:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2237
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2233
	movs	r2, #244
	ldr	r1, .L2237+4
	ldr	r0, .L2237+8
	bl	printk
.L2233:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2238:
	.align	2
.L2237:
	.word	.LANCHOR0
	.word	.LANCHOR2+267
	.word	.LC0
	.fnend
	.size	get_hw_aq_step_i, .-get_hw_aq_step_i
	.align	1
	.global	set_hw_aq_step_p
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_hw_aq_step_p, %function
set_hw_aq_step_p:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2248
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	mov	r8, r2
	lsls	r3, r3, #31
	bpl	.L2240
	movs	r2, #244
	ldr	r1, .L2248+4
	ldr	r0, .L2248+8
	bl	printk
.L2240:
	ldrh	r5, [r7, #4]
	mov	r1, r8
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2241
	mov	r2, r5
	mov	r1, r8
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #32
	str	r3, [r6, r2]
.L2241:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L2249:
	.align	2
.L2248:
	.word	.LANCHOR0
	.word	.LANCHOR2+284
	.word	.LC0
	.fnend
	.size	set_hw_aq_step_p, .-set_hw_aq_step_p
	.align	1
	.global	get_hw_aq_step_p
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_hw_aq_step_p, %function
get_hw_aq_step_p:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2255
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2251
	movs	r2, #244
	ldr	r1, .L2255+4
	ldr	r0, .L2255+8
	bl	printk
.L2251:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2256:
	.align	2
.L2255:
	.word	.LANCHOR0
	.word	.LANCHOR2+301
	.word	.LC0
	.fnend
	.size	get_hw_aq_step_p, .-get_hw_aq_step_p
	.align	1
	.global	set_tune_scene_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_tune_scene_mode, %function
set_tune_scene_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2266
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2258
	movs	r2, #244
	ldr	r1, .L2266+4
	ldr	r0, .L2266+8
	bl	printk
.L2258:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2259
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #1
	str	r3, [r6, r2]
.L2259:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2267:
	.align	2
.L2266:
	.word	.LANCHOR0
	.word	.LANCHOR2+318
	.word	.LC0
	.fnend
	.size	set_tune_scene_mode, .-set_tune_scene_mode
	.align	1
	.global	get_tune_scene_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_tune_scene_mode, %function
get_tune_scene_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2273
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2269
	movs	r2, #244
	ldr	r1, .L2273+4
	ldr	r0, .L2273+8
	bl	printk
.L2269:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2274:
	.align	2
.L2273:
	.word	.LANCHOR0
	.word	.LANCHOR2+338
	.word	.LC0
	.fnend
	.size	get_tune_scene_mode, .-get_tune_scene_mode
	.align	1
	.global	set_tune_motion_static_switch_enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_tune_motion_static_switch_enable, %function
set_tune_motion_static_switch_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2284
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r0
	ldr	r3, [r3]
	mov	r7, r1
	str	r2, [sp, #4]
	lsls	r3, r3, #31
	bpl	.L2276
	movs	r2, #244
	ldr	r1, .L2284+4
	ldr	r0, .L2284+8
	bl	printk
.L2276:
	ldrh	r5, [r7, #4]
	add	r1, sp, #4
	ldrh	r4, [r7, #6]
	lsrs	r5, r5, #4
	add	r4, r4, r6
	mov	r2, r5
	mov	r0, r4
	bl	memcmp
	cbz	r0, .L2277
	mov	r2, r5
	add	r1, sp, #4
	mov	r0, r4
	bl	memcpy
	ldrh	r2, [r7, #10]
	ldr	r3, [r6, r2]
	orr	r3, r3, #2
	str	r3, [r6, r2]
.L2277:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2285:
	.align	2
.L2284:
	.word	.LANCHOR0
	.word	.LANCHOR2+358
	.word	.LC0
	.fnend
	.size	set_tune_motion_static_switch_enable, .-set_tune_motion_static_switch_enable
	.align	1
	.global	get_tune_motion_static_switch_enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_tune_motion_static_switch_enable, %function
get_tune_motion_static_switch_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2291
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #31
	bpl	.L2287
	movs	r2, #244
	ldr	r1, .L2291+4
	ldr	r0, .L2291+8
	bl	printk
.L2287:
	ldrh	r2, [r4, #4]
	mov	r0, r5
	ldrh	r1, [r4, #6]
	lsrs	r2, r2, #4
	add	r1, r1, r6
	bl	memcpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L2292:
	.align	2
.L2291:
	.word	.LANCHOR0
	.word	.LANCHOR2+395
	.word	.LC0
	.fnend
	.size	get_tune_motion_static_switch_enable, .-get_tune_motion_static_switch_enable
	.align	1
	.global	const_strlen
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	const_strlen, %function
const_strlen:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r2, r0, #1
	rsb	r3, r0, #1
.L2294:
	adds	r0, r3, r2
	ldrb	r1, [r2, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L2294
	bx	lr
	.fnend
	.size	const_strlen, .-const_strlen
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.global	mpp_enc_cfg_api_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_api_init, %function
mpp_enc_cfg_api_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r1, #272
	ldr	r4, .L2302
	ldr	r0, .L2302+4
	bl	printk
	movs	r2, #128
	mov	r1, #10240
	adds	r0, r4, #4
	bl	mpp_trie_init
	ldr	r2, [r4, #4]
	movw	r1, #275
	mov	r5, r0
	ldr	r0, .L2302+8
	bl	printk
	cbz	r5, .L2297
	movw	r2, #277
	ldr	r1, .L2302+12
	ldr	r0, .L2302+16
	bl	printk
.L2298:
	movw	r1, #283
	ldr	r0, .L2302+20
	bl	printk
	ldr	r0, [r4, #4]
	bl	mpp_trie_get_node_count
	cmp	r0, #10240
	ble	.L2296
	ldr	r0, [r4, #4]
	bl	mpp_trie_get_node_count
	mov	r3, #10240
	mov	r2, #286
	ldr	r1, .L2302+12
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r3, #128
	ldr	r0, .L2302+24
	bl	printk
.L2296:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L2297:
	ldr	r6, .L2302+28
.L2299:
	ldr	r1, [r6], #4
	adds	r5, r5, #1
	ldr	r0, [r4, #4]
	bl	mpp_trie_add_info
	cmp	r5, #128
	bne	.L2299
	b	.L2298
.L2303:
	.align	2
.L2302:
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR2+432
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LANCHOR2+456
	.fnend
	.size	mpp_enc_cfg_api_init, .-mpp_enc_cfg_api_init
	.text
	.align	1
	.global	mpp_enc_cfg_api_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_api_deinit, %function
mpp_enc_cfg_api_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L2309
	ldr	r0, [r4, #4]
	cbz	r0, .L2304
	bl	mpp_trie_deinit
	movs	r3, #0
	str	r3, [r4, #4]
.L2304:
	pop	{r4, pc}
.L2310:
	.align	2
.L2309:
	.word	.LANCHOR0
	.fnend
	.size	mpp_enc_cfg_api_deinit, .-mpp_enc_cfg_api_deinit
	.align	1
	.global	mpp_enc_cfg_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_init, %function
mpp_enc_cfg_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	cbnz	r0, .L2312
	movw	r2, #309
	ldr	r1, .L2315
	ldr	r0, .L2315+4
	bl	printk
	mvn	r0, #2
.L2311:
	pop	{r3, r4, r5, pc}
.L2312:
	movw	r1, #4728
	ldr	r0, .L2315+8
	bl	mpp_osal_calloc
	mov	r4, r0
	cbnz	r0, .L2314
	mov	r3, r0
	movw	r2, #315
	ldr	r1, .L2315
	ldr	r0, .L2315+12
	bl	printk
	str	r4, [r5]
	ldr	r0, .L2315+16
	b	.L2311
.L2314:
	movw	r3, #4720
	movw	r2, #4728
	str	r2, [r0, r3]
	ldr	r3, .L2315+20
	ldr	r2, [r3, #4]
	movw	r3, #4724
	str	r2, [r0, r3]
	movs	r3, #2
	strd	r3, r3, [r0, #40]
	str	r3, [r0, #48]
	str	r0, [r5]
	movs	r0, #0
	b	.L2311
.L2316:
	.align	2
.L2315:
	.word	.LANCHOR2+968
	.word	.LC6
	.word	.LANCHOR2+985
	.word	.LC7
	.word	-1006
	.word	.LANCHOR0
	.fnend
	.size	mpp_enc_cfg_init, .-mpp_enc_cfg_init
	.align	1
	.global	mpp_enc_cfg_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_deinit, %function
mpp_enc_cfg_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r1, r0
	cbnz	r0, .L2318
	mov	r2, #334
	ldr	r1, .L2320
	ldr	r0, .L2320+4
	bl	printk
	mvn	r0, #2
.L2317:
	pop	{r3, pc}
.L2318:
	ldr	r0, .L2320+8
	bl	mpp_osal_free
	movs	r0, #0
	b	.L2317
.L2321:
	.align	2
.L2320:
	.word	.LANCHOR2+1002
	.word	.LC6
	.word	.LANCHOR2+1021
	.fnend
	.size	mpp_enc_cfg_deinit, .-mpp_enc_cfg_deinit
	.align	1
	.global	mpp_enc_cfg_set_s32
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_set_s32, %function
mpp_enc_cfg_set_s32:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2323
	cbnz	r1, .L2324
.L2323:
	str	r6, [sp]
	mov	r3, r4
	movw	r2, #369
	ldr	r1, .L2335
	ldr	r0, .L2335+4
	bl	printk
	mvn	r0, #2
.L2322:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2324:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2326
	mov	r3, r6
	movw	r2, #369
	ldr	r1, .L2335
	ldr	r0, .L2335+8
	bl	printk
.L2328:
	mov	r0, #-1
	b	.L2322
.L2326:
	movs	r1, #0
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2328
	ldr	r3, .L2335+12
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L2327
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2335+16
	and	r3, r3, #15
	ldr	r1, .L2335
	ldr	r0, .L2335+20
	ldr	r3, [r2, r3, lsl #2]
	movw	r2, #369
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2327:
	ldr	r3, [r5, #12]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2336:
	.align	2
.L2335:
	.word	.LANCHOR2+1040
	.word	.LC8
	.word	.LC9
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_set_s32, .-mpp_enc_cfg_set_s32
	.align	1
	.global	mpp_enc_cfg_set_u32
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_set_u32, %function
mpp_enc_cfg_set_u32:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2338
	cbnz	r1, .L2339
.L2338:
	str	r6, [sp]
	mov	r3, r4
	mov	r2, #370
	ldr	r1, .L2350
	ldr	r0, .L2350+4
	bl	printk
	mvn	r0, #2
.L2337:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2339:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2341
	mov	r3, r6
	mov	r2, #370
	ldr	r1, .L2350
	ldr	r0, .L2350+8
	bl	printk
.L2343:
	mov	r0, #-1
	b	.L2337
.L2341:
	movs	r1, #1
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2343
	ldr	r3, .L2350+12
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L2342
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2350+16
	and	r3, r3, #15
	ldr	r1, .L2350
	ldr	r0, .L2350+20
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, #370
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2342:
	ldr	r3, [r5, #12]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2351:
	.align	2
.L2350:
	.word	.LANCHOR2+1060
	.word	.LC8
	.word	.LC9
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_set_u32, .-mpp_enc_cfg_set_u32
	.align	1
	.global	mpp_enc_cfg_set_s64
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_set_s64, %function
mpp_enc_cfg_set_s64:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r8, r1
	mov	r6, r2
	mov	r7, r3
	mov	r4, r0
	cbz	r0, .L2353
	cbnz	r1, .L2354
.L2353:
	str	r8, [sp]
	mov	r3, r4
	movw	r2, #371
	ldr	r1, .L2365
	ldr	r0, .L2365+4
	bl	printk
	mvn	r0, #2
.L2352:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2354:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2356
	mov	r3, r8
	movw	r2, #371
	ldr	r1, .L2365
	ldr	r0, .L2365+8
	bl	printk
.L2358:
	mov	r0, #-1
	b	.L2352
.L2356:
	movs	r1, #2
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2358
	ldr	r3, .L2365+12
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L2357
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2365+16
	and	r3, r3, #15
	ldr	r1, .L2365
	ldr	r0, .L2365+20
	ldr	r3, [r2, r3, lsl #2]
	movw	r2, #371
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2357:
	ldr	lr, [r5, #12]
	mov	r2, r6
	mov	r3, r7
	mov	r1, r5
	mov	r0, r4
	mov	ip, lr
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	ip
.L2366:
	.align	2
.L2365:
	.word	.LANCHOR2+1080
	.word	.LC8
	.word	.LC9
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_set_s64, .-mpp_enc_cfg_set_s64
	.align	1
	.global	mpp_enc_cfg_set_u64
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_set_u64, %function
mpp_enc_cfg_set_u64:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r8, r1
	mov	r6, r2
	mov	r7, r3
	mov	r4, r0
	cbz	r0, .L2368
	cbnz	r1, .L2369
.L2368:
	str	r8, [sp]
	mov	r3, r4
	mov	r2, #372
	ldr	r1, .L2380
	ldr	r0, .L2380+4
	bl	printk
	mvn	r0, #2
.L2367:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2369:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2371
	mov	r3, r8
	mov	r2, #372
	ldr	r1, .L2380
	ldr	r0, .L2380+8
	bl	printk
.L2373:
	mov	r0, #-1
	b	.L2367
.L2371:
	movs	r1, #3
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2373
	ldr	r3, .L2380+12
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L2372
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2380+16
	and	r3, r3, #15
	ldr	r1, .L2380
	ldr	r0, .L2380+20
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, #372
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2372:
	ldr	lr, [r5, #12]
	mov	r2, r6
	mov	r3, r7
	mov	r1, r5
	mov	r0, r4
	mov	ip, lr
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	ip
.L2381:
	.align	2
.L2380:
	.word	.LANCHOR2+1100
	.word	.LC8
	.word	.LC9
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_set_u64, .-mpp_enc_cfg_set_u64
	.align	1
	.global	mpp_enc_cfg_set_ptr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_set_ptr, %function
mpp_enc_cfg_set_ptr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2383
	cbnz	r1, .L2384
.L2383:
	str	r6, [sp]
	mov	r3, r4
	movw	r2, #373
	ldr	r1, .L2395
	ldr	r0, .L2395+4
	bl	printk
	mvn	r0, #2
.L2382:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2384:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2386
	mov	r3, r6
	movw	r2, #373
	ldr	r1, .L2395
	ldr	r0, .L2395+8
	bl	printk
.L2388:
	mov	r0, #-1
	b	.L2382
.L2386:
	movs	r1, #4
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2388
	ldr	r3, .L2395+12
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L2387
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2395+16
	and	r3, r3, #15
	ldr	r1, .L2395
	ldr	r0, .L2395+20
	ldr	r3, [r2, r3, lsl #2]
	movw	r2, #373
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2387:
	ldr	r3, [r5, #12]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2396:
	.align	2
.L2395:
	.word	.LANCHOR2+1120
	.word	.LC8
	.word	.LC9
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_set_ptr, .-mpp_enc_cfg_set_ptr
	.align	1
	.global	mpp_enc_cfg_set_st
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_set_st, %function
mpp_enc_cfg_set_st:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2398
	cbnz	r1, .L2399
.L2398:
	str	r6, [sp]
	mov	r3, r4
	mov	r2, #374
	ldr	r1, .L2410
	ldr	r0, .L2410+4
	bl	printk
	mvn	r0, #2
.L2397:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2399:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2401
	mov	r3, r6
	mov	r2, #374
	ldr	r1, .L2410
	ldr	r0, .L2410+8
	bl	printk
.L2403:
	mov	r0, #-1
	b	.L2397
.L2401:
	movs	r1, #5
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2403
	ldr	r3, .L2410+12
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L2402
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2410+16
	and	r3, r3, #15
	ldr	r1, .L2410
	ldr	r0, .L2410+20
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, #374
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2402:
	ldr	r3, [r5, #12]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2411:
	.align	2
.L2410:
	.word	.LANCHOR2+1140
	.word	.LC8
	.word	.LC9
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_set_st, .-mpp_enc_cfg_set_st
	.align	1
	.global	mpp_enc_cfg_get_s32
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_get_s32, %function
mpp_enc_cfg_get_s32:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2413
	cbnz	r1, .L2414
.L2413:
	str	r6, [sp]
	mov	r3, r4
	mov	r2, #402
	ldr	r1, .L2425
	ldr	r0, .L2425+4
	bl	printk
	mvn	r0, #2
.L2412:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2414:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2416
	mov	r3, r6
	mov	r2, #402
	ldr	r1, .L2425
	ldr	r0, .L2425+8
	bl	printk
.L2418:
	mov	r0, #-1
	b	.L2412
.L2416:
	movs	r1, #0
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2418
	ldr	r3, .L2425+12
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L2417
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2425+16
	and	r3, r3, #15
	ldr	r1, .L2425
	ldr	r0, .L2425+20
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, #402
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2417:
	ldr	r3, [r5, #16]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2426:
	.align	2
.L2425:
	.word	.LANCHOR2+1159
	.word	.LC8
	.word	.LC11
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_get_s32, .-mpp_enc_cfg_get_s32
	.align	1
	.global	mpp_enc_cfg_get_u32
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_get_u32, %function
mpp_enc_cfg_get_u32:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2428
	cbnz	r1, .L2429
.L2428:
	str	r6, [sp]
	mov	r3, r4
	movw	r2, #403
	ldr	r1, .L2440
	ldr	r0, .L2440+4
	bl	printk
	mvn	r0, #2
.L2427:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2429:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2431
	mov	r3, r6
	movw	r2, #403
	ldr	r1, .L2440
	ldr	r0, .L2440+8
	bl	printk
.L2433:
	mov	r0, #-1
	b	.L2427
.L2431:
	movs	r1, #1
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2433
	ldr	r3, .L2440+12
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L2432
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2440+16
	and	r3, r3, #15
	ldr	r1, .L2440
	ldr	r0, .L2440+20
	ldr	r3, [r2, r3, lsl #2]
	movw	r2, #403
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2432:
	ldr	r3, [r5, #16]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2441:
	.align	2
.L2440:
	.word	.LANCHOR2+1179
	.word	.LC8
	.word	.LC11
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_get_u32, .-mpp_enc_cfg_get_u32
	.align	1
	.global	mpp_enc_cfg_get_s64
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_get_s64, %function
mpp_enc_cfg_get_s64:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2443
	cbnz	r1, .L2444
.L2443:
	str	r6, [sp]
	mov	r3, r4
	mov	r2, #404
	ldr	r1, .L2455
	ldr	r0, .L2455+4
	bl	printk
	mvn	r0, #2
.L2442:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2444:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2446
	mov	r3, r6
	mov	r2, #404
	ldr	r1, .L2455
	ldr	r0, .L2455+8
	bl	printk
.L2448:
	mov	r0, #-1
	b	.L2442
.L2446:
	movs	r1, #2
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2448
	ldr	r3, .L2455+12
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L2447
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2455+16
	and	r3, r3, #15
	ldr	r1, .L2455
	ldr	r0, .L2455+20
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, #404
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2447:
	ldr	r3, [r5, #16]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2456:
	.align	2
.L2455:
	.word	.LANCHOR2+1199
	.word	.LC8
	.word	.LC11
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_get_s64, .-mpp_enc_cfg_get_s64
	.align	1
	.global	mpp_enc_cfg_get_u64
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_get_u64, %function
mpp_enc_cfg_get_u64:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2458
	cbnz	r1, .L2459
.L2458:
	str	r6, [sp]
	mov	r3, r4
	movw	r2, #405
	ldr	r1, .L2470
	ldr	r0, .L2470+4
	bl	printk
	mvn	r0, #2
.L2457:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2459:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2461
	mov	r3, r6
	movw	r2, #405
	ldr	r1, .L2470
	ldr	r0, .L2470+8
	bl	printk
.L2463:
	mov	r0, #-1
	b	.L2457
.L2461:
	movs	r1, #3
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2463
	ldr	r3, .L2470+12
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L2462
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2470+16
	and	r3, r3, #15
	ldr	r1, .L2470
	ldr	r0, .L2470+20
	ldr	r3, [r2, r3, lsl #2]
	movw	r2, #405
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2462:
	ldr	r3, [r5, #16]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2471:
	.align	2
.L2470:
	.word	.LANCHOR2+1219
	.word	.LC8
	.word	.LC11
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_get_u64, .-mpp_enc_cfg_get_u64
	.align	1
	.global	mpp_enc_cfg_get_ptr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_get_ptr, %function
mpp_enc_cfg_get_ptr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2473
	cbnz	r1, .L2474
.L2473:
	str	r6, [sp]
	mov	r3, r4
	mov	r2, #406
	ldr	r1, .L2485
	ldr	r0, .L2485+4
	bl	printk
	mvn	r0, #2
.L2472:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2474:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2476
	mov	r3, r6
	mov	r2, #406
	ldr	r1, .L2485
	ldr	r0, .L2485+8
	bl	printk
.L2478:
	mov	r0, #-1
	b	.L2472
.L2476:
	movs	r1, #4
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2478
	ldr	r3, .L2485+12
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L2477
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2485+16
	and	r3, r3, #15
	ldr	r1, .L2485
	ldr	r0, .L2485+20
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, #406
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2477:
	ldr	r3, [r5, #16]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2486:
	.align	2
.L2485:
	.word	.LANCHOR2+1239
	.word	.LC8
	.word	.LC11
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_get_ptr, .-mpp_enc_cfg_get_ptr
	.align	1
	.global	mpp_enc_cfg_get_st
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_get_st, %function
mpp_enc_cfg_get_st:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r6, r1
	mov	r7, r2
	mov	r4, r0
	cbz	r0, .L2488
	cbnz	r1, .L2489
.L2488:
	str	r6, [sp]
	mov	r3, r4
	movw	r2, #407
	ldr	r1, .L2500
	ldr	r0, .L2500+4
	bl	printk
	mvn	r0, #2
.L2487:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2489:
	movw	r3, #4724
	ldr	r0, [r0, r3]
	bl	mpp_trie_get_info
	mov	r5, r0
	cbnz	r0, .L2491
	mov	r3, r6
	movw	r2, #407
	ldr	r1, .L2500
	ldr	r0, .L2500+8
	bl	printk
.L2493:
	mov	r0, #-1
	b	.L2487
.L2491:
	movs	r1, #5
	bl	check_cfg_api_info
	cmp	r0, #0
	bne	.L2493
	ldr	r3, .L2500+12
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bpl	.L2492
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, .L2500+16
	and	r3, r3, #15
	ldr	r1, .L2500
	ldr	r0, .L2500+20
	ldr	r3, [r2, r3, lsl #2]
	movw	r2, #407
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
.L2492:
	ldr	r3, [r5, #16]
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L2501:
	.align	2
.L2500:
	.word	.LANCHOR2+1259
	.word	.LC8
	.word	.LC11
	.word	.LANCHOR0
	.word	cfg_type_names
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_get_st, .-mpp_enc_cfg_get_st
	.section	.text.unlikely
	.align	1
	.global	mpp_enc_cfg_show
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_show, %function
mpp_enc_cfg_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	movw	r1, #413
	ldr	r0, .L2505
	movs	r4, #0
	bl	printk
	ldr	r5, .L2505+4
	ldr	r7, .L2505+8
	ldr	r6, .L2505+12
.L2503:
	ldr	r2, [r5], #4
	movw	r1, #417
	mov	r0, r6
	adds	r4, r4, #1
	ldrb	r3, [r2, #4]	@ zero_extendqisi2
	ldr	r2, [r2]
	and	r3, r3, #15
	ldr	r3, [r7, r3, lsl #2]
	bl	printk
	cmp	r4, #128
	bne	.L2503
	movw	r1, #419
	ldr	r0, .L2505+16
	bl	printk
	ldr	r3, .L2505+20
	ldr	r0, [r3, #4]
	bl	mpp_trie_get_node_count
	mov	r3, #10240
	mov	r2, r4
	movw	r1, #423
	str	r0, [sp]
	ldr	r0, .L2505+24
	bl	printk
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2506:
	.align	2
.L2505:
	.word	.LC12
	.word	.LANCHOR2+456
	.word	cfg_type_names
	.word	.LC13
	.word	.LC14
	.word	.LANCHOR0
	.word	.LC15
	.fnend
	.size	mpp_enc_cfg_show, .-mpp_enc_cfg_show
	.global	mpp_enc_cfg_debug
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.set	.LANCHOR2,. + 4344
	.type	__func__.8911, %object
	.size	__func__.8911, 19
__func__.8911:
	.ascii	"set_base_low_delay\000"
	.type	__func__.8927, %object
	.size	__func__.8927, 19
__func__.8927:
	.ascii	"get_base_low_delay\000"
	.type	__func__.8936, %object
	.size	__func__.8936, 12
__func__.8936:
	.ascii	"set_rc_mode\000"
	.type	__func__.8952, %object
	.size	__func__.8952, 12
__func__.8952:
	.ascii	"get_rc_mode\000"
	.type	__func__.8961, %object
	.size	__func__.8961, 18
__func__.8961:
	.ascii	"set_rc_bps_target\000"
	.type	__func__.8977, %object
	.size	__func__.8977, 18
__func__.8977:
	.ascii	"get_rc_bps_target\000"
	.type	__func__.8986, %object
	.size	__func__.8986, 15
__func__.8986:
	.ascii	"set_rc_bps_max\000"
	.type	__func__.9002, %object
	.size	__func__.9002, 15
__func__.9002:
	.ascii	"get_rc_bps_max\000"
	.type	__func__.9011, %object
	.size	__func__.9011, 15
__func__.9011:
	.ascii	"set_rc_bps_min\000"
	.type	__func__.9027, %object
	.size	__func__.9027, 15
__func__.9027:
	.ascii	"get_rc_bps_min\000"
	.type	__func__.9036, %object
	.size	__func__.9036, 19
__func__.9036:
	.ascii	"set_rc_fps_in_flex\000"
	.type	__func__.9052, %object
	.size	__func__.9052, 19
__func__.9052:
	.ascii	"get_rc_fps_in_flex\000"
	.type	__func__.9061, %object
	.size	__func__.9061, 18
__func__.9061:
	.ascii	"set_rc_fps_in_num\000"
	.type	__func__.9077, %object
	.size	__func__.9077, 18
__func__.9077:
	.ascii	"get_rc_fps_in_num\000"
	.type	__func__.9086, %object
	.size	__func__.9086, 21
__func__.9086:
	.ascii	"set_rc_fps_in_denorm\000"
	.type	__func__.9102, %object
	.size	__func__.9102, 21
__func__.9102:
	.ascii	"get_rc_fps_in_denorm\000"
	.type	__func__.9111, %object
	.size	__func__.9111, 20
__func__.9111:
	.ascii	"set_rc_fps_out_flex\000"
	.type	__func__.9127, %object
	.size	__func__.9127, 20
__func__.9127:
	.ascii	"get_rc_fps_out_flex\000"
	.type	__func__.9136, %object
	.size	__func__.9136, 19
__func__.9136:
	.ascii	"set_rc_fps_out_num\000"
	.type	__func__.9152, %object
	.size	__func__.9152, 19
__func__.9152:
	.ascii	"get_rc_fps_out_num\000"
	.type	__func__.9161, %object
	.size	__func__.9161, 22
__func__.9161:
	.ascii	"set_rc_fps_out_denorm\000"
	.type	__func__.9177, %object
	.size	__func__.9177, 22
__func__.9177:
	.ascii	"get_rc_fps_out_denorm\000"
	.type	__func__.9186, %object
	.size	__func__.9186, 11
__func__.9186:
	.ascii	"set_rc_gop\000"
	.type	__func__.9202, %object
	.size	__func__.9202, 11
__func__.9202:
	.ascii	"get_rc_gop\000"
	.type	__func__.9211, %object
	.size	__func__.9211, 23
__func__.9211:
	.ascii	"set_rc_max_reenc_times\000"
	.type	__func__.9227, %object
	.size	__func__.9227, 23
__func__.9227:
	.ascii	"get_rc_max_reenc_times\000"
	.type	__func__.9236, %object
	.size	__func__.9236, 16
__func__.9236:
	.ascii	"set_rc_priority\000"
	.type	__func__.9252, %object
	.size	__func__.9252, 16
__func__.9252:
	.ascii	"get_rc_priority\000"
	.type	__func__.9261, %object
	.size	__func__.9261, 17
__func__.9261:
	.ascii	"set_rc_drop_mode\000"
	.type	__func__.9277, %object
	.size	__func__.9277, 17
__func__.9277:
	.ascii	"get_rc_drop_mode\000"
	.type	__func__.9286, %object
	.size	__func__.9286, 16
__func__.9286:
	.ascii	"set_rc_drop_thd\000"
	.type	__func__.9302, %object
	.size	__func__.9302, 16
__func__.9302:
	.ascii	"get_rc_drop_thd\000"
	.type	__func__.9311, %object
	.size	__func__.9311, 16
__func__.9311:
	.ascii	"set_rc_drop_gap\000"
	.type	__func__.9327, %object
	.size	__func__.9327, 16
__func__.9327:
	.ascii	"get_rc_drop_gap\000"
	.type	__func__.9336, %object
	.size	__func__.9336, 18
__func__.9336:
	.ascii	"set_rc_max_i_prop\000"
	.type	__func__.9352, %object
	.size	__func__.9352, 18
__func__.9352:
	.ascii	"get_rc_max_i_prop\000"
	.type	__func__.9361, %object
	.size	__func__.9361, 18
__func__.9361:
	.ascii	"set_rc_min_i_prop\000"
	.type	__func__.9377, %object
	.size	__func__.9377, 18
__func__.9377:
	.ascii	"get_rc_min_i_prop\000"
	.type	__func__.9386, %object
	.size	__func__.9386, 21
__func__.9386:
	.ascii	"set_rc_init_ip_ratio\000"
	.type	__func__.9402, %object
	.size	__func__.9402, 21
__func__.9402:
	.ascii	"get_rc_init_ip_ratio\000"
	.type	__func__.9411, %object
	.size	__func__.9411, 18
__func__.9411:
	.ascii	"set_rc_super_mode\000"
	.type	__func__.9427, %object
	.size	__func__.9427, 18
__func__.9427:
	.ascii	"get_rc_super_mode\000"
	.type	__func__.9436, %object
	.size	__func__.9436, 19
__func__.9436:
	.ascii	"set_rc_super_i_thd\000"
	.type	__func__.9452, %object
	.size	__func__.9452, 19
__func__.9452:
	.ascii	"get_rc_super_i_thd\000"
	.type	__func__.9461, %object
	.size	__func__.9461, 19
__func__.9461:
	.ascii	"set_rc_super_p_thd\000"
	.type	__func__.9477, %object
	.size	__func__.9477, 19
__func__.9477:
	.ascii	"get_rc_super_p_thd\000"
	.type	__func__.9486, %object
	.size	__func__.9486, 19
__func__.9486:
	.ascii	"set_rc_debreath_en\000"
	.type	__func__.9502, %object
	.size	__func__.9502, 19
__func__.9502:
	.ascii	"get_rc_debreath_en\000"
	.type	__func__.9511, %object
	.size	__func__.9511, 25
__func__.9511:
	.ascii	"set_rc_debreath_strength\000"
	.type	__func__.9527, %object
	.size	__func__.9527, 25
__func__.9527:
	.ascii	"get_rc_debreath_strength\000"
	.type	__func__.9536, %object
	.size	__func__.9536, 15
__func__.9536:
	.ascii	"set_rc_qp_init\000"
	.type	__func__.9552, %object
	.size	__func__.9552, 15
__func__.9552:
	.ascii	"get_rc_qp_init\000"
	.type	__func__.9561, %object
	.size	__func__.9561, 14
__func__.9561:
	.ascii	"set_rc_qp_min\000"
	.type	__func__.9577, %object
	.size	__func__.9577, 14
__func__.9577:
	.ascii	"get_rc_qp_min\000"
	.type	__func__.9586, %object
	.size	__func__.9586, 14
__func__.9586:
	.ascii	"set_rc_qp_max\000"
	.type	__func__.9602, %object
	.size	__func__.9602, 14
__func__.9602:
	.ascii	"get_rc_qp_max\000"
	.type	__func__.9611, %object
	.size	__func__.9611, 16
__func__.9611:
	.ascii	"set_rc_qp_min_i\000"
	.type	__func__.9627, %object
	.size	__func__.9627, 16
__func__.9627:
	.ascii	"get_rc_qp_min_i\000"
	.type	__func__.9636, %object
	.size	__func__.9636, 16
__func__.9636:
	.ascii	"set_rc_qp_max_i\000"
	.type	__func__.9652, %object
	.size	__func__.9652, 16
__func__.9652:
	.ascii	"get_rc_qp_max_i\000"
	.type	__func__.9661, %object
	.size	__func__.9661, 15
__func__.9661:
	.ascii	"set_rc_qp_step\000"
	.type	__func__.9677, %object
	.size	__func__.9677, 15
__func__.9677:
	.ascii	"get_rc_qp_step\000"
	.type	__func__.9686, %object
	.size	__func__.9686, 13
__func__.9686:
	.ascii	"set_rc_qp_ip\000"
	.type	__func__.9702, %object
	.size	__func__.9702, 13
__func__.9702:
	.ascii	"get_rc_qp_ip\000"
	.type	__func__.9711, %object
	.size	__func__.9711, 13
__func__.9711:
	.ascii	"set_rc_qp_vi\000"
	.type	__func__.9727, %object
	.size	__func__.9727, 13
__func__.9727:
	.ascii	"get_rc_qp_vi\000"
	.type	__func__.9736, %object
	.size	__func__.9736, 18
__func__.9736:
	.ascii	"set_rc_hier_qp_en\000"
	.type	__func__.9752, %object
	.size	__func__.9752, 18
__func__.9752:
	.ascii	"get_rc_hier_qp_en\000"
	.type	__func__.9761, %object
	.size	__func__.9761, 21
__func__.9761:
	.ascii	"set_rc_hier_qp_delta\000"
	.type	__func__.9777, %object
	.size	__func__.9777, 21
__func__.9777:
	.ascii	"get_rc_hier_qp_delta\000"
	.type	__func__.9786, %object
	.size	__func__.9786, 22
__func__.9786:
	.ascii	"set_rc_hier_frame_num\000"
	.type	__func__.9802, %object
	.size	__func__.9802, 22
__func__.9802:
	.ascii	"get_rc_hier_frame_num\000"
	.type	__func__.9811, %object
	.size	__func__.9811, 18
__func__.9811:
	.ascii	"set_rc_stats_time\000"
	.type	__func__.9827, %object
	.size	__func__.9827, 18
__func__.9827:
	.ascii	"get_rc_stats_time\000"
	.type	__func__.9836, %object
	.size	__func__.9836, 23
__func__.9836:
	.ascii	"set_rc_fm_lvl_qp_min_i\000"
	.type	__func__.9852, %object
	.size	__func__.9852, 23
__func__.9852:
	.ascii	"get_rc_fm_lvl_qp_min_i\000"
	.type	__func__.9861, %object
	.size	__func__.9861, 23
__func__.9861:
	.ascii	"set_rc_fm_lvl_qp_min_p\000"
	.type	__func__.9877, %object
	.size	__func__.9877, 23
__func__.9877:
	.ascii	"get_rc_fm_lvl_qp_min_p\000"
	.type	__func__.9886, %object
	.size	__func__.9886, 23
__func__.9886:
	.ascii	"set_rc_fm_lvl_qp_max_i\000"
	.type	__func__.9902, %object
	.size	__func__.9902, 23
__func__.9902:
	.ascii	"get_rc_fm_lvl_qp_max_i\000"
	.type	__func__.9911, %object
	.size	__func__.9911, 23
__func__.9911:
	.ascii	"set_rc_fm_lvl_qp_max_p\000"
	.type	__func__.9927, %object
	.size	__func__.9927, 23
__func__.9927:
	.ascii	"get_rc_fm_lvl_qp_max_p\000"
	.type	__func__.9936, %object
	.size	__func__.9936, 25
__func__.9936:
	.ascii	"set_rc_mt_st_swth_frm_qp\000"
	.type	__func__.9952, %object
	.size	__func__.9952, 25
__func__.9952:
	.ascii	"get_rc_mt_st_swth_frm_qp\000"
	.type	__func__.9961, %object
	.size	__func__.9961, 15
__func__.9961:
	.ascii	"set_prep_width\000"
	.type	__func__.9977, %object
	.size	__func__.9977, 15
__func__.9977:
	.ascii	"get_prep_width\000"
	.type	__func__.9986, %object
	.size	__func__.9986, 16
__func__.9986:
	.ascii	"set_prep_height\000"
	.type	__func__.10002, %object
	.size	__func__.10002, 16
__func__.10002:
	.ascii	"get_prep_height\000"
	.type	__func__.10011, %object
	.size	__func__.10011, 20
__func__.10011:
	.ascii	"set_prep_hor_stride\000"
	.type	__func__.10027, %object
	.size	__func__.10027, 20
__func__.10027:
	.ascii	"get_prep_hor_stride\000"
	.type	__func__.10036, %object
	.size	__func__.10036, 20
__func__.10036:
	.ascii	"set_prep_ver_stride\000"
	.type	__func__.10052, %object
	.size	__func__.10052, 20
__func__.10052:
	.ascii	"get_prep_ver_stride\000"
	.type	__func__.10061, %object
	.size	__func__.10061, 19
__func__.10061:
	.ascii	"set_prep_max_width\000"
	.type	__func__.10077, %object
	.size	__func__.10077, 19
__func__.10077:
	.ascii	"get_prep_max_width\000"
	.type	__func__.10086, %object
	.size	__func__.10086, 20
__func__.10086:
	.ascii	"set_prep_max_height\000"
	.type	__func__.10102, %object
	.size	__func__.10102, 20
__func__.10102:
	.ascii	"get_prep_max_height\000"
	.type	__func__.10111, %object
	.size	__func__.10111, 16
__func__.10111:
	.ascii	"set_prep_format\000"
	.type	__func__.10127, %object
	.size	__func__.10127, 16
__func__.10127:
	.ascii	"get_prep_format\000"
	.type	__func__.10136, %object
	.size	__func__.10136, 20
__func__.10136:
	.ascii	"set_prep_colorspace\000"
	.type	__func__.10152, %object
	.size	__func__.10152, 20
__func__.10152:
	.ascii	"get_prep_colorspace\000"
	.type	__func__.10161, %object
	.size	__func__.10161, 19
__func__.10161:
	.ascii	"set_prep_colorprim\000"
	.type	__func__.10177, %object
	.size	__func__.10177, 19
__func__.10177:
	.ascii	"get_prep_colorprim\000"
	.type	__func__.10186, %object
	.size	__func__.10186, 18
__func__.10186:
	.ascii	"set_prep_colortrc\000"
	.type	__func__.10202, %object
	.size	__func__.10202, 18
__func__.10202:
	.ascii	"get_prep_colortrc\000"
	.type	__func__.10211, %object
	.size	__func__.10211, 20
__func__.10211:
	.ascii	"set_prep_colorrange\000"
	.type	__func__.10227, %object
	.size	__func__.10227, 20
__func__.10227:
	.ascii	"get_prep_colorrange\000"
	.type	__func__.10236, %object
	.size	__func__.10236, 15
__func__.10236:
	.ascii	"set_prep_range\000"
	.type	__func__.10252, %object
	.size	__func__.10252, 15
__func__.10252:
	.ascii	"get_prep_range\000"
	.type	__func__.10261, %object
	.size	__func__.10261, 18
__func__.10261:
	.ascii	"set_prep_rotation\000"
	.type	__func__.10277, %object
	.size	__func__.10277, 18
__func__.10277:
	.ascii	"get_prep_rotation\000"
	.type	__func__.10286, %object
	.size	__func__.10286, 19
__func__.10286:
	.ascii	"set_prep_mirroring\000"
	.type	__func__.10302, %object
	.size	__func__.10302, 19
__func__.10302:
	.ascii	"get_prep_mirroring\000"
	.type	__func__.10311, %object
	.size	__func__.10311, 15
__func__.10311:
	.ascii	"set_codec_type\000"
	.type	__func__.10327, %object
	.size	__func__.10327, 15
__func__.10327:
	.ascii	"get_codec_type\000"
	.type	__func__.10336, %object
	.size	__func__.10336, 21
__func__.10336:
	.ascii	"set_h264_stream_type\000"
	.type	__func__.10352, %object
	.size	__func__.10352, 21
__func__.10352:
	.ascii	"get_h264_stream_type\000"
	.type	__func__.10361, %object
	.size	__func__.10361, 17
__func__.10361:
	.ascii	"set_h264_profile\000"
	.type	__func__.10377, %object
	.size	__func__.10377, 17
__func__.10377:
	.ascii	"get_h264_profile\000"
	.type	__func__.10386, %object
	.size	__func__.10386, 15
__func__.10386:
	.ascii	"set_h264_level\000"
	.type	__func__.10402, %object
	.size	__func__.10402, 15
__func__.10402:
	.ascii	"get_h264_level\000"
	.type	__func__.10411, %object
	.size	__func__.10411, 18
__func__.10411:
	.ascii	"set_h264_poc_type\000"
	.type	__func__.10427, %object
	.size	__func__.10427, 18
__func__.10427:
	.ascii	"get_h264_poc_type\000"
	.type	__func__.10436, %object
	.size	__func__.10436, 26
__func__.10436:
	.ascii	"set_h264_log2_max_poc_lsb\000"
	.type	__func__.10452, %object
	.size	__func__.10452, 26
__func__.10452:
	.ascii	"get_h264_log2_max_poc_lsb\000"
	.type	__func__.10461, %object
	.size	__func__.10461, 26
__func__.10461:
	.ascii	"set_h264_log2_max_frm_num\000"
	.type	__func__.10477, %object
	.size	__func__.10477, 26
__func__.10477:
	.ascii	"get_h264_log2_max_frm_num\000"
	.type	__func__.10486, %object
	.size	__func__.10486, 26
__func__.10486:
	.ascii	"set_h264_gaps_not_allowed\000"
	.type	__func__.10502, %object
	.size	__func__.10502, 26
__func__.10502:
	.ascii	"get_h264_gaps_not_allowed\000"
	.type	__func__.10511, %object
	.size	__func__.10511, 18
__func__.10511:
	.ascii	"set_h264_cabac_en\000"
	.type	__func__.10527, %object
	.size	__func__.10527, 18
__func__.10527:
	.ascii	"get_h264_cabac_en\000"
	.type	__func__.10536, %object
	.size	__func__.10536, 19
__func__.10536:
	.ascii	"set_h264_cabac_idc\000"
	.type	__func__.10552, %object
	.size	__func__.10552, 19
__func__.10552:
	.ascii	"get_h264_cabac_idc\000"
	.type	__func__.10561, %object
	.size	__func__.10561, 18
__func__.10561:
	.ascii	"set_h264_trans8x8\000"
	.type	__func__.10577, %object
	.size	__func__.10577, 18
__func__.10577:
	.ascii	"get_h264_trans8x8\000"
	.type	__func__.10586, %object
	.size	__func__.10586, 21
__func__.10586:
	.ascii	"set_h264_const_intra\000"
	.type	__func__.10602, %object
	.size	__func__.10602, 21
__func__.10602:
	.ascii	"get_h264_const_intra\000"
	.type	__func__.10611, %object
	.size	__func__.10611, 22
__func__.10611:
	.ascii	"set_h264_scaling_list\000"
	.type	__func__.10627, %object
	.size	__func__.10627, 22
__func__.10627:
	.ascii	"get_h264_scaling_list\000"
	.type	__func__.10636, %object
	.size	__func__.10636, 22
__func__.10636:
	.ascii	"set_h264_cb_qp_offset\000"
	.type	__func__.10652, %object
	.size	__func__.10652, 22
__func__.10652:
	.ascii	"get_h264_cb_qp_offset\000"
	.type	__func__.10661, %object
	.size	__func__.10661, 22
__func__.10661:
	.ascii	"set_h264_cr_qp_offset\000"
	.type	__func__.10677, %object
	.size	__func__.10677, 22
__func__.10677:
	.ascii	"get_h264_cr_qp_offset\000"
	.type	__func__.10686, %object
	.size	__func__.10686, 22
__func__.10686:
	.ascii	"set_h264_dblk_disable\000"
	.type	__func__.10702, %object
	.size	__func__.10702, 22
__func__.10702:
	.ascii	"get_h264_dblk_disable\000"
	.type	__func__.10711, %object
	.size	__func__.10711, 20
__func__.10711:
	.ascii	"set_h264_dblk_alpha\000"
	.type	__func__.10727, %object
	.size	__func__.10727, 20
__func__.10727:
	.ascii	"get_h264_dblk_alpha\000"
	.type	__func__.10736, %object
	.size	__func__.10736, 19
__func__.10736:
	.ascii	"set_h264_dblk_beta\000"
	.type	__func__.10752, %object
	.size	__func__.10752, 19
__func__.10752:
	.ascii	"get_h264_dblk_beta\000"
	.type	__func__.10761, %object
	.size	__func__.10761, 17
__func__.10761:
	.ascii	"set_h264_qp_init\000"
	.type	__func__.10777, %object
	.size	__func__.10777, 17
__func__.10777:
	.ascii	"get_h264_qp_init\000"
	.type	__func__.10786, %object
	.size	__func__.10786, 16
__func__.10786:
	.ascii	"set_h264_qp_min\000"
	.type	__func__.10802, %object
	.size	__func__.10802, 16
__func__.10802:
	.ascii	"get_h264_qp_min\000"
	.type	__func__.10811, %object
	.size	__func__.10811, 16
__func__.10811:
	.ascii	"set_h264_qp_max\000"
	.type	__func__.10827, %object
	.size	__func__.10827, 16
__func__.10827:
	.ascii	"get_h264_qp_max\000"
	.type	__func__.10836, %object
	.size	__func__.10836, 18
__func__.10836:
	.ascii	"set_h264_qp_min_i\000"
	.type	__func__.10852, %object
	.size	__func__.10852, 18
__func__.10852:
	.ascii	"get_h264_qp_min_i\000"
	.type	__func__.10861, %object
	.size	__func__.10861, 18
__func__.10861:
	.ascii	"set_h264_qp_max_i\000"
	.type	__func__.10877, %object
	.size	__func__.10877, 18
__func__.10877:
	.ascii	"get_h264_qp_max_i\000"
	.type	__func__.10886, %object
	.size	__func__.10886, 17
__func__.10886:
	.ascii	"set_h264_qp_step\000"
	.type	__func__.10902, %object
	.size	__func__.10902, 17
__func__.10902:
	.ascii	"get_h264_qp_step\000"
	.type	__func__.10911, %object
	.size	__func__.10911, 21
__func__.10911:
	.ascii	"set_h264_qp_delta_ip\000"
	.type	__func__.10927, %object
	.size	__func__.10927, 21
__func__.10927:
	.ascii	"get_h264_qp_delta_ip\000"
	.type	__func__.10936, %object
	.size	__func__.10936, 17
__func__.10936:
	.ascii	"set_h264_max_tid\000"
	.type	__func__.10952, %object
	.size	__func__.10952, 17
__func__.10952:
	.ascii	"get_h264_max_tid\000"
	.type	__func__.10961, %object
	.size	__func__.10961, 17
__func__.10961:
	.ascii	"set_h264_max_ltr\000"
	.type	__func__.10977, %object
	.size	__func__.10977, 17
__func__.10977:
	.ascii	"get_h264_max_ltr\000"
	.type	__func__.10986, %object
	.size	__func__.10986, 21
__func__.10986:
	.ascii	"set_h264_prefix_mode\000"
	.type	__func__.11002, %object
	.size	__func__.11002, 21
__func__.11002:
	.ascii	"get_h264_prefix_mode\000"
	.type	__func__.11011, %object
	.size	__func__.11011, 24
__func__.11011:
	.ascii	"set_h264_base_layer_pid\000"
	.type	__func__.11027, %object
	.size	__func__.11027, 24
__func__.11027:
	.ascii	"get_h264_base_layer_pid\000"
	.type	__func__.11036, %object
	.size	__func__.11036, 17
__func__.11036:
	.ascii	"set_h265_profile\000"
	.type	__func__.11052, %object
	.size	__func__.11052, 17
__func__.11052:
	.ascii	"get_h265_profile\000"
	.type	__func__.11061, %object
	.size	__func__.11061, 15
__func__.11061:
	.ascii	"set_h265_level\000"
	.type	__func__.11077, %object
	.size	__func__.11077, 15
__func__.11077:
	.ascii	"get_h265_level\000"
	.type	__func__.11086, %object
	.size	__func__.11086, 22
__func__.11086:
	.ascii	"set_h265_scaling_list\000"
	.type	__func__.11102, %object
	.size	__func__.11102, 22
__func__.11102:
	.ascii	"get_h265_scaling_list\000"
	.type	__func__.11111, %object
	.size	__func__.11111, 22
__func__.11111:
	.ascii	"set_h265_cb_qp_offset\000"
	.type	__func__.11127, %object
	.size	__func__.11127, 22
__func__.11127:
	.ascii	"get_h265_cb_qp_offset\000"
	.type	__func__.11136, %object
	.size	__func__.11136, 22
__func__.11136:
	.ascii	"set_h265_cr_qp_offset\000"
	.type	__func__.11152, %object
	.size	__func__.11152, 22
__func__.11152:
	.ascii	"get_h265_cr_qp_offset\000"
	.type	__func__.11161, %object
	.size	__func__.11161, 22
__func__.11161:
	.ascii	"set_h265_dblk_disable\000"
	.type	__func__.11177, %object
	.size	__func__.11177, 22
__func__.11177:
	.ascii	"get_h265_dblk_disable\000"
	.type	__func__.11186, %object
	.size	__func__.11186, 20
__func__.11186:
	.ascii	"set_h265_dblk_alpha\000"
	.type	__func__.11202, %object
	.size	__func__.11202, 20
__func__.11202:
	.ascii	"get_h265_dblk_alpha\000"
	.type	__func__.11211, %object
	.size	__func__.11211, 19
__func__.11211:
	.ascii	"set_h265_dblk_beta\000"
	.type	__func__.11227, %object
	.size	__func__.11227, 19
__func__.11227:
	.ascii	"get_h265_dblk_beta\000"
	.type	__func__.11236, %object
	.size	__func__.11236, 17
__func__.11236:
	.ascii	"set_h265_qp_init\000"
	.type	__func__.11252, %object
	.size	__func__.11252, 17
__func__.11252:
	.ascii	"get_h265_qp_init\000"
	.type	__func__.11261, %object
	.size	__func__.11261, 16
__func__.11261:
	.ascii	"set_h265_qp_min\000"
	.type	__func__.11277, %object
	.size	__func__.11277, 16
__func__.11277:
	.ascii	"get_h265_qp_min\000"
	.type	__func__.11286, %object
	.size	__func__.11286, 16
__func__.11286:
	.ascii	"set_h265_qp_max\000"
	.type	__func__.11302, %object
	.size	__func__.11302, 16
__func__.11302:
	.ascii	"get_h265_qp_max\000"
	.type	__func__.11311, %object
	.size	__func__.11311, 18
__func__.11311:
	.ascii	"set_h265_qp_min_i\000"
	.type	__func__.11327, %object
	.size	__func__.11327, 18
__func__.11327:
	.ascii	"get_h265_qp_min_i\000"
	.type	__func__.11336, %object
	.size	__func__.11336, 18
__func__.11336:
	.ascii	"set_h265_qp_max_i\000"
	.type	__func__.11352, %object
	.size	__func__.11352, 18
__func__.11352:
	.ascii	"get_h265_qp_max_i\000"
	.type	__func__.11361, %object
	.size	__func__.11361, 17
__func__.11361:
	.ascii	"set_h265_qp_step\000"
	.type	__func__.11377, %object
	.size	__func__.11377, 17
__func__.11377:
	.ascii	"get_h265_qp_step\000"
	.type	__func__.11386, %object
	.size	__func__.11386, 21
__func__.11386:
	.ascii	"set_h265_qp_delta_ip\000"
	.type	__func__.11402, %object
	.size	__func__.11402, 21
__func__.11402:
	.ascii	"get_h265_qp_delta_ip\000"
	.type	__func__.11411, %object
	.size	__func__.11411, 26
__func__.11411:
	.ascii	"set_h265_sao_luma_disable\000"
	.type	__func__.11427, %object
	.size	__func__.11427, 26
__func__.11427:
	.ascii	"get_h265_sao_luma_disable\000"
	.type	__func__.11436, %object
	.size	__func__.11436, 28
__func__.11436:
	.ascii	"set_h265_sao_chroma_disable\000"
	.type	__func__.11452, %object
	.size	__func__.11452, 28
__func__.11452:
	.ascii	"get_h265_sao_chroma_disable\000"
	.type	__func__.11461, %object
	.size	__func__.11461, 23
__func__.11461:
	.ascii	"set_h265_sao_bit_ratio\000"
	.type	__func__.11477, %object
	.size	__func__.11477, 23
__func__.11477:
	.ascii	"get_h265_sao_bit_ratio\000"
	.type	__func__.11486, %object
	.size	__func__.11486, 16
__func__.11486:
	.ascii	"set_vp8_qp_init\000"
	.type	__func__.11502, %object
	.size	__func__.11502, 16
__func__.11502:
	.ascii	"get_vp8_qp_init\000"
	.type	__func__.11511, %object
	.size	__func__.11511, 15
__func__.11511:
	.ascii	"set_vp8_qp_min\000"
	.type	__func__.11527, %object
	.size	__func__.11527, 15
__func__.11527:
	.ascii	"get_vp8_qp_min\000"
	.type	__func__.11536, %object
	.size	__func__.11536, 15
__func__.11536:
	.ascii	"set_vp8_qp_max\000"
	.type	__func__.11552, %object
	.size	__func__.11552, 15
__func__.11552:
	.ascii	"get_vp8_qp_max\000"
	.type	__func__.11561, %object
	.size	__func__.11561, 17
__func__.11561:
	.ascii	"set_vp8_qp_min_i\000"
	.type	__func__.11577, %object
	.size	__func__.11577, 17
__func__.11577:
	.ascii	"get_vp8_qp_min_i\000"
	.type	__func__.11586, %object
	.size	__func__.11586, 17
__func__.11586:
	.ascii	"set_vp8_qp_max_i\000"
	.type	__func__.11602, %object
	.size	__func__.11602, 17
__func__.11602:
	.ascii	"get_vp8_qp_max_i\000"
	.type	__func__.11611, %object
	.size	__func__.11611, 16
__func__.11611:
	.ascii	"set_vp8_qp_step\000"
	.type	__func__.11627, %object
	.size	__func__.11627, 16
__func__.11627:
	.ascii	"get_vp8_qp_step\000"
	.type	__func__.11636, %object
	.size	__func__.11636, 20
__func__.11636:
	.ascii	"set_vp8_qp_delta_ip\000"
	.type	__func__.11652, %object
	.size	__func__.11652, 20
__func__.11652:
	.ascii	"get_vp8_qp_delta_ip\000"
	.type	__func__.11661, %object
	.size	__func__.11661, 20
__func__.11661:
	.ascii	"set_vp8_disable_ivf\000"
	.type	__func__.11677, %object
	.size	__func__.11677, 20
__func__.11677:
	.ascii	"get_vp8_disable_ivf\000"
	.type	__func__.11686, %object
	.size	__func__.11686, 15
__func__.11686:
	.ascii	"set_jpeg_quant\000"
	.type	__func__.11702, %object
	.size	__func__.11702, 15
__func__.11702:
	.ascii	"get_jpeg_quant\000"
	.type	__func__.11711, %object
	.size	__func__.11711, 18
__func__.11711:
	.ascii	"set_jpeg_qtable_y\000"
	.type	__func__.11727, %object
	.size	__func__.11727, 18
__func__.11727:
	.ascii	"get_jpeg_qtable_y\000"
	.type	__func__.11736, %object
	.size	__func__.11736, 18
__func__.11736:
	.ascii	"set_jpeg_qtable_u\000"
	.type	__func__.11752, %object
	.size	__func__.11752, 18
__func__.11752:
	.ascii	"get_jpeg_qtable_u\000"
	.type	__func__.11761, %object
	.size	__func__.11761, 18
__func__.11761:
	.ascii	"set_jpeg_qtable_v\000"
	.type	__func__.11777, %object
	.size	__func__.11777, 18
__func__.11777:
	.ascii	"get_jpeg_qtable_v\000"
	.type	__func__.11786, %object
	.size	__func__.11786, 18
__func__.11786:
	.ascii	"set_jpeg_q_factor\000"
	.type	__func__.11802, %object
	.size	__func__.11802, 18
__func__.11802:
	.ascii	"get_jpeg_q_factor\000"
	.type	__func__.11811, %object
	.size	__func__.11811, 16
__func__.11811:
	.ascii	"set_jpeg_qf_max\000"
	.type	__func__.11827, %object
	.size	__func__.11827, 16
__func__.11827:
	.ascii	"get_jpeg_qf_max\000"
	.type	__func__.11836, %object
	.size	__func__.11836, 16
__func__.11836:
	.ascii	"set_jpeg_qf_min\000"
	.type	__func__.11852, %object
	.size	__func__.11852, 16
__func__.11852:
	.ascii	"get_jpeg_qf_min\000"
	.type	__func__.11861, %object
	.size	__func__.11861, 15
__func__.11861:
	.ascii	"set_split_mode\000"
	.type	__func__.11877, %object
	.size	__func__.11877, 15
__func__.11877:
	.ascii	"get_split_mode\000"
	.type	__func__.11886, %object
	.size	__func__.11886, 14
__func__.11886:
	.ascii	"set_split_arg\000"
	.type	__func__.11902, %object
	.size	__func__.11902, 14
__func__.11902:
	.ascii	"get_split_arg\000"
	.type	__func__.11911, %object
	.size	__func__.11911, 14
__func__.11911:
	.ascii	"set_hw_qp_row\000"
	.type	__func__.11927, %object
	.size	__func__.11927, 14
__func__.11927:
	.ascii	"get_hw_qp_row\000"
	.type	__func__.11936, %object
	.size	__func__.11936, 16
__func__.11936:
	.ascii	"set_hw_qp_row_i\000"
	.type	__func__.11952, %object
	.size	__func__.11952, 16
__func__.11952:
	.ascii	"get_hw_qp_row_i\000"
	.type	__func__.11961, %object
	.size	__func__.11961, 17
__func__.11961:
	.ascii	"set_hw_aq_thrd_i\000"
	.type	__func__.11977, %object
	.size	__func__.11977, 17
__func__.11977:
	.ascii	"get_hw_aq_thrd_i\000"
	.type	__func__.11986, %object
	.size	__func__.11986, 17
__func__.11986:
	.ascii	"set_hw_aq_thrd_p\000"
	.type	__func__.12002, %object
	.size	__func__.12002, 17
__func__.12002:
	.ascii	"get_hw_aq_thrd_p\000"
	.type	__func__.12011, %object
	.size	__func__.12011, 17
__func__.12011:
	.ascii	"set_hw_aq_step_i\000"
	.type	__func__.12027, %object
	.size	__func__.12027, 17
__func__.12027:
	.ascii	"get_hw_aq_step_i\000"
	.type	__func__.12036, %object
	.size	__func__.12036, 17
__func__.12036:
	.ascii	"set_hw_aq_step_p\000"
	.type	__func__.12052, %object
	.size	__func__.12052, 17
__func__.12052:
	.ascii	"get_hw_aq_step_p\000"
	.type	__func__.12061, %object
	.size	__func__.12061, 20
__func__.12061:
	.ascii	"set_tune_scene_mode\000"
	.type	__func__.12077, %object
	.size	__func__.12077, 20
__func__.12077:
	.ascii	"get_tune_scene_mode\000"
	.type	__func__.12086, %object
	.size	__func__.12086, 37
__func__.12086:
	.ascii	"set_tune_motion_static_switch_enable\000"
	.type	__func__.12102, %object
	.size	__func__.12102, 37
__func__.12102:
	.ascii	"get_tune_motion_static_switch_enable\000"
	.type	__func__.12242, %object
	.size	__func__.12242, 21
__func__.12242:
	.ascii	"mpp_enc_cfg_api_init\000"
	.space	3
	.type	cfg_apis, %object
	.size	cfg_apis, 512
cfg_apis:
	.word	api_base_low_delay
	.word	api_rc_mode
	.word	api_rc_bps_target
	.word	api_rc_bps_max
	.word	api_rc_bps_min
	.word	api_rc_fps_in_flex
	.word	api_rc_fps_in_num
	.word	api_rc_fps_in_denorm
	.word	api_rc_fps_out_flex
	.word	api_rc_fps_out_num
	.word	api_rc_fps_out_denorm
	.word	api_rc_gop
	.word	api_rc_max_reenc_times
	.word	api_rc_priority
	.word	api_rc_drop_mode
	.word	api_rc_drop_thd
	.word	api_rc_drop_gap
	.word	api_rc_max_i_prop
	.word	api_rc_min_i_prop
	.word	api_rc_init_ip_ratio
	.word	api_rc_super_mode
	.word	api_rc_super_i_thd
	.word	api_rc_super_p_thd
	.word	api_rc_debreath_en
	.word	api_rc_debreath_strength
	.word	api_rc_qp_init
	.word	api_rc_qp_min
	.word	api_rc_qp_max
	.word	api_rc_qp_min_i
	.word	api_rc_qp_max_i
	.word	api_rc_qp_step
	.word	api_rc_qp_ip
	.word	api_rc_qp_vi
	.word	api_rc_hier_qp_en
	.word	api_rc_hier_qp_delta
	.word	api_rc_hier_frame_num
	.word	api_rc_stats_time
	.word	api_rc_fm_lvl_qp_min_i
	.word	api_rc_fm_lvl_qp_min_p
	.word	api_rc_fm_lvl_qp_max_i
	.word	api_rc_fm_lvl_qp_max_p
	.word	api_rc_mt_st_swth_frm_qp
	.word	api_prep_width
	.word	api_prep_height
	.word	api_prep_hor_stride
	.word	api_prep_ver_stride
	.word	api_prep_max_width
	.word	api_prep_max_height
	.word	api_prep_format
	.word	api_prep_colorspace
	.word	api_prep_colorprim
	.word	api_prep_colortrc
	.word	api_prep_colorrange
	.word	api_prep_range
	.word	api_prep_rotation
	.word	api_prep_mirroring
	.word	api_codec_type
	.word	api_h264_stream_type
	.word	api_h264_profile
	.word	api_h264_level
	.word	api_h264_poc_type
	.word	api_h264_log2_max_poc_lsb
	.word	api_h264_log2_max_frm_num
	.word	api_h264_gaps_not_allowed
	.word	api_h264_cabac_en
	.word	api_h264_cabac_idc
	.word	api_h264_trans8x8
	.word	api_h264_const_intra
	.word	api_h264_scaling_list
	.word	api_h264_cb_qp_offset
	.word	api_h264_cr_qp_offset
	.word	api_h264_dblk_disable
	.word	api_h264_dblk_alpha
	.word	api_h264_dblk_beta
	.word	api_h264_qp_init
	.word	api_h264_qp_min
	.word	api_h264_qp_max
	.word	api_h264_qp_min_i
	.word	api_h264_qp_max_i
	.word	api_h264_qp_step
	.word	api_h264_qp_delta_ip
	.word	api_h264_max_tid
	.word	api_h264_max_ltr
	.word	api_h264_prefix_mode
	.word	api_h264_base_layer_pid
	.word	api_h265_profile
	.word	api_h265_level
	.word	api_h265_scaling_list
	.word	api_h265_cb_qp_offset
	.word	api_h265_cr_qp_offset
	.word	api_h265_dblk_disable
	.word	api_h265_dblk_alpha
	.word	api_h265_dblk_beta
	.word	api_h265_qp_init
	.word	api_h265_qp_min
	.word	api_h265_qp_max
	.word	api_h265_qp_min_i
	.word	api_h265_qp_max_i
	.word	api_h265_qp_step
	.word	api_h265_qp_delta_ip
	.word	api_h265_sao_luma_disable
	.word	api_h265_sao_chroma_disable
	.word	api_h265_sao_bit_ratio
	.word	api_vp8_qp_init
	.word	api_vp8_qp_min
	.word	api_vp8_qp_max
	.word	api_vp8_qp_min_i
	.word	api_vp8_qp_max_i
	.word	api_vp8_qp_step
	.word	api_vp8_qp_delta_ip
	.word	api_vp8_disable_ivf
	.word	api_jpeg_quant
	.word	api_jpeg_qtable_y
	.word	api_jpeg_qtable_u
	.word	api_jpeg_qtable_v
	.word	api_jpeg_q_factor
	.word	api_jpeg_qf_max
	.word	api_jpeg_qf_min
	.word	api_split_mode
	.word	api_split_arg
	.word	api_hw_qp_row
	.word	api_hw_qp_row_i
	.word	api_hw_aq_thrd_i
	.word	api_hw_aq_thrd_p
	.word	api_hw_aq_step_i
	.word	api_hw_aq_step_p
	.word	api_tune_scene_mode
	.word	api_tune_motion_static_switch_enable
	.type	__func__.12255, %object
	.size	__func__.12255, 17
__func__.12255:
	.ascii	"mpp_enc_cfg_init\000"
	.type	__FUNCTION__.12256, %object
	.size	__FUNCTION__.12256, 17
__FUNCTION__.12256:
	.ascii	"mpp_enc_cfg_init\000"
	.type	__func__.12260, %object
	.size	__func__.12260, 19
__func__.12260:
	.ascii	"mpp_enc_cfg_deinit\000"
	.type	__FUNCTION__.12261, %object
	.size	__FUNCTION__.12261, 19
__FUNCTION__.12261:
	.ascii	"mpp_enc_cfg_deinit\000"
	.type	__func__.12271, %object
	.size	__func__.12271, 20
__func__.12271:
	.ascii	"mpp_enc_cfg_set_s32\000"
	.type	__func__.12281, %object
	.size	__func__.12281, 20
__func__.12281:
	.ascii	"mpp_enc_cfg_set_u32\000"
	.type	__func__.12291, %object
	.size	__func__.12291, 20
__func__.12291:
	.ascii	"mpp_enc_cfg_set_s64\000"
	.type	__func__.12301, %object
	.size	__func__.12301, 20
__func__.12301:
	.ascii	"mpp_enc_cfg_set_u64\000"
	.type	__func__.12311, %object
	.size	__func__.12311, 20
__func__.12311:
	.ascii	"mpp_enc_cfg_set_ptr\000"
	.type	__func__.12321, %object
	.size	__func__.12321, 19
__func__.12321:
	.ascii	"mpp_enc_cfg_set_st\000"
	.type	__func__.12331, %object
	.size	__func__.12331, 20
__func__.12331:
	.ascii	"mpp_enc_cfg_get_s32\000"
	.type	__func__.12341, %object
	.size	__func__.12341, 20
__func__.12341:
	.ascii	"mpp_enc_cfg_get_u32\000"
	.type	__func__.12351, %object
	.size	__func__.12351, 20
__func__.12351:
	.ascii	"mpp_enc_cfg_get_s64\000"
	.type	__func__.12361, %object
	.size	__func__.12361, 20
__func__.12361:
	.ascii	"mpp_enc_cfg_get_u64\000"
	.type	__func__.12371, %object
	.size	__func__.12371, 20
__func__.12371:
	.ascii	"mpp_enc_cfg_get_ptr\000"
	.type	__func__.12381, %object
	.size	__func__.12381, 19
__func__.12381:
	.ascii	"mpp_enc_cfg_get_st\000"
	.data
	.align	2
	.type	api_tune_motion_static_switch_enable, %object
	.size	api_tune_motion_static_switch_enable, 20
api_tune_motion_static_switch_enable:
	.word	.LC16
	.byte	64
	.byte	0
	.short	4716
	.byte	65
	.byte	0
	.short	4708
	.word	set_tune_motion_static_switch_enable
	.word	get_tune_motion_static_switch_enable
	.type	api_tune_scene_mode, %object
	.size	api_tune_scene_mode, 20
api_tune_scene_mode:
	.word	.LC17
	.byte	64
	.byte	0
	.short	4712
	.byte	65
	.byte	0
	.short	4708
	.word	set_tune_scene_mode
	.word	get_tune_scene_mode
	.type	api_hw_aq_step_p, %object
	.size	api_hw_aq_step_p, 20
api_hw_aq_step_p:
	.word	.LC18
	.byte	5
	.byte	4
	.short	508
	.byte	65
	.byte	0
	.short	304
	.word	set_hw_aq_step_p
	.word	get_hw_aq_step_p
	.type	api_hw_aq_step_i, %object
	.size	api_hw_aq_step_i, 20
api_hw_aq_step_i:
	.word	.LC19
	.byte	5
	.byte	4
	.short	444
	.byte	65
	.byte	0
	.short	304
	.word	set_hw_aq_step_i
	.word	get_hw_aq_step_i
	.type	api_hw_aq_thrd_p, %object
	.size	api_hw_aq_thrd_p, 20
api_hw_aq_thrd_p:
	.word	.LC20
	.byte	5
	.byte	4
	.short	380
	.byte	65
	.byte	0
	.short	304
	.word	set_hw_aq_thrd_p
	.word	get_hw_aq_thrd_p
	.type	api_hw_aq_thrd_i, %object
	.size	api_hw_aq_thrd_i, 20
api_hw_aq_thrd_i:
	.word	.LC21
	.byte	5
	.byte	4
	.short	316
	.byte	65
	.byte	0
	.short	304
	.word	set_hw_aq_thrd_i
	.word	get_hw_aq_thrd_i
	.type	api_hw_qp_row_i, %object
	.size	api_hw_qp_row_i, 20
api_hw_qp_row_i:
	.word	.LC22
	.byte	64
	.byte	0
	.short	312
	.byte	65
	.byte	0
	.short	304
	.word	set_hw_qp_row_i
	.word	get_hw_qp_row_i
	.type	api_hw_qp_row, %object
	.size	api_hw_qp_row, 20
api_hw_qp_row:
	.word	.LC23
	.byte	64
	.byte	0
	.short	308
	.byte	65
	.byte	0
	.short	304
	.word	set_hw_qp_row
	.word	get_hw_qp_row
	.type	api_split_arg, %object
	.size	api_split_arg, 20
api_split_arg:
	.word	.LC24
	.byte	65
	.byte	0
	.short	3412
	.byte	65
	.byte	0
	.short	3404
	.word	set_split_arg
	.word	get_split_arg
	.type	api_split_mode, %object
	.size	api_split_mode, 20
api_split_mode:
	.word	.LC25
	.byte	65
	.byte	0
	.short	3408
	.byte	65
	.byte	0
	.short	3404
	.word	set_split_mode
	.word	get_split_mode
	.type	api_jpeg_qf_min, %object
	.size	api_jpeg_qf_min, 20
api_jpeg_qf_min:
	.word	.LC26
	.byte	64
	.byte	0
	.short	592
	.byte	65
	.byte	0
	.short	576
	.word	set_jpeg_qf_min
	.word	get_jpeg_qf_min
	.type	api_jpeg_qf_max, %object
	.size	api_jpeg_qf_max, 20
api_jpeg_qf_max:
	.word	.LC27
	.byte	64
	.byte	0
	.short	588
	.byte	65
	.byte	0
	.short	576
	.word	set_jpeg_qf_max
	.word	get_jpeg_qf_max
	.type	api_jpeg_q_factor, %object
	.size	api_jpeg_q_factor, 20
api_jpeg_q_factor:
	.word	.LC28
	.byte	64
	.byte	0
	.short	584
	.byte	65
	.byte	0
	.short	576
	.word	set_jpeg_q_factor
	.word	get_jpeg_q_factor
	.type	api_jpeg_qtable_v, %object
	.size	api_jpeg_qtable_v, 20
api_jpeg_qtable_v:
	.word	.LC29
	.byte	68
	.byte	0
	.short	604
	.byte	65
	.byte	0
	.short	576
	.word	set_jpeg_qtable_v
	.word	get_jpeg_qtable_v
	.type	api_jpeg_qtable_u, %object
	.size	api_jpeg_qtable_u, 20
api_jpeg_qtable_u:
	.word	.LC30
	.byte	68
	.byte	0
	.short	600
	.byte	65
	.byte	0
	.short	576
	.word	set_jpeg_qtable_u
	.word	get_jpeg_qtable_u
	.type	api_jpeg_qtable_y, %object
	.size	api_jpeg_qtable_y, 20
api_jpeg_qtable_y:
	.word	.LC31
	.byte	68
	.byte	0
	.short	596
	.byte	65
	.byte	0
	.short	576
	.word	set_jpeg_qtable_y
	.word	get_jpeg_qtable_y
	.type	api_jpeg_quant, %object
	.size	api_jpeg_quant, 20
api_jpeg_quant:
	.word	.LC32
	.byte	64
	.byte	0
	.short	580
	.byte	65
	.byte	0
	.short	576
	.word	set_jpeg_quant
	.word	get_jpeg_quant
	.type	api_vp8_disable_ivf, %object
	.size	api_vp8_disable_ivf, 20
api_vp8_disable_ivf:
	.word	.LC33
	.byte	64
	.byte	0
	.short	608
	.byte	65
	.byte	0
	.short	576
	.word	set_vp8_disable_ivf
	.word	get_vp8_disable_ivf
	.type	api_vp8_qp_delta_ip, %object
	.size	api_vp8_qp_delta_ip, 20
api_vp8_qp_delta_ip:
	.word	.LC34
	.byte	64
	.byte	0
	.short	240
	.byte	65
	.byte	0
	.short	104
	.word	set_vp8_qp_delta_ip
	.word	get_vp8_qp_delta_ip
	.type	api_vp8_qp_step, %object
	.size	api_vp8_qp_step, 20
api_vp8_qp_step:
	.word	.LC35
	.byte	64
	.byte	0
	.short	236
	.byte	65
	.byte	0
	.short	104
	.word	set_vp8_qp_step
	.word	get_vp8_qp_step
	.type	api_vp8_qp_max_i, %object
	.size	api_vp8_qp_max_i, 20
api_vp8_qp_max_i:
	.word	.LC36
	.byte	64
	.byte	0
	.short	224
	.byte	65
	.byte	0
	.short	104
	.word	set_vp8_qp_max_i
	.word	get_vp8_qp_max_i
	.type	api_vp8_qp_min_i, %object
	.size	api_vp8_qp_min_i, 20
api_vp8_qp_min_i:
	.word	.LC37
	.byte	64
	.byte	0
	.short	232
	.byte	65
	.byte	0
	.short	104
	.word	set_vp8_qp_min_i
	.word	get_vp8_qp_min_i
	.type	api_vp8_qp_max, %object
	.size	api_vp8_qp_max, 20
api_vp8_qp_max:
	.word	.LC38
	.byte	64
	.byte	0
	.short	220
	.byte	65
	.byte	0
	.short	104
	.word	set_vp8_qp_max
	.word	get_vp8_qp_max
	.type	api_vp8_qp_min, %object
	.size	api_vp8_qp_min, 20
api_vp8_qp_min:
	.word	.LC39
	.byte	64
	.byte	0
	.short	228
	.byte	65
	.byte	0
	.short	104
	.word	set_vp8_qp_min
	.word	get_vp8_qp_min
	.type	api_vp8_qp_init, %object
	.size	api_vp8_qp_init, 20
api_vp8_qp_init:
	.word	.LC40
	.byte	64
	.byte	0
	.short	216
	.byte	65
	.byte	0
	.short	104
	.word	set_vp8_qp_init
	.word	get_vp8_qp_init
	.type	api_h265_sao_bit_ratio, %object
	.size	api_h265_sao_bit_ratio, 20
api_h265_sao_bit_ratio:
	.word	.LC41
	.byte	64
	.byte	0
	.short	768
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_sao_bit_ratio
	.word	get_h265_sao_bit_ratio
	.type	api_h265_sao_chroma_disable, %object
	.size	api_h265_sao_chroma_disable, 20
api_h265_sao_chroma_disable:
	.word	.LC42
	.byte	64
	.byte	0
	.short	764
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_sao_chroma_disable
	.word	get_h265_sao_chroma_disable
	.type	api_h265_sao_luma_disable, %object
	.size	api_h265_sao_luma_disable, 20
api_h265_sao_luma_disable:
	.word	.LC43
	.byte	64
	.byte	0
	.short	760
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_sao_luma_disable
	.word	get_h265_sao_luma_disable
	.type	api_h265_qp_delta_ip, %object
	.size	api_h265_qp_delta_ip, 20
api_h265_qp_delta_ip:
	.word	.LC44
	.byte	64
	.byte	0
	.short	240
	.byte	65
	.byte	0
	.short	104
	.word	set_h265_qp_delta_ip
	.word	get_h265_qp_delta_ip
	.type	api_h265_qp_step, %object
	.size	api_h265_qp_step, 20
api_h265_qp_step:
	.word	.LC45
	.byte	64
	.byte	0
	.short	236
	.byte	65
	.byte	0
	.short	104
	.word	set_h265_qp_step
	.word	get_h265_qp_step
	.type	api_h265_qp_max_i, %object
	.size	api_h265_qp_max_i, 20
api_h265_qp_max_i:
	.word	.LC46
	.byte	64
	.byte	0
	.short	224
	.byte	65
	.byte	0
	.short	104
	.word	set_h265_qp_max_i
	.word	get_h265_qp_max_i
	.type	api_h265_qp_min_i, %object
	.size	api_h265_qp_min_i, 20
api_h265_qp_min_i:
	.word	.LC47
	.byte	64
	.byte	0
	.short	232
	.byte	65
	.byte	0
	.short	104
	.word	set_h265_qp_min_i
	.word	get_h265_qp_min_i
	.type	api_h265_qp_max, %object
	.size	api_h265_qp_max, 20
api_h265_qp_max:
	.word	.LC48
	.byte	64
	.byte	0
	.short	220
	.byte	65
	.byte	0
	.short	104
	.word	set_h265_qp_max
	.word	get_h265_qp_max
	.type	api_h265_qp_min, %object
	.size	api_h265_qp_min, 20
api_h265_qp_min:
	.word	.LC49
	.byte	64
	.byte	0
	.short	228
	.byte	65
	.byte	0
	.short	104
	.word	set_h265_qp_min
	.word	get_h265_qp_min
	.type	api_h265_qp_init, %object
	.size	api_h265_qp_init, 20
api_h265_qp_init:
	.word	.LC50
	.byte	64
	.byte	0
	.short	216
	.byte	65
	.byte	0
	.short	104
	.word	set_h265_qp_init
	.word	get_h265_qp_init
	.type	api_h265_dblk_beta, %object
	.size	api_h265_dblk_beta, 20
api_h265_dblk_beta:
	.word	.LC51
	.byte	64
	.byte	0
	.short	780
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_dblk_beta
	.word	get_h265_dblk_beta
	.type	api_h265_dblk_alpha, %object
	.size	api_h265_dblk_alpha, 20
api_h265_dblk_alpha:
	.word	.LC52
	.byte	64
	.byte	0
	.short	776
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_dblk_alpha
	.word	get_h265_dblk_alpha
	.type	api_h265_dblk_disable, %object
	.size	api_h265_dblk_disable, 20
api_h265_dblk_disable:
	.word	.LC53
	.byte	65
	.byte	0
	.short	772
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_dblk_disable
	.word	get_h265_dblk_disable
	.type	api_h265_cr_qp_offset, %object
	.size	api_h265_cr_qp_offset, 20
api_h265_cr_qp_offset:
	.word	.LC54
	.byte	64
	.byte	0
	.short	756
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_cr_qp_offset
	.word	get_h265_cr_qp_offset
	.type	api_h265_cb_qp_offset, %object
	.size	api_h265_cb_qp_offset, 20
api_h265_cb_qp_offset:
	.word	.LC55
	.byte	64
	.byte	0
	.short	752
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_cb_qp_offset
	.word	get_h265_cb_qp_offset
	.type	api_h265_scaling_list, %object
	.size	api_h265_scaling_list, 20
api_h265_scaling_list:
	.word	.LC56
	.byte	65
	.byte	0
	.short	748
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_scaling_list
	.word	get_h265_scaling_list
	.type	api_h265_level, %object
	.size	api_h265_level, 20
api_h265_level:
	.word	.LC57
	.byte	64
	.byte	0
	.short	584
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_level
	.word	get_h265_level
	.type	api_h265_profile, %object
	.size	api_h265_profile, 20
api_h265_profile:
	.word	.LC58
	.byte	64
	.byte	0
	.short	580
	.byte	65
	.byte	0
	.short	576
	.word	set_h265_profile
	.word	get_h265_profile
	.type	api_h264_base_layer_pid, %object
	.size	api_h264_base_layer_pid, 20
api_h264_base_layer_pid:
	.word	.LC59
	.byte	64
	.byte	0
	.short	688
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_base_layer_pid
	.word	get_h264_base_layer_pid
	.type	api_h264_prefix_mode, %object
	.size	api_h264_prefix_mode, 20
api_h264_prefix_mode:
	.word	.LC60
	.byte	64
	.byte	0
	.short	684
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_prefix_mode
	.word	get_h264_prefix_mode
	.type	api_h264_max_ltr, %object
	.size	api_h264_max_ltr, 20
api_h264_max_ltr:
	.word	.LC61
	.byte	64
	.byte	0
	.short	676
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_max_ltr
	.word	get_h264_max_ltr
	.type	api_h264_max_tid, %object
	.size	api_h264_max_tid, 20
api_h264_max_tid:
	.word	.LC62
	.byte	64
	.byte	0
	.short	680
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_max_tid
	.word	get_h264_max_tid
	.type	api_h264_qp_delta_ip, %object
	.size	api_h264_qp_delta_ip, 20
api_h264_qp_delta_ip:
	.word	.LC63
	.byte	64
	.byte	0
	.short	240
	.byte	65
	.byte	0
	.short	104
	.word	set_h264_qp_delta_ip
	.word	get_h264_qp_delta_ip
	.type	api_h264_qp_step, %object
	.size	api_h264_qp_step, 20
api_h264_qp_step:
	.word	.LC64
	.byte	64
	.byte	0
	.short	236
	.byte	65
	.byte	0
	.short	104
	.word	set_h264_qp_step
	.word	get_h264_qp_step
	.type	api_h264_qp_max_i, %object
	.size	api_h264_qp_max_i, 20
api_h264_qp_max_i:
	.word	.LC65
	.byte	64
	.byte	0
	.short	224
	.byte	65
	.byte	0
	.short	104
	.word	set_h264_qp_max_i
	.word	get_h264_qp_max_i
	.type	api_h264_qp_min_i, %object
	.size	api_h264_qp_min_i, 20
api_h264_qp_min_i:
	.word	.LC66
	.byte	64
	.byte	0
	.short	232
	.byte	65
	.byte	0
	.short	104
	.word	set_h264_qp_min_i
	.word	get_h264_qp_min_i
	.type	api_h264_qp_max, %object
	.size	api_h264_qp_max, 20
api_h264_qp_max:
	.word	.LC67
	.byte	64
	.byte	0
	.short	220
	.byte	65
	.byte	0
	.short	104
	.word	set_h264_qp_max
	.word	get_h264_qp_max
	.type	api_h264_qp_min, %object
	.size	api_h264_qp_min, 20
api_h264_qp_min:
	.word	.LC68
	.byte	64
	.byte	0
	.short	228
	.byte	65
	.byte	0
	.short	104
	.word	set_h264_qp_min
	.word	get_h264_qp_min
	.type	api_h264_qp_init, %object
	.size	api_h264_qp_init, 20
api_h264_qp_init:
	.word	.LC69
	.byte	64
	.byte	0
	.short	216
	.byte	65
	.byte	0
	.short	104
	.word	set_h264_qp_init
	.word	get_h264_qp_init
	.type	api_h264_dblk_beta, %object
	.size	api_h264_dblk_beta, 20
api_h264_dblk_beta:
	.word	.LC70
	.byte	64
	.byte	0
	.short	644
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_dblk_beta
	.word	get_h264_dblk_beta
	.type	api_h264_dblk_alpha, %object
	.size	api_h264_dblk_alpha, 20
api_h264_dblk_alpha:
	.word	.LC71
	.byte	64
	.byte	0
	.short	640
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_dblk_alpha
	.word	get_h264_dblk_alpha
	.type	api_h264_dblk_disable, %object
	.size	api_h264_dblk_disable, 20
api_h264_dblk_disable:
	.word	.LC72
	.byte	64
	.byte	0
	.short	636
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_dblk_disable
	.word	get_h264_dblk_disable
	.type	api_h264_cr_qp_offset, %object
	.size	api_h264_cr_qp_offset, 20
api_h264_cr_qp_offset:
	.word	.LC73
	.byte	64
	.byte	0
	.short	632
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_cr_qp_offset
	.word	get_h264_cr_qp_offset
	.type	api_h264_cb_qp_offset, %object
	.size	api_h264_cb_qp_offset, 20
api_h264_cb_qp_offset:
	.word	.LC74
	.byte	64
	.byte	0
	.short	628
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_cb_qp_offset
	.word	get_h264_cb_qp_offset
	.type	api_h264_scaling_list, %object
	.size	api_h264_scaling_list, 20
api_h264_scaling_list:
	.word	.LC75
	.byte	64
	.byte	0
	.short	624
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_scaling_list
	.word	get_h264_scaling_list
	.type	api_h264_const_intra, %object
	.size	api_h264_const_intra, 20
api_h264_const_intra:
	.word	.LC76
	.byte	64
	.byte	0
	.short	620
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_const_intra
	.word	get_h264_const_intra
	.type	api_h264_trans8x8, %object
	.size	api_h264_trans8x8, 20
api_h264_trans8x8:
	.word	.LC77
	.byte	64
	.byte	0
	.short	616
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_trans8x8
	.word	get_h264_trans8x8
	.type	api_h264_cabac_idc, %object
	.size	api_h264_cabac_idc, 20
api_h264_cabac_idc:
	.word	.LC78
	.byte	64
	.byte	0
	.short	612
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_cabac_idc
	.word	get_h264_cabac_idc
	.type	api_h264_cabac_en, %object
	.size	api_h264_cabac_en, 20
api_h264_cabac_en:
	.word	.LC79
	.byte	64
	.byte	0
	.short	608
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_cabac_en
	.word	get_h264_cabac_en
	.type	api_h264_gaps_not_allowed, %object
	.size	api_h264_gaps_not_allowed, 20
api_h264_gaps_not_allowed:
	.word	.LC80
	.byte	65
	.byte	0
	.short	596
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_gaps_not_allowed
	.word	get_h264_gaps_not_allowed
	.type	api_h264_log2_max_frm_num, %object
	.size	api_h264_log2_max_frm_num, 20
api_h264_log2_max_frm_num:
	.word	.LC81
	.byte	65
	.byte	0
	.short	592
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_log2_max_frm_num
	.word	get_h264_log2_max_frm_num
	.type	api_h264_log2_max_poc_lsb, %object
	.size	api_h264_log2_max_poc_lsb, 20
api_h264_log2_max_poc_lsb:
	.word	.LC82
	.byte	65
	.byte	0
	.short	588
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_log2_max_poc_lsb
	.word	get_h264_log2_max_poc_lsb
	.type	api_h264_poc_type, %object
	.size	api_h264_poc_type, 20
api_h264_poc_type:
	.word	.LC83
	.byte	65
	.byte	0
	.short	584
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_poc_type
	.word	get_h264_poc_type
	.type	api_h264_level, %object
	.size	api_h264_level, 20
api_h264_level:
	.word	.LC84
	.byte	64
	.byte	0
	.short	604
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_level
	.word	get_h264_level
	.type	api_h264_profile, %object
	.size	api_h264_profile, 20
api_h264_profile:
	.word	.LC85
	.byte	64
	.byte	0
	.short	600
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_profile
	.word	get_h264_profile
	.type	api_h264_stream_type, %object
	.size	api_h264_stream_type, 20
api_h264_stream_type:
	.word	.LC86
	.byte	64
	.byte	0
	.short	580
	.byte	65
	.byte	0
	.short	576
	.word	set_h264_stream_type
	.word	get_h264_stream_type
	.type	api_codec_type, %object
	.size	api_codec_type, 20
api_codec_type:
	.word	.LC87
	.byte	64
	.byte	0
	.short	572
	.byte	65
	.byte	0
	.short	576
	.word	set_codec_type
	.word	get_codec_type
	.type	api_prep_mirroring, %object
	.size	api_prep_mirroring, 20
api_prep_mirroring:
	.word	.LC88
	.byte	64
	.byte	0
	.short	60
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_mirroring
	.word	get_prep_mirroring
	.type	api_prep_rotation, %object
	.size	api_prep_rotation, 20
api_prep_rotation:
	.word	.LC89
	.byte	64
	.byte	0
	.short	56
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_rotation
	.word	get_prep_rotation
	.type	api_prep_range, %object
	.size	api_prep_range, 20
api_prep_range:
	.word	.LC90
	.byte	64
	.byte	0
	.short	52
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_range
	.word	get_prep_range
	.type	api_prep_colorrange, %object
	.size	api_prep_colorrange, 20
api_prep_colorrange:
	.word	.LC91
	.byte	64
	.byte	0
	.short	52
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_colorrange
	.word	get_prep_colorrange
	.type	api_prep_colortrc, %object
	.size	api_prep_colortrc, 20
api_prep_colortrc:
	.word	.LC92
	.byte	64
	.byte	0
	.short	48
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_colortrc
	.word	get_prep_colortrc
	.type	api_prep_colorprim, %object
	.size	api_prep_colorprim, 20
api_prep_colorprim:
	.word	.LC93
	.byte	64
	.byte	0
	.short	44
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_colorprim
	.word	get_prep_colorprim
	.type	api_prep_colorspace, %object
	.size	api_prep_colorspace, 20
api_prep_colorspace:
	.word	.LC94
	.byte	64
	.byte	0
	.short	40
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_colorspace
	.word	get_prep_colorspace
	.type	api_prep_format, %object
	.size	api_prep_format, 20
api_prep_format:
	.word	.LC95
	.byte	64
	.byte	0
	.short	36
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_format
	.word	get_prep_format
	.type	api_prep_max_height, %object
	.size	api_prep_max_height, 20
api_prep_max_height:
	.word	.LC96
	.byte	64
	.byte	0
	.short	32
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_max_height
	.word	get_prep_max_height
	.type	api_prep_max_width, %object
	.size	api_prep_max_width, 20
api_prep_max_width:
	.word	.LC97
	.byte	64
	.byte	0
	.short	28
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_max_width
	.word	get_prep_max_width
	.type	api_prep_ver_stride, %object
	.size	api_prep_ver_stride, 20
api_prep_ver_stride:
	.word	.LC98
	.byte	64
	.byte	0
	.short	24
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_ver_stride
	.word	get_prep_ver_stride
	.type	api_prep_hor_stride, %object
	.size	api_prep_hor_stride, 20
api_prep_hor_stride:
	.word	.LC99
	.byte	64
	.byte	0
	.short	20
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_hor_stride
	.word	get_prep_hor_stride
	.type	api_prep_height, %object
	.size	api_prep_height, 20
api_prep_height:
	.word	.LC100
	.byte	64
	.byte	0
	.short	16
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_height
	.word	get_prep_height
	.type	api_prep_width, %object
	.size	api_prep_width, 20
api_prep_width:
	.word	.LC101
	.byte	64
	.byte	0
	.short	12
	.byte	65
	.byte	0
	.short	8
	.word	set_prep_width
	.word	get_prep_width
	.type	api_rc_mt_st_swth_frm_qp, %object
	.size	api_rc_mt_st_swth_frm_qp, 20
api_rc_mt_st_swth_frm_qp:
	.word	.LC102
	.byte	64
	.byte	0
	.short	264
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_mt_st_swth_frm_qp
	.word	get_rc_mt_st_swth_frm_qp
	.type	api_rc_fm_lvl_qp_max_p, %object
	.size	api_rc_fm_lvl_qp_max_p, 20
api_rc_fm_lvl_qp_max_p:
	.word	.LC103
	.byte	64
	.byte	0
	.short	260
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fm_lvl_qp_max_p
	.word	get_rc_fm_lvl_qp_max_p
	.type	api_rc_fm_lvl_qp_max_i, %object
	.size	api_rc_fm_lvl_qp_max_i, 20
api_rc_fm_lvl_qp_max_i:
	.word	.LC104
	.byte	64
	.byte	0
	.short	256
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fm_lvl_qp_max_i
	.word	get_rc_fm_lvl_qp_max_i
	.type	api_rc_fm_lvl_qp_min_p, %object
	.size	api_rc_fm_lvl_qp_min_p, 20
api_rc_fm_lvl_qp_min_p:
	.word	.LC105
	.byte	64
	.byte	0
	.short	252
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fm_lvl_qp_min_p
	.word	get_rc_fm_lvl_qp_min_p
	.type	api_rc_fm_lvl_qp_min_i, %object
	.size	api_rc_fm_lvl_qp_min_i, 20
api_rc_fm_lvl_qp_min_i:
	.word	.LC106
	.byte	64
	.byte	0
	.short	248
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fm_lvl_qp_min_i
	.word	get_rc_fm_lvl_qp_min_i
	.type	api_rc_stats_time, %object
	.size	api_rc_stats_time, 20
api_rc_stats_time:
	.word	.LC107
	.byte	64
	.byte	0
	.short	164
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_stats_time
	.word	get_rc_stats_time
	.type	api_rc_hier_frame_num, %object
	.size	api_rc_hier_frame_num, 20
api_rc_hier_frame_num:
	.word	.LC108
	.byte	5
	.byte	1
	.short	288
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_hier_frame_num
	.word	get_rc_hier_frame_num
	.type	api_rc_hier_qp_delta, %object
	.size	api_rc_hier_qp_delta, 20
api_rc_hier_qp_delta:
	.word	.LC109
	.byte	5
	.byte	1
	.short	272
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_hier_qp_delta
	.word	get_rc_hier_qp_delta
	.type	api_rc_hier_qp_en, %object
	.size	api_rc_hier_qp_en, 20
api_rc_hier_qp_en:
	.word	.LC110
	.byte	64
	.byte	0
	.short	268
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_hier_qp_en
	.word	get_rc_hier_qp_en
	.type	api_rc_qp_vi, %object
	.size	api_rc_qp_vi, 20
api_rc_qp_vi:
	.word	.LC111
	.byte	64
	.byte	0
	.short	244
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_qp_vi
	.word	get_rc_qp_vi
	.type	api_rc_qp_ip, %object
	.size	api_rc_qp_ip, 20
api_rc_qp_ip:
	.word	.LC112
	.byte	64
	.byte	0
	.short	240
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_qp_ip
	.word	get_rc_qp_ip
	.type	api_rc_qp_step, %object
	.size	api_rc_qp_step, 20
api_rc_qp_step:
	.word	.LC113
	.byte	64
	.byte	0
	.short	236
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_qp_step
	.word	get_rc_qp_step
	.type	api_rc_qp_max_i, %object
	.size	api_rc_qp_max_i, 20
api_rc_qp_max_i:
	.word	.LC114
	.byte	64
	.byte	0
	.short	224
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_qp_max_i
	.word	get_rc_qp_max_i
	.type	api_rc_qp_min_i, %object
	.size	api_rc_qp_min_i, 20
api_rc_qp_min_i:
	.word	.LC115
	.byte	64
	.byte	0
	.short	232
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_qp_min_i
	.word	get_rc_qp_min_i
	.type	api_rc_qp_max, %object
	.size	api_rc_qp_max, 20
api_rc_qp_max:
	.word	.LC116
	.byte	64
	.byte	0
	.short	220
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_qp_max
	.word	get_rc_qp_max
	.type	api_rc_qp_min, %object
	.size	api_rc_qp_min, 20
api_rc_qp_min:
	.word	.LC117
	.byte	64
	.byte	0
	.short	228
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_qp_min
	.word	get_rc_qp_min
	.type	api_rc_qp_init, %object
	.size	api_rc_qp_init, 20
api_rc_qp_init:
	.word	.LC118
	.byte	64
	.byte	0
	.short	216
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_qp_init
	.word	get_rc_qp_init
	.type	api_rc_debreath_strength, %object
	.size	api_rc_debreath_strength, 20
api_rc_debreath_strength:
	.word	.LC119
	.byte	65
	.byte	0
	.short	200
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_debreath_strength
	.word	get_rc_debreath_strength
	.type	api_rc_debreath_en, %object
	.size	api_rc_debreath_en, 20
api_rc_debreath_en:
	.word	.LC120
	.byte	65
	.byte	0
	.short	196
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_debreath_en
	.word	get_rc_debreath_en
	.type	api_rc_super_p_thd, %object
	.size	api_rc_super_p_thd, 20
api_rc_super_p_thd:
	.word	.LC121
	.byte	65
	.byte	0
	.short	188
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_super_p_thd
	.word	get_rc_super_p_thd
	.type	api_rc_super_i_thd, %object
	.size	api_rc_super_i_thd, 20
api_rc_super_i_thd:
	.word	.LC122
	.byte	65
	.byte	0
	.short	184
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_super_i_thd
	.word	get_rc_super_i_thd
	.type	api_rc_super_mode, %object
	.size	api_rc_super_mode, 20
api_rc_super_mode:
	.word	.LC123
	.byte	65
	.byte	0
	.short	180
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_super_mode
	.word	get_rc_super_mode
	.type	api_rc_init_ip_ratio, %object
	.size	api_rc_init_ip_ratio, 20
api_rc_init_ip_ratio:
	.word	.LC124
	.byte	64
	.byte	0
	.short	212
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_init_ip_ratio
	.word	get_rc_init_ip_ratio
	.type	api_rc_min_i_prop, %object
	.size	api_rc_min_i_prop, 20
api_rc_min_i_prop:
	.word	.LC125
	.byte	64
	.byte	0
	.short	208
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_min_i_prop
	.word	get_rc_min_i_prop
	.type	api_rc_max_i_prop, %object
	.size	api_rc_max_i_prop, 20
api_rc_max_i_prop:
	.word	.LC126
	.byte	64
	.byte	0
	.short	204
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_max_i_prop
	.word	get_rc_max_i_prop
	.type	api_rc_drop_gap, %object
	.size	api_rc_drop_gap, 20
api_rc_drop_gap:
	.word	.LC127
	.byte	65
	.byte	0
	.short	176
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_drop_gap
	.word	get_rc_drop_gap
	.type	api_rc_drop_thd, %object
	.size	api_rc_drop_thd, 20
api_rc_drop_thd:
	.word	.LC128
	.byte	65
	.byte	0
	.short	172
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_drop_thd
	.word	get_rc_drop_thd
	.type	api_rc_drop_mode, %object
	.size	api_rc_drop_mode, 20
api_rc_drop_mode:
	.word	.LC129
	.byte	65
	.byte	0
	.short	168
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_drop_mode
	.word	get_rc_drop_mode
	.type	api_rc_priority, %object
	.size	api_rc_priority, 20
api_rc_priority:
	.word	.LC130
	.byte	65
	.byte	0
	.short	192
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_priority
	.word	get_rc_priority
	.type	api_rc_max_reenc_times, %object
	.size	api_rc_max_reenc_times, 20
api_rc_max_reenc_times:
	.word	.LC131
	.byte	65
	.byte	0
	.short	160
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_max_reenc_times
	.word	get_rc_max_reenc_times
	.type	api_rc_gop, %object
	.size	api_rc_gop, 20
api_rc_gop:
	.word	.LC132
	.byte	64
	.byte	0
	.short	152
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_gop
	.word	get_rc_gop
	.type	api_rc_fps_out_denorm, %object
	.size	api_rc_fps_out_denorm, 20
api_rc_fps_out_denorm:
	.word	.LC133
	.byte	64
	.byte	0
	.short	148
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fps_out_denorm
	.word	get_rc_fps_out_denorm
	.type	api_rc_fps_out_num, %object
	.size	api_rc_fps_out_num, 20
api_rc_fps_out_num:
	.word	.LC134
	.byte	64
	.byte	0
	.short	144
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fps_out_num
	.word	get_rc_fps_out_num
	.type	api_rc_fps_out_flex, %object
	.size	api_rc_fps_out_flex, 20
api_rc_fps_out_flex:
	.word	.LC135
	.byte	64
	.byte	0
	.short	140
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fps_out_flex
	.word	get_rc_fps_out_flex
	.type	api_rc_fps_in_denorm, %object
	.size	api_rc_fps_in_denorm, 20
api_rc_fps_in_denorm:
	.word	.LC136
	.byte	64
	.byte	0
	.short	136
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fps_in_denorm
	.word	get_rc_fps_in_denorm
	.type	api_rc_fps_in_num, %object
	.size	api_rc_fps_in_num, 20
api_rc_fps_in_num:
	.word	.LC137
	.byte	64
	.byte	0
	.short	132
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fps_in_num
	.word	get_rc_fps_in_num
	.type	api_rc_fps_in_flex, %object
	.size	api_rc_fps_in_flex, 20
api_rc_fps_in_flex:
	.word	.LC138
	.byte	64
	.byte	0
	.short	128
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_fps_in_flex
	.word	get_rc_fps_in_flex
	.type	api_rc_bps_min, %object
	.size	api_rc_bps_min, 20
api_rc_bps_min:
	.word	.LC139
	.byte	64
	.byte	0
	.short	124
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_bps_min
	.word	get_rc_bps_min
	.type	api_rc_bps_max, %object
	.size	api_rc_bps_max, 20
api_rc_bps_max:
	.word	.LC140
	.byte	64
	.byte	0
	.short	120
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_bps_max
	.word	get_rc_bps_max
	.type	api_rc_bps_target, %object
	.size	api_rc_bps_target, 20
api_rc_bps_target:
	.word	.LC141
	.byte	64
	.byte	0
	.short	116
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_bps_target
	.word	get_rc_bps_target
	.type	api_rc_mode, %object
	.size	api_rc_mode, 20
api_rc_mode:
	.word	.LC142
	.byte	64
	.byte	0
	.short	108
	.byte	65
	.byte	0
	.short	104
	.word	set_rc_mode
	.word	get_rc_mode
	.type	api_base_low_delay, %object
	.size	api_base_low_delay, 20
api_base_low_delay:
	.word	.LC143
	.byte	64
	.byte	0
	.short	4
	.byte	65
	.byte	0
	.short	0
	.word	set_base_low_delay
	.word	get_base_low_delay
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mpp_enc_cfg_debug, %object
	.size	mpp_enc_cfg_debug, 4
mpp_enc_cfg_debug:
	.space	4
	.type	gCfgApi, %object
	.size	gCfgApi, 4
gCfgApi:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016%s:%d: enter\012\000"
.LC1:
	.ascii	"\0016%d: mpp_trie_init in\000"
.LC2:
	.ascii	"\0016%d: mpp_trie_init ok %p\000"
.LC3:
	.ascii	"\0013%s:%d: failed to init enc cfg set trie\012\000"
.LC4:
	.ascii	"\0016%d: mpp_enc_cfg_api_init\000"
.LC5:
	.ascii	"\0013%s:%d: create info %d with not enough node %d "
	.ascii	"-> %d info\012\000"
.LC6:
	.ascii	"\0013%s:%d: invalid NULL input config\012\000"
.LC7:
	.ascii	"\0013%s:%d: create encoder config failed %p\012\000"
.LC8:
	.ascii	"\0013%s:%d: invalid input cfg %p name %p\012\000"
.LC9:
	.ascii	"\0013%s:%d: failed to set %s to \012\000"
.LC10:
	.ascii	"\0016%s:%d: name %s type %s\012\000"
.LC11:
	.ascii	"\0013%s:%d: failed to set %s \012\000"
.LC12:
	.ascii	"\0016%d: dumping valid configure string start\012\000"
.LC13:
	.ascii	"\0016%d: %-25s type %s\012\000"
.LC14:
	.ascii	"\0016%d: dumping valid configure string done\012\000"
.LC15:
	.ascii	"\0016%d: total api count %d with node %d -> %d info"
	.ascii	"\012\000"
.LC16:
	.ascii	"tune:motion_static_switch_enable\000"
.LC17:
	.ascii	"tune:scene_mode\000"
.LC18:
	.ascii	"hw:aq_step_p\000"
.LC19:
	.ascii	"hw:aq_step_i\000"
.LC20:
	.ascii	"hw:aq_thrd_p\000"
.LC21:
	.ascii	"hw:aq_thrd_i\000"
.LC22:
	.ascii	"hw:qp_row_i\000"
.LC23:
	.ascii	"hw:qp_row\000"
.LC24:
	.ascii	"split:arg\000"
.LC25:
	.ascii	"split:mode\000"
.LC26:
	.ascii	"jpeg:qf_min\000"
.LC27:
	.ascii	"jpeg:qf_max\000"
.LC28:
	.ascii	"jpeg:q_factor\000"
.LC29:
	.ascii	"jpeg:qtable_v\000"
.LC30:
	.ascii	"jpeg:qtable_u\000"
.LC31:
	.ascii	"jpeg:qtable_y\000"
.LC32:
	.ascii	"jpeg:quant\000"
.LC33:
	.ascii	"vp8:disable_ivf\000"
.LC34:
	.ascii	"vp8:qp_delta_ip\000"
.LC35:
	.ascii	"vp8:qp_step\000"
.LC36:
	.ascii	"vp8:qp_max_i\000"
.LC37:
	.ascii	"vp8:qp_min_i\000"
.LC38:
	.ascii	"vp8:qp_max\000"
.LC39:
	.ascii	"vp8:qp_min\000"
.LC40:
	.ascii	"vp8:qp_init\000"
.LC41:
	.ascii	"h265:sao_bit_ratio\000"
.LC42:
	.ascii	"h265:sao_chroma_disable\000"
.LC43:
	.ascii	"h265:sao_luma_disable\000"
.LC44:
	.ascii	"h265:qp_delta_ip\000"
.LC45:
	.ascii	"h265:qp_step\000"
.LC46:
	.ascii	"h265:qp_max_i\000"
.LC47:
	.ascii	"h265:qp_min_i\000"
.LC48:
	.ascii	"h265:qp_max\000"
.LC49:
	.ascii	"h265:qp_min\000"
.LC50:
	.ascii	"h265:qp_init\000"
.LC51:
	.ascii	"h265:dblk_beta\000"
.LC52:
	.ascii	"h265:dblk_alpha\000"
.LC53:
	.ascii	"h265:dblk_disable\000"
.LC54:
	.ascii	"h265:cr_qp_offset\000"
.LC55:
	.ascii	"h265:cb_qp_offset\000"
.LC56:
	.ascii	"h265:scaling_list\000"
.LC57:
	.ascii	"h265:level\000"
.LC58:
	.ascii	"h265:profile\000"
.LC59:
	.ascii	"h264:base_layer_pid\000"
.LC60:
	.ascii	"h264:prefix_mode\000"
.LC61:
	.ascii	"h264:max_ltr\000"
.LC62:
	.ascii	"h264:max_tid\000"
.LC63:
	.ascii	"h264:qp_delta_ip\000"
.LC64:
	.ascii	"h264:qp_step\000"
.LC65:
	.ascii	"h264:qp_max_i\000"
.LC66:
	.ascii	"h264:qp_min_i\000"
.LC67:
	.ascii	"h264:qp_max\000"
.LC68:
	.ascii	"h264:qp_min\000"
.LC69:
	.ascii	"h264:qp_init\000"
.LC70:
	.ascii	"h264:dblk_beta\000"
.LC71:
	.ascii	"h264:dblk_alpha\000"
.LC72:
	.ascii	"h264:dblk_disable\000"
.LC73:
	.ascii	"h264:cr_qp_offset\000"
.LC74:
	.ascii	"h264:cb_qp_offset\000"
.LC75:
	.ascii	"h264:scaling_list\000"
.LC76:
	.ascii	"h264:const_intra\000"
.LC77:
	.ascii	"h264:trans8x8\000"
.LC78:
	.ascii	"h264:cabac_idc\000"
.LC79:
	.ascii	"h264:cabac_en\000"
.LC80:
	.ascii	"h264:gaps_not_allowed\000"
.LC81:
	.ascii	"h264:log2_max_frm_num\000"
.LC82:
	.ascii	"h264:log2_max_poc_lsb\000"
.LC83:
	.ascii	"h264:poc_type\000"
.LC84:
	.ascii	"h264:level\000"
.LC85:
	.ascii	"h264:profile\000"
.LC86:
	.ascii	"h264:stream_type\000"
.LC87:
	.ascii	"codec:type\000"
.LC88:
	.ascii	"prep:mirroring\000"
.LC89:
	.ascii	"prep:rotation\000"
.LC90:
	.ascii	"prep:range\000"
.LC91:
	.ascii	"prep:colorrange\000"
.LC92:
	.ascii	"prep:colortrc\000"
.LC93:
	.ascii	"prep:colorprim\000"
.LC94:
	.ascii	"prep:colorspace\000"
.LC95:
	.ascii	"prep:format\000"
.LC96:
	.ascii	"prep:max_height\000"
.LC97:
	.ascii	"prep:max_width\000"
.LC98:
	.ascii	"prep:ver_stride\000"
.LC99:
	.ascii	"prep:hor_stride\000"
.LC100:
	.ascii	"prep:height\000"
.LC101:
	.ascii	"prep:width\000"
.LC102:
	.ascii	"rc:mt_st_swth_frm_qp\000"
.LC103:
	.ascii	"rc:fm_lvl_qp_max_p\000"
.LC104:
	.ascii	"rc:fm_lvl_qp_max_i\000"
.LC105:
	.ascii	"rc:fm_lvl_qp_min_p\000"
.LC106:
	.ascii	"rc:fm_lvl_qp_min_i\000"
.LC107:
	.ascii	"rc:stats_time\000"
.LC108:
	.ascii	"rc:hier_frame_num\000"
.LC109:
	.ascii	"rc:hier_qp_delta\000"
.LC110:
	.ascii	"rc:hier_qp_en\000"
.LC111:
	.ascii	"rc:qp_vi\000"
.LC112:
	.ascii	"rc:qp_ip\000"
.LC113:
	.ascii	"rc:qp_step\000"
.LC114:
	.ascii	"rc:qp_max_i\000"
.LC115:
	.ascii	"rc:qp_min_i\000"
.LC116:
	.ascii	"rc:qp_max\000"
.LC117:
	.ascii	"rc:qp_min\000"
.LC118:
	.ascii	"rc:qp_init\000"
.LC119:
	.ascii	"rc:debreath_strength\000"
.LC120:
	.ascii	"rc:debreath_en\000"
.LC121:
	.ascii	"rc:super_p_thd\000"
.LC122:
	.ascii	"rc:super_i_thd\000"
.LC123:
	.ascii	"rc:super_mode\000"
.LC124:
	.ascii	"rc:init_ip_ratio\000"
.LC125:
	.ascii	"rc:min_i_prop\000"
.LC126:
	.ascii	"rc:max_i_prop\000"
.LC127:
	.ascii	"rc:drop_gap\000"
.LC128:
	.ascii	"rc:drop_thd\000"
.LC129:
	.ascii	"rc:drop_mode\000"
.LC130:
	.ascii	"rc:priority\000"
.LC131:
	.ascii	"rc:max_reenc_times\000"
.LC132:
	.ascii	"rc:gop\000"
.LC133:
	.ascii	"rc:fps_out_denorm\000"
.LC134:
	.ascii	"rc:fps_out_num\000"
.LC135:
	.ascii	"rc:fps_out_flex\000"
.LC136:
	.ascii	"rc:fps_in_denorm\000"
.LC137:
	.ascii	"rc:fps_in_num\000"
.LC138:
	.ascii	"rc:fps_in_flex\000"
.LC139:
	.ascii	"rc:bps_min\000"
.LC140:
	.ascii	"rc:bps_max\000"
.LC141:
	.ascii	"rc:bps_target\000"
.LC142:
	.ascii	"rc:mode\000"
.LC143:
	.ascii	"base:low_delay\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
