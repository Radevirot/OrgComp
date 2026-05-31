#3. Calcula la suma de todos los elementos de un array. 
#.data 
#array: .word 3, 7, 2, 9, 5, 1 
#length: .word 6 
#result: .word 0 
#.text 
# Completa la función suma_array 

.data 
array: .word 3, 7, 2, 9, 5, 1 
length: .word 6 
result: .word 0 

.text
main:
    
    la a1, array
    lw a2, length
    
    jal ra,suma_array
    
    li a7,10
    ecall
    
suma_array:
    addi t0,zero,0 #counter
    addi a0,zero,0 #accumulator (return value)
suma_array_loop:
    bge t0,a2,suma_array_loop_end
    lw t3,0(a1)
    add a0,a0,t3
    addi a1,a1,4
    addi t0,t0,1
    jal x0,suma_array_loop
suma_array_loop_end:
    la t3,result
    sw a0,0(t3)
    jalr ra