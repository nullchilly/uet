# Viet xau "Hello World" ra man hinh
.data
	msg: .asciiz "Hello World!"
.text
	# Viet xau ra man hinh
	la $a0, msg
	li $v0, 4
	syscall
	
	# Ket thuc
	li $v0, 10
	syscall