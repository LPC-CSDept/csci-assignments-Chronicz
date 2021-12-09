.data     # Data declaration section    
 msg1:     .asciiz     "  \  n Elapsed Time = "     
 		
 		.text     
 main:     # Start of code section     
 		
		 li     $a3, 0xffff0000 	# Base address of I/O     
 		li     $s1, 2     		# 0x00000002     
		sw     $s1, 0($a3)     	# Enable Keyboard Interrupt ; Receiver Control Register     

		li     $s1, 0x0000ffff 	# Mask to enable all exceptions     
		mtc0   $s1, $12     	# Store enable bits in Status register  


		li     $s1, 0     		# Time counter  


countdown:     
		li     $s0, 1000000     # Time Factor     

waitloop:     
 		addi     $s0, $s0, -1   
		bnez     $s0, waitloop  # time waste for 1,000,000 instruction time

		li    	 $v0, 4     	# Print message  ; Make a breakpoint here and run  
		la    	 $a0, msg1     
		syscall     
		
		addi     $s1, $s1, 5     	 
		move     $a0, $s1     
		li     	 $v0, 1     
		syscall     			# Print amount     

		addi     $t0, $s1, -60     # At the 12th try, exit.
		bnez     $t0, countdown     
		
		
		li     	 $v0, 10     
		syscall