.data
suma: .word 0
resta: .word 0
multi: .word 0
divi: .word 0

.text
main:
    addi t0,x0,8
    addi t1,x0,2

    add t2,t0,t1
    la t4,suma
    sw t2,0(t4)

    sub t2,t0,t1
    la t4,resta
    sw t2,0(t4)

    addi a0,x0,0
    addi t3,x0,0
    add a2,x0,t0
    add a3,x0,t1
    
    jal ra,multiplicar
    la t4,multi
    sw a0,0(t4)

    div t2,t0,t1
    la t4,divi
    sw t2,0(t4)

    li a7, 10
    ecall

multiplicar:
    beq t3,a2,fin_multi
    add a0,a0,a3
    addi t3,t3,1
    jal x0,multiplicar
fin_multi:
    jalr ra