# Nhap hai so nguyen
.data
	msg_1: .asciiz "Nhap so thu nhat:"
	msg_2: .asciiz "\nNhap so thu hai:"
	msg_sum: .asciiz "\nTong la:"
	msg_sub: .asciiz "\nHieu la:"
	msg_prod: .asciiz "\nTich la:"
.text
	# Nhap so thu nhat
	la $a0, msg_1
	li $v0, 4
	syscall
	
	# Nhap so nguyen
	li $v0, 5
	syscall
	
	# Luu vao $s1
	move $s1, $v0
	
	# Nhap so thu hai
	la $a0, msg_2
	li $v0, 4
	syscall
	
	# Nhap so nguyen
	li $v0, 5
	syscall
	
	# Luu vao s2
	move $s2, $v0
	
	# Tinh tong
	la $a0, msg_sum
	li $v0, 4
	syscall
	
	li $v0, 1
	add $a0, $s1, $s2
	syscall
	
	# Tinh hieu
	la $a0, msg_sub
	li $v0, 4
	syscall
	
	li $v0, 1
	sub $a0, $s1, $s2
	syscall
	
	# Tinh tich
	la $a0, msg_prod
	li $v0, 4
	syscall
	
	li $v0, 1
	mul $a0, $s1, $s2
	syscall
	
	# Ket thuc chuong trinh
	li $v0, 10
	syscall