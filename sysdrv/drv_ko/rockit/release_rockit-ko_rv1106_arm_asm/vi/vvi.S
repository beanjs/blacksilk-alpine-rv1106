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
	.file	"vvi.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rockit_get_tb_stream_info:					
	.asciz 	"rockit_get_tb_stream_info"					
__kstrtabns_rockit_get_tb_stream_info:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rockit_free_tb_stream_buf:					
	.asciz 	"rockit_free_tb_stream_buf"					
__kstrtabns_rockit_free_tb_stream_buf:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_compat_ioctl, %function
vi_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vi_compat_ioctl, .-vi_compat_ioctl
	.align	1
	.global	vvi_get_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_get_version, %function
vvi_get_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r1
	ldr	r5, [r0, #128]
	movs	r2, #124
	movs	r1, #0
	mov	r0, r4
	ldr	r6, [r5, #160]
	bl	memset
	ldr	r3, [r6, #224]
	str	r3, [r4]	@ unaligned
	ldr	r3, [r5]
	movs	r5, #0
	strb	r5, [r4, #8]
	strb	r5, [r4, #9]
	str	r3, [r4, #4]	@ unaligned
	strb	r5, [r4, #10]
	strb	r5, [r4, #11]
	ldr	r0, [r6]
	bl	strlen
	movs	r3, #20
	strb	r5, [r4, #53]
	strb	r3, [r4, #52]
	movs	r3, #17
	strb	r5, [r4, #54]
	strb	r5, [r4, #55]
	strb	r3, [r4, #88]
	strb	r5, [r4, #89]
	strb	r5, [r4, #90]
	strb	r5, [r4, #91]
	cmp	r0, #31
	str	r0, [r4, #12]	@ unaligned
	bls	.L3
	movs	r3, #31
	strb	r5, [r4, #13]
	strb	r3, [r4, #12]
	strb	r5, [r4, #14]
	strb	r5, [r4, #15]
.L3:
	ldr	r2, [r4, #12]	@ unaligned
	add	r0, r4, #16
	ldr	r1, [r6]
	bl	strncpy
	ldr	r2, [r4, #52]	@ unaligned
	ldr	r1, .L4
	add	r0, r4, #56
	bl	strncpy
	ldr	r2, [r4, #88]	@ unaligned
	ldr	r1, .L4+4
	add	r0, r4, #92
	bl	strncpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L5:
	.align	2
.L4:
	.word	.LC0
	.word	.LC1
	.fnend
	.size	vvi_get_version, .-vvi_get_version
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_new_wrap_line, %function
get_new_wrap_line:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	mov	r7, r0
	mov	r1, r0
	.pad #24
	sub	sp, sp, #24
	mov	r8, r2
	mul	r0, r3, r2
	mov	r6, r3
	bl	__aeabi_uidiv
	movs	r3, #252
	ldr	r2, .L13
	movs	r1, #4
	mov	r4, r0
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r0, #8
	strd	r5, r8, [sp, #16]
	strd	r6, r7, [sp, #8]
	ldr	r3, .L13+4
	bl	vlog
	cmp	r4, r5
	bcs	.L9
.L8:
	mov	r1, r4
	mov	r0, r5
	bl	__aeabi_uidivmod
	and	r3, r4, #1
	orrs	r3, r1, r3
	beq	.L6
	subs	r4, r4, #1
	b	.L8
.L9:
	mov	r4, r5
.L6:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L14:
	.align	2
.L13:
	.word	.LC2
	.word	.LANCHOR0
	.fnend
	.size	get_new_wrap_line, .-get_new_wrap_line
	.align	1
	.global	vvi_node_set_dev_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_dev_status, %function
vvi_node_set_dev_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	ldr	r3, [r1, #200]	@ unaligned
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #216
	ldr	r2, [r0, #128]
	beq	.L16
	mov	r3, #580
	ldr	r2, .L25
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L25+4
	movs	r0, #8
	bl	vlog
.L23:
	mov	r4, #-1
	b	.L15
.L16:
	adds	r0, r4, #1
	bne	.L18
	ldr	r5, [r1, #4]	@ unaligned
	cmp	r5, #2
	bls	.L19
	movs	r3, #3
	strd	r5, r3, [sp, #4]
	movw	r3, #586
.L24:
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L25+4
	movs	r0, #8
	ldr	r2, .L25+8
	bl	vlog
.L15:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L19:
	ldr	r0, [r1, #8]	@ unaligned
	cmp	r0, #5
	bls	.L20
	movs	r3, #6
	strd	r5, r3, [sp, #4]
	movw	r3, #591
	b	.L24
.L20:
	mov	r4, #1296
	ldr	r6, [r1, #204]	@ unaligned
	muls	r4, r5, r4
	mla	r4, r3, r0, r4
	add	r4, r4, r2
	str	r6, [r4, #1060]
	ldr	r3, [r1, #196]	@ unaligned
	str	r3, [r4, #1052]
.L22:
	movs	r4, #0
	b	.L15
.L18:
	cmp	r4, #2
	bls	.L21
	movs	r3, #3
	ldr	r2, .L25+12
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #598
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L25+4
	bl	vlog
	b	.L23
.L21:
	mla	r4, r3, r4, r2
	ldr	r1, [r1, #204]	@ unaligned
	str	r1, [r4, #412]
	b	.L22
.L26:
	.align	2
.L25:
	.word	.LC3
	.word	.LANCHOR0+18
	.word	.LC4
	.word	.LC5
	.fnend
	.size	vvi_node_set_dev_status, .-vvi_node_set_dev_status
	.align	1
	.global	vvi_node_get_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_status, %function
vvi_node_get_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r1
	ldr	r3, [r1, #16]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	cmp	r3, #136
	beq	.L28
	movw	r3, #349
	ldr	r2, .L34
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L34+4
	movs	r0, #8
	bl	vlog
.L33:
	mov	r0, #-1
	b	.L27
.L28:
	mov	r3, #352
	ldr	r2, .L34+8
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L34+4
	movs	r0, #8
	bl	vlog
	ldr	r2, [r7, #4]	@ unaligned
	ldr	r1, [r7]	@ unaligned
	movs	r0, #8
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L33
	ldr	r4, [r0, #60]
	movs	r1, #5
	ldr	r2, .L34+12
	movs	r0, #8
	ldr	r8, .L34+4
	movs	r6, #0
	ldr	r3, [r4]
	ldr	r9, .L34+20
	str	r3, [sp, #4]
	movw	r3, #357
	str	r3, [sp]
	ldr	r3, .L34+4
	bl	vlog
	ldr	r3, [r4, #76]!
	ldr	r5, [r3], #-36
	subs	r5, r5, #36
.L30:
	add	r2, r3, #36
	cmp	r2, r4
	bne	.L32
	movw	r3, #367
	ldr	r2, .L34+16
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L34+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
.L27:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L32:
	ldr	r2, [r3, #16]
	cmp	r6, #7
	it	le
	addle	r1, r7, r6, lsl #2
	mov	r0, #8
	itt	le
	addle	r6, r6, #1
	strle	r2, [r1, #20]	@ unaligned
	movs	r1, #5
	strd	r3, r2, [sp, #4]
	mov	r3, #364
	mov	r2, r9
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
	ldr	r2, [r5, #36]
	mov	r3, r5
	sub	r5, r2, #36
	b	.L30
.L35:
	.align	2
.L34:
	.word	.LC6
	.word	.LANCHOR0+42
	.word	.LC7
	.word	.LC8
	.word	.LC10
	.word	.LC9
	.fnend
	.size	vvi_node_get_status, .-vvi_node_get_status
	.align	1
	.global	vvi_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_start, %function
vvi_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r0, #128]
	ldr	r5, [r3, #160]
	ldr	r3, [r1, #24]	@ unaligned
	cmp	r3, #196
	beq	.L37
	mov	r3, #280
	ldr	r2, .L51
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L51+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L36:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L37:
	ldr	r2, [r1, #8]	@ unaligned
	movs	r0, #8
	ldr	r1, [r1]	@ unaligned
	bl	vsys_get_node_from_map
	ldr	r3, [r4, #52]	@ unaligned
	lsls	r3, r3, #29
	mov	r7, r0
	bpl	.L39
	ldr	r3, [r4, #48]	@ unaligned
	str	r3, [r5, #236]
	ldr	r8, [r4, #28]	@ unaligned
	ldr	r6, [r4, #48]	@ unaligned
	mov	r0, r8
	mov	r1, r6
	bl	__aeabi_uidivmod
	cbz	r1, .L40
	mov	r3, r6
	ldr	r2, [r4, #12]	@ unaligned
	mov	r1, r8
	ldr	r0, [r4, #20]	@ unaligned
	bl	get_new_wrap_line
	mov	r6, r0
.L40:
	bl	mcu_wrap_end
	mov	r0, r6
	bl	mcu_set_wrap_line
	movs	r1, #0
	ldr	r0, [r4, #28]	@ unaligned
	bl	mcu_wrap_config
	movs	r3, #1
	str	r3, [r5, #228]
	ldr	r3, [r4, #48]	@ unaligned
	str	r3, [r5, #232]
.L39:
	movs	r3, #1
	str	r3, [r5, #4]
	cbz	r7, .L41
	ldr	r2, .L51+8
	movs	r1, #5
	movw	r3, #301
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L51+4
	bl	vlog
	mov	r0, r7
	bl	mpi_node_streamon
	movw	r3, #303
	ldr	r2, .L51+12
	movs	r1, #5
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L51+4
	bl	vlog
.L41:
	mov	r3, #306
	ldr	r2, .L51+16
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L51+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
	b	.L36
.L52:
	.align	2
.L51:
	.word	.LC11
	.word	.LANCHOR0+62
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.fnend
	.size	vvi_node_start, .-vvi_node_start
	.align	1
	.global	vvi_node_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stop, %function
vvi_node_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1, #24]	@ unaligned
	ldr	r5, [r0, #128]
	cmp	r3, #196
	beq	.L54
	mov	r3, #318
	ldr	r2, .L64
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L64+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L53:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L54:
	ldr	r2, [r1, #8]	@ unaligned
	movs	r0, #8
	ldr	r1, [r1]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbz	r0, .L56
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #4
	ldr	r2, .L64+8
	movs	r0, #8
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #324
	str	r3, [sp]
	ldr	r3, .L64+4
	bl	vlog
	movs	r1, #1
	mov	r0, r6
	bl	mpi_node_flush
	movs	r1, #0
	str	r1, [r5, #-28]
	mov	r2, #1296
	ldr	r0, [r4]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	muls	r2, r0, r2
	movs	r0, #216
	mla	r3, r0, r3, r2
	add	r3, r3, r5
	str	r1, [r3, #1052]
.L56:
	ldr	r0, [r5, #196]
	cmp	r0, #0
	beq	.L53
	ldr	r4, [r4, #8]	@ unaligned
	cbnz	r4, .L57
	strd	r4, r4, [r5, #196]
	bl	mcu_wrap_end
	movs	r0, #10
	bl	msleep
.L57:
	movs	r0, #0
	b	.L53
.L65:
	.align	2
.L64:
	.word	.LC11
	.word	.LANCHOR0+77
	.word	.LC15
	.fnend
	.size	vvi_node_stop, .-vvi_node_stop
	.align	1
	.global	vvi_mb_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_mb_get, %function
vvi_mb_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r3, [r1, #16]	@ unaligned
	.pad #36
	sub	sp, sp, #36
	ldr	r6, [r0, #128]
	cmp	r3, #136
	beq	.L67
	mov	r3, #408
	ldr	r2, .L77
	str	r3, [sp]
	ldr	r3, .L77+4
.L76:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L75:
	mov	r0, #-1
.L66:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L67:
	ldr	r3, [r6, #196]
	ldr	r2, [r1, #4]	@ unaligned
	cbz	r3, .L69
	cbnz	r2, .L69
	movw	r3, #413
	ldr	r2, .L77+8
	str	r3, [sp]
	ldr	r3, .L77+4
	b	.L76
.L69:
	ldr	r1, [r4]	@ unaligned
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L70
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L77+12
	movs	r0, #8
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #419
	str	r3, [sp]
	ldr	r3, .L77+4
	bl	vlog
	b	.L75
.L70:
	ldr	r3, [r4, #12]	@ unaligned
	str	r3, [r0, #384]
	bl	mpi_node_pick_out_buffer
	mov	r5, r0
	cbnz	r0, .L71
	ldr	r3, [r4, #12]	@ unaligned
	movs	r1, #2
	ldr	r2, .L77+16
	movs	r0, #8
	str	r3, [sp, #4]
	movw	r3, #425
	str	r3, [sp]
	ldr	r3, .L77+4
	bl	vlog
	b	.L75
.L71:
	ldr	r2, [r7, #76]
	movw	lr, #4748
	ldr	r7, [r4]	@ unaligned
	ldr	r3, [r4, #4]	@ unaligned
	add	r1, r0, r2, lsl #3
	movs	r0, #6
	muls	r0, r7, r0
	add	r2, r5, r2, lsl #3
	add	r1, r1, #308
	adds	r7, r3, r0
	addw	r3, r3, #597
	add	r3, r3, r0
	add	r0, r4, #56
	add	r7, r6, r7, lsl #3
	subs	r6, r6, #32
	add	r6, r6, r3, lsl #3
	ldr	ip, [r7, lr]
	str	r1, [r7, lr]
	strd	r6, ip, [r2, #308]
	movs	r2, #80
	str	r1, [ip]
	add	r1, r5, #616
	ldr	r3, [r5, #448]
	ldr	r3, [r3]
	str	r3, [r4, #52]	@ unaligned
	bl	memcpy
	ldr	r1, [r4, #112]	@ unaligned
	ldr	r2, [r4, #116]	@ unaligned
	movs	r0, #8
	ldr	r3, [r5]
	str	r3, [r4, #8]	@ unaligned
	strd	r1, r2, [sp, #16]
	movs	r1, #5
	ldr	r2, [r4, #108]	@ unaligned
	str	r5, [sp, #4]
	strd	r3, r2, [sp, #8]
	movw	r3, #435
	ldr	r2, .L77+20
	str	r3, [sp]
	ldr	r3, .L77+4
	bl	vlog
	ldrd	r2, [r5, #672]
	movs	r1, #5
	movs	r0, #8
	strd	r2, [sp, #24]
	ldr	r3, [r5, #624]
	ldr	r2, .L77+24
	str	r3, [sp, #16]
	ldr	r3, [r5, #620]
	str	r3, [sp, #12]
	ldr	r3, [r5, #448]
	ldr	r3, [r3]
	str	r3, [sp, #8]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #439
	str	r3, [sp]
	ldr	r3, .L77+4
	bl	vlog
	movs	r0, #0
	b	.L66
.L78:
	.align	2
.L77:
	.word	.LC6
	.word	.LANCHOR0+91
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.fnend
	.size	vvi_mb_get, .-vvi_mb_get
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_release, %function
vi_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r5, [r1, #128]
	mov	r0, r5
	bl	mpi_obj_unref
	ldr	r3, [r5, #16]
	cmp	r3, #1
	bne	.L80
	mov	r10, r5
	ldr	r1, .L103
	ldr	r2, [r10], #208
	add	r9, r5, #4736
	ldr	r0, .L103+4
	add	r9, r9, #8
	bl	printk
	mov	r8, #0
	add	r3, r5, #856
	str	r3, [sp, #24]
.L90:
	movs	r2, #216
	movs	r1, #0
	mov	r0, r10
	sub	fp, r9, #4736
	bl	memset
	sub	fp, fp, #8
	movs	r7, #0
	ldr	r3, [sp, #24]
	str	r3, [sp, #16]
.L83:
	ldr	r3, [sp, #16]
	cbz	r3, .L81
	movs	r2, #216
	movs	r1, #0
	mov	r0, r3
	bl	memset
.L81:
	mov	r2, r7
	mov	r1, r8
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbnz	r0, .L82
.L89:
	adds	r7, r7, #1
	ldr	r3, [sp, #16]
	cmp	r7, #6
	add	fp, fp, #8
	add	r3, r3, #216
	str	r3, [sp, #16]
	bne	.L83
	add	r8, r8, #1
	ldr	r3, [sp, #24]
	cmp	r8, #3
	add	r10, r10, #216
	add	r3, r3, #1296
	add	r9, r9, #48
	str	r3, [sp, #24]
	bne	.L90
	movs	r3, #0
	strd	r3, r3, [r5, #196]
.L80:
	movs	r0, #0
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L82:
	ldr	r4, [r0, #60]
	mov	r2, r7
	mov	r1, r8
	movs	r0, #8
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
	cbz	r4, .L85
	movs	r1, #1
	mov	r0, r4
	bl	mpi_buf_pool_destroy
.L85:
	movw	r3, #837
	ldr	r2, .L103+8
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L103
	movs	r0, #8
	strd	r8, r7, [sp, #4]
	bl	vlog
	ldr	r2, [r6, #76]
	ldr	r4, [r9, r7, lsl #3]
	mvn	r3, #43
	add	r1, r2, #33
	sub	r3, r3, r1, lsl #3
	add	r4, r4, r3
	add	r2, r4, r2, lsl #3
	ldr	r2, [r2, #308]
	adds	r3, r2, r3
	str	r3, [sp, #20]
	add	r3, fp, #4736
	adds	r3, r3, #8
	str	r3, [sp, #28]
.L86:
	ldr	r3, [r6, #76]
	ldr	r2, [sp, #28]
	add	r3, r4, r3, lsl #3
	add	r3, r3, #308
	cmp	r3, r2
	beq	.L89
	cbz	r4, .L87
	ldr	r3, [r4]
	movs	r1, #4
	ldr	r2, .L103+12
	movs	r0, #8
	str	r3, [sp, #4]
	mov	r3, #840
	str	r3, [sp]
	ldr	r3, .L103
	bl	vlog
	ldr	r3, [r6, #76]
	mov	r0, r4
	add	r3, r4, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #308]
	bl	mpi_obj_unref
.L87:
	ldr	r3, [r6, #76]
	ldr	r2, [sp, #20]
	add	r1, r3, #33
	ldr	r4, [sp, #20]
	add	r3, r2, r3, lsl #3
	mvn	r2, #43
	sub	r2, r2, r1, lsl #3
	ldr	r3, [r3, #308]
	add	r3, r3, r2
	str	r3, [sp, #20]
	b	.L86
.L104:
	.align	2
.L103:
	.word	.LANCHOR0+102
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.fnend
	.size	vi_release, .-vi_release
	.align	1
	.global	vvi_node_get_dev_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_dev_status, %function
vvi_node_get_dev_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r1
	ldr	r3, [r1, #200]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #216
	ldr	r7, [r1, #4]	@ unaligned
	ldr	r6, [r1, #8]	@ unaligned
	ldr	r9, [r0, #128]
	beq	.L106
	movw	r3, #615
	ldr	r2, .L125
	str	r3, [sp]
	ldr	r3, .L125+4
.L124:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L122:
	mov	r4, #-1
	b	.L105
.L106:
	ldr	r3, .L125+8
	ldr	r3, [r3]
	cbnz	r3, .L117
.L109:
	adds	r3, r4, #1
	bne	.L113
	cmp	r7, #2
	bls	.L114
	movs	r3, #3
	strd	r7, r3, [sp, #4]
	mov	r3, #636
.L123:
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L125+4
	movs	r0, #8
	ldr	r2, .L125+12
	bl	vlog
.L105:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L111:
	bl	mcu_get_wrap_status
	cbnz	r0, .L110
	movs	r0, #10
	bl	msleep
.L108:
	adds	r8, r8, #-1
	bcs	.L111
.L112:
	movw	r3, #629
	ldr	r2, .L125+16
	str	r3, [sp]
	ldr	r3, .L125+4
	b	.L124
.L117:
	mov	r8, #50
	b	.L108
.L110:
	cmp	r8, #0
	bne	.L109
	b	.L112
.L114:
	cmp	r6, #5
	bls	.L115
	movs	r3, #6
	strd	r7, r3, [sp, #4]
	movw	r3, #641
	b	.L123
.L115:
	mov	r3, #1296
	movs	r4, #216
	muls	r7, r3, r7
	mla	r6, r4, r6, r7
	add	r6, r6, r9
	ldr	r3, [r6, #1060]
	str	r3, [r5, #204]	@ unaligned
	ldr	r3, [r6, #1052]
	str	r3, [r5, #196]	@ unaligned
.L121:
	movs	r4, #0
	b	.L105
.L113:
	cmp	r4, #2
	bls	.L116
	movs	r3, #3
	ldr	r2, .L125+20
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	mov	r3, #648
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L125+4
	bl	vlog
	b	.L122
.L116:
	movs	r3, #216
	mla	r4, r3, r4, r9
	ldr	r3, [r4, #412]
	str	r3, [r5, #204]	@ unaligned
	b	.L121
.L126:
	.align	2
.L125:
	.word	.LC3
	.word	.LANCHOR0+113
	.word	.LANCHOR1
	.word	.LC4
	.word	.LC24
	.word	.LC5
	.fnend
	.size	vvi_node_get_dev_status, .-vvi_node_get_dev_status
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_open, %function
vi_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	movs	r3, #15
	ldr	r0, .L128
	str	r0, [r1, #128]
	str	r3, [r0, #-4]
	bl	mpi_obj_ref
	mov	r3, #808
	ldr	r2, .L128+4
	movs	r1, #4
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L128+8
	bl	vlog
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L129:
	.align	2
.L128:
	.word	g_vvi_dev+32
	.word	.LC25
	.word	.LANCHOR0+137
	.fnend
	.size	vi_open, .-vi_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_ioctl, %function
vi_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r3, r2
	ldr	r2, [r0, #128]
	mov	r6, r1
	uxtb	r4, r6
	ldr	r1, [r2, #160]
	ldr	r5, [r1, #28]
	cmp	r5, r4
	bls	.L131
	.syntax unified
@ 87 "./arch/arm/include/asm/barrier.h" 1
	cmp	r4, r5
	sbc	r5, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r1, #24]
	ands	r4, r4, r5
	movs	r5, #20
	mla	r1, r5, r4, r1
	cbz	r1, .L131
	mov	r2, r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_ioctl_kernel
.L131:
	str	r4, [sp, #4]
	movw	r3, #790
	ldr	r2, .L136
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #8
	ldr	r3, .L136+4
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L137:
	.align	2
.L136:
	.word	.LC26
	.word	.LANCHOR0+145
	.fnend
	.size	vi_ioctl, .-vi_ioctl
	.align	1
	.global	vvi_node_get_chn_fr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_chn_fr, %function
vvi_node_get_chn_fr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r1
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r7, [r1]	@ unaligned
	cmp	r3, #20
	ldr	r6, [r1, #4]	@ unaligned
	ldr	r5, [r0, #128]
	beq	.L139
	movw	r3, #695
	ldr	r2, .L142
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L142+4
	movs	r0, #8
	bl	vlog
.L141:
	mov	r0, #-1
	b	.L138
.L139:
	mov	r2, r6
	mov	r1, r7
	movs	r0, #8
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L141
	mov	r2, #1296
	movs	r3, #216
	muls	r2, r7, r2
	movs	r0, #0
	mla	r2, r3, r6, r2
	add	r2, r2, r5
	ldr	r3, [r2, #980]
	str	r3, [r4, #12]	@ unaligned
	ldr	r3, [r2, #984]
	str	r3, [r4, #16]	@ unaligned
.L138:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L143:
	.align	2
.L142:
	.word	.LC27
	.word	.LANCHOR0+154
	.fnend
	.size	vvi_node_get_chn_fr, .-vvi_node_get_chn_fr
	.align	1
	.global	vvi_node_set_chn_fr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_chn_fr, %function
vvi_node_set_chn_fr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r1
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r5, [r0, #128]
	cmp	r3, #20
	ldr	r7, [r1]	@ unaligned
	ldr	r6, [r1, #4]	@ unaligned
	beq	.L145
	movw	r3, #667
	ldr	r2, .L149
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L149+4
	movs	r0, #8
	bl	vlog
.L144:
	mov	r0, #-1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L145:
	mov	r2, r6
	mov	r1, r7
	movs	r0, #8
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L144
	mov	r1, #1296
	movs	r2, #216
	muls	r1, r7, r1
	ldr	r3, [r4, #12]	@ unaligned
	mla	r1, r2, r6, r1
	add	r2, r0, #212
	add	r1, r1, r5
	str	r3, [r1, #980]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [r1, #984]
	add	r3, r0, #204
	ldr	r1, [r4, #16]	@ unaligned
	ldr	r0, [r4, #12]	@ unaligned
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	mpi_node_set_frame_rate
.L150:
	.align	2
.L149:
	.word	.LC27
	.word	.LANCHOR0+174
	.fnend
	.size	vvi_node_set_chn_fr, .-vvi_node_set_chn_fr
	.align	1
	.global	vvi_node_set_chns_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_chns_attr, %function
vvi_node_set_chns_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r2, [r1, #200]	@ unaligned
	ldr	r5, [r1]	@ unaligned
	cmp	r2, #216
	ldr	r3, [r1, #8]	@ unaligned
	ldr	r0, [r0, #128]
	beq	.L152
	mov	r3, #528
	ldr	r2, .L158
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L158+4
	movs	r0, #8
	bl	vlog
.L157:
	mov	r0, #-1
.L151:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L152:
	cmp	r5, #2
	bls	.L154
	movs	r3, #3
	ldr	r2, .L158+8
	strd	r5, r3, [sp, #4]
	mov	r3, #532
	str	r3, [sp]
	ldr	r3, .L158+4
.L156:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L157
.L154:
	cmp	r3, #5
	bls	.L155
	movs	r2, #6
	strd	r3, r2, [sp, #4]
	mov	r3, #536
	ldr	r2, .L158+12
	str	r3, [sp]
	ldr	r3, .L158+4
	b	.L156
.L155:
	mov	r4, #1296
	muls	r4, r5, r4
	mla	r3, r2, r3, r4
	adds	r4, r0, r3
	add	r0, r4, #856
	ldr	r5, [r4, #1060]
	bl	memcpy
	movs	r0, #0
	str	r5, [r4, #1060]
	b	.L151
.L159:
	.align	2
.L158:
	.word	.LC3
	.word	.LANCHOR0+194
	.word	.LC5
	.word	.LC28
	.fnend
	.size	vvi_node_set_chns_attr, .-vvi_node_set_chns_attr
	.align	1
	.global	vvi_node_get_chns_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_chns_attr, %function
vvi_node_get_chns_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r1
	ldr	r2, [r5, #200]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1]	@ unaligned
	cmp	r2, #216
	ldr	r4, [r1, #8]	@ unaligned
	ldr	r1, [r0, #128]
	beq	.L161
	movw	r3, #555
	ldr	r2, .L167
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L167+4
	movs	r0, #8
	bl	vlog
.L166:
	mov	r0, #-1
.L160:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L161:
	cmp	r3, #2
	bls	.L163
	movs	r2, #3
	strd	r3, r2, [sp, #4]
	movw	r3, #559
	ldr	r2, .L167+8
	str	r3, [sp]
	ldr	r3, .L167+4
.L165:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L166
.L163:
	cmp	r4, #5
	bls	.L164
	movs	r3, #6
	ldr	r2, .L167+12
	strd	r4, r3, [sp, #4]
	movw	r3, #563
	str	r3, [sp]
	ldr	r3, .L167+4
	b	.L165
.L164:
	muls	r4, r2, r4
	mov	r0, #1296
	mla	r3, r0, r3, r4
	mov	r0, r5
	add	r1, r1, r3
	add	r1, r1, #856
	bl	memcpy
	movs	r0, #0
	b	.L160
.L168:
	.align	2
.L167:
	.word	.LC3
	.word	.LANCHOR0+217
	.word	.LC5
	.word	.LC28
	.fnend
	.size	vvi_node_get_chns_attr, .-vvi_node_get_chns_attr
	.align	1
	.global	vvi_node_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_delete, %function
vvi_node_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r1
	ldr	r3, [r1, #24]	@ unaligned
	.pad #28
	sub	sp, sp, #28
	ldr	r7, [r0, #128]
	cmp	r3, #196
	ldr	r8, [r1]	@ unaligned
	sub	fp, r7, #32
	ldr	r4, [r1, #8]	@ unaligned
	beq	.L170
	movs	r3, #208
	ldr	r2, .L192
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L192+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L169:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L170:
	mov	r2, r4
	mov	r1, r8
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L172
	movs	r5, #6
	addw	r3, r4, #597
	mul	r5, r5, r8
	add	r3, r3, r5
	add	r5, r5, r4
	add	r5, r7, r5, lsl #3
	add	r3, fp, r3, lsl #3
	str	r3, [sp, #20]
	movw	r3, #4744
	ldr	r3, [r5, r3]
	ldr	r2, [sp, #20]
	cmp	r2, r3
	bne	.L173
	movs	r3, #215
	strd	r8, r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L192+4
	movs	r0, #8
	ldr	r2, .L192+8
	bl	vlog
.L173:
	ldr	r2, [r6, #76]
	movw	r1, #4744
	ldr	r5, [r5, r1]
	mvn	r10, #43
	add	r3, r2, #33
	sub	r3, r10, r3, lsl #3
	add	r5, r5, r3
	add	r2, r5, r2, lsl #3
	ldr	r2, [r2, #308]
.L191:
	add	r10, r3, r2
	ldr	r3, [r6, #76]
	ldr	r2, [sp, #20]
	add	r3, r5, r3, lsl #3
	add	r3, r3, #308
	cmp	r2, r3
	bne	.L176
	ldr	r5, [r6, #60]
	movs	r0, #8
	ldr	r2, [r9, #8]	@ unaligned
	ldr	r1, [r9]	@ unaligned
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
	cbz	r5, .L177
	movs	r1, #1
	mov	r0, r5
	bl	mpi_buf_pool_destroy
.L177:
	movs	r3, #230
	strd	r8, r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L192+4
	movs	r0, #8
	ldr	r2, .L192+12
	bl	vlog
.L172:
	cmp	fp, #0
	beq	.L178
	mov	r0, #1296
	movs	r2, #216
	mul	r8, r0, r8
	movs	r1, #0
	mla	r4, r2, r4, r8
	add	r7, r7, r4
	add	r4, r4, #888
	add	r0, fp, r4
	ldr	r5, [r7, #1060]
	bl	memset
	str	r5, [r7, #1060]
.L178:
	movs	r3, #240
	ldr	r2, .L192+16
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L192+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
	b	.L169
.L176:
	cbz	r5, .L175
	ldr	r3, [r5]
	movs	r1, #4
	ldr	r2, .L192+20
	movs	r0, #8
	str	r3, [sp, #4]
	movs	r3, #219
	str	r3, [sp]
	ldr	r3, .L192+4
	bl	vlog
	ldr	r3, [r6, #76]
	mov	r0, r5
	add	r3, r5, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #308]
	bl	mpi_obj_unref
.L175:
	ldr	r3, [r6, #76]
	mvn	r2, #43
	mov	r5, r10
	add	r1, r3, #33
	add	r3, r10, r3, lsl #3
	sub	r2, r2, r1, lsl #3
	ldr	r3, [r3, #308]
	b	.L191
.L193:
	.align	2
.L192:
	.word	.LC11
	.word	.LANCHOR0+240
	.word	.LC29
	.word	.LC22
	.word	.LC30
	.word	.LC23
	.fnend
	.size	vvi_node_delete, .-vvi_node_delete
	.align	1
	.global	rockit_free_tb_stream_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_free_tb_stream_buf, %function
rockit_free_tb_stream_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r1, #3520
	ldr	r3, .L197
	ldr	r0, [r3, #48]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L195
	ldr	r0, .L197+4
	bl	printk
	mov	r0, #-1
.L194:
	pop	{r3, r4, r5, pc}
.L195:
	ldr	r3, .L197+8
	movs	r4, #0
	str	r4, [r0, #24]
	str	r3, [r0, #4]
	bl	rkisp_rockit_free_tb_stream_buf
	mov	r0, r5
	bl	kfree
	mov	r0, r4
	b	.L194
.L198:
	.align	2
.L197:
	.word	kmalloc_caches
	.word	.LC31
	.word	.LC32
	.fnend
	.size	rockit_free_tb_stream_buf, .-rockit_free_tb_stream_buf
	.align	1
	.global	vvi_change_resolution
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_change_resolution, %function
vvi_change_resolution:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r5, r1
	ldr	r3, [r0, #128]
	mov	r1, #3520
	ldr	r7, [r3, #160]
	ldr	r3, .L218
	ldr	r0, [r3, #48]
	bl	kmem_cache_alloc
	mov	r6, r0
	cbnz	r0, .L200
	ldr	r0, .L218+4
	bl	printk
.L209:
	mov	r4, #-1
	b	.L199
.L200:
	ldr	r3, [r5, #16]	@ unaligned
	cmp	r3, #33
	beq	.L202
	ldr	r1, .L218+8
	mov	r2, #462
	ldr	r0, .L218+12
.L217:
	bl	printk
	b	.L209
.L202:
	ldr	r2, [r5, #4]	@ unaligned
	movs	r0, #8
	ldr	r1, [r5]	@ unaligned
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L209
	ldr	r3, [r0, #56]
	movs	r1, #4
	ldr	r8, [r7, #232]
	ldr	r10, [r5, #20]	@ unaligned
	ldr	r9, [r5, #24]	@ unaligned
	str	r3, [r6, #24]
	ldr	r3, [r0, #44]
	movs	r0, #8
	ldr	r2, .L218+16
	ldr	r3, [r3, #44]
	str	r3, [r6, #4]
	ldr	r3, [r7, #228]
	str	r3, [sp, #4]
	movw	r3, #479
	str	r3, [sp]
	ldr	r3, .L218+8
	bl	vlog
	ldr	r3, [r7, #228]
	cbz	r3, .L203
	ldr	r3, [r5, #4]	@ unaligned
	cbnz	r3, .L203
	ldr	r3, [r7, #236]
	mov	r1, r9
	ldr	r2, [r5, #8]	@ unaligned
	mov	r0, r10
	bl	get_new_wrap_line
	mov	r8, r0
	bl	mcu_wrap_end
	movs	r0, #10
	bl	msleep
.L203:
	mov	fp, #2
.L207:
	mov	r0, r6
	bl	rkisp_rockit_pause_stream
	cbz	r0, .L204
	mov	r2, #490
	ldr	r1, .L218+8
	ldr	r0, .L218+20
	b	.L217
.L210:
	mov	fp, #1
	b	.L207
.L204:
	mov	r3, r8
	mov	r2, r9
	mov	r1, r10
	mov	r0, r6
	bl	rkisp_rockit_config_stream
	cbz	r0, .L205
	movw	r2, #495
	ldr	r1, .L218+8
	ldr	r0, .L218+24
	mvn	r4, #1
	bl	printk
.L199:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L205:
	mov	r0, r6
	bl	rkisp_rockit_resume_stream
	mov	r4, r0
	cbz	r0, .L206
	movw	r2, #501
	ldr	r1, .L218+8
	ldr	r0, .L218+28
	mvn	r4, #2
	bl	printk
	b	.L199
.L206:
	cmp	fp, #1
	bne	.L210
	ldr	r3, [r7, #228]
	cbz	r3, .L208
	ldr	r3, [r5, #4]	@ unaligned
	cbnz	r3, .L208
	mov	r0, r8
	bl	mcu_set_wrap_line
	mov	r1, r8
	mov	r0, r9
	bl	mcu_wrap_config
	str	r8, [r7, #232]
.L208:
	mov	r0, r6
	bl	kfree
	b	.L199
.L219:
	.align	2
.L218:
	.word	kmalloc_caches
	.word	.LC31
	.word	.LANCHOR0+256
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.fnend
	.size	vvi_change_resolution, .-vvi_change_resolution
	.align	1
	.global	rockit_get_tb_stream_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_get_tb_stream_info, %function
rockit_get_tb_stream_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L223
	mov	r1, #3520
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r0, [r3, #48]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L221
	ldr	r0, .L223+4
	bl	printk
	mov	r0, #-1
.L220:
	pop	{r4, r5, r6, pc}
.L221:
	ldr	r3, .L223+8
	movs	r4, #0
	mov	r1, r6
	str	r4, [r0, #24]
	str	r3, [r0, #4]
	bl	rkisp_rockit_get_tb_stream_info
	mov	r0, r5
	bl	kfree
	mov	r0, r4
	b	.L220
.L224:
	.align	2
.L223:
	.word	kmalloc_caches
	.word	.LC31
	.word	.LC32
	.fnend
	.size	rockit_get_tb_stream_info, .-rockit_get_tb_stream_info
	.align	1
	.global	vvi_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_create, %function
vvi_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L261
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #76
	sub	sp, sp, #76
	ldr	r2, [r3]
	mov	r4, r1
	mov	r8, r3
	str	r2, [sp, #68]
	ldr	r2, [r0, #128]
	ldr	r5, [r2, #160]
	ldr	r2, [r1, #24]	@ unaligned
	cmp	r2, #196
	beq	.L226
	movs	r3, #99
	ldr	r2, .L261+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L261+8
	movs	r0, #8
	bl	vlog
.L258:
	mov	r0, #-1
	b	.L225
.L226:
	ldr	r0, .L261+12
	bl	mpi_allocator_find_by_name
	mov	r9, r0
	cbnz	r0, .L228
	movs	r3, #104
	ldr	r2, .L261+16
	str	r3, [sp]
	ldr	r3, .L261+8
	str	r0, [sp, #4]
.L260:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L258
.L228:
	ldr	r6, [r4, #8]	@ unaligned
	movs	r0, #8
	ldr	r7, [r4]	@ unaligned
	mov	r2, r6
	mov	r1, r7
	bl	vsys_get_node_from_map
	mov	fp, r0
	cbz	r0, .L229
	movs	r3, #113
	str	r6, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L261+8
	movs	r0, #8
	ldr	r2, .L261+20
	bl	vlog
	mvn	r0, #1
.L225:
	ldr	r2, [sp, #68]
	ldr	r3, [r8]
	cmp	r2, r3
	beq	.L244
	bl	__stack_chk_fail
.L229:
	add	r3, sp, #36
	mov	r1, r0
	movs	r2, #32
	add	r5, r5, r7, lsl #2
	mov	r0, r3
	bl	memset
	add	r2, r4, #56
	ldr	r10, [r4, #52]	@ unaligned
	mov	r0, r2
	uxtb	r10, r10
	str	r2, [sp, #28]
	bl	mpi_dev_find_by_name
	movs	r1, #4
	ldr	r2, [sp, #28]
	add	r3, sp, #36
	str	r0, [r5, #196]
	strd	r0, r3, [sp, #8]
	movs	r3, #129
	str	r2, [sp, #16]
	movs	r0, #8
	str	r3, [sp]
	str	r7, [sp, #4]
	ldr	r3, .L261+8
	ldr	r2, .L261+24
	bl	vlog
	cmp	r10, #1
	bhi	.L230
	ldr	r3, .L261+28
	mov	r1, #3520
	ldr	r0, [r3, #4]
	bl	kmem_cache_alloc
	movs	r2, #80
	mov	r1, fp
	bl	memset
	ldr	r1, [r4, #20]	@ unaligned
	str	r1, [r0, #4]
	mov	r3, r0
	ldr	r2, [r4, #28]	@ unaligned
	strd	r2, r1, [r0, #8]
	str	r2, [r0, #16]
	ldr	r2, [r4, #96]	@ unaligned
	str	r2, [r0, #24]
	ldr	r0, [r5, #196]
	cbnz	r0, .L231
.L234:
	movs	r3, #144
	ldr	r2, .L261+32
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L261+8
	movs	r0, #8
	strd	r7, r6, [sp, #4]
	bl	vlog
	ldr	r2, .L261+36
	ldr	r3, .L261+40
	cmp	r10, #1
	it	hi
	movhi	r3, r2
	ldr	r2, .L261+44
	str	r3, [sp, #4]
	movs	r3, #145
	str	r3, [sp]
	ldr	r3, .L261+8
	b	.L260
.L231:
	mov	r2, fp
	mov	r1, r6
.L255:
	bl	mpi_dev_create_node_with_params
	mov	r5, r0
	cmp	r0, #0
	beq	.L234
	movs	r3, #148
	movs	r1, #4
	str	r3, [sp]
	movs	r0, #8
	ldr	r3, .L261+8
	strd	r7, r6, [sp, #4]
	ldr	r2, .L261+48
	bl	vlog
	ldr	r1, .L261+52
	str	r1, [r5, #4]
	ldr	r3, [r4, #40]	@ unaligned
	cmp	r3, #1
	bne	.L236
	ldr	r2, [r4, #36]	@ unaligned
	cbnz	r2, .L237
	movs	r3, #4
	strb	r2, [r4, #33]
	strb	r3, [r4, #32]
	strb	r2, [r4, #34]
	strb	r2, [r4, #35]
.L237:
	ldr	r3, [r4, #32]	@ unaligned
	cmp	r3, #1
	bne	.L238
	str	r1, [sp]
	movs	r0, #0
	ldr	r1, .L261+56
	movs	r3, #4
	strb	r0, [r4, #33]
	strb	r3, [r4, #32]
	strb	r0, [r4, #34]
	strb	r0, [r4, #35]
.L256:
	mov	r0, r9
	bl	mpi_buf_pool_create
	ldr	r3, [r4, #32]	@ unaligned
	ldr	r2, .L261+60
	movs	r1, #4
	str	r3, [sp, #8]
	mov	r6, r0
	ldr	r3, [r4, #8]	@ unaligned
	movs	r0, #8
	str	r3, [sp, #4]
	movs	r3, #162
	str	r3, [sp]
	ldr	r3, .L261+8
	bl	vlog
.L259:
	cbnz	r6, .L257
.L243:
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #2
	ldr	r2, .L261+64
	movs	r0, #8
	str	r3, [sp, #4]
	movs	r3, #175
	str	r3, [sp]
	ldr	r3, .L261+8
	bl	vlog
	mov	r0, r5
	bl	mpi_node_destroy
	b	.L258
.L230:
	mov	r3, fp
	mov	r2, fp
	mov	r1, r6
	ldr	r0, [r5, #196]
	b	.L255
.L238:
	str	r1, [sp]
	movs	r1, #1
	b	.L256
.L236:
	cbnz	r3, .L242
	ldr	r0, [r4, #44]	@ unaligned
	bl	vsys_get_pool
	ldr	r3, [r4, #44]	@ unaligned
	ldr	r2, .L261+68
	movs	r1, #4
	mov	r6, r0
	str	r3, [sp, #4]
	movs	r0, #8
	movs	r3, #169
	str	r3, [sp]
	ldr	r3, .L261+8
	bl	vlog
	b	.L259
.L257:
	mov	r1, r5
	mov	r0, r6
	bl	mpi_buf_pool_add_user
.L241:
	add	r3, r5, #204
	add	r2, r5, #212
	ldr	r1, [r4, #128]	@ unaligned
	ldr	r0, [r4, #124]	@ unaligned
	bl	mpi_node_set_frame_rate
	mov	r3, r5
	ldr	r2, [r4, #8]	@ unaligned
	movs	r0, #8
	ldr	r1, [r4]	@ unaligned
	bl	vsys_add_node_to_map
	mov	r1, r5
	mov	r0, r6
	bl	mpi_buf_pool_add_user
	movs	r3, #188
	ldr	r2, .L261+72
	movs	r1, #4
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L261+8
	bl	vlog
	movs	r0, #0
	b	.L225
.L242:
	movs	r6, #0
	cmp	r6, #0
	bne	.L241
	b	.L243
.L244:
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L262:
	.align	2
.L261:
	.word	__stack_chk_guard
	.word	.LC11
	.word	.LANCHOR0+278
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	kmalloc_caches
	.word	.LC44
	.word	.LC39
	.word	.LC38
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	-2147483647
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.fnend
	.size	vvi_node_create, .-vvi_node_create
	.align	1
	.global	vvi_mb_put
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_mb_put, %function
vvi_mb_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r1
	ldr	r3, [r1, #16]	@ unaligned
	cmp	r3, #136
	beq	.L264
	movw	r3, #381
	ldr	r2, .L268
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L268+4
	movs	r0, #8
	bl	vlog
.L266:
	mov	r0, #-1
	b	.L263
.L264:
	ldr	r2, [r1, #4]	@ unaligned
	movs	r0, #8
	ldr	r1, [r1]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L266
	movs	r1, #4
	ldr	r0, [r5, #8]	@ unaligned
	bl	mpi_obj_from_id
	ldr	r2, .L268+8
	movs	r1, #5
	ldr	r3, [r0, #448]
	mov	r4, r0
	strd	r0, r3, [sp, #8]
	movs	r0, #8
	ldr	r3, [r5, #8]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #390
	str	r3, [sp]
	ldr	r3, .L268+4
	bl	vlog
	cbz	r4, .L267
	ldr	r3, [r6, #76]
	movs	r0, #8
	add	r3, r4, r3, lsl #3
	ldrd	r1, r2, [r3, #308]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #308]
	movw	r3, #393
	ldr	r2, .L268+12
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L268+4
	bl	vlog
	mov	r0, r6
	movs	r2, #0
	mov	r1, r4
	bl	mpi_node_release_buffer_flag
	movs	r0, #0
.L263:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L267:
	mov	r0, r4
	b	.L263
.L269:
	.align	2
.L268:
	.word	.LC6
	.word	.LANCHOR0+294
	.word	.LC52
	.word	.LC53
	.fnend
	.size	vvi_mb_put, .-vvi_mb_put
	.align	1
	.global	vvi_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_probe, %function
vvi_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r2, #4920
	ldr	r4, .L275
	mov	r5, r0
	movs	r1, #0
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	mov	r0, r5
	bl	kstrdup
	movs	r3, #1
	str	r3, [r4, #224]
	mov	r2, r5
	ldr	r3, .L275+4
	movs	r1, #8
	str	r4, [r4, #192]
	str	r3, [r4, #24]
	movs	r3, #15
	str	r3, [r4, #28]
	str	r0, [r4]
	add	r0, r4, #32
	bl	mpi_dev_register
	movs	r3, #0
	str	r3, [r4, #100]
	movs	r0, #4
	strd	r3, r3, [r4, #108]
	ldr	r4, .L275+8
.L271:
	subs	r2, r4, r3
	movs	r1, #0
.L272:
	adds	r1, r1, #1
	adds	r5, r2, r3
	cmp	r1, #6
	str	r2, [r2]
	str	r2, [r5, r0]
	add	r2, r2, #8
	bne	.L272
	subs	r3, r3, #48
	adds	r0, r0, #48
	cmn	r3, #144
	bne	.L271
	ldr	r1, .L275+12
	ldr	r0, .L275+16
	pop	{r3, r4, r5, lr}
	b	mpi_sysfs_dev_add
.L276:
	.align	2
.L275:
	.word	g_vvi_dev
	.word	.LANCHOR0+308
	.word	g_vvi_dev+4776
	.word	.LANCHOR0+608
	.word	g_vvi_dev+32
	.fnend
	.size	vvi_probe, .-vvi_probe
	.align	1
	.global	vvi_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_shutdown, %function
vvi_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L278
	add	r0, r4, #32
	str	r3, [r4, #12]
	bl	mpi_dev_unregister
	ldr	r0, [r4]
	pop	{r4, lr}
	b	kfree
.L279:
	.align	2
.L278:
	.word	g_vvi_dev
	.fnend
	.size	vvi_shutdown, .-vvi_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vvi_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_init, %function
vvi_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L281
	bl	vvi_probe
	movs	r0, #0
	pop	{r3, pc}
.L282:
	.align	2
.L281:
	.word	.LC47
	.fnend
	.size	vvi_init, .-vvi_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vvi_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_exit, %function
vvi_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vvi_shutdown
	.fnend
	.size	vvi_exit, .-vvi_exit
	.global	wait_mcu_flag
	.global	g_vvi_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.38471, %object
	.size	__func__.38471, 18
__func__.38471:
	.ascii	"get_new_wrap_line\000"
	.type	__func__.38622, %object
	.size	__func__.38622, 24
__func__.38622:
	.ascii	"vvi_node_set_dev_status\000"
	.type	__func__.38509, %object
	.size	__func__.38509, 20
__func__.38509:
	.ascii	"vvi_node_get_status\000"
	.type	__func__.38484, %object
	.size	__func__.38484, 15
__func__.38484:
	.ascii	"vvi_node_start\000"
	.type	__func__.38498, %object
	.size	__func__.38498, 14
__func__.38498:
	.ascii	"vvi_node_stop\000"
	.type	__func__.38555, %object
	.size	__func__.38555, 11
__func__.38555:
	.ascii	"vvi_mb_get\000"
	.type	__func__.38757, %object
	.size	__func__.38757, 11
__func__.38757:
	.ascii	"vi_release\000"
	.type	__func__.38638, %object
	.size	__func__.38638, 24
__func__.38638:
	.ascii	"vvi_node_get_dev_status\000"
	.type	__func__.38735, %object
	.size	__func__.38735, 8
__func__.38735:
	.ascii	"vi_open\000"
	.type	__func__.38719, %object
	.size	__func__.38719, 9
__func__.38719:
	.ascii	"vi_ioctl\000"
	.type	__func__.38678, %object
	.size	__func__.38678, 20
__func__.38678:
	.ascii	"vvi_node_get_chn_fr\000"
	.type	__func__.38661, %object
	.size	__func__.38661, 20
__func__.38661:
	.ascii	"vvi_node_set_chn_fr\000"
	.type	__func__.38591, %object
	.size	__func__.38591, 23
__func__.38591:
	.ascii	"vvi_node_set_chns_attr\000"
	.type	__func__.38606, %object
	.size	__func__.38606, 23
__func__.38606:
	.ascii	"vvi_node_get_chns_attr\000"
	.type	__func__.38443, %object
	.size	__func__.38443, 16
__func__.38443:
	.ascii	"vvi_node_delete\000"
	.type	__func__.38570, %object
	.size	__func__.38570, 22
__func__.38570:
	.ascii	"vvi_change_resolution\000"
	.type	__func__.38418, %object
	.size	__func__.38418, 16
__func__.38418:
	.ascii	"vvi_node_create\000"
	.type	__func__.38540, %object
	.size	__func__.38540, 11
__func__.38540:
	.ascii	"vvi_mb_put\000"
	.space	3
	.type	vvi_ioctls, %object
	.size	vvi_ioctls, 300
vvi_ioctls:
	.word	-1065585152
	.word	0
	.word	vvi_get_version
	.word	.LC54
	.word	0
	.word	-1060866559
	.word	0
	.word	vvi_node_create
	.word	.LC55
	.word	0
	.word	-1060866558
	.word	0
	.word	vvi_node_delete
	.word	.LC56
	.word	0
	.word	-1064798717
	.word	0
	.word	vvi_node_get_status
	.word	.LC57
	.word	0
	.word	-1060866556
	.word	0
	.word	vvi_node_start
	.word	.LC58
	.word	0
	.word	-1060866555
	.word	0
	.word	vvi_node_stop
	.word	.LC59
	.word	0
	.word	-1064798714
	.word	0
	.word	vvi_mb_put
	.word	.LC60
	.word	0
	.word	-1064798713
	.word	16
	.word	vvi_mb_get
	.word	.LC61
	.word	0
	.word	-1071548920
	.word	0
	.word	vvi_change_resolution
	.word	.LC62
	.word	0
	.word	-1059555831
	.word	0
	.word	vvi_node_set_chns_attr
	.word	.LC63
	.word	0
	.word	-1059555830
	.word	0
	.word	vvi_node_get_chns_attr
	.word	.LC64
	.word	0
	.word	-1059555829
	.word	0
	.word	vvi_node_set_dev_status
	.word	.LC65
	.word	0
	.word	-1059555828
	.word	0
	.word	vvi_node_get_dev_status
	.word	.LC66
	.word	0
	.word	-1072400883
	.word	0
	.word	vvi_node_set_chn_fr
	.word	.LC67
	.word	0
	.word	-1072400882
	.word	0
	.word	vvi_node_get_chn_fr
	.word	.LC68
	.word	0
	.type	vvi_driver_fops, %object
	.size	vvi_driver_fops, 128
vvi_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	vi_ioctl
	.word	vi_compat_ioctl
	.word	0
	.space	4
	.word	vi_open
	.space	4
	.word	vi_release
	.space	60
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	wait_mcu_flag, %object
	.size	wait_mcu_flag, 4
wait_mcu_flag:
	.space	4
	.type	g_vvi_dev, %object
	.size	g_vvi_dev, 4920
g_vvi_dev:
	.space	4920
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"-2023-09-28-17:34:00\000"
.LC1:
	.ascii	"vmpi:d4f898704722e6713f10876f39aa2121f9219477-v1.4."
	.ascii	"54\000"
.LC2:
	.ascii	"\033[1;32mtmp = %d, vi_res->wrap_line = %d, cur_w ="
	.ascii	" %d, cur_h = %d, max_res_width = %d\033[0m\000"
.LC3:
	.ascii	"\033[1;31mstruct vi_attr_kn_ctx mismatching\033[0m\000"
.LC4:
	.ascii	"\033[1;31mpipeId %d need less than %d\033[0m\000"
.LC5:
	.ascii	"\033[1;31mdevId %d need less than %d\033[0m\000"
.LC6:
	.ascii	"\033[1;31mstruct vvi_buff_info mismatching\033[0m\000"
.LC7:
	.ascii	"enter...\000"
.LC8:
	.ascii	"buf pool(%d) find\000"
.LC9:
	.ascii	"buf = %px ref cnt = %d\000"
.LC10:
	.ascii	"exit...\000"
.LC11:
	.ascii	"\033[1;31mstruct vvi_node_info mismatching\033[0m\000"
.LC12:
	.ascii	"mpi_node_streamon start\000"
.LC13:
	.ascii	"mpi_node_add_out_watcher start\000"
.LC14:
	.ascii	"\033[1;32mvvi_node_start done\033[0m\000"
.LC15:
	.ascii	"\033[1;32mdo vi vvi_node_stop dev:%d, chn:%d\033[0m"
	.ascii	"\000"
.LC16:
	.ascii	"\033[1;31mwrap mode not support get buffer from chn"
	.ascii	" 0\033[0m\000"
.LC17:
	.ascii	"\033[1;31mget node fail devid = %d, chnid = %d\033["
	.ascii	"0m\000"
.LC18:
	.ascii	"\033[1;31mget buf fail timeout = %d\033[0m\000"
.LC19:
	.ascii	"get buff: %px, dma_buf id = %d, frame seq=%d, pts:%"
	.ascii	"lld\000"
.LC20:
	.ascii	"buf id:%d size:%d w:%d h:%d pts:%llu\000"
.LC21:
	.ascii	"%s %d\000"
.LC22:
	.ascii	"\033[1;32mdelete vvi node: dev:%d, chn:%d\033[0m\000"
.LC23:
	.ascii	"\033[1;32mbuf id = %d, user process exit\033[0m\000"
.LC24:
	.ascii	"\033[1;31mwait mcu start fail\033[0m\000"
.LC25:
	.ascii	"\033[1;32m--------- vi open ----------\033[0m\000"
.LC26:
	.ascii	"\033[1;31mvi_ioctl: error vvi ioctl, invalid ioctrl"
	.ascii	" index %d\033[0m\000"
.LC27:
	.ascii	"\033[1;31mstruct vi_frame_rate mismatching\033[0m\000"
.LC28:
	.ascii	"\033[1;31mchnId %d need less than %d\033[0m\000"
.LC29:
	.ascii	"\033[1;32mdev = %d, chn = %d is empty\033[0m\000"
.LC30:
	.ascii	"do vi vvi_node_delete\000"
.LC31:
	.ascii	"\0013no memory for rockit_cfg\000"
.LC32:
	.ascii	"rkisp-vir0\000"
.LC33:
	.ascii	"\0013%s[%d] struct vvi_resolution mismatching\000"
.LC34:
	.ascii	"\033[1;32mvi_res->wrap_mode = %d\033[0m\000"
.LC35:
	.ascii	"\0013%s[%d]:rkisp_rockit_pause_stream fail\000"
.LC36:
	.ascii	"\0013%s[%d]:rkisp_rockit_config_stream fail\000"
.LC37:
	.ascii	"\0013%s[%d]:rkisp_rockit_resume_stream fail\000"
.LC38:
	.ascii	"rkcif\000"
.LC39:
	.ascii	"rkisp\000"
.LC40:
	.ascii	"valloc\000"
.LC41:
	.ascii	"\033[1;31merror getting vdev  %p\033[0m\000"
.LC42:
	.ascii	"\033[1;32mvvi chn:%d node have exist!\033[0m\000"
.LC43:
	.ascii	"\033[1;32m>>>>>> videv %d: %p, isp_name: %s, modeln"
	.ascii	"ame: %s\033[0m\000"
.LC44:
	.ascii	"\033[1;31merror create dev:%d, chn:%d %s vvi node\033"
	.ascii	"[0m\000"
.LC45:
	.ascii	"\033[1;31mdevice is %s\033[0m\000"
.LC46:
	.ascii	"\033[1;32m vvi dev:%d, chn:%d node create success\033"
	.ascii	"[0m\000"
.LC47:
	.ascii	"vvi\000"
.LC48:
	.ascii	"\033[1;32mvvi_node_create chn:%d pool create bufcnt"
	.ascii	":%d\033[0m\000"
.LC49:
	.ascii	"\033[1;31mchn:%d pool create fail\033[0m\000"
.LC50:
	.ascii	"\033[1;32mvvi_node_create vi_node_info->mbPool:%d\033"
	.ascii	"[0m\000"
.LC51:
	.ascii	"\033[1;32mvvi_node_create done\033[0m\000"
.LC52:
	.ascii	"put buff: id:%d, buf:%p, dma_buf:%p\000"
.LC53:
	.ascii	"unref buffer\000"
.LC54:
	.ascii	"VVI_IOCTL_VERSION\000"
.LC55:
	.ascii	"VVI_IOCTL_NODE_CREATE\000"
.LC56:
	.ascii	"VVI_IOCTL_NODE_DELETE\000"
.LC57:
	.ascii	"VVI_IOCTL_NODE_GET_STATUS\000"
.LC58:
	.ascii	"VVI_IOCTL_NODE_START\000"
.LC59:
	.ascii	"VVI_IOCTL_NODE_STOP\000"
.LC60:
	.ascii	"VVI_IOCTL_MB_PUT\000"
.LC61:
	.ascii	"VVI_IOCTL_MB_GET\000"
.LC62:
	.ascii	"VVI_IOCTL_RES_CHANGE\000"
.LC63:
	.ascii	"VVI_IOCTL_SET_ATTR\000"
.LC64:
	.ascii	"VVI_IOCTL_GET_ATTR\000"
.LC65:
	.ascii	"VVI_IOCTL_SET_DEV_STA\000"
.LC66:
	.ascii	"VVI_IOCTL_GET_DEV_STA\000"
.LC67:
	.ascii	"VVI_IOCTL_SET_FR\000"
.LC68:
	.ascii	"VVI_IOCTL_GET_FR\000"
	.section	___ksymtab_gpl+rockit_free_tb_stream_buf,"a"
	.align	2
	.type	__ksymtab_rockit_free_tb_stream_buf, %object
	.size	__ksymtab_rockit_free_tb_stream_buf, 12
__ksymtab_rockit_free_tb_stream_buf:
	.word	rockit_free_tb_stream_buf
	.word	__kstrtab_rockit_free_tb_stream_buf
	.word	__kstrtabns_rockit_free_tb_stream_buf
	.section	___ksymtab_gpl+rockit_get_tb_stream_info,"a"
	.align	2
	.type	__ksymtab_rockit_get_tb_stream_info, %object
	.size	__ksymtab_rockit_get_tb_stream_info, 12
__ksymtab_rockit_get_tb_stream_info:
	.word	rockit_get_tb_stream_info
	.word	__kstrtab_rockit_get_tb_stream_info
	.word	__kstrtabns_rockit_get_tb_stream_info
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
