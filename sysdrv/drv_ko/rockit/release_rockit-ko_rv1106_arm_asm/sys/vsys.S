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
	.file	"vsys.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsys_get_pool:					
	.asciz 	"vsys_get_pool"					
__kstrtabns_vsys_get_pool:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsys_add_node_to_map:					
	.asciz 	"vsys_add_node_to_map"					
__kstrtabns_vsys_add_node_to_map:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsys_get_node_from_map:					
	.asciz 	"vsys_get_node_from_map"					
__kstrtabns_vsys_get_node_from_map:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsys_remove_node_from_map:					
	.asciz 	"vsys_remove_node_from_map"					
__kstrtabns_vsys_remove_node_from_map:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_init, %function
vsys_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vsys_init, .-vsys_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_compat_ioctl, %function
vsys_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vsys_compat_ioctl, .-vsys_compat_ioctl
	.align	1
	.global	vsys_get_pool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_get_pool, %function
vsys_get_pool:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L8
	ldr	r3, [r2]
.L7:
	subs	r3, r3, #36
	add	r1, r3, #36
	cmp	r1, r2
	bne	.L6
	movs	r3, #0
.L3:
	mov	r0, r3
	bx	lr
.L6:
	ldr	r1, [r3, #44]
	cmp	r1, r0
	beq	.L3
	ldr	r3, [r3, #36]
	b	.L7
.L9:
	.align	2
.L8:
	.word	mpi_buf_pool_list
	.fnend
	.size	vsys_get_pool, .-vsys_get_pool
	.align	1
	.global	vsys_add_node_to_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_add_node_to_map, %function
vsys_add_node_to_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r7, r0
	.pad #20
	sub	sp, sp, #20
	mov	r5, r1
	mov	r4, r2
	mov	r6, r3
	cbnz	r3, .L11
.L20:
	mov	r0, #-1
.L10:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L11:
	strd	r1, r2, [sp, #8]
	mov	r3, #508
	str	r0, [sp, #4]
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L22
	subs	r7, r7, #4
	ldr	r2, .L22+4
	bl	vlog
	cmp	r7, #16
	bhi	.L21
	tbb	[pc, r7]
.L14:
	.byte	(.L19-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L18-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L17-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L16-.L14)/2
	.byte	(.L15-.L14)/2
	.byte	(.L21-.L14)/2
	.byte	(.L13-.L14)/2
	.p2align 1
.L16:
	cmp	r5, #1
	bhi	.L20
	cmp	r4, #3
	bhi	.L20
	add	r4, r4, r5, lsl #2
	ldr	r3, .L22+8
	add	r4, r4, #1536
	add	r4, r3, r4, lsl #2
	str	r6, [r4, #4]
.L21:
	movs	r0, #0
	b	.L10
.L13:
	cmp	r5, #0
	blt	.L20
	cmp	r4, #31
	bhi	.L20
	add	r4, r4, r5, lsl #5
	ldr	r3, .L22+8
	add	r4, r3, r4, lsl #2
	str	r6, [r4, #900]
	b	.L21
.L15:
	cmp	r5, #0
	blt	.L20
	cmp	r4, #63
	bhi	.L20
	add	r4, r4, r5, lsl #6
	ldr	r3, .L22+8
	add	r4, r3, r4, lsl #2
	str	r6, [r4, #388]
	b	.L21
.L19:
	cmp	r5, #0
	blt	.L20
	cmp	r4, #63
	bhi	.L20
	add	r4, r4, r5, lsl #6
	ldr	r3, .L22+8
	add	r4, r3, r4, lsl #2
	str	r6, [r4, #644]
	b	.L21
.L17:
	cmp	r5, #7
	bhi	.L20
	cmp	r4, #5
	bhi	.L20
	movs	r3, #6
	mla	r4, r3, r5, r4
	ldr	r5, .L22+8
	add	r4, r5, r4, lsl #2
	str	r6, [r4, #196]
	b	.L21
.L18:
	cmp	r5, #255
	bhi	.L20
	cmp	r4, #4
	bhi	.L20
	add	r5, r5, r5, lsl #2
	add	r4, r4, r5
	ldr	r5, .L22+8
	add	r4, r5, r4, lsl #2
	str	r6, [r4, #1028]
	b	.L21
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	.LC0
	.word	g_vsys_dev
	.fnend
	.size	vsys_add_node_to_map, .-vsys_add_node_to_map
	.align	1
	.global	vsys_get_node_from_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_get_node_from_map, %function
vsys_get_node_from_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r6, r0
	strd	r1, r2, [sp, #8]
	movw	r3, #553
	str	r0, [sp, #4]
	mov	r5, r1
	str	r3, [sp]
	mov	r4, r2
	ldr	r3, .L46
	movs	r1, #5
	ldr	r2, .L46+4
	movs	r0, #0
	subs	r6, r6, #4
	bl	vlog
	cmp	r6, #16
	bhi	.L45
	tbb	[pc, r6]
.L27:
	.byte	(.L32-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L31-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L30-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L29-.L27)/2
	.byte	(.L28-.L27)/2
	.byte	(.L45-.L27)/2
	.byte	(.L26-.L27)/2
	.p2align 1
.L29:
	cmp	r5, #1
	bhi	.L45
	cmp	r4, #3
	bhi	.L45
	add	r4, r4, r5, lsl #2
	ldr	r3, .L46+8
	add	r4, r4, #1536
	add	r4, r3, r4, lsl #2
	ldr	r0, [r4, #4]
.L24:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L26:
	cmp	r5, #0
	blt	.L45
	cmp	r4, #31
	bhi	.L45
	add	r4, r4, r5, lsl #5
	ldr	r3, .L46+8
	add	r4, r3, r4, lsl #2
	ldr	r0, [r4, #900]
	b	.L24
.L28:
	cmp	r5, #0
	blt	.L45
	cmp	r4, #63
	bhi	.L45
	add	r4, r4, r5, lsl #6
	ldr	r3, .L46+8
	add	r4, r3, r4, lsl #2
	ldr	r0, [r4, #388]
	b	.L24
.L32:
	cmp	r5, #0
	blt	.L45
	cmp	r4, #63
	bhi	.L45
	add	r4, r4, r5, lsl #6
	ldr	r3, .L46+8
	add	r4, r3, r4, lsl #2
	ldr	r0, [r4, #644]
	b	.L24
.L30:
	cmp	r5, #7
	bhi	.L45
	cmp	r4, #5
	bhi	.L45
	movs	r3, #6
	mla	r4, r3, r5, r4
	ldr	r5, .L46+8
	add	r4, r5, r4, lsl #2
	ldr	r0, [r4, #196]
	b	.L24
.L31:
	cmp	r5, #255
	bhi	.L45
	cmp	r4, #4
	bhi	.L45
	add	r5, r5, r5, lsl #2
	add	r4, r4, r5
	ldr	r5, .L46+8
	add	r4, r5, r4, lsl #2
	ldr	r0, [r4, #1028]
	b	.L24
.L45:
	movs	r0, #0
	b	.L24
.L47:
	.align	2
.L46:
	.word	.LANCHOR0+21
	.word	.LC0
	.word	g_vsys_dev
	.fnend
	.size	vsys_get_node_from_map, .-vsys_get_node_from_map
	.align	1
	.global	vsys_remove_node_from_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_remove_node_from_map, %function
vsys_remove_node_from_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r6, r0
	strd	r1, r2, [sp, #8]
	movw	r3, #598
	str	r0, [sp, #4]
	mov	r5, r1
	str	r3, [sp]
	mov	r4, r2
	ldr	r3, .L73
	movs	r1, #5
	ldr	r2, .L73+4
	movs	r0, #0
	subs	r6, r6, #4
	bl	vlog
	cmp	r6, #16
	bhi	.L57
	tbb	[pc, r6]
.L51:
	.byte	(.L56-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L55-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L54-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L53-.L51)/2
	.byte	(.L52-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L50-.L51)/2
	.p2align 1
.L53:
	cmp	r5, #1
	bhi	.L69
	cmp	r4, #3
	bhi	.L69
	add	r4, r4, r5, lsl #2
	add	r4, r4, #1536
.L70:
	ldr	r3, .L73+8
	add	r4, r3, r4, lsl #2
.L71:
	movs	r0, #0
	str	r0, [r4, #4]
.L48:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L50:
	cmp	r5, #0
	blt	.L69
	cmp	r4, #31
	bhi	.L69
	add	r4, r4, r5, lsl #5
	adds	r4, r4, #224
	b	.L70
.L52:
	cmp	r5, #0
	blt	.L69
	cmp	r4, #63
	bhi	.L69
	add	r4, r4, r5, lsl #6
	adds	r4, r4, #96
	b	.L70
.L56:
	cmp	r5, #0
	blt	.L69
	cmp	r4, #63
	bhi	.L69
	add	r4, r4, r5, lsl #6
	adds	r4, r4, #160
	b	.L70
.L54:
	cmp	r5, #7
	bhi	.L69
	cmp	r4, #5
	bhi	.L69
	movs	r3, #6
	mla	r4, r3, r5, r4
	adds	r4, r4, #48
.L72:
	ldr	r5, .L73+8
	add	r4, r5, r4, lsl #2
	b	.L71
.L55:
	cmp	r5, #255
	bhi	.L69
	cmp	r4, #4
	bhi	.L69
	add	r5, r5, r5, lsl #2
	add	r4, r4, r5
	add	r4, r4, #256
	b	.L72
.L57:
	movs	r0, #0
	b	.L48
.L69:
	mov	r0, #-1
	b	.L48
.L74:
	.align	2
.L73:
	.word	.LANCHOR0+44
	.word	.LC0
	.word	g_vsys_dev
	.fnend
	.size	vsys_remove_node_from_map, .-vsys_remove_node_from_map
	.align	1
	.global	vsys_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_version, %function
vsys_version:
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
	beq	.L76
	movs	r3, #91
	ldr	r2, .L82
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L82+4
	movs	r0, #0
	bl	vlog
.L76:
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
.L83:
	.align	2
.L82:
	.word	.LC1
	.word	.LANCHOR0+70
	.fnend
	.size	vsys_version, .-vsys_version
	.align	1
	.global	vsys_bind
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_bind, %function
vsys_bind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #28
	beq	.L85
	movs	r3, #117
	ldr	r2, .L96
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L96+4
	movs	r0, #0
	bl	vlog
.L85:
	ldr	r0, [r4]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r0, #6
	bne	.L86
	adds	r3, r3, #1
.L94:
	str	r3, [r4, #8]	@ unaligned
.L87:
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r1, [r4, #4]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbnz	r0, .L88
	movs	r3, #129
	ldr	r2, .L96+8
	str	r3, [sp]
	ldr	r3, .L96+4
.L95:
	movs	r1, #2
	bl	vlog
	mov	r0, #-1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L86:
	cmp	r0, #17
	bne	.L87
	adds	r3, r3, #2
	b	.L94
.L88:
	ldr	r1, [r4, #20]	@ unaligned
	ldr	r2, [r4, #24]	@ unaligned
	ldr	r0, [r4, #16]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbnz	r0, .L90
	movs	r3, #137
	ldr	r2, .L96+12
	str	r3, [sp]
	ldr	r3, .L96+4
	b	.L95
.L90:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	mpi_node_bind
.L97:
	.align	2
.L96:
	.word	.LC2
	.word	.LANCHOR0+83
	.word	.LC3
	.word	.LC4
	.fnend
	.size	vsys_bind, .-vsys_bind
	.align	1
	.global	vsys_unbind
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_unbind, %function
vsys_unbind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #28
	beq	.L99
	movs	r3, #156
	ldr	r2, .L110
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L110+4
	movs	r0, #0
	bl	vlog
.L99:
	ldr	r0, [r4]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r0, #6
	bne	.L100
	adds	r3, r3, #1
.L108:
	str	r3, [r4, #8]	@ unaligned
.L101:
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r1, [r4, #4]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbnz	r0, .L102
	movs	r3, #168
	ldr	r2, .L110+8
	str	r3, [sp]
	ldr	r3, .L110+4
.L109:
	movs	r1, #2
	bl	vlog
	mov	r0, #-1
.L98:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L100:
	cmp	r0, #17
	bne	.L101
	adds	r3, r3, #2
	b	.L108
.L102:
	ldr	r1, [r4, #20]	@ unaligned
	ldr	r2, [r4, #24]	@ unaligned
	ldr	r0, [r4, #16]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbnz	r0, .L104
	movs	r3, #176
	ldr	r2, .L110+12
	str	r3, [sp]
	ldr	r3, .L110+4
	b	.L109
.L104:
	mov	r0, r5
	bl	mpi_node_unbind
	movs	r0, #0
	b	.L98
.L111:
	.align	2
.L110:
	.word	.LC2
	.word	.LANCHOR0+93
	.word	.LC3
	.word	.LC4
	.fnend
	.size	vsys_unbind, .-vsys_unbind
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_thread_fn, %function
vsys_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	add	r5, r0, #168
	mov	r4, r0
.L113:
	bl	kthread_should_stop
	cbz	r0, .L116
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L116:
	ldr	r3, [r4, #184]
	cbz	r3, .L114
	movs	r0, #1
	bl	msleep
	b	.L113
.L114:
	mov	r0, r5
	bl	down
	b	.L113
	.fnend
	.size	vsys_thread_fn, .-vsys_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_read, %function
vsys_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #92
	sub	sp, sp, #92
	ldr	r5, [r0, #128]
	mov	r9, r2
	str	r1, [sp, #84]
	adds	r5, r5, #4
	mov	r0, r5
	bl	mpi_fs_buf_read
	adds	r3, r0, #1
	mov	r4, r0
	bne	.L118
	ldr	r3, .L149
	mov	r0, r5
	ldr	r2, .L149+4
	ldr	r1, .L149+8
	str	r3, [sp]
	ldr	r7, .L149+12
	ldr	r3, .L149+16
	ldr	r2, [r2]
	bl	mpi_fs_buf_add
	ldr	r1, .L149+20
	mov	r0, r5
	ldr	r10, .L149+52
	bl	mpi_fs_buf_add
	ldr	r1, .L149+24
	mov	r0, r5
	ldr	fp, .L149+44
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	subs	r4, r4, #36
.L119:
	add	r3, r4, #36
	cmp	r3, r7
	beq	.L127
	ldr	r1, [r4, #12]
	mov	r0, r5
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #44]
	str	r1, [sp, #76]
	ldr	r1, [r4, #284]
	str	r1, [sp, #72]
	ldr	r1, [r4, #280]
	str	r1, [sp, #68]
	ldr	r1, [r4, #384]
	str	r1, [sp, #64]
	ldr	r1, [r4, #392]
	str	r1, [sp, #60]
	ldr	r1, [r4, #400]
	str	r1, [sp, #56]
	ldr	r1, [r4, #204]
	str	r1, [sp, #52]
	ldr	r1, [r4, #196]
	str	r1, [sp, #48]
	ldr	r1, [r4, #192]
	str	r1, [sp, #44]
	ldr	r1, [r4, #184]
	str	r1, [sp, #40]
	ldr	r1, [r4, #380]
	str	r1, [sp, #36]
	ldr	r1, [r4, #388]
	str	r1, [sp, #32]
	ldr	r1, [r4, #396]
	str	r1, [sp, #28]
	ldr	r1, [r4, #144]
	str	r1, [sp, #24]
	ldr	r1, [r4, #136]
	str	r1, [sp, #20]
	ldr	r1, [r4, #132]
	str	r1, [sp, #16]
	ldr	r1, [r4, #124]
	strd	r2, r1, [sp, #8]
	ldr	r2, [r4, #56]
	ldr	r1, .L149+28
	strd	r4, r2, [sp]
	ldr	r3, [r3, #44]
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cbz	r0, .L120
.L127:
	ldr	r1, .L149+32
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r1, .L149+36
	mov	r0, r5
	ldr	r8, .L149+56
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	ldr	r10, .L149+60
	subs	r4, r4, #36
.L121:
	add	r3, r4, #36
	cmp	r3, r7
	bne	.L137
.L129:
	mov	r2, r9
	ldr	r1, [sp, #84]
	mov	r0, r5
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpi_fs_buf_read
.L120:
	ldr	r6, [r4, #300]
	add	r8, r4, #300
	subs	r6, r6, #4
.L122:
	adds	r2, r6, #4
	cmp	r2, r8
	beq	.L125
	ldr	r2, [r6]
	mov	r1, r10
	mov	r0, r5
	ldr	r2, [r2]
	bl	mpi_fs_buf_add
	cbz	r0, .L123
.L125:
	mov	r1, fp
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r4, [r4, #36]
	subs	r4, r4, #36
	b	.L119
.L123:
	ldr	r6, [r6, #4]
	subs	r6, r6, #4
	b	.L122
.L137:
	ldr	r3, [r4, #144]
	cbz	r3, .L128
	ldr	r3, [r4, #44]
	mov	r1, r8
	ldr	r2, .L149+40
	mov	r0, r5
	str	r2, [sp]
	ldr	r3, [r3, #44]
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	bne	.L129
	mvn	fp, #151
	add	r6, r4, #152
	sub	fp, fp, r4
.L130:
	ldr	r1, [r4, #144]
	add	r2, fp, r6
	cmp	r1, r2
	ble	.L132
	ldrb	r2, [r6], #1	@ zero_extendqisi2
	mov	r1, r10
	mov	r0, r5
	bl	mpi_fs_buf_add
	cmp	r0, #0
	beq	.L130
.L132:
	ldr	r1, .L149+44
	mov	r0, r5
	bl	mpi_fs_buf_add
.L128:
	ldr	r3, [r4, #204]
	cbz	r3, .L133
	ldr	r3, [r4, #44]
	mov	r1, r8
	ldr	r2, .L149+48
	mov	r0, r5
	str	r2, [sp]
	ldr	r3, [r3, #44]
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	bne	.L129
	mvn	fp, #211
	add	r6, r4, #212
	sub	fp, fp, r4
.L134:
	ldr	r1, [r4, #204]
	add	r2, fp, r6
	cmp	r1, r2
	ble	.L136
	ldrb	r2, [r6], #1	@ zero_extendqisi2
	mov	r1, r10
	mov	r0, r5
	bl	mpi_fs_buf_add
	cmp	r0, #0
	beq	.L134
.L136:
	ldr	r1, .L149+44
	mov	r0, r5
	bl	mpi_fs_buf_add
.L133:
	ldr	r4, [r4, #36]
	subs	r4, r4, #36
	b	.L121
.L118:
	cbnz	r0, .L117
	mov	r0, r5
	bl	mpi_fs_buf_reset
.L117:
	mov	r0, r4
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L150:
	.align	2
.L149:
	.word	.LC7
	.word	g_vsys_dev
	.word	.LC6
	.word	mpi_node_list
	.word	.LC5
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC16
	.word	.LC14
	.word	.LC18
	.word	.LC13
	.word	.LC15
	.word	.LC17
	.fnend
	.size	vsys_read, .-vsys_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_force_lost_frame, %function
vsys_force_lost_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #20
	beq	.L152
	movw	r3, #369
	ldr	r2, .L163
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L163+4
	movs	r0, #0
	bl	vlog
.L152:
	ldr	r0, [r4]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r0, #6
	bne	.L153
	adds	r3, r3, #1
.L161:
	str	r3, [r4, #8]	@ unaligned
.L154:
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r1, [r4, #4]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r3, r0
	cbnz	r0, .L155
	mov	r3, #380
	ldr	r2, .L163+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L163+4
	bl	vlog
	mov	r0, #-1
.L151:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L153:
	cmp	r0, #17
	bne	.L154
	adds	r3, r3, #2
	b	.L161
.L155:
	ldr	r2, [r4]	@ unaligned
	ldr	r1, [r4, #16]	@ unaligned
	cmp	r2, #8
	ite	eq
	addeq	r0, r0, #208
	addne	r0, r3, #148
	bl	mpi_node_force_lost_frame
	movs	r0, #0
	b	.L151
.L164:
	.align	2
.L163:
	.word	.LC19
	.word	.LANCHOR0+105
	.word	.LC20
	.fnend
	.size	vsys_force_lost_frame, .-vsys_force_lost_frame
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_free_all_cma, %function
vsys_free_all_cma:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	free_all_cma
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	vsys_free_all_cma, .-vsys_free_all_cma
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_wait_rcu, %function
vsys_wait_rcu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	synchronize_rcu
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	vsys_wait_rcu, .-vsys_wait_rcu
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_pool_create, %function
vsys_pool_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r4, r1
	ldr	r3, [r1, #16]	@ unaligned
	ldr	r6, [r0, #128]
	cmp	r3, #536
	beq	.L168
	mov	r3, #270
	ldr	r2, .L185
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L185+4
	movs	r0, #0
	bl	vlog
.L168:
	ldr	r0, .L185+8
	bl	mpi_allocator_find_by_name
	mov	r7, r0
	cbnz	r0, .L169
	movw	r3, #275
	ldr	r2, .L185+12
	str	r3, [sp]
	ldr	r3, .L185+4
	str	r0, [sp, #4]
.L184:
	movs	r1, #2
	bl	vlog
	mov	r0, #-1
.L167:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L169:
	mov	r2, sp
	bic	r3, r2, #8160
	bic	r3, r3, #31
	movs	r1, #1
	ldr	r3, [r3, #12]
	add	r3, r3, #736
	str	r3, [r2]
	movs	r3, #0
	ldr	r2, [r4, #12]	@ unaligned
	bl	mpi_buf_pool_create
	mov	r5, r0
	cbnz	r0, .L171
	movw	r3, #281
	str	r7, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L185+16
	ldr	r3, .L185+4
	b	.L184
.L171:
	ldr	r2, [r6, #28]
	add	r3, r0, #48
	adds	r6, r6, #24
	str	r3, [r6, #4]
	ldr	r9, .L185+4
	strd	r6, r2, [r0, #48]
	movs	r6, #0
	str	r3, [r2]
	ldr	r3, [r4, #20]	@ unaligned
	ldr	r10, .L185+20
	str	r3, [r0, #92]
	ldr	r3, [r4]	@ unaligned
	str	r3, [r0, #44]
.L172:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, r6
	bgt	.L177
	movs	r0, #0
	b	.L167
.L177:
	add	fp, r4, r6, lsl #2
	ldr	r8, [r4, #8]	@ unaligned
	ldr	r0, [fp, #24]	@ unaligned
	cmp	r8, #0
	beq	.L173
	bl	dma_buf_get
	mov	r7, r0
	cbz	r0, .L175
	mov	r1, r0
	movs	r2, #1
	mov	r0, r5
	bl	mpi_buf_pool_import_dmabuf
	mov	r0, r7
	bl	dma_buf_put
.L175:
	adds	r6, r6, #1
	b	.L172
.L173:
	movs	r1, #4
	bl	mpi_obj_from_id
	ldr	r3, [fp, #24]	@ unaligned
	mov	r2, r10
	movs	r1, #4
	mov	r7, r0
	str	r3, [sp, #4]
	mov	r0, r8
	movw	r3, #297
	str	r3, [sp]
	mov	r3, r9
	bl	vlog
	cmp	r7, #0
	beq	.L175
	mov	r1, r7
	mov	r0, r5
	bl	mpi_buf_pool_import
	mov	r0, r7
	bl	mpi_obj_unref
	b	.L175
.L186:
	.align	2
.L185:
	.word	.LC21
	.word	.LANCHOR0+127
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.fnend
	.size	vsys_pool_create, .-vsys_pool_create
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_ioctl, %function
vsys_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	uxtb	r4, r1
	ldr	r3, .L191
	mov	r6, r0
	mov	r5, r1
	mov	r7, r2
	adds	r3, r3, #4
	ldr	r2, .L191+4
	ldr	r8, [r3, #160]
	movs	r1, #5
	strd	r4, r3, [sp, #8]
	movs	r0, #0
	movw	r3, #417
	str	r4, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L191+8
	bl	vlog
	ldr	r0, [r8, #192]
	cmp	r0, r4
	bhi	.L188
	mov	r3, #420
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L191+8
	movs	r0, #0
	ldr	r2, .L191+12
	bl	vlog
.L189:
.L187:
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L188:
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r0
	sbc	r0, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r0
	ldr	r0, [r8, #188]
	movs	r3, #20
	mla	r0, r3, r4, r0
	cbnz	r0, .L190
	movw	r3, #427
	ldr	r2, .L191+16
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L191+8
	bl	vlog
	b	.L187
.L190:
	mov	r1, r0
	mov	r3, r7
	mov	r2, r5
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L192:
	.align	2
.L191:
	.word	g_vsys_dev
	.word	.LC26
	.word	.LANCHOR0+144
	.word	.LC27
	.word	.LC28
	.fnend
	.size	vsys_ioctl, .-vsys_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_deinit, %function
vsys_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r0, #128]
	ldr	r3, [r3]
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bgt	.L253
	ldr	r4, [r3, #160]
	mov	r9, #0
	add	r5, r4, #196
	add	r6, r4, #388
.L195:
	mov	r8, r5
	movs	r7, #6
.L197:
	ldr	r0, [r8], #4
	cbz	r0, .L196
	bl	mpi_node_destroy
	str	r9, [r8, #-4]
.L196:
	subs	r7, r7, #1
	bne	.L197
	adds	r5, r5, #24
	cmp	r5, r6
	bne	.L195
	add	r8, r4, #644
	add	r5, r4, #900
	mov	r9, r8
.L200:
	ldr	r0, [r8], #4
	cbz	r0, .L199
	bl	mpi_node_destroy
	str	r7, [r8, #-4]
.L199:
	cmp	r8, r5
	bne	.L200
	add	fp, r4, #6144
	add	r8, r4, #1032
	add	fp, fp, #8
.L201:
	mov	r10, r8
	movs	r7, #4
.L203:
	ldr	r1, [r10], #4
	cbz	r1, .L202
	ldr	r0, [r8, #-4]
	bl	mpi_node_unbind
	movs	r3, #0
	str	r3, [r10, #-4]
.L202:
	subs	r7, r7, #1
	bne	.L203
	str	r7, [r8, #-4]
	add	r8, r8, #20
	cmp	r8, fp
	bne	.L201
.L206:
	ldr	r0, [r6], #4
	cbz	r0, .L205
	bl	mpi_node_destroy
	str	r7, [r6, #-4]
.L205:
	cmp	r9, r6
	bne	.L206
	addw	r6, r4, #1028
	movs	r7, #0
.L208:
	ldr	r0, [r5], #4
	cbz	r0, .L207
	bl	mpi_node_destroy
	str	r7, [r5, #-4]
.L207:
	cmp	r5, r6
	bne	.L208
	add	r6, r4, #6144
	add	r5, r4, #6144
	adds	r6, r6, #4
	adds	r5, r5, #20
	movs	r7, #0
.L210:
	ldr	r0, [r6], #4
	cbnz	r0, .L209
.L212:
	cmp	r5, r6
	bne	.L210
	add	r4, r4, #6176
	movs	r6, #0
	adds	r4, r4, #4
.L214:
	ldr	r0, [r5], #4
	cbnz	r0, .L213
.L216:
	cmp	r5, r4
	bne	.L214
	ldr	r3, .L256
	ldr	r9, .L256+8
	ldr	r10, .L256+12
	ldr	r4, [r3]
	mov	r8, r3
	ldr	r5, [r4], #-36
	subs	r5, r5, #36
.L217:
	add	r3, r4, #36
	cmp	r3, r8
	bne	.L224
	ldr	r5, .L256+4
	ldr	r0, [r5]
	ldr	r4, [r0], #-36
	subs	r4, r4, #36
.L221:
	add	r3, r0, #36
	cmp	r3, r5
	bne	.L222
.L253:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L209:
	bl	mpi_node_destroy
	str	r7, [r6, #-4]
	b	.L212
.L213:
	bl	mpi_node_destroy
	str	r6, [r5, #-4]
	b	.L216
.L219:
	ldr	r7, [r4, #4]
	mov	r1, r9
	mov	r0, r7
	bl	strcmp
	cbz	r0, .L218
	mov	r1, r10
	mov	r0, r7
	bl	strcmp
	cbz	r0, .L218
	mov	r0, r4
	bl	mpi_obj_unref
.L218:
	adds	r6, r6, #1
.L220:
	ldr	r3, [r4, #16]
	cmp	r6, r3
	blt	.L219
	ldr	r3, [r5, #36]
	mov	r4, r5
	sub	r5, r3, #36
	b	.L217
.L224:
	movs	r6, #0
	b	.L220
.L222:
	movs	r1, #1
	bl	mpi_buf_pool_destroy
	ldr	r3, [r4, #36]
	mov	r0, r4
	sub	r4, r3, #36
	b	.L221
.L257:
	.align	2
.L256:
	.word	mpi_buf_list
	.word	mpi_buf_pool_list
	.word	.LC29
	.word	.LC30
	.fnend
	.size	vsys_deinit, .-vsys_deinit
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_open, %function
vsys_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L263
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r7, r1
	ldr	r0, [r3, #20]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L259
	movw	r3, #451
	ldr	r2, .L263+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L263+8
	bl	vlog
.L262:
	mov	r6, #-1
.L258:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L259:
	mov	r1, #10240
	adds	r0, r0, #4
	bl	mpi_fs_buf_init
	mov	r6, r0
	cbz	r0, .L261
	mov	r0, r4
	bl	kfree
	b	.L262
.L261:
	ldr	r5, .L263+12
	add	r3, r4, #24
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	mov	r0, r5
	bl	mpi_obj_ref
	ldr	r3, [r5, #16]
	str	r5, [r4]
	subs	r5, r5, #4
	cmp	r3, #2
	str	r4, [r7, #128]
	bne	.L258
	ldr	r1, [r5, #4]
	ldr	r0, .L263+16
	bl	printk
	b	.L258
.L264:
	.align	2
.L263:
	.word	kmalloc_caches
	.word	.LC31
	.word	.LANCHOR0+155
	.word	g_vsys_dev+4
	.word	.LC32
	.fnend
	.size	vsys_open, .-vsys_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_release, %function
vsys_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	ldr	r5, [r1, #128]
	ldr	r8, .L275+20
	ldr	r9, .L275
	ldr	r0, [r5]
	sub	r10, r8, #4
	bl	mpi_obj_unref
	ldr	r4, [r5, #24]
	ldr	r6, [r4], #-48
	subs	r6, r6, #48
.L266:
	add	r7, r4, #48
	add	r3, r5, #24
	cmp	r7, r3
	bne	.L269
	ldr	r3, [r5]
	ldr	r2, [r3, #16]
	cmp	r2, #1
	bne	.L273
	ldr	r2, [r3]
	mov	r7, #256
	ldr	r1, .L275
	mov	r8, #290
	ldr	r0, .L275+4
	bl	printk
	ldr	r2, .L275+8
	movw	r3, #6180
	ldr	r6, .L275+12
	ldr	r0, [r2, r3]
	ldr	r4, [r0], #-48
	subs	r4, r4, #48
.L271:
	add	r3, r0, #48
	cmp	r3, r6
	bne	.L272
.L273:
	adds	r0, r5, #4
	bl	mpi_fs_buf_deinit
	mov	r0, r5
	bl	kfree
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L269:
	ldr	r3, [r4]
	movs	r1, #4
	ldr	r2, .L275+16
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #473
	str	r3, [sp]
	mov	r3, r9
	bl	vlog
	ldrd	r2, r3, [r4, #48]
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r3, #290
	mov	r2, #256
	strd	r2, r3, [r4, #48]
	ldr	r3, [r4, #92]
	cbnz	r3, .L267
	movs	r1, #1
	mov	r0, r4
	bl	mpi_buf_pool_destroy
.L268:
	ldr	r3, [r6, #48]
	mov	r4, r6
	sub	r6, r3, #48
	b	.L266
.L267:
	ldr	r3, [r8]
	str	r7, [r8]
	strd	r10, r3, [r4, #48]
	str	r7, [r3]
	b	.L268
.L272:
	ldrd	r2, r3, [r0, #48]
	movs	r1, #1
	str	r3, [r2, #4]
	str	r2, [r3]
	strd	r7, r8, [r0, #48]
	bl	mpi_buf_pool_destroy
	ldr	r3, [r4, #48]
	mov	r0, r4
	sub	r4, r3, #48
	b	.L271
.L276:
	.align	2
.L275:
	.word	.LANCHOR0+165
	.word	.LC34
	.word	g_vsys_dev
	.word	g_vsys_dev+6180
	.word	.LC33
	.word	g_vsys_dev+6184
	.fnend
	.size	vsys_release, .-vsys_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_pool_delete, %function
vsys_pool_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r5, r1
	ldr	r3, [r1, #16]	@ unaligned
	ldr	r4, [r0, #128]
	cmp	r3, #536
	beq	.L278
	movw	r3, #321
	ldr	r2, .L286
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L286+4
	movs	r0, #0
	bl	vlog
.L278:
	ldr	r3, [r5]	@ unaligned
	movs	r1, #4
	ldr	r2, .L286+8
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #323
	str	r3, [sp]
	ldr	r3, .L286+4
	bl	vlog
	mov	r3, r4
	ldr	r0, [r3, #24]!
	ldr	r2, [r0], #-48
	subs	r2, r2, #48
.L279:
	add	r1, r0, #48
	cmp	r1, r3
	beq	.L281
	ldr	r1, [r5]	@ unaligned
	ldr	r4, [r0, #44]
	cmp	r4, r1
	bne	.L280
	ldrd	r2, r3, [r0, #48]
	movs	r1, #1
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r2, #256
	mov	r3, #290
	strd	r2, r3, [r0, #48]
	bl	mpi_buf_pool_destroy
.L281:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L280:
	ldr	r1, [r2, #48]
	mov	r0, r2
	sub	r2, r1, #48
	b	.L279
.L287:
	.align	2
.L286:
	.word	.LC21
	.word	.LANCHOR0+178
	.word	.LC35
	.fnend
	.size	vsys_pool_delete, .-vsys_pool_delete
	.align	1
	.global	vsys_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_probe, %function
vsys_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r2, #6188
	ldr	r4, .L290
	mov	r6, r0
	movs	r1, #0
	ldr	r5, .L290+4
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	mov	r0, r6
	bl	kstrdup
	mov	r2, r6
	movs	r1, #8
	movs	r3, #10
	str	r5, [r4, #188]
	str	r3, [r4, #192]
	str	r4, [r4, #164]
	str	r0, [r4]
	adds	r0, r4, #4
	bl	mpi_dev_register
	add	r1, r5, #200
	add	r0, r4, #172
	strd	r0, r0, [r4, #172]
	adds	r0, r4, #4
	movs	r3, #0
	str	r3, [r4, #72]
	strd	r3, r3, [r4, #80]
	str	r3, [r4, #168]
	bl	mpi_sysfs_dev_add
	ldr	r3, .L290+8
	mov	r2, #-1
	mov	r1, r4
	ldr	r0, .L290+12
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L289
	bl	wake_up_process
.L289:
	ldr	r3, .L290+16
	movw	r2, #6180
	str	r5, [r4, #180]
	str	r3, [r4, r2]
	movw	r2, #6184
	str	r3, [r4, r2]
	pop	{r4, r5, r6, pc}
.L291:
	.align	2
.L290:
	.word	g_vsys_dev
	.word	.LANCHOR0+196
	.word	.LC36
	.word	vsys_thread_fn
	.word	g_vsys_dev+6180
	.fnend
	.size	vsys_probe, .-vsys_probe
	.align	1
	.global	vsys_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_shutdown, %function
vsys_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L293
	movs	r3, #1
	adds	r0, r0, #4
	str	r3, [r0, #180]
	b	mpi_dev_unregister
.L294:
	.align	2
.L293:
	.word	g_vsys_dev
	.fnend
	.size	vsys_shutdown, .-vsys_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vsys_load
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_load, %function
vsys_load:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L296
	bl	vsys_probe
	movs	r0, #0
	pop	{r3, pc}
.L297:
	.align	2
.L296:
	.word	.LC36
	.fnend
	.size	vsys_load, .-vsys_load
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vsys_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_exit, %function
vsys_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vsys_shutdown
	.fnend
	.size	vsys_exit, .-vsys_exit
	.text
	.align	1
	.global	vsys_close
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_close, %function
vsys_close:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movs	r4, #0
	ldr	r7, .L338
.L300:
	adds	r6, r7, r4
	movs	r5, #0
.L302:
	ldr	r0, [r6], #4
	cbz	r0, .L301
	bl	mpi_node_stream_pause
.L301:
	adds	r5, r5, #1
	cmp	r5, #6
	bne	.L302
	adds	r4, r4, #24
	cmp	r4, #192
	bne	.L300
	ldr	r5, .L338+4
	movs	r4, #0
.L305:
	ldr	r0, [r5], #4
	cbz	r0, .L304
	bl	mpi_node_stream_pause
.L304:
	adds	r4, r4, #1
	cmp	r4, #64
	bne	.L305
	ldr	r5, .L338+8
	movs	r4, #0
.L307:
	ldr	r0, [r5], #4
	cbz	r0, .L306
	bl	mpi_node_stream_pause
.L306:
	adds	r4, r4, #1
	cmp	r4, #64
	bne	.L307
	ldr	r5, .L338+12
	movs	r4, #0
.L309:
	ldr	r0, [r5], #4
	cbz	r0, .L308
	bl	mpi_node_stream_pause
.L308:
	adds	r4, r4, #1
	cmp	r4, #32
	bne	.L309
	ldr	r5, .L338+16
	movs	r4, #0
.L311:
	ldr	r0, [r5], #4
	cbnz	r0, .L310
.L313:
	adds	r4, r4, #1
	cmp	r4, #4
	bne	.L311
	ldr	r5, .L338+20
	movs	r4, #0
.L315:
	ldr	r0, [r5], #4
	cbnz	r0, .L314
.L317:
	adds	r4, r4, #1
	cmp	r4, #4
	bne	.L315
	movs	r0, #100
	pop	{r3, r4, r5, r6, r7, lr}
	b	msleep
.L310:
	bl	mpi_node_stream_pause
	b	.L313
.L314:
	bl	mpi_node_stream_pause
	b	.L317
.L339:
	.align	2
.L338:
	.word	g_vsys_dev+196
	.word	g_vsys_dev+644
	.word	g_vsys_dev+388
	.word	g_vsys_dev+900
	.word	g_vsys_dev+6148
	.word	g_vsys_dev+6164
	.fnend
	.size	vsys_close, .-vsys_close
	.global	g_vsys_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.36803, %object
	.size	__func__.36803, 21
__func__.36803:
	.ascii	"vsys_add_node_to_map\000"
	.type	__func__.36825, %object
	.size	__func__.36825, 23
__func__.36825:
	.ascii	"vsys_get_node_from_map\000"
	.type	__func__.36846, %object
	.size	__func__.36846, 26
__func__.36846:
	.ascii	"vsys_remove_node_from_map\000"
	.type	__func__.36560, %object
	.size	__func__.36560, 13
__func__.36560:
	.ascii	"vsys_version\000"
	.type	__func__.36568, %object
	.size	__func__.36568, 10
__func__.36568:
	.ascii	"vsys_bind\000"
	.type	__func__.36576, %object
	.size	__func__.36576, 12
__func__.36576:
	.ascii	"vsys_unbind\000"
	.type	__func__.36686, %object
	.size	__func__.36686, 22
__func__.36686:
	.ascii	"vsys_force_lost_frame\000"
	.type	__func__.36641, %object
	.size	__func__.36641, 17
__func__.36641:
	.ascii	"vsys_pool_create\000"
	.type	__func__.36699, %object
	.size	__func__.36699, 11
__func__.36699:
	.ascii	"vsys_ioctl\000"
	.type	__func__.36721, %object
	.size	__func__.36721, 10
__func__.36721:
	.ascii	"vsys_open\000"
	.type	__func__.36749, %object
	.size	__func__.36749, 13
__func__.36749:
	.ascii	"vsys_release\000"
	.type	__func__.36653, %object
	.size	__func__.36653, 17
__func__.36653:
	.ascii	"vsys_pool_delete\000"
	.space	1
	.type	vsys_ioctls, %object
	.size	vsys_ioctls, 200
vsys_ioctls:
	.word	-1068731648
	.word	0
	.word	vsys_version
	.word	.LC37
	.word	0
	.word	-1071877375
	.word	0
	.word	vsys_bind
	.word	.LC38
	.word	0
	.word	-1071877374
	.word	0
	.word	vsys_unbind
	.word	.LC39
	.word	0
	.word	29443
	.word	0
	.word	vsys_init
	.word	.LC40
	.word	0
	.word	29444
	.word	0
	.word	vsys_deinit
	.word	.LC41
	.word	0
	.word	-1038585083
	.word	0
	.word	vsys_pool_create
	.word	.LC42
	.word	0
	.word	-1038585082
	.word	0
	.word	vsys_pool_delete
	.word	.LC43
	.word	0
	.word	29447
	.word	0
	.word	vsys_wait_rcu
	.word	.LC44
	.word	0
	.word	29448
	.word	0
	.word	vsys_free_all_cma
	.word	.LC45
	.word	0
	.word	-1072401655
	.word	0
	.word	vsys_force_lost_frame
	.word	.LC46
	.word	0
	.type	vsys_driver_fops, %object
	.size	vsys_driver_fops, 128
vsys_driver_fops:
	.word	0
	.space	4
	.word	vsys_read
	.space	24
	.word	0
	.word	vsys_ioctl
	.word	vsys_compat_ioctl
	.word	0
	.space	4
	.word	vsys_open
	.space	4
	.word	vsys_release
	.space	60
	.bss
	.align	2
	.type	g_vsys_dev, %object
	.size	g_vsys_dev, 6188
g_vsys_dev:
	.space	6188
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"mod = %d dev_id = %d, chn_id = %d\000"
.LC1:
	.ascii	"\033[1;31mstruct vsys_version mismatching\033[0m\000"
.LC2:
	.ascii	"\033[1;31mstruct vsys_bind mismatching\033[0m\000"
.LC3:
	.ascii	"\033[1;31mget node from map [src chn] fail\033[0m\000"
.LC4:
	.ascii	"\033[1;31mget node from map [dst chn] fail\033[0m\000"
.LC5:
	.ascii	"vmpi:d4f898704722e6713f10876f39aa2121f9219477-v1.4."
	.ascii	"54\000"
.LC6:
	.ascii	"module: %s\012version: %s\012build: %s\012\000"
.LC7:
	.ascii	"-2023-09-28-17:34:00\000"
.LC8:
	.ascii	"***********************************************mpi "
	.ascii	"node list******************************************"
	.ascii	"*********\012\000"
.LC9:
	.ascii	"id---name--------handle-----nid-ref-infa_cnt-lcnt-f"
	.ascii	"rate-fbase-wcnt-depth-timeout-onfa_cnt-lcnt-frate-f"
	.ascii	"base-wcnt-depth-timeout-itime-otime-state-next_node"
	.ascii	"-------------\012\000"
.LC10:
	.ascii	"%-#4d %-#11s %-#10x %-#3d %-#3d %-#8d %-#4d %-#5d %"
	.ascii	"-#5d %-#4d %-#5d %-#7d %-#8d %-#4d %-#5d %-#5d %-#4"
	.ascii	"d %-#5d %-#7d %-#5ld %-#5ld %-#5x \000"
.LC11:
	.ascii	"*********************************************mpi no"
	.ascii	"de frame control***********************************"
	.ascii	"*********\012\000"
.LC12:
	.ascii	"id---name--------table-----------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"---------\012\000"
.LC13:
	.ascii	"%-#4d  \000"
.LC14:
	.ascii	"\012\000"
.LC15:
	.ascii	"%-#4d %-#11s %-#5s\000"
.LC16:
	.ascii	"in\000"
.LC17:
	.ascii	"%d \000"
.LC18:
	.ascii	"out\000"
.LC19:
	.ascii	"\033[1;31mstruct vsys_chn_attr mismatching\033[0m\000"
.LC20:
	.ascii	"\033[1;31mget node from map fail\033[0m\000"
.LC21:
	.ascii	"\033[1;31mstruct vsys_pool mismatching\033[0m\000"
.LC22:
	.ascii	"valloc\000"
.LC23:
	.ascii	"\033[1;31merror getting vdev  %p\033[0m\000"
.LC24:
	.ascii	"\033[1;31mcreate pool fail  %p\033[0m\000"
.LC25:
	.ascii	"\033[1;32mmpi_buf id =  %d\033[0m\000"
.LC26:
	.ascii	"vsys_ioctl: nr = %d, index = %d dev = %p\000"
.LC27:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC28:
	.ascii	"\033[1;31m error: ioctl is null\033[0m\000"
.LC29:
	.ascii	"mcu\000"
.LC30:
	.ascii	"venc\000"
.LC31:
	.ascii	"\033[1;31mvalloc open fail\033[0m\000"
.LC32:
	.ascii	"vsys dev open %d\000"
.LC33:
	.ascii	"\033[1;32mpool id = %d, user process exit\033[0m\000"
.LC34:
	.ascii	"%s, %d\000"
.LC35:
	.ascii	"\033[1;32mpool->id =  %d\033[0m\000"
.LC36:
	.ascii	"vsys\000"
.LC37:
	.ascii	"VSYS_IOCTL_VERSION\000"
.LC38:
	.ascii	"VSYS_IOCTL_SYS_BIND\000"
.LC39:
	.ascii	"VSYS_IOCTL_SYS_UNBIND\000"
.LC40:
	.ascii	"VSYS_IOCTL_SYS_INIT\000"
.LC41:
	.ascii	"VSYS_IOCTL_SYS_DEINIT\000"
.LC42:
	.ascii	"VSYS_IOCTL_SYS_POOL_CREATE\000"
.LC43:
	.ascii	"VSYS_IOCTL_SYS_POOL_DELETE\000"
.LC44:
	.ascii	"VSYS_IOCTL_WAIT_MMZ_FREE\000"
.LC45:
	.ascii	"VSYS_IOCTL_RELEASE_PHY_MEMORY\000"
.LC46:
	.ascii	"VSYS_IOCTL_FORCE_LOST_FRAME\000"
	.section	___ksymtab_gpl+vsys_add_node_to_map,"a"
	.align	2
	.type	__ksymtab_vsys_add_node_to_map, %object
	.size	__ksymtab_vsys_add_node_to_map, 12
__ksymtab_vsys_add_node_to_map:
	.word	vsys_add_node_to_map
	.word	__kstrtab_vsys_add_node_to_map
	.word	__kstrtabns_vsys_add_node_to_map
	.section	___ksymtab_gpl+vsys_get_node_from_map,"a"
	.align	2
	.type	__ksymtab_vsys_get_node_from_map, %object
	.size	__ksymtab_vsys_get_node_from_map, 12
__ksymtab_vsys_get_node_from_map:
	.word	vsys_get_node_from_map
	.word	__kstrtab_vsys_get_node_from_map
	.word	__kstrtabns_vsys_get_node_from_map
	.section	___ksymtab_gpl+vsys_get_pool,"a"
	.align	2
	.type	__ksymtab_vsys_get_pool, %object
	.size	__ksymtab_vsys_get_pool, 12
__ksymtab_vsys_get_pool:
	.word	vsys_get_pool
	.word	__kstrtab_vsys_get_pool
	.word	__kstrtabns_vsys_get_pool
	.section	___ksymtab_gpl+vsys_remove_node_from_map,"a"
	.align	2
	.type	__ksymtab_vsys_remove_node_from_map, %object
	.size	__ksymtab_vsys_remove_node_from_map, 12
__ksymtab_vsys_remove_node_from_map:
	.word	vsys_remove_node_from_map
	.word	__kstrtab_vsys_remove_node_from_map
	.word	__kstrtabns_vsys_remove_node_from_map
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
