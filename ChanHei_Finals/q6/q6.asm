#
# Student Name: Chan Hei
# File Name: q6.asm
# Start Date: Dec 11(SAT)
# Finish Date: Dec 11(SAT)
# CS21 Finals Question 2
#
# Decription:
# Take the user character and print it in a console until 'q' is typed
# Make the interrupt handler(Kernel text program)
#
# Elaboration:
# Enable all interrupts by modifying Status Register
# Then Enable all keyboard interrupts with Receiver Control Register
# Set up a infinite loop
# Get Exception Code and process I/O
# Get user input with Receiver Data register
# Print all input except 'q'
# Reset registers after each input
# If User enter 'q' then end program
#
# Declaration:
# s1 = 10 -> v0 for kernel text
# s2 = 11 -> a0 for kernel text
# $t0 = high order bits 0xffff for accesing kernel space
#
# Start
        .kdata
s1:     .word 10
s2:     .word 11

        .text
        .globl main
main:   mfc0    $a0, $12        # Get Status Register
        ori     $a0, 0xff11     # Enable all interrupts
        mtc0    $a0, $12        # Return enable status to status register
        lui     $t0, 0xffff     # Access Kernel Space in memory 0xffff0000
        ori     $a0, $zero, 2   # Enable Keyboard interrupt
        sw      $a0, 0($t0)     # Return Enable to Receiver Control Register

loop:   j       loop            # Infinite loop
        nop

        .ktext  0x80000180      # Kernel text
        sw      $v0, s1         # Kernel Register
        sw      $a0, s2         # Kernel Register

        mfc0    $k0, $13        # Access Cause Register
        srl     $a0, $k0, 2     # Get ExecuteCode Field
        andi    $a0, $a0, 0x1f  # Get exception ExecuteCode
        bnez    $a0, reset      # Only process I/O when exception code is not 0
        nop

        lui     $v0, 0xffff     # Access Kernel Space
        lw      $a0, 4($v0)      # Get input into $a0 with Receiver Control Register at 0xffff0004
        bne     $a0, 113, print # print input except 'q'
        nop
        li      $v0, 10         # End program when q is entered
        syscall

print:  li      $v0, 11         # print character
        syscall
    
reset:  lw  $v0, s1             # Reset $v0
        lw  $a0, s2             # Reset $a0
        mtc0    $zero, $13      # Clear Cause Register
        mfc0    $k0, $12        # Set Status registers
        ori     $k0, 0x11       # Enable interrupts
        mtc0,   $k0, $12        # Return to Status register
        eret                    # return to epc
# End of File