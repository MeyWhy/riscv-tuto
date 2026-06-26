.option norelax
.global _start
.section .text
_start:	
	li a0, 1
	la a1, s
	li a2, 8
	li a7, 64
	ecall 


	li a0, 0
	la a1, input
	li a2, 8
	li a7, 63
	ecall
	
	
	li a0, 1
	la a1, input
	li a2, 8
	li a7, 64
	ecall 

	
	li a0, 2
	li a7, 93
	ecall
.section .data
hello: .ascii "Biseaute"
input: .ascii "        "
s: .ascii "________"
