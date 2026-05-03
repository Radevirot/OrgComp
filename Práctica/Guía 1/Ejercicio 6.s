# Almacenar el máximo entre t0  = 8 y t1 = 12 en t2.

addi t0,x0,12
addi t1,x0,30

# facilillo, checkeamos si t0 es mayor o igual grande que t1, si lo es lo guardamos en t2,
# si no lo es nos guardamos t1 en t2

bge t0,t1,mayor #si t0 es mayor saltamos a mayor
add t2,t1,x0 #esto corre si t1 es mayor, guardamos t1 en t2
jal x0,end #vamos al final para saltear la branch mayor


mayor:
    add t2,t0,x0 #guardamos t0 en t2
    
end:
    jal x0,end