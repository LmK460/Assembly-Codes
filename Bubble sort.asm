.data
vetor: .word 4,5,7,8,9,0,1,12 # declaracao array
.text
.globl Main

Main:
li $a0, 28 # quatidade de elementos do vetor a partir da posição 0. qauntidade = tamanho - tamanho int.
forext:
li $t0,0 # $t0: j=0
li $t1, 0 #troca ainda não ocorreu
forint:
lw $t2, vetor($t0) # $t3 <- A[j]
lw $t3, vetor+4($t0) # $t2 <- A[j+1]
bgt $t3, $t2, control # vetor[j] <= vetor[j+1]?
sw $t3, vetor($t0) # vetor[j] =vetor[j+1] trocando valores
sw $t2, vetor+4($t0) #vetor[j+1] = vetor[j]
li $t1, 1 # troca ocorreu
control:
add $t0, $t0, 4 #proximo elemento do array (next array element)
blt $t0,$a0 forint 
bnez $t1, forext 

li $v0, 10 #codigo de fim de execução
syscall
