#2. Escribe una función recursiva que calcule el factorial de un número. 
# Entrada: a0 = n 
# Salida: a0 = n! 
#factorial: 
# Caso base: si n == 0, retornar 1 
# Caso recursivo: n * factorial(n-1) 
#ret 


.data

.text
main:
    
    addi a0,zero,4
    
    jal ra, factorial
    
    li a7,10
    ecall

factorial:
    addi t0,zero,2
    
    addi sp,sp,-8
    sw ra,0(sp)
    sw a0,4(sp)
    
    blt a0,t0,caso_base
    
    addi a0,a0,-1
    
    jal ra, factorial
    
    lw t1,4(sp)
    lw ra,0(sp)
    addi sp,sp,8
    
    mul a0,a0,t1
    
    jalr ra
    
caso_base:
    addi a0,zero,1
    lw ra, 0(sp)
    addi sp,sp,8
    jalr ra