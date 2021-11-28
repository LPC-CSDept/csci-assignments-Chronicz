#
# Chan Hei
# Nov 27
# Quiz Question 3
# Calculate Newton's Method
# Start

	.data
n:	.float	144.0			# n value
pr1:	.asciiz	"n = "			
pr2:	.asciiz	"square root of n = "
lf:	.asciiz	"\n"

	.text
	.globl main

main:	l.s	$f1, n			# Load n
	li.s	$f2, 1.0		# x = 1...N
	li.s	$f3, 2.0		# 2 for division
	li.s	$f10, 1.0e-5		# limit
	
loop:	mov.s	$f4, $f1		# create temp($f5) = n ($f1)
	div.s	$f4, $f4, $f2		# n / x
	add.s	$f4, $f4, $f2		# x + n / x
	nop
	div.s	$f4, $f4, $f3		# x' = (x + n / x) / 2
	sub.s	$f5, $f4, $f2		# Get difference of x' - x 
	abs.s	$f5, $f5		# Get absolate value of x' - x
	c.lt.s	$f5, $f10		# Check if difference of x'- x < 0.00001
	bc1t	end			# Jump to end if true
	nop
	
	mov.s	$f2, $f4		# false 
	j	loop
	nop
	
end:	li	$v0, 4
	la	$a0, pr1
	syscall
	li	$v0, 2
	mov.s	$f12, $f1
	syscall
	li	$v0, 4
	la	$a0, lf
	syscall
	li	$v0, 4
	la	$a0, pr2
	syscall
	li	$v0, 2
	mov.s	$f12, $f4
	syscall
	li	$v0, 10
	syscall
	
# end