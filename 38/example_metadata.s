	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI0_0:
	.quad	0x3ff0000000000000		## double 1
LCPI0_1:
	.quad	0x4000000000000000		## double 2
LCPI0_2:
	.quad	0x4024000000000000		## double 10

	.section	__TEXT,__text,regular,pure_instructions

	.global _foo
_foo:
	.cfi_startproc
## bb.0
    pushq	%rbp
    movq	%rsp, %rbp
    movq	_foo.meta@GOTPCREL(%rip), %rax
    movq	%rax, -8(%rbp)
    subq	$32, %rsp
## bb.1
    movq	$3, %rdi
    movsd	%xmm0, -16(%rbp)		#  spill	var0
    callq	_array_create_by_length
    movsd	-16(%rbp), %xmm0		#  reload	var0
    movsd	LCPI0_0(%rip), %xmm1		#  movsd	doubleIndex(0), var4(temp):double
    movsd	%xmm1, 24(%rax)		#  movsd	var4(temp):double, 24(var3(temp):int64)
    movsd	LCPI0_1(%rip), %xmm2		#  movsd	doubleIndex(1), var5(temp):double
    movsd	%xmm2, 32(%rax)		#  movsd	var5(temp):double, 32(var3(temp):int64)
    movsd	%xmm0, 40(%rax)		#  movsd	var0(b):double, 40(var3(temp):int64)
    movq	%rax, %r10				#  movq	var3(temp):int64, var1(a):int64
    leaq	L_.str(%rip), %r11		#  leaq	stringConst(0), var6(temp):int64
    movq	%r11, %rdi
    movsd	%xmm0, -16(%rbp)		#  spill	var0
    movq	%r10, -24(%rbp)			#  spill	var1
    callq	_string_create_by_cstr
    movq	%rax, %rdi				#  movq	%rax, var7(temp):int64
    movsd	-16(%rbp), %xmm0		#  reload	var0
    movq	-24(%rbp), %r10			#  reload	var1
    movq	%rdi, %rsi				#  movq	var7(temp):int64, var2(s):int64
    movq	%rsi, %rdi
    movsd	%xmm0, -16(%rbp)		#  spill	var0
    movq	%r10, -24(%rbp)			#  spill	var1
    callq	_println_s
    movsd	-16(%rbp), %xmm0		#  reload	var0
    movq	-24(%rbp), %r10			#  reload	var1
    movsd	%xmm0, -16(%rbp)		#  spill	var0
    movsd	40(%r10), %xmm0
    callq	_println_d
    movsd	-16(%rbp), %xmm0		#  reload	var0
    mulsd	LCPI0_2(%rip), %xmm0		#  mulsd	doubleIndex(2), var0(b):double
    movq	%rbp, %rdi
    movsd	%xmm0, -16(%rbp)		#  spill	var0
    callq	_frame_walker
    movsd	-16(%rbp), %xmm0		#  reload	var0
    addq	$32, %rsp
    popq	%rbp
    retq
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI1_0:
	.quad	0x4000000000000000		## double 2

	.section	__TEXT,__text,regular,pure_instructions

	.global _main
_main:
	.cfi_startproc
## bb.0
    pushq	%rbp
    movq	%rsp, %rbp
    movq	_main.meta@GOTPCREL(%rip), %rax
    movq	%rax, -8(%rbp)
    subq	$16, %rsp
## bb.1
    movsd	LCPI1_0(%rip), %xmm0
    callq	_foo
    callq	_println_d
    addq	$16, %rsp
    popq	%rbp
    retq
	.cfi_endproc

	.section	__DATA,__const
	.globl	_foo.meta				## can be accessed globally
	.p2align	3					## 8 byte alignment
_foo.meta:
	.quad	_foo.name				## link to function name section
	.quad	2						## var count
	.quad	0x0000000001000010		## var0, type: 1, address offset: 16
	.quad	0x0000000106000018		## var1, type: 6, address offset: 24

	.section	__TEXT,__const
	.globl	_foo.name				## can be accessed globally
	.p2align	3					## 8 byte alignment
_foo.name:
	.asciz	"foo"

	.section	__DATA,__const
	.globl	_main.meta				## can be accessed globally
	.p2align	3					## 8 byte alignment
_main.meta:
	.quad	_main.name				## link to function name section
	.quad	0						## var count

	.section	__TEXT,__const
	.globl	_main.name				## can be accessed globally
	.p2align	3					## 8 byte alignment
_main.name:
	.asciz	"main"

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	"Hello PlayScript!"
