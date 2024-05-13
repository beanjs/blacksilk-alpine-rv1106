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
	.file	"mpp_mem_pool.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	mpp_mem_get_pool_f
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_mem_get_pool_f, %function
mpp_mem_get_pool_f:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r1
	ldr	r0, .L6
	movs	r1, #40
	mov	r6, r2
	mov	r4, r3
	bl	mpp_osal_malloc
	cbz	r0, .L1
	add	r3, r0, #12
	movs	r2, #0
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	add	r3, r0, #20
	str	r0, [r0]
	str	r6, [r0, #8]
	strd	r2, r2, [r0, #28]
	str	r5, [r0, #4]
	str	r4, [r0, #36]
	str	r3, [r0, #20]
	str	r3, [r0, #24]
.L1:
	pop	{r4, r5, r6, pc}
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.fnend
	.size	mpp_mem_get_pool_f, .-mpp_mem_get_pool_f
	.align	1
	.global	mpp_mem_put_pool_f
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_mem_put_pool_f, %function
mpp_mem_put_pool_f:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1]
	cmp	r3, r1
	beq	.L9
	str	r3, [sp]
	movs	r2, #72
	mov	r3, r1
	ldr	r0, .L30
	ldr	r1, .L30+4
	bl	printk
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L9:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r1, #20]
	add	r7, r1, #20
	cmp	r7, r3
	bne	.L11
.L17:
	ldr	r3, [r4, #12]
	add	r7, r4, #12
	cmp	r7, r3
	beq	.L13
	ldr	r3, [r4, #8]
	movs	r2, #89
	ldr	r1, .L30+4
	ldr	r0, .L30+8
	str	r3, [sp]
	ldr	r3, [r4, #28]
	bl	printk
	ldr	r1, [r4, #12]
	ldr	r8, .L30+16
	ldr	r5, [r1], #-4
	subs	r5, r5, #4
.L20:
	adds	r3, r1, #4
	cmp	r7, r3
	bne	.L22
.L13:
	ldrd	r3, r2, [r4, #28]
	orrs	r1, r3, r2
	beq	.L19
	strd	r3, r2, [sp]
	movs	r2, #99
	ldr	r3, [r4, #8]
	ldr	r1, .L30+4
	ldr	r0, .L30+12
	bl	printk
.L19:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, .L30+16
	mov	r1, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpp_osal_free
.L11:
	ldr	r1, [r1, #20]
	ldr	r8, .L30+16
	ldr	r5, [r1], #-4
	subs	r5, r5, #4
.L14:
	adds	r3, r1, #4
	cmp	r7, r3
	beq	.L17
	cbz	r1, .L15
	mov	r0, r8
	bl	mpp_osal_free
.L15:
	ldr	r3, [r4, #32]
	mov	r1, r5
	subs	r3, r3, #1
	str	r3, [r4, #32]
	ldr	r3, [r5, #4]
	subs	r5, r3, #4
	b	.L14
.L22:
	cbz	r1, .L21
	mov	r0, r8
	bl	mpp_osal_free
.L21:
	ldr	r3, [r4, #28]
	mov	r1, r5
	subs	r3, r3, #1
	str	r3, [r4, #28]
	ldr	r3, [r5, #4]
	subs	r5, r3, #4
	b	.L20
.L31:
	.align	2
.L30:
	.word	.LC0
	.word	.LANCHOR0+19
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR0+38
	.fnend
	.size	mpp_mem_put_pool_f, .-mpp_mem_put_pool_f
	.align	1
	.global	mpp_mem_pool_get_f
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_mem_pool_get_f, %function
mpp_mem_pool_get_f:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r6, r1
	ldr	r3, [r4, #20]
	add	r2, r4, #20
	cmp	r2, r3
	beq	.L33
	ldr	r3, [r4, #20]
	cmp	r2, r3
	beq	.L33
	subs	r0, r3, #4
	beq	.L33
	ldrd	r1, r2, [r3]
	str	r2, [r1, #4]
	str	r1, [r2]
	add	r1, r4, #12
	str	r3, [r3]
	str	r3, [r3, #4]
	ldr	r2, [r4, #16]
	str	r3, [r4, #16]
	strd	r1, r2, [r3]
	str	r3, [r2]
	ldr	r2, [r4, #32]
	subs	r2, r2, #1
	str	r2, [r4, #32]
	ldr	r2, [r4, #28]
	adds	r2, r2, #1
	str	r2, [r4, #28]
	ldr	r5, [r3, #8]
	str	r0, [r3, #-4]
.L34:
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cbz	r0, .L32
	ldr	r2, [r0, #16]
	movs	r1, #0
	ldr	r0, [r0, #12]
	bl	memset
	b	.L32
.L33:
	ldrd	r2, r3, [r4, #32]
	ldr	r0, [r4, #28]
	add	r2, r2, r0
	cmp	r2, r3
	bcc	.L35
	ldr	r2, [r4, #8]
	movs	r1, #129
	ldr	r0, .L44
	movs	r5, #0
	bl	printk
	mov	r0, r5
	b	.L34
.L35:
	add	r7, r4, #12
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r4, #8]
	ldr	r0, .L44+4
	adds	r1, r1, #20
	bl	mpp_osal_malloc
	mov	r5, r0
	cbnz	r0, .L36
	ldr	r3, [r4, #4]
	movs	r2, #136
	ldr	r1, .L44+8
	ldr	r0, .L44+12
	bl	printk
.L32:
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, pc}
.L36:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	str	r0, [r5]
	add	r3, r0, #20
	str	r3, [r0, #12]
	ldr	r3, [r4, #8]
	str	r3, [r0, #16]
	adds	r3, r0, #4
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	ldr	r2, [r4, #16]
	str	r3, [r4, #16]
	strd	r7, r2, [r0, #4]
	str	r3, [r2]
	ldr	r3, [r4, #28]
	adds	r3, r3, #1
	str	r3, [r4, #28]
	ldr	r5, [r0, #12]
	b	.L34
.L45:
	.align	2
.L44:
	.word	.LC3
	.word	.LANCHOR0+57
	.word	.LANCHOR0+76
	.word	.LC4
	.fnend
	.size	mpp_mem_pool_get_f, .-mpp_mem_pool_get_f
	.align	1
	.global	mpp_mem_pool_put_f
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_mem_pool_put_f, %function
mpp_mem_pool_put_f:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r1
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	sub	r1, r2, #20
	ldr	r0, [r3]
	cmp	r0, r3
	beq	.L47
	str	r0, [sp]
	movs	r2, #166
	ldr	r1, .L50
	ldr	r0, .L50+4
	bl	printk
.L46:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L47:
	ldr	r3, [r2, #-20]
	cmp	r3, r1
	beq	.L49
	strd	r1, r3, [sp]
	mov	r3, r2
	ldr	r1, .L50
	movs	r2, #172
	ldr	r0, .L50+8
	bl	printk
	b	.L46
.L49:
	.syntax unified
@ 29 "./arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldrd	r4, r1, [r2, #-16]
	sub	r3, r2, #16
	str	r1, [r4, #4]
	str	r4, [r1]
	mov	r1, r0
	str	r3, [r2, #-16]
	str	r3, [r2, #-12]
	ldr	r4, [r1, #20]!
	str	r3, [r4, #4]
	strd	r4, r1, [r2, #-16]
	str	r3, [r0, #20]
	ldr	r3, [r0, #28]
	subs	r3, r3, #1
	str	r3, [r0, #28]
	ldr	r3, [r0, #32]
	adds	r3, r3, #1
	str	r3, [r0, #32]
	movs	r3, #0
	str	r3, [r2, #-20]
	.syntax unified
@ 171 "./arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L46
.L51:
	.align	2
.L50:
	.word	.LANCHOR0+95
	.word	.LC5
	.word	.LC6
	.fnend
	.size	mpp_mem_pool_put_f, .-mpp_mem_pool_put_f
	.align	1
	.global	mpp_mem_pool_info_show
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_mem_pool_info_show, %function
mpp_mem_pool_info_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r1
	ldr	r2, [r1, #4]
	mov	r5, r0
	ldr	r1, .L53
	bl	seq_printf
	ldr	r3, .L53+4
	mov	r0, r5
	ldr	r2, .L53+8
	ldr	r1, .L53+12
	str	r3, [sp, #4]
	ldr	r3, .L53+16
	str	r3, [sp]
	ldr	r3, .L53+20
	bl	seq_printf
	ldr	r1, [r4, #36]
	ldrd	r3, r2, [r4, #28]
	mov	r0, r5
	str	r1, [sp, #4]
	adds	r1, r2, r3
	str	r1, [sp]
	ldr	r1, .L53+24
	bl	seq_printf
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L54:
	.align	2
.L53:
	.word	.LC7
	.word	.LC11
	.word	.LC9
	.word	.LC10
	.word	.LC12
	.word	.LC8
	.word	.LC13
	.fnend
	.size	mpp_mem_pool_info_show, .-mpp_mem_pool_info_show
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.23946, %object
	.size	__FUNCTION__.23946, 19
__FUNCTION__.23946:
	.ascii	"mpp_mem_get_pool_f\000"
	.type	__func__.23957, %object
	.size	__func__.23957, 19
__func__.23957:
	.ascii	"mpp_mem_put_pool_f\000"
	.type	__FUNCTION__.23979, %object
	.size	__FUNCTION__.23979, 19
__FUNCTION__.23979:
	.ascii	"mpp_mem_put_pool_f\000"
	.type	__FUNCTION__.24028, %object
	.size	__FUNCTION__.24028, 19
__FUNCTION__.24028:
	.ascii	"mpp_mem_pool_get_f\000"
	.type	__func__.24029, %object
	.size	__func__.24029, 19
__func__.24029:
	.ascii	"mpp_mem_pool_get_f\000"
	.type	__func__.24044, %object
	.size	__func__.24044, 19
__func__.24044:
	.ascii	"mpp_mem_pool_put_f\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: invalid mem impl %p check %p\012\000"
.LC1:
	.ascii	"\0013%s:%d: found %d used buffer size %d\012\000"
.LC2:
	.ascii	"\0013%s:%d: pool size %d found leaked buffer used:u"
	.ascii	"nused [%d:%d]\012\000"
.LC3:
	.ascii	"\0016%d: pool %d reach max cnt %d\012\000"
.LC4:
	.ascii	"\0013%s:%d: failed to create node from %s pool\012\000"
.LC5:
	.ascii	"\0013%s:%d: invalid mem pool %p check %p\012\000"
.LC6:
	.ascii	"\0013%s:%d: invalid mem pool ptr %p node %p check %"
	.ascii	"p\012\000"
.LC7:
	.ascii	"\012--------%s pool--------------------------------"
	.ascii	"-------------------------------------------\012\000"
.LC8:
	.ascii	"used_cnt\000"
.LC9:
	.ascii	"unused_cnt\000"
.LC10:
	.ascii	"%12s|%12s|%12s|%12s\012\000"
.LC11:
	.ascii	"max_cnt\000"
.LC12:
	.ascii	"total_cnt\000"
.LC13:
	.ascii	"%12u|%12u|%12u|%12u\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
