#5. Dado un código funcional que suma un arreglo, aplícale técnicas de 
#optimización. 
#Código Base (Ineficiente): 
# Suma los elementos de un arreglo 
#la t0, array 
#li t1, 0    # i = 0     
#li a0, 0      # sum = 0   
#li t2, 1000     # length 
#loop: 
#bge t1, t2, end 
#slli t3, t1, 2 
#add t4, t0, t3 
#lw t5, 0(t4) 
#add a0, a0, t5 
#addi t1, t1, 1 
#j loop
#end:

# - voy a cargar el address del último elemento y usarlo para la
# condición de corte
# - voy a avanzar el address inicial en vez de calcular el address
# en base a un índice
# - reemplazo li por addi
# - loop unrolling, trabajo 2 elementos en vez de 1, no voy a
# hacer el edge case para arrays de longitud impar, asi que solo
# sirve para pares

.data
array: .word 10,2,5,3,12,4 #suponer 1000 elementos
    
.text
.global main
main:
la t0, array 
addi t1,zero, 1000     # length 
slli t1,t1,2
addi a0,zero, 0     # sum = 0
add t1,t0,t1  

loop: 
    bge t0, t1, end 

    lw t2, 0(t0)
    lw t3, 4(t0)
    addi t0, t0, 8
    add a0, a0, t2
    add a0 ,a0, t3
    jal x0, loop 
end:
    li a7,10
    ecall