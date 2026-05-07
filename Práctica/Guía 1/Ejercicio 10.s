# Comparar dos valores en registros y almacenar el mayor en otro registro. 
# ya detalle la resolucion para esto en el ejercicio 6, voy a hacerlo de nuevo sin explicar
# para reforzar

addi t0,x0,25
addi t1,x0,500
addi t2,x0,0

bge t0,t1,t0_esmayor
add t2,x0,t1
jal x0,end

t0_esmayor:
    add t2,x0,t0
    
end:
    jal x0,end
    