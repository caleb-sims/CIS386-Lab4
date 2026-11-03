# PLAN:
# assign x to $s0
# flip bits of $s0
# add 1 to $s0

.data
x: .word 37

.text
lw $s0, x		# load x into s0

nor $s0, $s0, $zero	# flip bits of s0

addi $s0, $s0, 1	# add 1