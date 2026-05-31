#10. Fibonacci en ensamblador 
#a. Genera la secuencia de Fibonacci hasta n=10. 
#b. Guarda los valores en memoria. 

.data
fibo: .word 0,0,0,0,0,0,0,0,0,0
size: .word 10

.text
main:
    
    lw a2, size
    la a0, fibo
    
    jal ra, fibonacci
    
    li a7,10
    ecall
    
fibonacci:
    addi t2,zero,2 # counter
    addi t0,zero,0 # prev2
    sw t0,0(a0) # store prev2
    addi t1,zero,1 # prev1
    sw t1,4(a0) # store prev1
    addi a0,a0,8 # move array pointer
fibonacci_loop:
    bge t2,a2,fibonacci_loop_end
    add t3,t0,t1 # current=prev2+prev1
    sw t3,0(a0) # store current
    addi t0,t1,0 # prev2=prev1
    addi t1,t3,0 # prev1=current
    addi a0,a0,4 # move array pointer
    addi t2,t2,1 # advance counter
    
    jal x0, fibonacci_loop #loop
fibonacci_loop_end:
    jalr ra
    
    
    