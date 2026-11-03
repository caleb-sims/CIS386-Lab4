# NUM & 0011 = 00XX; if XX == 0, NUM is divisible by 4.

.data
length: .word 10
array: .word 1, 2, 4, 8, 9, 11, 12, 16, 21, 24
count: .word 0
i: .word 0

.text
lw $s0, i				# s0 = i
lw $s1, length			# s1 = length
lw $s2, count				# s2 = count
lw $s3, array				# s3 = address of array

loop:
	sll $t0, $s0, 2		# t0 = s0 * 4
	add $t1, $s3, $t0		# t1 = s3[t0] = array[i]
	andi $t2, $t1, 3		# t2 = t1 AND 0011
	beq $t2, 0, done		# if t2 == 0, done
	addi $s0, $s0, 1		# i++
	addi $s2, $s2, 1		# count++
	beq $s0, $s1, done		# if i == length, done
	j loop
	
done:
	lw $v0, 1			# print count
	move $a0, $s2
	syscall