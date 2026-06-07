#Implementa tu propia versión de la función strcmp de C, que compara dos 
#cadenas lexicográficamente. 

.data
string1: .asciz "I'm run"
string2: .asciz "I'm run"

.text
.global main
main:
    
    la a0, string1
    la a1, string2
    
    jal ra, strcmp
    
    li a7,10
    ecall
    
strcmp:
    lb t0, 0(a0)
    lb t1, 0(a1)
    bne t0,t1, strcmp_end
    beq t0,zero, strcmp_end
    addi a0,a0,1
    addi a1,a1,1
    
    jal x0,strcmp
strcmp_end:
    sub a0,t0,t1
    jalr ra