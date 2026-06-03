#4. Encuentra el valor máximo en un array de enteros. 
# Entrada: a0 = dirección array, a1 = longitud 
# Salida: a0 = valor máximo 
#encontrar_max: 
# ¡Implementa la búsqueda! 
#ret


.data
array: .word 8,20,2,50,3
size: .word 5

.text
main:
    
    la a0,array
    lw a1,size
    
    jal ra,encontrar_max
    
    li a7,10
    ecall

encontrar_max:
    addi t0,zero,0 #contador
    addi t1,zero,0 #max
encontrar_max_loop:
    bge t0,a1,encontrar_max_loop_end
    lw t2,0(a0)
    addi t0,t0,1
    addi a0,a0,4
    bgt t2,t1,mayor_encontrado
    
    jal x0,encontrar_max_loop
mayor_encontrado:
    addi t1,t2,0
    jal x0,encontrar_max_loop
encontrar_max_loop_end:
    addi a0,t1,0
    jalr ra




