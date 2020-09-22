  .data

mensagem:	.asciiz "Digite um numero\n"
mensagem1:	.asciiz "\nAntecessor do numero\n"
mensagem2:	.asciiz "\nSucessor do numero\n"
numero: 	.word 10
antecessor:	.word 10
sucessor: 	.word 10
		
	    .text

main: addi $v0, $zero, 4		# imprime mensagem
      la $a0, mensagem
      syscall

      addi $v0, $zero, 5 		# lê inteiro
      syscall
      sw $v0, numero($zero)		# grava numero que foi lido no teclado na memória
      addi $t2, $v0, 0			# $t2 = numero que foi lido


      addi $t0, $t2, -1		# calcula antecessor
      sw $t0, antecessor($zero)	# grava antecessor

      addi $v0, $zero, 4		# imprime mensagem1
      la $a0, mensagem1
      syscall

      addi $v0, $zero, 1		# imprime inteiro
      add $a0, $zero, $t0 		# argumento = antecessor
      syscall


      addi $t1, $t2, 1			# calcula sucessor
      sw $t1, sucessor($zero)		# grava sucessor

      addi $v0, $zero, 4		# imprime mensagem2
      la $a0, mensagem2
      syscall

      addi $v0, $zero, 1		# imprime inteiro
      add $a0, $zero, $t1 		# argumento = sucessor
      syscall


      jr $ra