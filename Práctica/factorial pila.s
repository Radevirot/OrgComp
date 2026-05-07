.data
#Nombre: .tipo valor1, valor2,...
argumento: .word 7
str1: .string "El factorial de: "
str2: .string " es "

.text
main:
    lw a0, argumento #load desde el segmeto de datos
    jal ra, fact #Llamar funci n
    mv a1, a0
    lw a0, argumento
    jal ra, printResult
    li a7, 10
    ecall
    
fact:
    addi sp, sp, -8 #Para guardar argumento y ra
    sw ra, 0(sp)
    sw a0, 4(sp)
    addi t0, a0, -1
    bge t0, zero, nfact
    
    addi a0, zero, 1
    addi sp, sp, 8
    jalr ra
       
nfact:
    addi a0, a0, -1
    jal ra, fact
    
    addi t1, a0, 0
    lw a0, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    mul a0, a0, t1
    ret
    
printResult:
    mv t0, a0
    mv t1, a1
    la a0, str1
    li a7, 4
    ecall
    mv a0, t0
    li a7, 1
    ecall
    la a0, str2
    li a7, 4
    ecall
    mv a0, t1
    li a7, 1
    ecall
    ret