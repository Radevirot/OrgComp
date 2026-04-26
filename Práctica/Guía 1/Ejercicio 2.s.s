addi t0,x0,3        #t0=3
addi t1,x0,5        #t1=5
addi t2,x0,7        #t2=7
add t0,t0,t1        #t0=t0+t1
add t3,t0,t2        #t3=t0+t2

#La ejecución con forwarding toma 9 ciclos de reloj
#La ejecución sin forwarding toma 12 ciclos de reloj

# la diferencia entre tener y no tener forwarding es que con
# forwarding hay conexiones