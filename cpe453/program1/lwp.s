	.file	"lwp.c"
	.globl	Original_stackPointer
	.bss
	.align 8
	.type	Original_stackPointer, @object
	.size	Original_stackPointer, 8
Original_stackPointer:
	.zero	8
	.comm	lwp_ptable,960,32
	.globl	schedule
	.align 8
	.type	schedule, @object
	.size	schedule, 8
schedule:
	.zero	8
	.globl	pid
	.data
	.align 8
	.type	pid, @object
	.size	pid, 8
pid:
	.quad	1
	.globl	lwp
	.bss
	.align 4
	.type	lwp, @object
	.size	lwp, 4
lwp:
	.zero	4
	.globl	lwp_procs
	.align 4
	.type	lwp_procs, @object
	.size	lwp_procs, 4
lwp_procs:
	.zero	4
	.text
	.globl	new_lwp
	.type	new_lwp, @function
new_lwp:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	$0, -24(%rbp)
	movl	lwp_procs(%rip), %eax
	cmpl	$30, %eax
	jle	.L2
	movl	$-1, %eax
	jmp	.L3
.L2:
	movl	lwp_procs(%rip), %eax
	movl	%eax, lwp(%rip)
	movl	lwp_procs(%rip), %eax
	addl	$1, %eax
	movl	%eax, lwp_procs(%rip)
	movl	lwp(%rip), %ecx
	movq	pid(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, pid(%rip)
	movslq	%ecx, %rdx
	salq	$5, %rdx
	addq	$lwp_ptable, %rdx
	movq	%rax, (%rdx)
	movl	lwp(%rip), %ebx
	movq	-56(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movslq	%ebx, %rdx
	salq	$5, %rdx
	addq	$lwp_ptable, %rdx
	movq	%rax, 8(%rdx)
	movl	lwp(%rip), %eax
	cltq
	salq	$5, %rax
	leaq	lwp_ptable+16(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	%rax, (%rdx)
	movl	lwp(%rip), %eax
	cltq
	salq	$5, %rax
	addq	$lwp_ptable, %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movl	$lwp_exit, %edx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	subq	$8, -32(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-48(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	subq	$8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	$286331153, (%rax)
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	movl	lwp(%rip), %eax
.L3:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	new_lwp, .-new_lwp
	.globl	lwp_exit
	.type	lwp_exit, @function
lwp_exit:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	lwp(%rip), %eax
	cltq
	salq	$5, %rax
	addq	$lwp_ptable, %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free
	movl	lwp(%rip), %eax
	movl	%eax, -4(%rbp)
	jmp	.L5
.L6:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$5, %rax
	addq	$lwp_ptable, %rax
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	$lwp_ptable, %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rax)
	addl	$1, -4(%rbp)
.L5:
	movl	lwp_procs(%rip), %eax
	subl	$1, %eax
	cmpl	-4(%rbp), %eax
	jg	.L6
	movl	lwp_procs(%rip), %eax
	subl	$1, %eax
	movl	%eax, lwp_procs(%rip)
	movl	lwp_procs(%rip), %eax
	testl	%eax, %eax
	jne	.L7
	movl	$0, %eax
	call	lwp_stop
	jmp	.L4
.L7:
	movq	schedule(%rip), %rax
	testq	%rax, %rax
	je	.L9
	movq	schedule(%rip), %rax
	call	*%rax
	jmp	.L10
.L9:
	movl	$0, %eax
.L10:
	movl	%eax, lwp(%rip)
	movl	lwp(%rip), %eax
	cltq
	salq	$5, %rax
	addq	$lwp_ptable+16, %rax
	movq	8(%rax), %rax
#APP
# 81 "lwp.c" 1
	movq  %rax,%rsp
# 0 "" 2
# 82 "lwp.c" 1
	popq  %rbp
# 0 "" 2
# 82 "lwp.c" 1
	popq  %r15
# 0 "" 2
# 82 "lwp.c" 1
	popq  %r14
# 0 "" 2
# 82 "lwp.c" 1
	popq  %r13
# 0 "" 2
# 82 "lwp.c" 1
	popq  %r12
# 0 "" 2
# 82 "lwp.c" 1
	popq  %r11
# 0 "" 2
# 82 "lwp.c" 1
	popq  %r10
# 0 "" 2
# 82 "lwp.c" 1
	popq  %r9
# 0 "" 2
# 82 "lwp.c" 1
	popq  %r8
# 0 "" 2
# 82 "lwp.c" 1
	popq  %rdi
# 0 "" 2
# 82 "lwp.c" 1
	popq  %rsi
# 0 "" 2
# 82 "lwp.c" 1
	popq  %rdx
# 0 "" 2
# 82 "lwp.c" 1
	popq  %rcx
# 0 "" 2
# 82 "lwp.c" 1
	popq  %rbx
# 0 "" 2
# 82 "lwp.c" 1
	popq  %rax
# 0 "" 2
# 82 "lwp.c" 1
	movq  %rbp,%rsp
# 0 "" 2
#NO_APP
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	lwp_exit, .-lwp_exit
	.globl	lwp_getpid
	.type	lwp_getpid, @function
lwp_getpid:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	lwp(%rip), %eax
	cltq
	salq	$5, %rax
	addq	$lwp_ptable, %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	lwp_getpid, .-lwp_getpid
	.globl	lwp_yield
	.type	lwp_yield, @function
lwp_yield:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 91 "lwp.c" 1
	pushq %rax
# 0 "" 2
# 91 "lwp.c" 1
	pushq %rbx
# 0 "" 2
# 91 "lwp.c" 1
	pushq %rcx
# 0 "" 2
# 91 "lwp.c" 1
	pushq %rdx
# 0 "" 2
# 91 "lwp.c" 1
	pushq %rsi
# 0 "" 2
# 91 "lwp.c" 1
	pushq %rdi
# 0 "" 2
# 91 "lwp.c" 1
	pushq %r8
# 0 "" 2
# 91 "lwp.c" 1
	pushq %r9
# 0 "" 2
# 91 "lwp.c" 1
	pushq %r10
# 0 "" 2
# 91 "lwp.c" 1
	pushq %r11
# 0 "" 2
# 91 "lwp.c" 1
	pushq %r12
# 0 "" 2
# 91 "lwp.c" 1
	pushq %r13
# 0 "" 2
# 91 "lwp.c" 1
	pushq %r14
# 0 "" 2
# 91 "lwp.c" 1
	pushq %r15
# 0 "" 2
# 91 "lwp.c" 1
	pushq %rbp
# 0 "" 2
#NO_APP
	movl	lwp(%rip), %edx
#APP
# 92 "lwp.c" 1
	movq  %rsp,%rax
# 0 "" 2
#NO_APP
	movslq	%edx, %rdx
	salq	$5, %rdx
	addq	$lwp_ptable+16, %rdx
	movq	%rax, 8(%rdx)
	movq	schedule(%rip), %rax
	testq	%rax, %rax
	jne	.L14
	movl	lwp(%rip), %eax
	addl	$1, %eax
	movl	lwp_procs(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	movl	%eax, lwp(%rip)
	jmp	.L15
.L14:
	movq	schedule(%rip), %rax
	call	*%rax
	movl	%eax, lwp(%rip)
.L15:
	movl	lwp(%rip), %eax
	cltq
	salq	$5, %rax
	addq	$lwp_ptable+16, %rax
	movq	8(%rax), %rax
#APP
# 98 "lwp.c" 1
	movq  %rax,%rsp
# 0 "" 2
# 99 "lwp.c" 1
	popq  %rbp
# 0 "" 2
# 99 "lwp.c" 1
	popq  %r15
# 0 "" 2
# 99 "lwp.c" 1
	popq  %r14
# 0 "" 2
# 99 "lwp.c" 1
	popq  %r13
# 0 "" 2
# 99 "lwp.c" 1
	popq  %r12
# 0 "" 2
# 99 "lwp.c" 1
	popq  %r11
# 0 "" 2
# 99 "lwp.c" 1
	popq  %r10
# 0 "" 2
# 99 "lwp.c" 1
	popq  %r9
# 0 "" 2
# 99 "lwp.c" 1
	popq  %r8
# 0 "" 2
# 99 "lwp.c" 1
	popq  %rdi
# 0 "" 2
# 99 "lwp.c" 1
	popq  %rsi
# 0 "" 2
# 99 "lwp.c" 1
	popq  %rdx
# 0 "" 2
# 99 "lwp.c" 1
	popq  %rcx
# 0 "" 2
# 99 "lwp.c" 1
	popq  %rbx
# 0 "" 2
# 99 "lwp.c" 1
	popq  %rax
# 0 "" 2
# 99 "lwp.c" 1
	movq  %rbp,%rsp
# 0 "" 2
#NO_APP
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	lwp_yield, .-lwp_yield
	.globl	lwp_start
	.type	lwp_start, @function
lwp_start:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	lwp_procs(%rip), %eax
	testl	%eax, %eax
	jne	.L17
	jmp	.L16
.L17:
#APP
# 106 "lwp.c" 1
	pushq %rax
# 0 "" 2
# 106 "lwp.c" 1
	pushq %rbx
# 0 "" 2
# 106 "lwp.c" 1
	pushq %rcx
# 0 "" 2
# 106 "lwp.c" 1
	pushq %rdx
# 0 "" 2
# 106 "lwp.c" 1
	pushq %rsi
# 0 "" 2
# 106 "lwp.c" 1
	pushq %rdi
# 0 "" 2
# 106 "lwp.c" 1
	pushq %r8
# 0 "" 2
# 106 "lwp.c" 1
	pushq %r9
# 0 "" 2
# 106 "lwp.c" 1
	pushq %r10
# 0 "" 2
# 106 "lwp.c" 1
	pushq %r11
# 0 "" 2
# 106 "lwp.c" 1
	pushq %r12
# 0 "" 2
# 106 "lwp.c" 1
	pushq %r13
# 0 "" 2
# 106 "lwp.c" 1
	pushq %r14
# 0 "" 2
# 106 "lwp.c" 1
	pushq %r15
# 0 "" 2
# 106 "lwp.c" 1
	pushq %rbp
# 0 "" 2
# 107 "lwp.c" 1
	movq  %rsp,%rax
# 0 "" 2
#NO_APP
	movq	%rax, Original_stackPointer(%rip)
	movq	schedule(%rip), %rax
	testq	%rax, %rax
	jne	.L19
	movl	$0, -4(%rbp)
	jmp	.L20
.L19:
	movq	schedule(%rip), %rax
	call	*%rax
	movl	%eax, -4(%rbp)
.L20:
	movl	-4(%rbp), %eax
	movl	%eax, lwp(%rip)
	movl	lwp(%rip), %eax
	cltq
	salq	$5, %rax
	addq	$lwp_ptable+16, %rax
	movq	8(%rax), %rax
#APP
# 115 "lwp.c" 1
	movq  %rax,%rsp
# 0 "" 2
# 116 "lwp.c" 1
	popq  %rbp
# 0 "" 2
# 116 "lwp.c" 1
	popq  %r15
# 0 "" 2
# 116 "lwp.c" 1
	popq  %r14
# 0 "" 2
# 116 "lwp.c" 1
	popq  %r13
# 0 "" 2
# 116 "lwp.c" 1
	popq  %r12
# 0 "" 2
# 116 "lwp.c" 1
	popq  %r11
# 0 "" 2
# 116 "lwp.c" 1
	popq  %r10
# 0 "" 2
# 116 "lwp.c" 1
	popq  %r9
# 0 "" 2
# 116 "lwp.c" 1
	popq  %r8
# 0 "" 2
# 116 "lwp.c" 1
	popq  %rdi
# 0 "" 2
# 116 "lwp.c" 1
	popq  %rsi
# 0 "" 2
# 116 "lwp.c" 1
	popq  %rdx
# 0 "" 2
# 116 "lwp.c" 1
	popq  %rcx
# 0 "" 2
# 116 "lwp.c" 1
	popq  %rbx
# 0 "" 2
# 116 "lwp.c" 1
	popq  %rax
# 0 "" 2
# 116 "lwp.c" 1
	movq  %rbp,%rsp
# 0 "" 2
#NO_APP
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	lwp_start, .-lwp_start
	.globl	lwp_stop
	.type	lwp_stop, @function
lwp_stop:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 120 "lwp.c" 1
	pushq %rax
# 0 "" 2
# 120 "lwp.c" 1
	pushq %rbx
# 0 "" 2
# 120 "lwp.c" 1
	pushq %rcx
# 0 "" 2
# 120 "lwp.c" 1
	pushq %rdx
# 0 "" 2
# 120 "lwp.c" 1
	pushq %rsi
# 0 "" 2
# 120 "lwp.c" 1
	pushq %rdi
# 0 "" 2
# 120 "lwp.c" 1
	pushq %r8
# 0 "" 2
# 120 "lwp.c" 1
	pushq %r9
# 0 "" 2
# 120 "lwp.c" 1
	pushq %r10
# 0 "" 2
# 120 "lwp.c" 1
	pushq %r11
# 0 "" 2
# 120 "lwp.c" 1
	pushq %r12
# 0 "" 2
# 120 "lwp.c" 1
	pushq %r13
# 0 "" 2
# 120 "lwp.c" 1
	pushq %r14
# 0 "" 2
# 120 "lwp.c" 1
	pushq %r15
# 0 "" 2
# 120 "lwp.c" 1
	pushq %rbp
# 0 "" 2
#NO_APP
	movq	Original_stackPointer(%rip), %rax
#APP
# 121 "lwp.c" 1
	movq  %rax,%rsp
# 0 "" 2
# 122 "lwp.c" 1
	popq  %rbp
# 0 "" 2
# 122 "lwp.c" 1
	popq  %r15
# 0 "" 2
# 122 "lwp.c" 1
	popq  %r14
# 0 "" 2
# 122 "lwp.c" 1
	popq  %r13
# 0 "" 2
# 122 "lwp.c" 1
	popq  %r12
# 0 "" 2
# 122 "lwp.c" 1
	popq  %r11
# 0 "" 2
# 122 "lwp.c" 1
	popq  %r10
# 0 "" 2
# 122 "lwp.c" 1
	popq  %r9
# 0 "" 2
# 122 "lwp.c" 1
	popq  %r8
# 0 "" 2
# 122 "lwp.c" 1
	popq  %rdi
# 0 "" 2
# 122 "lwp.c" 1
	popq  %rsi
# 0 "" 2
# 122 "lwp.c" 1
	popq  %rdx
# 0 "" 2
# 122 "lwp.c" 1
	popq  %rcx
# 0 "" 2
# 122 "lwp.c" 1
	popq  %rbx
# 0 "" 2
# 122 "lwp.c" 1
	popq  %rax
# 0 "" 2
# 122 "lwp.c" 1
	movq  %rbp,%rsp
# 0 "" 2
#NO_APP
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	lwp_stop, .-lwp_stop
	.globl	lwp_set_scheduler
	.type	lwp_set_scheduler, @function
lwp_set_scheduler:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, schedule(%rip)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	lwp_set_scheduler, .-lwp_set_scheduler
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-44)"
	.section	.note.GNU-stack,"",@progbits
