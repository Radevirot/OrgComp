.data
valor: .word -5
flag: .word 0 # -1 si es negativo, 0 si es 0 y 1 si es positivo

.text
main:
    
    lw a1, valor
    
    jal ra, check_sign
    
    li a7,10
    ecall
    
check_sign:
    bge a1,zero,mayor_o_igual
    addi a0,zero,-1
    jal x0,check_sign_end
mayor_o_igual:
    beq a1,zero,igual
    addi a0,zero,1
    jal x0,check_sign_end
igual:
    addi a0,zero,0
check_sign_end:
    la t0, flag
    sw a0, 0(t0)
    jalr ra