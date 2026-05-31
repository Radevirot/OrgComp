#9. Cálculo del factorial (n!) 
#a. Pide un número (simulado con una variable en memoria). 
#b. Calcula el factorial usando un bucle. 
#c. Almacena el resultado en memoria. 
#d. Revisa cómo varía el registro del contador en "Register View". 

# me voy a permitir usar mul en este ejercicio para no tener que hacer una subrutina adentro
# de otra, y que quede bien claro el bucle para el cálculo del factorial

# mi implementación usa un bucle ascendente, se puede hacer uno descendente y ahorrar registros.

.data
input: .word 5
output: .word 0

.text
main:
    
    lw a2, input
    jal ra, factorial
    
    li a7, 10
    ecall
    
factorial:
    addi t1,a2,1 #tope del loop (le sume uno porque el counter arranca en 1)
    addi t0,zero,1 #counter (needs to start at 1 to multiply)
    addi a0,zero,1 #valor de retorno (multiplicative accumulator)
factorial_loop:
    bge t0,t1,factorial_loop_end
    mul a0,t0,a0
    addi t0,t0,1
    jal x0,factorial_loop
factorial_loop_end:
    la t0, output
    sw a0, 0(t0)
    jalr ra