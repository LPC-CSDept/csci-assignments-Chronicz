#
# Student Name: Chan Hei
# File Name: q5.asm
# Start Date: Dec 11(SAT)
# CS21 Finals Question 1
#
# Description:
# Take the 3 digits through the MM I/O
# Make the real decimal value for the 3 digit input, e.g, if the user type 1, 2, and 3. Print 123(decimal) by the syscall
# $t0 = counter, $t1 = digit holder, $t2 = 0xffff, $t3 = Receiver Control, 
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
        andi    $t3, $t3, 0x0001    # Check if Receiver control Register is ready, ready = 1?
        beq $t3, $zero, poll        # Polling until ready bit is 1
        nop
        lw  $s0, 4($t2)             # Read with Receiver Data Register

        sub $s0, $s0, 48            # Subtract '0' to get digit in decimals
        sub $t0, $t0, 1             # Subtract Input Counter by 1

        mul $s0, $s0, $t1           # Move value into the correct digit
        add $s1, $s1, $s0           # Add the current input into total
        div $t1, $t1, 10           # Move to the next digit
        beq $t0, $zero, print       # When Input Counter = 0, go to print
        nop
        b   poll                    # Proceed to next input
        nop

print:  move    $a0, $s1            # Print Result
        li  $v0, 1
        syscall

        li  $v0, 10
        syscall
# End of File