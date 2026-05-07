# Determinar si el valor en t0 = 6 es par (guardar 1 en t1 si es par, 0 si no). 
# con un and y un xor sale solo esto

addi t0,x0,6  #nos guardamos el valor en el registro 0
andi t1,t0,1  #le hacemos un and con un solo bit (1)
              #si nos da 1 es porque es impar, y 0 es porque es par
xori t1,t1,1  #ahora le hacemos un xor con 1 para invertirlo, cosa que nos quede
              #1 si es par y 0 si es impar como pide el ejercicio