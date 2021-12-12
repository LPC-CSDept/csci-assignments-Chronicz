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
# s1 = 10 -> v0 for kernel text
# s2 = 11 -> a0 for kernel text
# lf = linefeed \n
# $t0 = high order bits 0xffff for accesing kernel space
# Start
        .kdata
s1:     .word 10
s2:     .word 11
lf      .asciiz "\n"

        .text
        .globl main
main:   mfc0    $a0, $12        # Get Status Register
        ori     $a0, 0xff11     # Enable all interrupts
        mtc0    $a0, $12        # Return enable status to status register
        lui     $t0, 0xffff     # Access Kernel Space in memory 0xffff0000
        ori     $a0, $zero, 2   # Enable Keyboard interrupt
        sw      $a0, 0($t0)     # Return Enable to Receiver Control Register

loop:   j       here            # Infinite loop
# End of File