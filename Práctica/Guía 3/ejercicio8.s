#8. Convierte un string a mayúsculas in-place. 
#.data 
#texto: .asciz "Hola Mundo RISC-V" 
#.text 
# Modificar el string directamente en memoria 
#a_mayusculas: 
#ret

# cositas a tener en cuenta:
# - asciz tiene un caracter nulo al final que vale cero, sirve para condición de corte
# - cada caracter es 1 byte, o sea que usamos load byte y store byte y recorremos sumando 1
# - hay una diferencia de 32 valores entre las minúsculas y las mayúsculas, entonces
# buscamos minúsculas y les restamos 32 (tenemos que ignorar cosas que no sean letras)


.data
texto: .asciz "Hola Mundo RISC-V"

.text

la a0,texto
jal ra, a_mayusculas

li a7,10
ecall

a_mayusculas:
    lb t1, 0(a0)
    addi t0,zero,0 # compare value
    beq t1,t0,a_mayusculas_loop_end
    addi t0,zero,123
    bge t1,t0,not_lowercase
    addi t0,zero,97
    blt t1,t0,not_lowercase
    
    # si llegamos acá es porque es lowercase, restamos 32 y storeamos
    addi t1,t1,-32
    sb t1, 0(a0)
    
    # dejamos que siga el curso natural de la secuencia y pase por not_lowercase
    
not_lowercase:
    addi a0,a0,1
    jal x0, a_mayusculas
a_mayusculas_loop_end:
    
    jalr ra






