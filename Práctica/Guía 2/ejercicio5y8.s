.data
valor1: .word 2
valor2: .word 4
mayor: .word 0

.text
main:
    
    lw a1, valor1
    lw a2, valor2
    
    jal ra, obtener_mayor
    
    li a7,10
    ecall
    
obtener_mayor:
    bge a1,a2,v1mayorv2
    addi a0,a2,0
    jal x0,obtener_mayor_end
v1mayorv2:
    addi a0,a1,0
obtener_mayor_end:
    la t0, mayor
    sw a0, 0(t0)
    jalr ra