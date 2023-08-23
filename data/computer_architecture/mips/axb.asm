# Giai va bien luan phuong trinh ax + b = 0
.data
	msg_a: .asciiz "Nhap a = "
	msg_b: .asciiz "Nhap b = "
	msg_vsn: .asciiz "Phuong trinhf co vo so nghiem."
	msg_vn: .asciiz "Phuong trinh vo nghiem."
	msg_cn: .asciiz "Phuong trinh co nghiem x = "
	MINUS_ONE: .float -1
.text
	# Nhap a
	la $a0, msg_a
	li $v0, 4
	syscall
	
	li $v0, 6
	syscall
	
	# Luu vao $f1
	mov.s $f1, $f0
	
	# Nhap b
	la $a0, msg_b
	li $v0, 4
	syscall
	
	li $v0, 6
	syscall
	
	# Luu vao $f2
	mov.s $f2, $f0
	
	# Giai va bien luan chuong trinh
	# Gan cho $f3 = 0
	sub.s $f3, $f3, $f3
	
	# if a == 0
	c.eq.s $f1, $f3
	bc1f ELSE_A
	
	# if b == 0
	c.eq.s $f2, $f3
	bc1f ELSE_B
	la $a0, msg_vsn
	li $v0, 4
	syscall
	j EXIT
ELSE_B:
	la $a0, msg_vn
	li $v0, 4
	syscall
	j EXIT
ELSE_A:
	la $a0, msg_cn
	li $v0, 4
	syscall
	div.s $f12, $f2, $f1
	# Gan $f4 = -1
	l.s $f4, MINUS_ONE
	mul.s $f12, $f12, $f4
	li $v0, 2
	syscall
EXIT:
	# Ket thuc chuong trinh
	li $v0, 10
	syscall