#
# Chan Hei
# Nov 27
# Quiz Question 2
# Calculate ax^2 + bx + c
#
# Description:
# Get x,a,b,c from user input then convert them into float values
# Do the calculations with the float registers holding the values 
# Print the result
#
# Start
	.data
pr1:	.asciiz	"Calculating ax^2 + bx + c\n"
pr2:	.asciiz	"Enter a value for x: "
pr3:	.asciiz	"Enter a value for a: "
pr4:	.asciiz "Enter a value for b: "
pr5:	.asciiz	"Enter a value for c: "
pr6:	.asciiz	"Result: "
lf:	.asciiz	"\n"

	.text
	.globl main
main:	li	$v0, 4		# print title
	la	$a0, pr1
	syscall
	
	li	$v0, 4		# get x
	la	$a0, pr2
	syscall
	li	$v0, 5
	syscall
	
	mtc1	$v0, $f1	# converting x to float
	cvt.s.w	$f1, $f1
	
	li	$v0, 4
	la	$a0, lf
	syscall
	
	
	li	$v0, 4		# get a
	la	$a0, pr3
	syscall
	li	$v0, 5
	syscall
	
	mtc1	$v0, $f2	# converting a to float
	cvt.s.w	$f2, $f2
	
	li	$v0, 4
	la	$a0, lf
	syscall

	li	$v0, 4		# get b
	la	$a0, pr4
	syscall
	li	$v0, 5
	syscall
	
	mtc1	$v0, $f3	# converting b to float
	cvt.s.w	$f3, $f3
	
	li	$v0, 4
	la	$a0, lf
	syscall
	
	li	$v0, 4		# get c
	la	$a0, pr5
	syscall
	li	$v0, 5
	syscall
	
	mtc1	$v0, $f4
	cvt.s.w	$f4, $f4	# converting c to float

	li	$v0, 4
	la	$a0, lf
	syscall
	
	mul.s	$f3, $f1, $f3	# bx
	add.s	$f3, $f3, $f4	# bx+c
	mul.s	$f1, $f1, $f1	# x^2
	mul.s	$f1, $f1, $f2	# ax^2
	add.s	$f1, $f1, $f3	# ax^2 + bx + c
	
	li	$v0, 4
	la	$a0, pr6
	syscall
	li	$v0, 2
	mov.s	$f12, $f1
	syscall
	
	li	$v0, 10
	syscall
	
# end