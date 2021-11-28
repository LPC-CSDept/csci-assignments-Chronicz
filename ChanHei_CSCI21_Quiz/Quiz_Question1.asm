#
# Chan Hei
# Nov 27
# Quiz Question 1
# Converting from Fahrenheit to Celsius
# Start

	.data
prompt:	.asciiz	"Enter Degree in Farenheit\n"
lf:	.asciiz	"Celsius: "
val1:	.float	32.0
val2:	.float	5.0
val3:	.float	9.0

	.text
	.globl main

main:	li	$v0, 4		# print prompt
	la	$a0, prompt
	syscall

	li	$v0, 5		# get user input
	syscall
	
	mtc1	$v0, $f1
	cvt.s.w	$f1, $f1	# convert user input into float value

	l.s	$f2, val1
	l.s	$f3, val2
	l.s	$f4, val3
	
	sub.s	$f1, $f1, $f2	# Fahrenheit - 32
	mul.s	$f1, $f1, $f3	# (Fahrenheit - 32) * 5
	div.s	$f1, $f1, $f4	# (Fahrenheit - 32) / 9
	
	li	$v0, 4		# print line feed "Celsius: "
	la	$a0, lf
	syscall
	
	li	$v0, 2		# print result after line feed
	mov.s	$f12, $f1	
	syscall
	
	li	$v0, 10		# End program
	syscall

# end