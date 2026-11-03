# B[3] = A[i-j] + A[i+j]

	.data
length_A: .word 5
A:  .word 5, 3, 12, 40, 7

length_B: .word 4
B: .word 1, 2, 3, 4

i: .word 3
j: .word 1

msg: .asciiz "Count: "

.text
lw $s0, i		# s0 = i
lw $s1, j		# s1 = j

la $s2, A		# s2 = &A
la $s3, B		# s3 = &B

sub $t0, $s0, $s1	# t0 = s0 - s1 = i - j
add $t1, $s0, $s1	# t1 = s0 + s1 = i + j

			# multiply by 4
sll $t0, $t0, 2	# t0 = t0 * 4
sll $t1, $t1, 2	# t1 = t1 * 4

add $t0, $t0, $s2	# find the addresses of the words at A[i-j] and A[i+j]
add $t1, $t1, $s2

lw $t0, 0($t0)	# load words at the addresses
lw $t1, 0($t1)

add $t2, $t0, $t1	# t2 = A[i-j] + A[i+j]

sw $t2, 12($s2)	# store t2 in B[3]


