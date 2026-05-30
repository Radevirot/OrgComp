.data
array: .word 1,2,3,4,10

.text
main:

    la a0,array #cargo la dir en memoria del primer elemento como parametro para la funcion
    addi a1,x0,5 # longitud

    jal ra, recorrer_arreglo
    
    li a7,10
    ecall
    
recorrer_arreglo:
    addi t1,x0,0 # contador
    addi t2,x0,0 # acumulador
    
bucle_recorrer_arreglo:
    
    bge t1,a1,fin_bucle_recorrer_arreglo
    lw t3, 0(a0)
    add t2,t2,t3
    
    addi a0,a0,4 # me muevo al siguiente elemento (4 bytes)
    addi t1,t1,1 # sumo 1 contador
    jal x0,bucle_recorrer_arreglo
    
fin_bucle_recorrer_arreglo:
    addi a0,t2,0
    jalr ra