#Implemente un programa que multiplique los primeros 4 números enteros 
#positivos. (Empleando bucles) 

#observa en el “Pipeline View” como se ejecutan los saltos, 
#analiza el flujo de ejecución y responde
# ¿Cómo afecta el salto condicional? 
# ¿Cuántos ciclos tarda en ejecutarse un bucle?


# voy a implementar esta solución con subrutinas anidadas, una que implementa el factorial
# y otra que hace la multiplicación como sumas consecutivas.
# para hacer andar esto bien vamos a tener que usar el stack, porque necesitamos guardar
# el return address de fact a main antes de entrar en mult

.data

.text
main:
    
    addi a7,x0,8 #fact size
    
    jal ra, fact
    
    li a7,10
    ecall
    
fact:
    # acá me guardo el return address al main usando el stack
    addi sp,sp,-4 #reservo 32 bits
    sw ra, 0(sp) #guardo el return address
    addi a7,a7,1
    addi t0,x0,1 #contador
    addi a1,x0,1 #acumulador
fact_loop:
    bge t0,a7,fact_loop_end
    addi a4,t0,0
    addi a3,a1,0
    
    jal ra, mult
    
    addi a1,a0,0
    
    addi t0,t0,1
    
    jal x0,fact_loop
fact_loop_end:
    addi a0,a1,0
    # cargo el return address, libero la pila y vuelvo al main
    lw ra,0(sp)
    addi sp,sp,4
    jalr ra
    
    
mult:
    addi t1,x0,0 #contador
    addi a0,x0,0 #acumulador
mult_loop:
    bge t1,a4,mult_loop_end
    add a0,a0,a3
    addi t1,t1,1
    jal x0,mult_loop
mult_loop_end:
    jalr ra
    