# Nhap so nguyen n. TInh n!

.data
	msg_input: .asciiz "Nhap so nguyen n: "
	msg_result: .asciiz "Ket qua la: "
.text
	la $a0, msg_input
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0
	
	# Hien ket qua
	la $a0, msg_result
	li $v0, 4
	syscall
	
	# Tinh ket qua
	
	move $a0, $s0
	jal factorial
	
	# Hien ket qua tinh duoc
	move $a0, $v0
	li $v0, 1
	syscall
	
	# Ket thuc chuong trinh
	li $v0, 10
	syscall
	
factorial:
	slti $t0, $a0, 2
	beq $t0, $zero, RECURSIVE
	li $v0, 1
	jr $ra
	
RECURSIVE:
	addi $sp, $sp, -8
	# Luu gia tri cua $a0 va $ra vao Stack
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	addi $a0, $a0, -1
	jal factorial
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	mul $v0, $a0, $v0
	addi $sp, $sp, 8
	jr $ra
	# Ket thuc ham factorial