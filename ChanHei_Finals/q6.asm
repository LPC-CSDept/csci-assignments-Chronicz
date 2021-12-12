#
# Student Name: Chan Hei
# File Name: q6.asm
# Start Date: Dec 11(SAT)
# CS21 Finals Question 2
#
# Decription:
# Take the user character and print it in a console until 'q' is typed
# Make the interrupt handler(Kernel text program)
#
# Elaboration:
#
# Declaration:
# s1 = v0 for kernel text
# s2 = a0 for kernel text
# lf = linefeed \n
#
# Start
        .kdata
s1:     .word 10
s2:     .word 11
lf      .asciiz "\n"

# End of File