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
	.file	"vpss.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vpss_map_node_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_map_node_get, %function
vpss_map_node_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vpss_map_node_get, .-vpss_map_node_get
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_compat_ioctl, %function
vpss_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vpss_compat_ioctl, .-vpss_compat_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_open, %function
vpss_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L4
	movs	r0, #0
	str	r3, [r1, #128]
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0+4
	.fnend
	.size	vpss_open, .-vpss_open
	.align	1
	.global	vpss_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_version, %function
vpss_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r2, [r1, #32]	@ unaligned
	ldr	r5, [r0, #128]
	cmp	r2, #76
	ldr	r6, [r5, #160]
	beq	.L7
	movs	r3, #55
	ldr	r2, .L10
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L10+4
	movs	r0, #0
	bl	vlog
	mov	r0, #-1
.L6:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L7:
	movs	r1, #0
	mov	r0, r4
	bl	memset
	ldr	r3, [r6, #196]
	str	r3, [r4]	@ unaligned
	ldr	r3, [r5]
	movs	r5, #0
	strb	r5, [r4, #8]
	strb	r5, [r4, #9]
	str	r3, [r4, #4]	@ unaligned
	strb	r5, [r4, #10]
	strb	r5, [r4, #11]
	ldr	r0, [r6, #192]
	bl	strlen
	movs	r3, #20
	strb	r5, [r4, #37]
	strb	r3, [r4, #36]
	movs	r3, #17
	strb	r5, [r4, #38]
	strb	r5, [r4, #39]
	strb	r3, [r4, #56]
	strb	r5, [r4, #57]
	strb	r5, [r4, #58]
	strb	r5, [r4, #59]
	cmp	r0, #15
	str	r0, [r4, #12]	@ unaligned
	bls	.L9
	movs	r3, #15
	strb	r5, [r4, #13]
	strb	r3, [r4, #12]
	strb	r5, [r4, #14]
	strb	r5, [r4, #15]
.L9:
	movs	r5, #0
	movs	r3, #16
	strb	r5, [r4, #37]
	adds	r0, r4, r3
	strb	r3, [r4, #36]
	strb	r3, [r4, #56]
	strb	r5, [r4, #38]
	strb	r5, [r4, #39]
	strb	r5, [r4, #57]
	strb	r5, [r4, #58]
	strb	r5, [r4, #59]
	ldr	r2, [r4, #12]	@ unaligned
	ldr	r1, [r6, #192]
	bl	strncpy
	ldr	r2, [r4, #36]	@ unaligned
	ldr	r1, .L10+8
	add	r0, r4, #40
	bl	strncpy
	ldr	r2, [r4, #56]	@ unaligned
	ldr	r1, .L10+12
	add	r0, r4, #60
	bl	strncpy
	mov	r0, r5
	b	.L6
.L11:
	.align	2
.L10:
	.word	.LC0
	.word	.LANCHOR1
	.word	.LC1
	.word	.LC2
	.fnend
	.size	vpss_version, .-vpss_version
	.align	1
	.global	vpss_map_node_set
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_map_node_set, %function
vpss_map_node_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r3, [r1, #9]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r5, [r1, #5]	@ unaligned
	cmp	r3, #25
	beq	.L13
	movs	r3, #88
	ldr	r2, .L27
	str	r3, [sp]
	ldr	r3, .L27+4
.L23:
	movs	r1, #2
	movs	r0, #0
	bl	vlog
.L24:
	mov	r0, #-1
.L12:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L13:
	ldr	r0, [r1, #13]	@ unaligned
	cmp	r0, #18
	beq	.L15
	movs	r3, #93
	ldr	r2, .L27+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L27+4
	str	r0, [sp, #4]
	movs	r0, #0
.L25:
	bl	vlog
	b	.L24
.L15:
	ldr	r2, [r1, #21]	@ unaligned
	ldr	r1, [r1, #17]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L16
	ldr	r3, [r4, #21]	@ unaligned
	ldr	r2, .L27+12
	str	r3, [sp, #4]
	movs	r3, #99
	str	r3, [sp]
	ldr	r3, .L27+4
.L26:
	movs	r1, #2
	b	.L25
.L16:
	ldrb	r6, [r4]	@ zero_extendqisi2
	cbnz	r6, .L17
	mov	r2, r6
	ldr	r1, [r4, #1]	@ unaligned
	movs	r0, #6
	adds	r5, r5, #1
	bl	vsys_get_node_from_map
	cbnz	r0, .L18
	ldr	r3, [r4, #1]	@ unaligned
	ldr	r2, .L27+16
	str	r3, [sp, #4]
	movs	r3, #106
	str	r3, [sp]
	ldr	r3, .L27+4
	b	.L26
.L18:
	mov	r1, r7
	bl	mpi_node_bind
	cbz	r0, .L17
	movs	r3, #111
	ldr	r2, .L27+20
	str	r3, [sp]
	ldr	r3, .L27+4
	b	.L23
.L17:
	mov	r2, r5
	mov	r3, r7
	ldr	r1, [r4, #1]	@ unaligned
	movs	r0, #6
	bl	vsys_add_node_to_map
	ldrb	r5, [r4]	@ zero_extendqisi2
	ldr	r2, [r4, #21]	@ unaligned
	ldr	r3, [r4, #1]	@ unaligned
	cbz	r5, .L19
	strd	r3, r2, [sp, #4]
	movs	r1, #4
	movs	r3, #118
	ldr	r2, .L27+24
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L27+4
	bl	vlog
	movs	r0, #0
	b	.L12
.L19:
	str	r2, [sp, #12]
	movs	r1, #4
	ldr	r2, [r4, #5]	@ unaligned
	mov	r0, r5
	strd	r3, r2, [sp, #4]
	movs	r3, #121
	ldr	r2, .L27+28
	str	r3, [sp]
	ldr	r3, .L27+4
	bl	vlog
	mov	r0, r5
	b	.L12
.L28:
	.align	2
.L27:
	.word	.LC3
	.word	.LANCHOR1+13
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.fnend
	.size	vpss_map_node_set, .-vpss_map_node_set
	.align	1
	.global	vpss_map_node_remove
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_map_node_remove, %function
vpss_map_node_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r1
	ldr	r3, [r1, #9]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r6, [r1, #5]	@ unaligned
	cmp	r3, #25
	beq	.L30
	movs	r3, #139
	ldr	r2, .L46
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L46+4
	movs	r0, #0
	bl	vlog
.L42:
	mov	r0, #-1
.L29:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L30:
	ldr	r3, [r1, #13]	@ unaligned
	cmp	r3, #18
	beq	.L32
	str	r3, [sp, #4]
	movs	r3, #143
	ldr	r2, .L46+8
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L46+4
.L45:
	bl	vlog
	b	.L42
.L32:
	ldr	r1, [r1, #1]	@ unaligned
	movs	r2, #0
	movs	r0, #6
	bl	vsys_get_node_from_map
	ldr	r1, [r4, #1]	@ unaligned
	mov	r7, r0
	cbnz	r0, .L33
	movs	r3, #149
	ldr	r2, .L46+12
	str	r3, [sp]
	ldr	r3, .L46+4
	str	r1, [sp, #4]
.L44:
	movs	r1, #2
	b	.L45
.L33:
	ldrb	r5, [r4]	@ zero_extendqisi2
	cbnz	r5, .L37
	adds	r6, r6, #1
	movs	r0, #6
	mov	r2, r6
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbnz	r0, .L35
	movs	r3, #157
	str	r6, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L46+16
	ldr	r3, .L46+4
	b	.L44
.L35:
	mov	r0, r7
	bl	mpi_node_unbind
	mov	r2, r6
	ldr	r1, [r4, #1]	@ unaligned
	movs	r0, #6
	bl	vsys_remove_node_from_map
	ldr	r3, [r4, #5]	@ unaligned
	ldr	r2, .L46+20
	movs	r1, #4
	mov	r0, r5
	str	r3, [sp, #8]
	ldr	r3, [r4, #1]	@ unaligned
	str	r6, [sp, #12]
	str	r3, [sp, #4]
	movs	r3, #163
	str	r3, [sp]
	ldr	r3, .L46+4
	bl	vlog
.L43:
	movs	r0, #0
	b	.L29
.L37:
	ldr	r8, .L46+4
	movs	r5, #1
	ldr	r9, .L46+28
.L34:
	ldr	r1, [r4, #1]	@ unaligned
	mov	r2, r5
	movs	r0, #6
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbz	r0, .L36
	ldr	r6, [r0, #56]
	mov	r0, r7
	bl	mpi_node_unbind
	mov	r2, r5
	ldr	r1, [r4, #1]	@ unaligned
	movs	r0, #6
	bl	vsys_remove_node_from_map
	ldr	r3, [r4, #1]	@ unaligned
	subs	r2, r5, #1
	movs	r1, #4
	movs	r0, #0
	strd	r3, r2, [sp, #4]
	mov	r2, r9
	str	r3, [sp, #12]
	movs	r3, #174
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
.L36:
	adds	r5, r5, #1
	cmp	r5, #5
	bne	.L34
	ldr	r1, [r4, #1]	@ unaligned
	movs	r2, #0
	movs	r0, #6
	bl	vsys_remove_node_from_map
	ldr	r3, [r4, #1]	@ unaligned
	ldr	r2, .L46+24
	movs	r1, #4
	movs	r0, #0
	str	r6, [sp, #8]
	str	r3, [sp, #4]
	movs	r3, #179
	str	r3, [sp]
	ldr	r3, .L46+4
	bl	vlog
	b	.L43
.L47:
	.align	2
.L46:
	.word	.LC3
	.word	.LANCHOR1+31
	.word	.LC4
	.word	.LC6
	.word	.LC5
	.word	.LC10
	.word	.LC12
	.word	.LC11
	.fnend
	.size	vpss_map_node_remove, .-vpss_map_node_remove
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_thread_fn, %function
vpss_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	add	r5, r0, #168
	mov	r4, r0
.L49:
	bl	kthread_should_stop
	cbz	r0, .L52
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L52:
	ldr	r3, [r4]
	cbz	r3, .L50
	movs	r0, #1
	bl	msleep
	b	.L49
.L50:
	mov	r0, r5
	bl	down
	b	.L49
	.fnend
	.size	vpss_thread_fn, .-vpss_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_ioctl, %function
vpss_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	uxtb	r4, r1
	ldr	r3, [r0, #128]
	mov	r5, r0
	mov	r6, r1
	mov	r7, r2
	movs	r1, #5
	ldr	r2, .L57
	ldr	r8, [r3, #160]
	movs	r0, #0
	strd	r4, r3, [sp, #8]
	movs	r3, #206
	str	r4, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L57+4
	bl	vlog
	ldr	r0, [r8, #188]
	cmp	r0, r4
	bhi	.L54
	movs	r3, #209
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L57+4
	movs	r0, #0
	ldr	r2, .L57+8
	bl	vlog
.L55:
.L53:
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L54:
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r0
	sbc	r0, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r0
	ldr	r0, [r8, #184]
	movs	r3, #20
	mla	r0, r3, r4, r0
	cbnz	r0, .L56
	movs	r3, #216
	ldr	r2, .L57+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L57+4
	bl	vlog
	b	.L53
.L56:
	mov	r1, r0
	mov	r3, r7
	mov	r2, r6
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L58:
	.align	2
.L57:
	.word	.LC13
	.word	.LANCHOR1+52
	.word	.LC14
	.word	.LC15
	.fnend
	.size	vpss_ioctl, .-vpss_ioctl
	.align	1
	.global	vpss_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_probe, %function
vpss_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movs	r2, #200
	ldr	r4, .L61
	mov	r7, r0
	movs	r1, #0
	ldr	r6, .L61+4
	movs	r5, #0
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	mov	r0, r7
	bl	kstrdup
	mov	r2, r7
	movs	r3, #1
	movs	r1, #8
	str	r3, [r4, #196]
	movs	r3, #4
	str	r5, [r4, #72]
	str	r3, [r4, #188]
	strd	r5, r5, [r4, #80]
	str	r6, [r4, #184]
	str	r4, [r4, #164]
	str	r0, [r4, #192]
	adds	r0, r4, r3
	bl	mpi_dev_register
	add	r0, r4, #172
	add	r1, r6, #80
	strd	r0, r0, [r4, #172]
	adds	r0, r4, #4
	str	r5, [r4, #168]
	bl	mpi_sysfs_dev_add
	ldr	r3, .L61+8
	mov	r2, #-1
	mov	r1, r4
	ldr	r0, .L61+12
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L60
	bl	wake_up_process
.L60:
	str	r5, [r4, #180]
	pop	{r3, r4, r5, r6, r7, pc}
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	.LANCHOR1+64
	.word	.LC16
	.word	vpss_thread_fn
	.fnend
	.size	vpss_probe, .-vpss_probe
	.align	1
	.global	vpss_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_shutdown, %function
vpss_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L64
	mov	r0, r4
	str	r3, [r0], #4
	bl	mpi_dev_unregister
	ldr	r0, [r4, #192]
	pop	{r4, lr}
	b	kfree
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.fnend
	.size	vpss_shutdown, .-vpss_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vpss_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_init, %function
vpss_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L67
	bl	vpss_probe
	movs	r0, #0
	pop	{r3, pc}
.L68:
	.align	2
.L67:
	.word	.LC16
	.fnend
	.size	vpss_init, .-vpss_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vpss_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_exit, %function
vpss_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vpss_shutdown
	.fnend
	.size	vpss_exit, .-vpss_exit
	.global	g_vpss_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.36383, %object
	.size	__func__.36383, 13
__func__.36383:
	.ascii	"vpss_version\000"
	.type	__func__.36393, %object
	.size	__func__.36393, 18
__func__.36393:
	.ascii	"vpss_map_node_set\000"
	.type	__func__.36407, %object
	.size	__func__.36407, 21
__func__.36407:
	.ascii	"vpss_map_node_remove\000"
	.type	__func__.36424, %object
	.size	__func__.36424, 11
__func__.36424:
	.ascii	"vpss_ioctl\000"
	.space	1
	.type	vpss_ioctls, %object
	.size	vpss_ioctls, 80
vpss_ioctls:
	.word	-1068732416
	.word	0
	.word	vpss_version
	.word	.LC17
	.word	0
	.word	-1072074751
	.word	0
	.word	vpss_map_node_set
	.word	.LC18
	.word	0
	.word	-1072074750
	.word	0
	.word	vpss_map_node_get
	.word	.LC19
	.word	0
	.word	-1072074749
	.word	0
	.word	vpss_map_node_remove
	.word	.LC20
	.word	0
	.type	vpss_driver_fops, %object
	.size	vpss_driver_fops, 128
vpss_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	vpss_ioctl
	.word	vpss_compat_ioctl
	.word	0
	.space	4
	.word	vpss_open
	.space	4
	.word	0
	.space	60
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_vpss_dev, %object
	.size	g_vpss_dev, 200
g_vpss_dev:
	.space	200
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct vpss_version mismatching\033[0m\000"
.LC1:
	.ascii	"-2023-09-28-17:34:00\000"
.LC2:
	.ascii	"vmpi:d4f898704722e6713f10876f39aa2121f9219477-v1.4."
	.ascii	"54\000"
.LC3:
	.ascii	"\033[1;31mstruct vpss_map_info mismatching\033[0m\000"
.LC4:
	.ascii	"\033[1;31mVPSS sub mode id fail mod_id = %d\033[0m\000"
.LC5:
	.ascii	"\033[1;31mVPSS get sub node fail channel_id = %d\033"
	.ascii	"[0m\000"
.LC6:
	.ascii	"\033[1;31mVPSS get grp node fail grp_id = %d\033[0m"
	.ascii	"\000"
.LC7:
	.ascii	"\033[1;31mVPSS bind sub node fail\033[0m\000"
.LC8:
	.ascii	"\033[1;32mVPSS GRP %d node map set to node %d succe"
	.ascii	"ss!\033[0m\000"
.LC9:
	.ascii	"\033[1;32mVPSS GRP %d CHN %d node map set to node %"
	.ascii	"d success!\033[0m\000"
.LC10:
	.ascii	"\033[1;32mVPSS GRP %d CHN %d node map remove node %"
	.ascii	"d success!\033[0m\000"
.LC11:
	.ascii	"\033[1;32mVPSS GRP %d CHN %d node unbind to GRP %d "
	.ascii	"node success!\033[0m\000"
.LC12:
	.ascii	"\033[1;32mVPSS GRP %d node map remove node %d succe"
	.ascii	"ss!\033[0m\000"
.LC13:
	.ascii	"nr = %d, index = %d dev = %p\000"
.LC14:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC15:
	.ascii	"\033[1;31merror: ioctl is null\033[0m\000"
.LC16:
	.ascii	"vpss\000"
.LC17:
	.ascii	"VPSS_IOCTL_VERSION\000"
.LC18:
	.ascii	"VPSS_IOCTL_MAP_NODE_SET\000"
.LC19:
	.ascii	"VPSS_IOCTL_MAP_NODE_GET\000"
.LC20:
	.ascii	"VPSS_IOCTL_MAP_NODE_REMOVE\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
