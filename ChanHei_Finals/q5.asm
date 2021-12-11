#
# Student Name: Chan Hei
# File Name: q5.asm
# Start Date: Dec 11(SAT)
# CS21 Finals Question 1
#
# Description:
# Take the 3 digits through the MM I/O
# Make the real decimal value for the 3 digit input, e.g, if the user type 1, 2, and 3. Print 123(decimal) by the syscall
#
# Start
    .data
count:  .word   3

    .text
    .globl main
main:   lw  $t0, count          # initiate input counter

# End of File