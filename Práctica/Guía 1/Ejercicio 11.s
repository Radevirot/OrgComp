# Multiplicar dos números usando sumas repetidas (ej: 3 * 4 = 3 + 3 + 3 + 3). 

addi t0,x0,25
addi t1,x0,10
addi t2,x0,0 #acumulador
addi t3,x0,0 #contador


while:
    beq t3,t0,end
    add t2,t2,t1
    addi t3,t3,1
    jal x0,while
    
end:
    jal x0,end