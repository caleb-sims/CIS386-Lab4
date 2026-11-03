.data
length: .word 8
array:  .word 5, -3, 12, -40, 7, 0, 33, -8
minMsg: .asciiz "Min: "
maxMsg: .asciiz "\nMax: "

.text
li $v0, 4
la $a0, array