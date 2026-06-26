.option norelax
.global _start
.section .text
_start:
	li a0, 0
	la a1, x
	li a2, 1
	li a7, 63
	ecall

	li a0, 0
	la a1, y
	li a2, 1
	li a7, 63
	ecall
	
		
	la t0, x
	lb a3, 0(t0)
	addi a3, a3, -48

	la t0, y
	lb a4, 0(t0)
	addi a4, a4, -48

	add a5, a3, a4
	
	addi a5, a5, 48
	la t0,x 
	sb a5, 0(t0)

	li a0, 1
	la a1, x
	li a2, 1
	li a7, 64
	ecall

	li a0, 2
	li a7, 93
	ecall

.section .data
x: .byte 0
y: .byte 0

