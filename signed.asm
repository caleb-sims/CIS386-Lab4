# PLAN:
# if array[i] < min -> newMin
# else if array[i] < max == 0 -> newMax
# loop until i == length

.data
i: .word 0
length: .word 8
array:  .word 5, -3, 12, -40, 7, 0, 33, -8
minMsg: .asciiz "Min: "
maxMsg: .asciiz "\nMax: "

.text
lw $s0, i
lw $s1, length
lw $s2, array

sll $t0, $s0, 2				# t0 = s0/i * 4
add $s3, $s2, $t0				# s3(min) = s2[t0] = array[0]
add $s4, $s3, $zero				# s4(max) = s3(min)
addi $s0, $s0, 1				# i++

loop:
	sll $t0, $s0, 2			# t0 = s0/i * 4
	add $t1, $s2, $t0			# t1 = address of array at t0
	slt $t2, $t1, $s3			# if array[i] < min, t2 = 1
	beq $t2, 1, newMin			# if t2 == 1, branch to newMin
	slt $t2, $s4, $t1			# if max < array[i], t2 = 1
	beq $t2, 1, newMax			# if t2 == 1, branch to newMax
	j end
	
newMin:
	add $s3, $t1, $zero			# min = array[i]
	j end
	
newMax:
	add $s4, $t1, $zero			# max = array[i]
	j end
	
end:
	addi $s0, $s0, 1			# i++
	beq $s0, $s1, done			# if i == length, done.
	j loop					# reloop

done:
	li $v0, 4				# print "Min: "
	la $a0, minMsg
	syscall
	
	li $v0, 1				# print min
	la $a0, ($s3)
	syscall
	
	li $v0, 4				# print "\nMax: "
	la $a0, maxMsg
	syscall
	
	li $v0, 1				# print max
	la $a0, ($s4)
	syscall
