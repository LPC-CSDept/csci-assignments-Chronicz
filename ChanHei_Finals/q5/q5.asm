#
# Student Name: Chan Hei
# File Name: q5.asm
# Start Date: Dec 11(SAT)
# Finish Date: Dec 11(SAT)
# CS21 Finals Question 1
#
# Description:
# Take the 3 digits through the MM I/O
# Make the real decimal value for the 3 digit input, e.g, if the user type 1, 2, and 3. Print 123(decimal) by the syscall
#
# Elaboration:
# We use memory mapped registers for MMIO.
# The registers I am using here is the Receiver Control Register and Receiver Data Register.
# The ready bit/LSB of the Receiver Control Register shows when it is ready to get input character
# The Receiver Data Register will read the input into the low order 8 bit of the register
# 
# Declaration:
# $t0 = counter, $t1 = digit holder, $t2 = 0  xffff, $t3 = Receiver Control, $s0 = input, s1 = total
# $t0 = $t0-1 after each input and calculation until 0
# $t1 = $t1/10 after each input for getting the correct digit place
# $t2 = Set the high order 16 bit of register to ffff to access kernel space
# $t3 = Receiver Control Register located at 0xffff0000, Receiver Data Register at 0xffff0000+4= 0xffff0004
# $s0 = $s0*$t1 eg. (1)3 * 100 = 300 (2) 5 * 10 = 50 (3) 7 * 1 = 7
# $s1 = $s1+$s0 eg. 300 + 50 + 7 = 357
#
# Start
    .data
count:  .word   3

    .text
    .globl main
main:   lw  $t0, count              # Initiate Input Counter
        ori $t1, $zero, 100
        lui $t2, 0xffff             # Load Receiver Control Register
poll:   lw  $t3, 0($t2)
        andi    $t3, $t3, 0x0001    # Check if Receiver control Register is ready, ready bit/LSB = 1?
        beq $t3, $zero, poll        # Polling until ready bit is 1
        nop
        lw  $s0, 4($t2)             # Read with Receiver Data Register

        sub $s0, $s0, 48            # Subtract '0' to get digit in decimals
        sub $t0, $t0, 1             # Subtract Input Counter by 1

        mul $s0, $s0, $t1           # Move value into the correct digit
        add $s1, $s1, $s0           # Add the current input into total
        beq $t0, $zero, print       # When Input Counter = 0, go to print
        nop
        div $t1, $t1, 10            # Move to the next digit
        b   poll                    # Proceed to next input
        nop

print:  move    $a0, $s1            # Print Result
        li  $v0, 1
        syscall

        li  $v0, 10
        syscall
# End of File