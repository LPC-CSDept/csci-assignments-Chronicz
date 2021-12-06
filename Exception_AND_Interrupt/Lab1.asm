#
# Chan Hei
# Exception and Interruption
# Lab1
#
    .data
pr1:    .asciiz "\nElapsed Time = "

    .text
main:   li  $a3, 0xffff0000
        li  $s1, 2
        sw  $s1, 0($a3)
        li  $s1, 0x0000ffff
        mtc0    $s1, $12
        li  $s1, 0

countdown:
        li  $s0, 1000000

loop:   addi    $s0, $s0, -1
        bnez    $s0, waitloop

        li  $v0, 4
        la  $a0, pr1
        syscall

        addi    $s1, $s1, 5
        move    $a0, $s1
        li  $v0, 1
        syscall

        addi    $t0, $s1, -60
        bnez    $t0, countdown
        li  $v0, 10
        syscall
