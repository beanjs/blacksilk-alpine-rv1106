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
	.file	"vrga.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vrga_node_get_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_get_status, %function
vrga_node_get_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrga_node_get_status, .-vrga_node_get_status
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_compat_ioctl, %function
vrga_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrga_compat_ioctl, .-vrga_compat_ioctl
	.align	1
	.global	vrga_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_create, %function
vrga_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r1
	ldr	r3, [r0, #128]
	.pad #36
	sub	sp, sp, #36
	ldr	r5, [r1]	@ unaligned
	ldr	r6, [r3, #160]
	and	r5, r5, #63
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #32
	beq	.L4
	movs	r3, #85
	ldr	r2, .L14
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L14+4
	movs	r0, #0
	bl	vlog
.L13:
	mov	r0, #-1
.L3:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L4:
	ldr	r0, .L14+8
	bl	mpi_allocator_find_by_name
	mov	r7, r0
	cmp	r0, #0
	beq	.L13
	ldr	r2, [r4, #20]	@ unaligned
	add	r3, r6, r5, lsl #2
	add	r0, r6, #12
	str	r2, [r3, #204]
	movs	r3, #0
	movs	r2, #1
	ldr	r1, [r4]	@ unaligned
	bl	mpi_dev_create_node_with_params
	mov	r6, r0
	cmp	r0, #0
	beq	.L13
	ldr	r3, [r4]	@ unaligned
	movs	r1, #4
	ldr	r9, .L14+24
	movs	r0, #0
	ldr	r2, .L14+12
	strd	r5, r3, [sp, #4]
	movs	r3, #98
	str	r3, [sp]
	ldr	r3, .L14+4
	bl	vlog
	mov	r3, r6
	mov	r2, r5
	movs	r1, #0
	str	r9, [r6, #4]
	movs	r0, #18
	bl	vsys_add_node_to_map
	add	r3, r6, #144
	add	r2, r6, #152
	ldr	r1, [r4, #28]	@ unaligned
	ldr	r0, [r4, #24]	@ unaligned
	bl	mpi_node_set_frame_rate
	ldr	r8, [r4, #20]	@ unaligned
	cmp	r8, #0
	bne	.L8
	mov	r0, r7
	str	r9, [sp]
	ldr	r3, [r4, #16]	@ unaligned
	movs	r1, #1
	ldr	r2, [r4, #8]	@ unaligned
	bl	mpi_buf_pool_create
	mov	r7, r0
	cbnz	r0, .L9
	mov	r1, r0
	mov	r2, r5
	movs	r0, #18
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
	b	.L13
.L9:
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #4
	ldr	r2, .L14+16
	str	r3, [sp, #24]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r0]
	strd	r0, r3, [sp, #12]
	mov	r0, r8
	ldr	r3, [r4]	@ unaligned
	strd	r5, r3, [sp, #4]
	movs	r3, #113
	str	r3, [sp]
	ldr	r3, .L14+4
	bl	vlog
	mov	r1, r6
	mov	r0, r7
	bl	mpi_buf_pool_add_user
.L8:
	ldr	r3, [r4]	@ unaligned
	movs	r1, #4
	str	r5, [r4, #4]	@ unaligned
	movs	r0, #0
	ldr	r2, .L14+20
	strd	r5, r3, [sp, #4]
	movs	r3, #118
	str	r3, [sp]
	ldr	r3, .L14+4
	bl	vlog
	movs	r0, #0
	b	.L3
.L15:
	.align	2
.L14:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC2
	.word	.LC4
	.word	.LC5
	.word	.LC3
	.fnend
	.size	vrga_node_create, .-vrga_node_create
	.align	1
	.global	vrga_mb_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_mb_get, %function
vrga_mb_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r2, [r1]	@ unaligned
	cmp	r3, #104
	and	r2, r2, #63
	beq	.L17
	movs	r3, #221
	ldr	r2, .L31
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L31+4
	movs	r0, #0
	bl	vlog
.L20:
	mov	r0, #-1
.L16:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L17:
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L20
	ldr	r3, [r5, #8]	@ unaligned
	str	r3, [r0, #384]
	bl	mpi_node_pick_out_buffer
	mov	r4, r0
	cmp	r0, #0
	beq	.L20
	ldr	r3, [r0, #448]
	cmp	r3, #0
	beq	.L20
	ldr	r3, [r6, #288]
	cbz	r3, .L21
	ldr	r2, [r6, #76]
	add	r3, r3, #324
	add	r1, r0, r2, lsl #3
	ldr	r0, [r3, #4]
	add	r2, r4, r2, lsl #3
	add	r1, r1, #308
	str	r1, [r3, #4]
	strd	r3, r0, [r2, #308]
	str	r1, [r0]
.L21:
	movs	r2, #80
	add	r1, r4, #616
	add	r0, r5, #24
	bl	memcpy
	ldr	r3, [r4, #448]
	movs	r0, #0
	ldr	r3, [r3]
	str	r3, [r5, #4]	@ unaligned
	ldr	r3, [r4]
	str	r3, [r5, #20]	@ unaligned
	b	.L16
.L32:
	.align	2
.L31:
	.word	.LC6
	.word	.LANCHOR0+17
	.fnend
	.size	vrga_mb_get, .-vrga_mb_get
	.global	__aeabi_uidivmod
	.align	1
	.global	vrga_node_set_crop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_set_crop, %function
vrga_node_set_crop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r1
	ldr	r3, [r1, #28]	@ unaligned
	.pad #48
	sub	sp, sp, #48
	ldr	r6, [r1]	@ unaligned
	cmp	r3, #32
	and	r6, r6, #63
	beq	.L34
	mov	r3, #338
	ldr	r2, .L45
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L45+4
	movs	r0, #0
.L44:
	bl	vlog
	mov	r0, #-1
.L33:
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, pc}
.L34:
	mov	r2, r6
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	cbnz	r0, .L36
	mov	r3, #344
	ldr	r2, .L45+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L45+4
	b	.L44
.L36:
	ldr	r5, [r0, #288]
	cbz	r5, .L37
	ldrd	r0, r2, [r5, #8]
	subs	r3, r0, r2
	cmp	r3, #0
	it	lt
	rsblt	r3, r3, #0
	cmp	r3, #4
	ble	.L38
	strd	r0, r2, [sp, #4]
	movw	r3, #351
	ldr	r2, .L45+12
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L45+4
	bl	vlog
.L37:
	ldr	r3, [r5, #12]
	movs	r1, #4
	ldr	r2, .L45+16
	movs	r0, #0
	str	r3, [sp, #40]
	ldr	r3, [r5, #8]
	str	r3, [sp, #36]
	ldr	r3, [r4, #24]	@ unaligned
	str	r3, [sp, #32]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r4, #12]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4]	@ unaligned
	strd	r6, r3, [sp, #4]
	movw	r3, #363
	str	r3, [sp]
	ldr	r3, .L45+4
	bl	vlog
	movs	r0, #0
	b	.L33
.L38:
	movs	r1, #5
	bl	__aeabi_uidivmod
	add	r2, r4, #32
	mov	r3, r4
	add	r1, r5, r1, lsl #5
	adds	r1, r1, #24
.L39:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r2
	str	r0, [r1], #4	@ unaligned
	bne	.L39
	ldr	r3, [r5, #8]
	adds	r3, r3, #1
	str	r3, [r5, #8]
	b	.L37
.L46:
	.align	2
.L45:
	.word	.LC7
	.word	.LANCHOR0+29
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.fnend
	.size	vrga_node_set_crop, .-vrga_node_set_crop
	.align	1
	.global	vrga_node_set_scale
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_set_scale, %function
vrga_node_set_scale:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r6, [r1, #24]	@ unaligned
	.pad #44
	sub	sp, sp, #44
	ldr	r7, [r1]	@ unaligned
	cmp	r6, #28
	and	r7, r7, #63
	beq	.L48
	mov	r3, #376
	ldr	r2, .L59
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L59+4
	movs	r0, #0
.L58:
	bl	vlog
	mov	r0, #-1
.L47:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L48:
	mov	r2, r7
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	cbnz	r0, .L50
	mov	r3, #382
	ldr	r2, .L59+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L59+4
	b	.L58
.L50:
	ldr	r5, [r0, #288]
	cbz	r5, .L51
	ldrd	r0, r2, [r5, #16]
	subs	r3, r0, r2
	cmp	r3, #0
	it	lt
	rsblt	r3, r3, #0
	cmp	r3, #4
	ble	.L52
	strd	r0, r2, [sp, #4]
	movw	r3, #389
	ldr	r2, .L59+12
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L59+4
	bl	vlog
.L51:
	ldr	r3, [r5, #20]
	movs	r1, #4
	ldr	r2, .L59+16
	movs	r0, #0
	str	r3, [sp, #36]
	ldr	r3, [r5, #16]
	str	r3, [sp, #32]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r4, #12]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4]	@ unaligned
	strd	r7, r3, [sp, #4]
	mov	r3, #402
	str	r3, [sp]
	ldr	r3, .L59+4
	bl	vlog
	movs	r0, #0
	b	.L47
.L52:
	movs	r1, #5
	bl	__aeabi_uidivmod
	add	r2, r4, #28
	mov	r3, r4
	mla	r1, r6, r1, r5
	adds	r1, r1, #184
.L53:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r2
	str	r0, [r1], #4	@ unaligned
	bne	.L53
	ldr	r3, [r5, #16]
	adds	r3, r3, #1
	str	r3, [r5, #16]
	b	.L51
.L60:
	.align	2
.L59:
	.word	.LC11
	.word	.LANCHOR0+48
	.word	.LC8
	.word	.LC9
	.word	.LC12
	.fnend
	.size	vrga_node_set_scale, .-vrga_node_set_scale
	.align	1
	.global	vrga_mb_release
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_mb_release, %function
vrga_mb_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #36
	sub	sp, sp, #36
	ldr	r6, [r1]	@ unaligned
	cmp	r3, #104
	and	r6, r6, #63
	beq	.L62
	movs	r3, #251
	ldr	r2, .L67
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L67+4
	movs	r0, #0
	bl	vlog
.L65:
	mov	r0, #-1
	b	.L61
.L62:
	mov	r2, r6
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	beq	.L65
	movs	r1, #4
	ldr	r0, [r5, #20]	@ unaligned
	bl	mpi_obj_from_id
	mov	r4, r0
	cbz	r0, .L64
	ldr	r3, [r0, #16]
	movs	r1, #5
	ldr	r2, .L67+8
	str	r3, [sp, #24]
	ldr	r3, [r5, #20]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r0, #448]
	strd	r0, r3, [sp, #12]
	movs	r0, #0
	ldr	r3, [r5]	@ unaligned
	strd	r6, r3, [sp, #4]
	movw	r3, #263
	str	r3, [sp]
	ldr	r3, .L67+4
	bl	vlog
	ldr	r3, [r7, #76]
	mov	r0, r7
	add	r3, r4, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #308]
	movs	r2, #0
	mov	r1, r4
	bl	mpi_node_release_buffer_flag
.L66:
	movs	r0, #0
.L61:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L64:
	movw	r3, #267
	ldr	r2, .L67+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L67+4
	bl	vlog
	b	.L66
.L68:
	.align	2
.L67:
	.word	.LC6
	.word	.LANCHOR0+68
	.word	.LC13
	.word	.LC14
	.fnend
	.size	vrga_mb_release, .-vrga_mb_release
	.align	1
	.global	vrga_mb_send
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_mb_send, %function
vrga_mb_send:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #36
	sub	sp, sp, #36
	ldr	r6, [r1]	@ unaligned
	cmp	r3, #104
	and	r6, r6, #63
	beq	.L70
	movw	r3, #279
	ldr	r2, .L75
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L75+4
	movs	r0, #0
	bl	vlog
.L73:
	mov	r0, #-1
.L69:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L70:
	mov	r2, r6
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	beq	.L73
	ldr	r0, [r4, #16]	@ unaligned
	cmp	r0, #0
	blt	.L74
	bl	get_mpi_buf
	mov	r5, r0
	cbnz	r0, .L72
	ldr	r3, [r4, #16]	@ unaligned
	movs	r1, #2
	ldr	r2, .L75+8
	str	r3, [sp, #4]
	mov	r3, #290
	str	r3, [sp]
	ldr	r3, .L75+4
	bl	vlog
	b	.L73
.L72:
	ldr	r3, .L75+12
	movs	r1, #5
	str	r3, [r0, #4]
	ldr	r2, [r4, #16]	@ unaligned
	ldr	r3, [r0, #16]
	str	r2, [sp, #28]
	ldr	r2, [r0, #448]
	strd	r3, r2, [sp, #20]
	ldr	r3, [r0]
	ldr	r2, .L75+16
	strd	r0, r3, [sp, #12]
	movs	r0, #0
	ldr	r3, [r4], #24	@ unaligned
	strd	r6, r3, [sp, #4]
	movw	r3, #299
	str	r3, [sp]
	ldr	r3, .L75+4
	bl	vlog
	movs	r2, #80
	mov	r1, r4
	add	r0, r5, #616
	bl	memcpy
	movs	r2, #0
	mov	r1, r5
	mov	r0, r7
	bl	mpi_node_buffer_in
.L74:
	movs	r0, #0
	b	.L69
.L76:
	.align	2
.L75:
	.word	.LC6
	.word	.LANCHOR0+84
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.fnend
	.size	vrga_mb_send, .-vrga_mb_send
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_open, %function
vrga_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L78
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	add	r0, r3, #12
	str	r0, [r1, #128]
	movs	r2, #21
	str	r2, [r3, #184]
	bl	mpi_obj_ref
	movw	r3, #487
	ldr	r2, .L78+4
	movs	r1, #4
	movs	r0, #0
	str	r3, [sp]
	ldr	r3, .L78+8
	bl	vlog
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L79:
	.align	2
.L78:
	.word	.LANCHOR1
	.word	.LC18
	.word	.LANCHOR0+97
	.fnend
	.size	vrga_open, .-vrga_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_ioctl, %function
vrga_ioctl:
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
	ldr	r5, [r6, #184]
	cmp	r5, r4
	bls	.L81
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r5
	sbc	r5, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r6, #180]
	ands	r4, r4, r5
	movs	r5, #20
	mla	r4, r5, r4, r2
	cbz	r4, .L81
	mov	r2, r1
	mov	r1, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_ioctl_kernel
.L81:
	mov	r3, #468
	ldr	r2, .L85
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L85+4
	movs	r0, #0
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L86:
	.align	2
.L85:
	.word	.LC19
	.word	.LANCHOR0+107
	.fnend
	.size	vrga_ioctl, .-vrga_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_handle_message, %function
vrga_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r2
	.pad #36
	sub	sp, sp, #36
	mov	r7, r0
	cbnz	r0, .L88
	ldr	r3, [r0, #8]
	cmp	r3, #1
	bne	.L105
.L88:
	subs	r3, r1, #2
	cmp	r3, #1
	bhi	.L90
	ldr	r4, [r7, #288]
	cmp	r4, #0
	beq	.L87
	ldr	r4, [r4]
	cmp	r4, #0
	beq	.L87
	mov	r0, r4
	bl	mpi_obj_ref
	ldr	r3, [r4, #48]
	cmp	r7, r3
	bne	.L91
	mov	r0, r4
	bl	mpi_job_wait
.L91:
	mov	r0, r4
	bl	mpi_obj_unref
.L105:
	movs	r4, #0
	b	.L87
.L90:
	ldr	r3, .L117
	ldr	r4, [r3, #8]
	cmp	r4, #0
	bne	.L105
	cmp	r1, #1
	bne	.L87
	ldr	r3, [r5]
	movs	r1, #5
	ldr	r2, .L117+4
	mov	r0, r4
	str	r3, [sp, #12]
	ldr	r3, [r7]
	str	r3, [sp, #8]
	ldr	r3, [r7, #44]
	ldr	r3, [r3, #44]
	str	r3, [sp, #4]
	movw	r3, #950
	str	r3, [sp]
	ldr	r3, .L117+8
	bl	vlog
	ldr	r9, [r7, #288]
	ldr	r10, [r7, #44]
	cmp	r9, #0
	beq	.L107
	cmp	r5, #0
	beq	.L107
	mov	r0, r5
	bl	mpi_obj_ref
	ldr	r3, [r9, #4]
	cbnz	r3, .L108
	mov	r1, r4
	mov	r0, r7
	bl	mpi_node_request_buf
	mov	r6, r0
	cbnz	r0, .L92
.L93:
	mov	r0, r5
	b	.L116
.L108:
	mov	r6, r4
.L92:
	mov	r1, r7
	mov	r0, r10
	bl	mpi_dev_request_job_for_node
	mov	r8, r0
	cbz	r0, .L94
	ldr	r3, [r0, #12]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L95
	bl	mpi_obj_unref
.L94:
	mov	r0, r6
	bl	mpi_obj_unref
	b	.L93
.L95:
	str	r5, [r0, #60]
	ldr	r3, [r9, #4]
	cmp	r3, #0
	beq	.L96
	str	r5, [r0, #64]
	mov	r0, r5
	bl	mpi_obj_ref
.L97:
	ldr	r3, [r8, #64]
	movs	r1, #5
	ldr	r2, .L117+12
	movs	r0, #0
	ldr	r3, [r3]
	str	r3, [sp, #20]
	ldr	r3, [r8, #60]
	ldr	r3, [r3]
	str	r3, [sp, #16]
	ldr	r3, [r7]
	str	r3, [sp, #12]
	ldr	r3, [r10, #44]
	str	r3, [sp, #8]
	ldr	r3, [r8]
	str	r3, [sp, #4]
	mov	r3, #884
	str	r3, [sp]
	ldr	r3, .L117+16
	bl	vlog
	mov	r0, r8
	bl	mpi_job_set_ready
	mov	r0, r8
	ldr	r10, .L117+16
	bl	mpi_obj_ref
	ldr	fp, .L117+24
	mov	r9, #904
.L98:
	mov	r1, r8
	ldr	r0, [r7, #308]
	bl	mpi_queue_push_obj
	mov	r6, r0
	cbz	r0, .L115
	ldr	r0, .L117+20
	bl	up
.L87:
	mov	r0, r4
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L96:
	str	r6, [r0, #64]
	b	.L97
.L115:
	ldr	r0, [r7, #308]
	bl	mpi_queue_pop_obj
	mov	r5, r0
	cbnz	r0, .L99
	movs	r1, #1
	mov	r0, r8
	bl	mpi_job_cancel
	mov	r0, r8
.L116:
	bl	mpi_obj_unref
.L107:
	mov	r4, #-1
	b	.L87
.L99:
	ldr	r3, [r0, #60]
	ldr	r2, [r0, #16]
	ldr	r1, [r3, #16]
	str	r1, [sp, #24]
	movs	r1, #5
	ldr	r3, [r3]
	strd	r2, r3, [sp, #16]
	mov	r2, fp
	ldr	r3, [r0]
	mov	r0, r6
	str	r3, [sp, #12]
	ldr	r3, [r7]
	str	r3, [sp, #8]
	ldr	r3, [r7, #44]
	ldr	r3, [r3, #44]
	strd	r9, r3, [sp]
	mov	r3, r10
	bl	vlog
	movs	r1, #1
	mov	r0, r5
	bl	mpi_job_cancel
	mov	r0, r5
	bl	mpi_obj_unref
	b	.L98
.L118:
	.align	2
.L117:
	.word	.LANCHOR1
	.word	.LC20
	.word	.LANCHOR0+118
	.word	.LC21
	.word	.LANCHOR0+143
	.word	.LANCHOR1+188
	.word	.LC22
	.fnend
	.size	vrga_handle_message, .-vrga_handle_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_destroy_ctx, %function
vrga_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L120
	bl	kfree
.L120:
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	vrga_destroy_ctx, .-vrga_destroy_ctx
	.align	1
	.global	vrga_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_version, %function
vrga_version:
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
	beq	.L125
	movs	r3, #57
	ldr	r2, .L129
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L129+4
	movs	r0, #0
	bl	vlog
	mov	r0, #-1
.L124:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L125:
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
	b	.L124
.L130:
	.align	2
.L129:
	.word	.LC23
	.word	.LANCHOR0+156
	.fnend
	.size	vrga_version, .-vrga_version
	.align	1
	.global	vrga_node_set_bypass
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_set_bypass, %function
vrga_node_set_bypass:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #32
	and	r4, r4, #63
	beq	.L132
	movw	r3, #315
	ldr	r2, .L136
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L136+4
	movs	r0, #0
	bl	vlog
.L134:
	mov	r0, #-1
	b	.L131
.L132:
	mov	r2, r4
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L134
	ldr	r3, .L136+8
	ldr	r0, [r0, #288]
	ldr	r2, [r5, #20]	@ unaligned
	add	r4, r3, r4, lsl #2
	str	r2, [r4, #204]
	cbz	r0, .L131
	str	r2, [r0, #4]
	movs	r0, #0
.L131:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L137:
	.align	2
.L136:
	.word	.LC0
	.word	.LANCHOR0+169
	.word	.LANCHOR1
	.fnend
	.size	vrga_node_set_bypass, .-vrga_node_set_bypass
	.align	1
	.global	vrga_node_frame_rate_ctl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_frame_rate_ctl, %function
vrga_node_frame_rate_ctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r2, [r1]	@ unaligned
	cmp	r3, #32
	and	r2, r2, #63
	beq	.L139
	mov	r3, #414
	ldr	r2, .L142
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L142+4
	movs	r0, #0
	bl	vlog
.L141:
	mov	r0, #-1
	b	.L138
.L139:
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L141
	add	r3, r0, #144
	add	r2, r0, #152
	ldr	r1, [r4, #28]	@ unaligned
	ldr	r0, [r4, #24]	@ unaligned
	bl	mpi_node_set_frame_rate
	movs	r0, #0
.L138:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L143:
	.align	2
.L142:
	.word	.LC0
	.word	.LANCHOR0+190
	.fnend
	.size	vrga_node_frame_rate_ctl, .-vrga_node_frame_rate_ctl
	.align	1
	.global	vrga_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_start, %function
vrga_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #32
	and	r4, r4, #63
	beq	.L145
	movs	r3, #181
	ldr	r2, .L148
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L148+4
	movs	r0, #0
	bl	vlog
.L147:
	mov	r0, #-1
	b	.L144
.L145:
	mov	r2, r4
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L147
	bl	mpi_node_streamon
	ldr	r3, [r5]	@ unaligned
	ldr	r2, .L148+8
	movs	r1, #4
	movs	r0, #0
	strd	r4, r3, [sp, #4]
	movs	r3, #188
	str	r3, [sp]
	ldr	r3, .L148+4
	bl	vlog
	movs	r0, #0
.L144:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L149:
	.align	2
.L148:
	.word	.LC0
	.word	.LANCHOR0+215
	.word	.LC24
	.fnend
	.size	vrga_node_start, .-vrga_node_start
	.align	1
	.global	vrga_node_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_stop, %function
vrga_node_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #32
	and	r4, r4, #63
	beq	.L151
	movs	r3, #199
	ldr	r2, .L154
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L154+4
	movs	r0, #0
	bl	vlog
.L153:
	mov	r0, #-1
	b	.L150
.L151:
	mov	r2, r4
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L153
	movs	r1, #1
	bl	mpi_node_flush
	ldr	r3, [r5]	@ unaligned
	ldr	r2, .L154+8
	movs	r1, #4
	movs	r0, #0
	strd	r4, r3, [sp, #4]
	movs	r3, #207
	str	r3, [sp]
	ldr	r3, .L154+4
	bl	vlog
	movs	r0, #0
.L150:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L155:
	.align	2
.L154:
	.word	.LC0
	.word	.LANCHOR0+231
	.word	.LC25
	.fnend
	.size	vrga_node_stop, .-vrga_node_stop
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_release, %function
vrga_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	ldr	r4, [r1, #128]
	mov	r0, r4
	bl	mpi_obj_unref
	ldr	r3, [r4, #16]
	cmp	r3, #1
	bne	.L157
	movs	r5, #0
	mov	r8, #256
.L165:
	mov	r2, r5
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	mov	r4, r0
	cbz	r0, .L158
	ldr	r6, [r0, #60]
	cbz	r6, .L159
	mov	r1, r0
	mov	r0, r6
	bl	mpi_buf_pool_del_user
	movs	r1, #1
	mov	r0, r6
	bl	mpi_buf_pool_destroy
.L159:
	ldr	r6, [r4, #288]
	cbnz	r6, .L160
.L164:
	mov	r2, r5
	movs	r1, #0
	movs	r0, #18
	bl	vsys_remove_node_from_map
	mov	r0, r4
	bl	mpi_node_destroy
.L158:
	adds	r5, r5, #1
	cmp	r5, #64
	bne	.L165
	mov	r3, #532
	ldr	r2, .L176
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L176+4
	movs	r0, #0
	bl	vlog
.L157:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L160:
	ldr	r2, [r4, #76]
	mvn	r7, #43
	ldr	r0, [r6, #324]
	add	r6, r6, #324
	add	r3, r2, #33
	mov	r9, #290
	sub	r3, r7, r3, lsl #3
	add	r0, r0, r3
	add	r2, r0, r2, lsl #3
	ldr	r7, [r2, #308]
	add	r7, r7, r3
.L161:
	ldr	r3, [r4, #76]
	add	r2, r0, r3, lsl #3
	add	r2, r2, #308
	cmp	r2, r6
	beq	.L164
	cbz	r0, .L162
	add	r3, r0, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	strd	r8, r9, [r3, #308]
	bl	mpi_obj_unref
.L162:
	ldr	r3, [r4, #76]
	mvn	r2, #43
	mov	r0, r7
	add	r1, r3, #33
	add	r3, r7, r3, lsl #3
	sub	r2, r2, r1, lsl #3
	ldr	r3, [r3, #308]
	adds	r7, r3, r2
	b	.L161
.L177:
	.align	2
.L176:
	.word	.LC26
	.word	.LANCHOR0+246
	.fnend
	.size	vrga_release, .-vrga_release
	.align	1
	.global	vrga_node_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_delete, %function
vrga_node_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r8, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r5, [r1]	@ unaligned
	cmp	r3, #32
	and	r5, r5, #63
	beq	.L179
	movs	r3, #138
	ldr	r2, .L194
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L194+4
	movs	r0, #0
	bl	vlog
.L187:
	mov	r0, #-1
	b	.L178
.L179:
	mov	r2, r5
	movs	r1, #0
	movs	r0, #18
	bl	vsys_get_node_from_map
	mov	r4, r0
	cmp	r0, #0
	beq	.L187
	ldr	r6, [r0, #60]
	cbz	r6, .L181
	mov	r1, r0
	mov	r0, r6
	bl	mpi_buf_pool_del_user
	movs	r1, #1
	mov	r0, r6
	bl	mpi_buf_pool_destroy
.L181:
	ldr	r6, [r4, #288]
	cbnz	r6, .L182
.L186:
	mov	r2, r5
	movs	r1, #0
	movs	r0, #18
	bl	vsys_remove_node_from_map
	mov	r0, r4
	bl	mpi_node_destroy
	ldr	r3, [r8]	@ unaligned
	ldr	r2, .L194+8
	movs	r1, #4
	movs	r0, #0
	strd	r5, r3, [sp, #4]
	movs	r3, #165
	str	r3, [sp]
	ldr	r3, .L194+4
	bl	vlog
	movs	r0, #0
.L178:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L182:
	ldr	r2, [r4, #76]
	mvn	r7, #43
	ldr	r0, [r6, #324]
	add	r6, r6, #324
	add	r3, r2, #33
	mov	r9, #256
	mov	r10, #290
	sub	r3, r7, r3, lsl #3
	add	r0, r0, r3
	add	r2, r0, r2, lsl #3
	ldr	r7, [r2, #308]
	add	r7, r7, r3
.L183:
	ldr	r3, [r4, #76]
	add	r2, r0, r3, lsl #3
	add	r2, r2, #308
	cmp	r2, r6
	beq	.L186
	cbz	r0, .L184
	add	r3, r0, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	strd	r9, r10, [r3, #308]
	bl	mpi_obj_unref
.L184:
	ldr	r3, [r4, #76]
	mvn	r2, #43
	mov	r0, r7
	add	r1, r3, #33
	add	r3, r7, r3, lsl #3
	sub	r2, r2, r1, lsl #3
	ldr	r3, [r3, #308]
	adds	r7, r3, r2
	b	.L183
.L195:
	.align	2
.L194:
	.word	.LC0
	.word	.LANCHOR0+259
	.word	.LC27
	.fnend
	.size	vrga_node_delete, .-vrga_node_delete
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_create_ctx, %function
vrga_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L203
	mov	r1, #3520
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	cbz	r0, .L196
	cbz	r4, .L198
	ldr	r2, [r4, #56]
	ldr	r3, .L203+4
	and	r2, r2, #63
	add	r3, r3, r2, lsl #2
	ldr	r4, [r3, #204]
.L198:
	movs	r3, #1
	str	r4, [r0, #4]
	str	r3, [r0, #8]
	movs	r3, #0
	str	r3, [r0, #16]
	add	r3, r0, #324
	str	r3, [r0, #324]
	str	r3, [r0, #328]
.L196:
	pop	{r4, pc}
.L204:
	.align	2
.L203:
	.word	kmalloc_caches
	.word	.LANCHOR1
	.fnend
	.size	vrga_create_ctx, .-vrga_create_ctx
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_thread_fn, %function
vrga_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 344
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #396
	sub	sp, sp, #396
	ldr	r4, .L318
	movs	r5, #0
	mov	r6, r0
	movs	r2, #252
	mov	r1, r5
	str	r5, [sp, #132]
	ldr	r3, [r4]
	ldr	fp, .L318+12
	str	r3, [sp, #388]
	add	r3, r0, #12
	add	r0, sp, #136
	str	r3, [sp, #48]
	bl	memset
	ldr	r3, .L318+4
	mov	r1, #3520
	ldr	r0, [r3, #20]
	bl	kmem_cache_alloc
	ldr	r3, [r6, #12]
	ldr	r2, .L318+8
	movs	r1, #5
	str	r3, [sp, #8]
	ldr	r3, [r6, #56]
	str	r0, [sp, #124]
	mov	r0, r5
	str	r3, [sp, #4]
	movw	r3, #731
	str	r3, [sp]
	ldr	r3, .L318+12
	bl	vlog
	str	r4, [sp, #52]
.L206:
	bl	kthread_should_stop
	cbz	r0, .L229
	ldr	r0, [sp, #124]
	cbz	r0, .L230
	bl	kfree
.L230:
	ldr	r3, [sp, #52]
	movs	r0, #0
	ldr	r2, [sp, #388]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L231
	bl	__stack_chk_fail
.L229:
	ldr	r7, [r6, #8]
	cbz	r7, .L207
	movs	r0, #1
	bl	msleep
	b	.L206
.L319:
	.align	2
.L318:
	.word	__stack_chk_guard
	.word	kmalloc_caches
	.word	.LC28
	.word	.LANCHOR0+276
.L207:
	add	r0, r6, #188
	bl	down
	mov	r1, r7
	ldr	r0, [sp, #48]
	bl	mpi_dev_run_job
	mov	r4, r0
	cmp	r0, #0
	beq	.L206
	ldr	r8, [r0, #48]
	cmp	r8, #0
	beq	.L209
	ldr	r5, [r8, #288]
	cmp	r5, #0
	beq	.L209
	str	r0, [r5]
	add	r9, sp, #132
	ldr	r3, [r0, #48]
	mov	r1, #256
	ldr	r2, .L320
	mov	r0, r9
	ldr	r3, [r3]
	str	r3, [sp]
	ldr	r3, [r6, #56]
	bl	snprintf
	ldr	r1, [r8, #56]
	ldrd	r3, r2, [r4, #60]
	mov	r0, r7
	strd	r5, r1, [sp, #32]
	ldr	r1, [r5, #4]
	str	r1, [sp, #28]
	ldr	r1, [r2, #448]
	str	r1, [sp, #24]
	movs	r1, #5
	ldr	r2, [r2]
	str	r2, [sp, #20]
	ldr	r2, [r3, #448]
	str	r2, [sp, #16]
	ldr	r3, [r3]
	ldr	r2, .L320+4
	strd	r9, r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	mov	r3, #756
	str	r3, [sp]
	mov	r3, fp
	bl	vlog
	ldr	r3, [r5, #4]
	cmp	r3, #0
	bne	.L210
	ldrd	r2, r3, [r5, #8]
	cmp	r2, r3
	bne	.L211
.L214:
	ldrd	r2, r3, [r5, #16]
	cmp	r2, r3
	bne	.L212
.L213:
	ldr	r3, [r4, #48]
	ldr	r10, [sp, #112]
	cmp	r3, #0
	beq	.L215
	ldr	r9, [r3, #288]
	cmp	r9, #0
	beq	.L215
	ldr	r7, [r4, #60]
	cmp	r7, #0
	beq	.L215
	ldr	r2, [r4, #64]
	cmp	r2, #0
	beq	.L215
	ldr	r1, [r7, #448]
	ldr	r2, [r2, #448]
	ldr	r3, [r3, #56]
	str	r1, [sp, #100]
	movs	r1, #0
	str	r2, [sp, #108]
	str	r1, [sp, #104]
	str	r3, [sp, #128]
	cmp	r10, #0
	beq	.L216
	movs	r1, #5
	ldr	r0, [r9, #12]
	bl	__aeabi_uidivmod
	add	r1, r9, r1, lsl #5
	ldr	r3, [r1, #28]
	cmp	r3, #0
	beq	.L217
	ldrd	r2, r3, [r1, #32]
	cmp	r2, #0
	bne	.L218
	str	r3, [sp, #84]
	add	r0, sp, #68
	ldr	r3, [r1, #40]
	str	r3, [sp, #88]
	ldr	r3, [r1, #44]
	str	r3, [sp, #92]
	ldr	r3, [r1, #48]
	add	r1, sp, #84
	str	r3, [sp, #96]
	ldrd	r2, r3, [r7, #620]
	bl	crop_rect_ratio_to_abs
	ldr	r3, [sp, #112]
	ldr	ip, [sp, #68]
	ldrd	r0, r1, [sp, #72]
	ldr	r2, [sp, #80]
	str	ip, [r3]
	ldr	r3, [sp, #112]
	str	r0, [r3, #4]
	ldr	r3, [sp, #112]
	str	r1, [r3, #8]
	ldr	r3, [sp, #112]
.L310:
	str	r2, [r3, #12]
	ldr	r3, [sp, #112]
	ldr	r2, [r7, #628]
	str	r2, [r3, #20]
	ldr	r2, [r7, #632]
	str	r2, [r3, #24]
	ldr	r0, [r7, #640]
	bl	pixel_format_rk_to_rga
	ldr	r3, [sp, #112]
	str	r0, [r3, #16]
	ldr	r0, [r7, #648]
	bl	compress_mode_rk_to_rga
	movs	r1, #5
	ldr	r3, [sp, #112]
	str	r0, [r3, #28]
	movs	r0, #0
	ldr	r3, [r9, #12]
	adds	r3, r3, #1
	str	r3, [r9, #12]
	ldr	r3, [sp, #112]
	ldr	r2, [r3, #28]
	str	r2, [sp, #44]
	ldr	r2, [r3, #16]
	str	r2, [sp, #40]
	ldr	r2, [r3, #24]
	str	r2, [sp, #36]
	ldr	r2, [r3, #20]
	str	r2, [sp, #32]
	ldr	r2, [r3, #12]
	str	r2, [sp, #28]
	ldr	r2, [r3, #8]
	str	r2, [sp, #24]
	ldr	r2, [r3, #4]
	str	r2, [sp, #20]
	ldr	r3, [r3]
	ldr	r2, .L320+8
	str	r3, [sp, #16]
	ldr	r3, [sp, #128]
	str	r3, [sp, #12]
	ldr	r3, [r7, #448]
	str	r3, [sp, #8]
	ldr	r3, [r7]
	str	r3, [sp, #4]
	movw	r3, #611
	str	r3, [sp]
	ldr	r3, .L320+12
	bl	vlog
.L216:
	ldr	r2, [r4, #48]
	cmp	r2, #0
	beq	.L224
	ldr	r7, [r2, #288]
	cmp	r7, #0
	beq	.L224
	ldr	r3, [r4, #60]
	cmp	r3, #0
	beq	.L224
	ldr	r10, [r4, #64]
	cmp	r10, #0
	beq	.L224
	ldr	r1, [r3, #448]
	mov	r9, #0
	ldr	r2, [r2, #56]
	str	r3, [sp, #60]
	str	r1, [sp, #100]
	str	r2, [sp, #128]
	ldr	r1, [r10, #448]
	ldr	r2, [sp, #120]
	str	r9, [sp, #104]
	str	r1, [sp, #108]
	str	r2, [sp, #56]
	cmp	r2, #0
	beq	.L222
	ldr	r0, [r7, #20]
	movs	r1, #5
	bl	__aeabi_uidivmod
	movs	r0, #28
	ldr	r2, [sp, #56]
	mla	r1, r0, r1, r7
	str	r9, [r2]
	ldr	r2, [sp, #120]
	str	r9, [r2, #4]
	ldr	r2, [sp, #120]
	ldr	r0, [r1, #188]
	str	r0, [r2, #8]
	ldr	r2, [sp, #120]
	ldr	r0, [r1, #192]
	str	r0, [r2, #12]
	ldr	r2, [sp, #120]
	ldr	r0, [r1, #196]
	str	r0, [r2, #20]
	ldr	r2, [sp, #120]
	ldr	r0, [r1, #200]
	str	r0, [r2, #24]
	ldr	r0, [r1, #204]
	bl	pixel_format_rk_to_rga
	ldr	r2, [sp, #120]
	ldr	r3, [sp, #60]
	str	r0, [r2, #16]
	ldr	r0, [r3, #648]
	bl	compress_mode_rk_to_rga
	movs	r1, #5
	ldr	r3, [sp, #120]
	str	r0, [r3, #28]
	mov	r0, r9
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
	ldr	r3, [sp, #120]
	ldr	r2, [r3, #28]
	str	r2, [sp, #44]
	ldr	r2, [r3, #16]
	str	r2, [sp, #40]
	ldr	r2, [r3, #24]
	str	r2, [sp, #36]
	ldr	r2, [r3, #20]
	str	r2, [sp, #32]
	ldr	r2, [r3, #12]
	str	r2, [sp, #28]
	ldr	r2, [r3, #8]
	str	r2, [sp, #24]
	ldr	r2, [r3, #4]
	str	r2, [sp, #20]
	ldr	r3, [r3]
	ldr	r2, .L320+16
	str	r3, [sp, #16]
	ldr	r3, [sp, #128]
	str	r3, [sp, #12]
	ldr	r3, [r10, #448]
	str	r3, [sp, #8]
	ldr	r3, [r10]
	str	r3, [sp, #4]
	movw	r3, #669
	str	r3, [sp]
	ldr	r3, .L320+20
	bl	vlog
.L222:
	add	r0, sp, #100
	bl	rga_mpi_commit
	mov	r9, r0
	cmp	r0, #0
	bne	.L224
	ldrd	r3, r2, [r4, #60]
	ldr	r1, [r8, #56]
	str	r1, [sp, #28]
	ldr	r1, [r2, #448]
	str	r1, [sp, #24]
	movs	r1, #5
	ldr	r2, [r2]
	str	r2, [sp, #20]
	ldr	r2, [r3, #448]
	str	r2, [sp, #16]
	ldr	r3, [r3]
	ldr	r2, .L320+24
	str	r3, [sp, #12]
	add	r3, sp, #132
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movw	r3, #806
	str	r3, [sp]
	mov	r3, fp
	bl	vlog
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L234
	ldr	r8, [r4, #60]
	cmp	r8, #0
	beq	.L234
	ldr	r7, [r4, #64]
	cmp	r7, #0
	beq	.L234
	b	.L321
.L322:
	.align	2
.L320:
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LANCHOR0+291
	.word	.LC32
	.word	.LANCHOR0+317
	.word	.LC33
.L321:
	ldr	r3, [sp, #124]
	ldr	r2, [r3, #8]
	str	r2, [r7, #620]
	ldr	r2, [r3, #12]
	str	r2, [r7, #624]
	ldr	r2, [r3, #20]
	str	r2, [r7, #628]
	ldr	r2, [r3, #24]
	str	r2, [r7, #632]
	ldr	r0, [r3, #16]
	bl	pixel_format_rga_to_rk
	ldr	r3, [sp, #124]
	str	r0, [r7, #640]
	ldr	r0, [r3, #28]
	bl	compress_mode_rga_to_rk
	str	r0, [r7, #648]
	ldr	r2, [r8, #668]
	ldr	r3, [sp, #124]
	str	r2, [r7, #668]
	ldrd	r0, [r8, #672]
	strd	r0, [r7, #672]
	strd	r0, [sp, #40]
	movs	r1, #5
	str	r2, [sp, #36]
	mov	r0, r9
	ldr	r2, [r3, #28]
	str	r2, [sp, #32]
	ldr	r2, [r3, #16]
	str	r2, [sp, #28]
	ldr	r2, [r3, #24]
	str	r2, [sp, #24]
	ldr	r2, [r3, #20]
	str	r2, [sp, #20]
	ldr	r2, [r3, #12]
	str	r2, [sp, #16]
	ldr	r3, [r3, #8]
	ldr	r2, .L323
	str	r3, [sp, #12]
	ldr	r3, [r7, #448]
	str	r3, [sp, #8]
	ldr	r3, [r7]
	str	r3, [sp, #4]
	movw	r3, #709
	str	r3, [sp]
	ldr	r3, .L323+4
	bl	vlog
	ldr	r3, [r8, #16]
	ldr	r2, [r7, #16]
	movs	r1, #5
	mov	r0, r9
	strd	r3, r2, [sp, #4]
	movw	r3, #711
	ldr	r2, .L323+8
	str	r3, [sp]
	ldr	r3, .L323+4
	bl	vlog
.L225:
	ldr	r0, [sp, #112]
	cbz	r0, .L226
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #112]
.L226:
	ldr	r0, [sp, #120]
	cbz	r0, .L227
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #120]
.L227:
	cmp	r9, #-1
	beq	.L209
.L210:
	movs	r1, #0
	str	r1, [r5]
	ldr	r3, [r6, #176]
	adds	r3, r3, #1
	str	r3, [r6, #176]
.L313:
	mov	r0, r4
	bl	mpi_job_done
	b	.L206
.L211:
	ldr	r3, .L323+12
	mov	r1, #3520
	ldr	r0, [r3, #20]
	bl	kmem_cache_alloc
	str	r0, [sp, #112]
	cmp	r0, #0
	bne	.L214
.L209:
	movs	r3, #0
	mov	r1, #-1
	str	r3, [r5]
	b	.L313
.L212:
	ldr	r3, .L323+12
	mov	r1, #3520
	ldr	r0, [r3, #20]
	bl	kmem_cache_alloc
	mov	r7, r0
	str	r0, [sp, #120]
	cmp	r0, #0
	bne	.L213
	ldr	r0, [sp, #112]
	cmp	r0, #0
	beq	.L209
	bl	kfree
	str	r7, [sp, #112]
	b	.L209
.L218:
	str	r3, [r10]
	ldr	r3, [sp, #112]
	ldr	r2, [r1, #40]
	str	r2, [r3, #4]
	ldr	r3, [sp, #112]
	ldr	r2, [r1, #44]
	str	r2, [r3, #8]
	ldr	r3, [sp, #112]
	ldr	r2, [r1, #48]
	b	.L310
.L217:
	str	r3, [r10]
	ldr	r2, [sp, #112]
	str	r3, [r2, #4]
	ldr	r3, [sp, #112]
	ldr	r2, [r7, #620]
	str	r2, [r3, #8]
	ldr	r3, [sp, #112]
	ldr	r2, [r7, #624]
	b	.L310
.L215:
	cmp	r10, #0
	beq	.L228
	mov	r0, r10
.L316:
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #112]
	b	.L228
.L234:
	mov	r9, #-1
	b	.L225
.L224:
	ldr	r0, [sp, #112]
	cmp	r0, #0
	bne	.L316
.L228:
	ldr	r0, [sp, #120]
	cmp	r0, #0
	beq	.L209
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #120]
	b	.L209
.L231:
	add	sp, sp, #396
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L324:
	.align	2
.L323:
	.word	.LC34
	.word	.LANCHOR0+343
	.word	.LC35
	.word	kmalloc_caches
	.fnend
	.size	vrga_thread_fn, .-vrga_thread_fn
	.align	1
	.global	vrga_user_request
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_user_request, %function
vrga_user_request:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r0
	ldr	r0, .L331
	mov	r6, r1
	bl	mpi_dev_request_job
	mov	r4, r0
	cbz	r0, .L325
	ldr	r3, [r0, #12]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L327
	bl	mpi_obj_unref
	movs	r4, #0
.L325:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L327:
	strd	r5, r6, [r0, #60]
	movs	r1, #5
	ldr	r3, [r6]
	ldr	r2, .L331+4
	str	r3, [sp, #12]
	ldr	r3, [r5]
	str	r3, [sp, #8]
	ldr	r3, [r0]
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #1023
	str	r3, [sp]
	ldr	r3, .L331+8
	bl	vlog
	mov	r0, r4
	bl	mpi_job_set_ready
	mov	r0, r4
	bl	mpi_obj_ref
	b	.L325
.L332:
	.align	2
.L331:
	.word	.LANCHOR1+12
	.word	.LC36
	.word	.LANCHOR0+367
	.fnend
	.size	vrga_user_request, .-vrga_user_request
	.align	1
	.global	vrga_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_probe, %function
vrga_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r2, #460
	ldr	r4, .L335
	mov	r6, r0
	movs	r1, #0
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	mov	r0, r6
	bl	kstrdup
	movs	r3, #1
	str	r3, [r4, #4]
	mov	r2, #-1
	ldr	r3, .L335+4
	mov	r1, r4
	str	r3, [r4, #180]
	movs	r3, #21
	str	r3, [r4, #184]
	ldr	r3, .L335+8
	str	r0, [r4]
	ldr	r0, .L335+12
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L334
	bl	wake_up_process
.L334:
	movs	r3, #0
	str	r3, [r4, #188]
	ldr	r3, .L335+16
	mov	r2, r6
	str	r5, [r4, #200]
	movs	r1, #8
	ldr	r5, .L335+20
	str	r3, [r4, #80]
	ldr	r3, .L335+24
	sub	r0, r5, #180
	strd	r5, r5, [r4, #192]
	str	r4, [r4, #172]
	str	r3, [r4, #88]
	ldr	r3, .L335+28
	str	r3, [r4, #92]
	bl	mpi_dev_register
	sub	r0, r5, #180
	ldr	r1, .L335+32
	pop	{r4, r5, r6, lr}
	b	mpi_sysfs_dev_add
.L336:
	.align	2
.L335:
	.word	.LANCHOR1
	.word	.LANCHOR0+388
	.word	.LC3
	.word	vrga_thread_fn
	.word	vrga_create_ctx
	.word	.LANCHOR1+192
	.word	vrga_destroy_ctx
	.word	vrga_handle_message
	.word	.LANCHOR0+808
	.fnend
	.size	vrga_probe, .-vrga_probe
	.align	1
	.global	vrga_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_shutdown, %function
vrga_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L338
	ldr	r0, [r4, #200]
	str	r3, [r4, #8]
	bl	kthread_stop
	ldr	r0, [r4], #12
	bl	kfree
	mov	r0, r4
	pop	{r4, lr}
	b	mpi_dev_unregister
.L339:
	.align	2
.L338:
	.word	.LANCHOR1
	.fnend
	.size	vrga_shutdown, .-vrga_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vrga_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_init, %function
vrga_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L341
	bl	vrga_probe
	movs	r0, #0
	pop	{r3, pc}
.L342:
	.align	2
.L341:
	.word	.LC3
	.fnend
	.size	vrga_init, .-vrga_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vrga_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_exit, %function
vrga_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vrga_shutdown
	.fnend
	.size	vrga_exit, .-vrga_exit
	.global	g_vrga_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.37028, %object
	.size	__func__.37028, 17
__func__.37028:
	.ascii	"vrga_node_create\000"
	.type	__func__.37089, %object
	.size	__func__.37089, 12
__func__.37089:
	.ascii	"vrga_mb_get\000"
	.type	__func__.37133, %object
	.size	__func__.37133, 19
__func__.37133:
	.ascii	"vrga_node_set_crop\000"
	.type	__func__.37154, %object
	.size	__func__.37154, 20
__func__.37154:
	.ascii	"vrga_node_set_scale\000"
	.type	__func__.37098, %object
	.size	__func__.37098, 16
__func__.37098:
	.ascii	"vrga_mb_release\000"
	.type	__func__.37111, %object
	.size	__func__.37111, 13
__func__.37111:
	.ascii	"vrga_mb_send\000"
	.type	__func__.37214, %object
	.size	__func__.37214, 10
__func__.37214:
	.ascii	"vrga_open\000"
	.type	__func__.37198, %object
	.size	__func__.37198, 11
__func__.37198:
	.ascii	"vrga_ioctl\000"
	.type	__func__.37357, %object
	.size	__func__.37357, 25
__func__.37357:
	.ascii	"vrga_handle_node_message\000"
	.type	__func__.37321, %object
	.size	__func__.37321, 13
__func__.37321:
	.ascii	"vrga_new_job\000"
	.type	__func__.37016, %object
	.size	__func__.37016, 13
__func__.37016:
	.ascii	"vrga_version\000"
	.type	__func__.37124, %object
	.size	__func__.37124, 21
__func__.37124:
	.ascii	"vrga_node_set_bypass\000"
	.type	__func__.37174, %object
	.size	__func__.37174, 25
__func__.37174:
	.ascii	"vrga_node_frame_rate_ctl\000"
	.type	__func__.37071, %object
	.size	__func__.37071, 16
__func__.37071:
	.ascii	"vrga_node_start\000"
	.type	__func__.37079, %object
	.size	__func__.37079, 15
__func__.37079:
	.ascii	"vrga_node_stop\000"
	.type	__func__.37251, %object
	.size	__func__.37251, 13
__func__.37251:
	.ascii	"vrga_release\000"
	.type	__func__.37041, %object
	.size	__func__.37041, 17
__func__.37041:
	.ascii	"vrga_node_delete\000"
	.type	__func__.37301, %object
	.size	__func__.37301, 15
__func__.37301:
	.ascii	"vrga_thread_fn\000"
	.type	__func__.37263, %object
	.size	__func__.37263, 26
__func__.37263:
	.ascii	"vrga_set_rga_job_src_info\000"
	.type	__func__.37273, %object
	.size	__func__.37273, 26
__func__.37273:
	.ascii	"vrga_set_rga_job_dst_info\000"
	.type	__func__.37281, %object
	.size	__func__.37281, 24
__func__.37281:
	.ascii	"vrga_set_dst_frame_info\000"
	.type	__func__.37387, %object
	.size	__func__.37387, 18
__func__.37387:
	.ascii	"vrga_user_request\000"
	.space	3
	.type	vrga_ioctls, %object
	.size	vrga_ioctls, 420
vrga_ioctls:
	.word	-1068731904
	.word	0
	.word	vrga_version
	.word	.LC37
	.word	0
	.word	-1071615487
	.word	0
	.word	vrga_node_create
	.word	.LC38
	.word	0
	.word	-1071615486
	.word	0
	.word	vrga_node_delete
	.word	.LC39
	.word	0
	.word	-1071615485
	.word	0
	.word	vrga_node_get_status
	.word	.LC40
	.word	0
	.word	-1071615484
	.word	0
	.word	vrga_node_start
	.word	.LC41
	.word	0
	.word	-1071615483
	.word	0
	.word	vrga_node_stop
	.word	.LC42
	.word	0
	.word	-1066896890
	.word	16
	.word	vrga_mb_get
	.word	.LC43
	.word	0
	.word	-1066896889
	.word	0
	.word	vrga_mb_send
	.word	.LC44
	.word	0
	.word	-1066896888
	.word	0
	.word	vrga_mb_release
	.word	.LC45
	.word	0
	.word	-1071615479
	.word	0
	.word	vrga_node_set_bypass
	.word	.LC46
	.word	0
	.space	120
	.word	-1071615472
	.word	0
	.word	vrga_node_set_crop
	.word	.LC47
	.word	0
	.word	-1071615471
	.word	0
	.word	vrga_node_frame_rate_ctl
	.word	.LC48
	.word	0
	.space	40
	.word	-1071877612
	.word	0
	.word	vrga_node_set_scale
	.word	.LC49
	.word	0
	.type	vrga_driver_fops, %object
	.size	vrga_driver_fops, 128
vrga_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	vrga_ioctl
	.word	vrga_compat_ioctl
	.word	0
	.space	4
	.word	vrga_open
	.space	4
	.word	vrga_release
	.space	60
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	g_vrga_dev, %object
	.size	g_vrga_dev, 460
g_vrga_dev:
	.space	460
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct vrga_node_info mismatching\033[0m\000"
.LC1:
	.ascii	"valloc\000"
.LC2:
	.ascii	"\033[1;32mRGA %d(%d) node create success!\033[0m\000"
.LC3:
	.ascii	"vrga\000"
.LC4:
	.ascii	"\033[1;32mRGA %d(%d) create MB_SOURCE_PRIVATE succe"
	.ascii	"ss! pool %p pool_id %d bufffer_cnt %d bufffer_size "
	.ascii	"%d\033[0m\000"
.LC5:
	.ascii	"\033[1;32mRGA %d(%d) node create done!\033[0m\000"
.LC6:
	.ascii	"\033[1;31mstruct vrga_buff_info mismatching\033[0m\000"
.LC7:
	.ascii	"\033[1;31mstruct vrga_crop_info mismatching\033[0m\000"
.LC8:
	.ascii	"\033[1;31mnot found vrga_node\033[0m\000"
.LC9:
	.ascii	"\033[1;31mexceed max rga buf cnt(0x%x-0x%x)\033[0m\000"
.LC10:
	.ascii	"\033[1;32mRGA %d(%d) node enable(%d), ration(0)/abs"
	.ascii	"(1)(%d), x(%d), y(%d), w(%d), h(%d), s/g(0x%x-0x%x)"
	.ascii	"\033[0m\000"
.LC11:
	.ascii	"\033[1;31mstruct vrga_scale_info mismatching\033[0m"
	.ascii	"\000"
.LC12:
	.ascii	"\033[1;32mRGA %d(%d) node w(%d), h(%d), vw(%d), vh("
	.ascii	"%d), fmt(%d), s/g(0x%x-0x%x)\033[0m\000"
.LC13:
	.ascii	"RGA %d(%d) node release mpi_buf(%p), dma_buf(%p), b"
	.ascii	"uf_id(%ld), buf_refcnt(%d).\000"
.LC14:
	.ascii	"\033[1;31mbuf null\033[0m\000"
.LC15:
	.ascii	"\033[1;31merror cannot find mpi_buf fr fd %d\033[0m"
	.ascii	"\000"
.LC16:
	.ascii	"vrga-fr-user\000"
.LC17:
	.ascii	"RGA %d(%d) node mpi_buf(%p), buf_id(%d), buf_refcnt"
	.ascii	"(%d), dma_buf(%p), fd(%d).\000"
.LC18:
	.ascii	"\033[1;32m--------- vrga open ----------\033[0m\000"
.LC19:
	.ascii	"\033[1;31mvrga: error vrga ioctl\033[0m\000"
.LC20:
	.ascii	"vrga(%s-%d) buf(%d) ready\000"
.LC21:
	.ascii	"vrga job(%d) ready for (%s-%d) buf(%d->%d)\000"
.LC22:
	.ascii	"vrga(%s-%d) drop job(%d)->refcnt(%d), src_buf(%d)->"
	.ascii	"refcnt(%d)\000"
.LC23:
	.ascii	"\033[1;31mstruct vrga_version mismatching\033[0m\000"
.LC24:
	.ascii	"\033[1;32mRGA %d(%d) node start done!\033[0m\000"
.LC25:
	.ascii	"\033[1;32mRGA %d(%d) node stop done!\033[0m\000"
.LC26:
	.ascii	"\033[1;32m--------- vrga release ----------\033[0m\000"
.LC27:
	.ascii	"\033[1;32mRGA %d(%d) node destroy done!\033[0m\000"
.LC28:
	.ascii	"dev(%s-%d) register ok\000"
.LC29:
	.ascii	"%s-%d\000"
.LC30:
	.ascii	"vrga job(%d) run for (%s) buf(%d: %p->%d: %p), vctx"
	.ascii	"(%d: %p), nick_id(%d)\000"
.LC31:
	.ascii	"src buf(%d: %p), rga: ctx_id(%d), x(%d), y(%d), w(%"
	.ascii	"d), h(%d), vw(%d), vh(%d), pf(0x%x), cp(%d)\000"
.LC32:
	.ascii	"dst buf(%d: %p), rga: ctx_id(%d), x(%d), y(%d), w(%"
	.ascii	"d), h(%d), vw(%d), vh(%d), pf(0x%x), cp(%d)\000"
.LC33:
	.ascii	"vrga job(%d) done for (%s) buf(%d: %p->%d: %p), nic"
	.ascii	"k_id(%d)\000"
.LC34:
	.ascii	"dst buf(%d: %p), rga: w(%d), h(%d), vw(%d), vh(%d),"
	.ascii	" pf(0x%x), cp(%d), seq(%d), pts(%lld)\000"
.LC35:
	.ascii	"src_ref(%d), dst_ref(%d)\000"
.LC36:
	.ascii	"vrga job(%d) ready for user, buf(%d->%d)\000"
.LC37:
	.ascii	"VRGA_IOCTL_VERSION\000"
.LC38:
	.ascii	"VRGA_IOCTL_NODE_CREATE\000"
.LC39:
	.ascii	"VRGA_IOCTL_NODE_DELETE\000"
.LC40:
	.ascii	"VRGA_IOCTL_NODE_GET_STATUS\000"
.LC41:
	.ascii	"VRGA_IOCTL_NODE_START\000"
.LC42:
	.ascii	"VRGA_IOCTL_NODE_STOP\000"
.LC43:
	.ascii	"VRGA_IOCTL_MB_GET\000"
.LC44:
	.ascii	"VRGA_IOCTL_MB_SEND\000"
.LC45:
	.ascii	"VRGA_IOCTL_MB_RELEASE\000"
.LC46:
	.ascii	"VRGA_IOCTL_SET_BYPASS\000"
.LC47:
	.ascii	"VRGA_IOCTL_SET_CROP\000"
.LC48:
	.ascii	"VRGA_IOCTL_FRAME_RATE_CTL\000"
.LC49:
	.ascii	"VRGA_IOCTL_SET_SCALE\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
