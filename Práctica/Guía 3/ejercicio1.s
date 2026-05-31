# 1. Implementa una función que intercambie dos valores usando solo el stack. 
# Entrada: a0 = valor1, a1 = valor2 
# Salida: a0 = valor2, a1 = valor1 
# intercambiar: 
# ¡Implementa usando push/pop! 
# ret

.data

.text
main:
    
    addi a0,zero,2
    addi a1,zero,5
    
    jal ra, intercambiar
    
    li a7,10
    ecall
    
intercambiar:
    addi sp,sp,-4
    sw a0, 0(sp)
    addi a0,a1,0
    lw a1, 0(sp)
    addi sp,sp,4
    jalr ra