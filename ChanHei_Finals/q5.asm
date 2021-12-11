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
main:   lw  $t0, count              # Initiate Input Counter
        ori $t1, $zero, 10
        lui $t1, 0xffff             # Load Receiver Control Register
poll:   lw  $t2, 0($t1)
        andi    $t2, $t2, 0x0001    # Check if Receiver control Register is ready, ready = 1?
        beq $t2, $zero, poll        # Polling until ready bit is 1
        nop
        lw  $s0, 4($t1)             # Read with Receiver Data Register

        sub $s0, $s0, 48            # Subtract '0' to get digit in decimals
        sub $t0, $t0, 1
        beq $t0, $zero, print
print:  move    $a0, $s1
        li  $v0, 1
        syscall

        
    

# End of File