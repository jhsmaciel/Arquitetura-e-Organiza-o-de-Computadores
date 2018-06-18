.data
	msg1: .asciiz "\n Digite um valor entre 10 e 10000, para ser verificado se eh palindromo ou nao: "
	msg2: .asciiz "\n O numero eh palindromo."
	msg3: .asciiz "\n O numero nao eh palindromo e o palindromo mais proximo é : "
.text
main:
	
	#Receber um número entre 10 e 10000, verificar se é palindromo, caso não for, mostre o mais próximo.
	
	add $t1, $zero, $zero
	add $t2, $zero, $zero
	add $t3, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
	add $t7, $zero, $zero
	add $v0, $zero, $zero
	add $t9, $zero, $zero
	
	enquanto:
	li $v0, 4   		
	la $a0, msg1
	syscall	
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	add $t4, $t1, $zero
	
	ble $t1, 10, enquanto
	bge $t1, 10000, enquanto
	
	enquantoinvert:
	
	mul $t2, $t2, 10
	rem $t3, $t1, 10
	add $t2, $t2, $t3
	sub $t1, $t1, $t3
	div $t1, $t1, 10
	
	bgt $t1, 0, enquantoinvert
	
	beq $t4, $t2, se #T4 nao esta invertido, usar no senao!
	j senao
	
	se:
	li $v0, 4
	la $a0, msg2
	syscall
	
	j semfim
	
	senao:	

	blt $t4, 1000, sedois #Se menor
	j senaodois
	sedois:
	
	sub $t1, $t4, 10		 #113
	
	enquantodez:				#enquanto ble i<=10
			
	add $t2, $zero,$zero #Invertido é o t2
	add $t6, $t1, $zero	 #n2	
	
	enquanton:
	
	mul $t2, $t2, 10
	rem $t3, $t6, 10
	add $t2, $t2, $t3
	sub $t6, $t6, $t3
	div $t6, $t6, 10
	
	bgt $t6, 0, enquanton   #Se maior
 	
	beq $t1, $t2, setres  #Se igual
	
	j senaotres
	
	setres:
	
	add $t7, $t1, $zero	#t7 é o b
		
	senaotres:
	
	add $t1, $t1, 1
	add $t9, $t9, 1
	
	ble $t9, 10, enquantodez #Se menor ou igual
	
	sub $s5, $t4, $t7 
	
	ble $s5, 5, sequatro #Se menor ou igual
	
	j senaoquatro
	
	sequatro:
	
	li $v0, 4   		
	la $a0, msg3
	syscall
	li $v0, 1   		
	add $a0, $t7, $zero
	syscall
	
	j fimsequatro
	
	senaoquatro:
	
	add $t7, $t7, 10 
	li $v0, 4   		
	la $a0, msg3
	syscall
	li $v0, 1   		
	add $a0, $t7, $zero
	syscall
	
	fimsequatro:
	
	j semfim
	
	senaodois:
	
	sub $t1, $t4, 110		 # quatro digitos
	
	enquanto10:				#enquanto ble i<=110
			
	add $t2, $zero,$zero #Invertido é o t2
	add $t6, $t1, $zero	 #n2	
	
	enquantone:
	
	mul $t2, $t2, 10
	rem $t3, $t6, 10
	add $t2, $t2, $t3
	sub $t6, $t6, $t3
	div $t6, $t6, 10
	
	bgt $t6, 0, enquantone   #Se maior
 	
	beq $t1, $t2, se3  #Se igual
	
	j senao3
	
	se3:
	
	add $t7, $t1, $zero	#t7 é o b
		
	senao3:
	
	add $t1, $t1, 1
	add $t9, $t9, 1
	
	ble $t9, 110, enquanto10 #Se menor ou igual
	
	sub $s5, $t4, $t7 
	
	ble $s5, 55, se4 #Se menor ou igual
	
	j senao4
	
	se4:
	
	li $v0, 4   		
	la $a0, msg3
	syscall
	li $v0, 1   		
	add $a0, $t7, $zero
	syscall
	
	j fimse4
	
	senao4:
	
	add $t7, $t7, 110 
	li $v0, 4   		
	la $a0, msg3
	syscall
	li $v0, 1   		
	add $a0, $t7, $zero
	syscall
	
	fimse4:
	
	semfim:
