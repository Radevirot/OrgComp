# Calcular t2 = t0 * t1 usando sumas repetidas. (t0 = 4 y t1= 3) 

# bueno esto no tiene mucho misterio, sumemos 4 tres veces

addi t0,x0,4
addi t2,x0,0
add t2,t2,t0
add t2,t2,t0
add t2,t2,t0

# o sumamos 3 cuatro veces

addi t2,x0,0
addi t1,x0,3
add t2,t2,t1
add t2,t2,t1
add t2,t2,t1
add t2,t2,t1