# PLAN:
# check if array[i] == 0
# if no: i++ and jump to loop
# if yes: print "Count: i"

.data
array: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 0
i: .word 0
msg: .asciiz "Count: "

.text
lw $s1, array				# load array address into s1
lw $s0, i				# load i into s0

loop:
	add $t0, $s0, $zero		# save i into t0
	sll $t0, $t0, 2		# mult t0 by 4
	add $t1, $s1, $t0		# t1 = array[i]
	beq $t1, 0, done		# if array[i] == 0, done
	addi $s0, $s0, 1		# i++
	j loop
	
done:
	li $v0, 4			# prints "Count: "
	la $a0, msg
	syscall
	
	li $v0, 1			# prints i
	move $a0, $s0
	syscall