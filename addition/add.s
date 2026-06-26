.option norelax
.global _start
.section .text
_start:
	la t0, x
	lb a3, 0(t0)
	la t0, y
	lb a4, 0(t0)
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
x: .byte 1
y: .byte 6
d: .byte
