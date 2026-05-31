#9. Cálculo del factorial (n!) 
#a. Pide un número (simulado con una variable en memoria). 
#b. Calcula el factorial usando un bucle. 
#c. Almacena el resultado en memoria. 
#d. Revisa cómo varía el registro del contador en "Register View". 

# la única forma que se me ocurrió de implementar esto usando push y pop es haciéndolo
# recursivo en vez de un bucle común, así que esta es la implementación recursiva del
# factorial

.data
input: .word 5
output: .word 0

.text
main:
    
    lw a2, input
    jal ra, factorial
    la t0, output
    sw a0, 0(t0)
    
    li a7, 10
    ecall
    
factorial:

    addi sp,sp,-8
    sw ra, 0(sp)
    sw a2, 4(sp)
    
    addi t0,zero,2
    blt a2,t0,base_case
    
    addi a2,a2,-1
    
    jal ra, factorial
    
    lw a2, 4(sp)
    lw ra, 0(sp)
    addi sp,sp,8
    
    mul a0,a0,a2
    
    jalr ra

base_case:
    
    addi a0,zero,1
    lw ra, 0(sp)
    addi sp,sp,8
    
    jalr ra