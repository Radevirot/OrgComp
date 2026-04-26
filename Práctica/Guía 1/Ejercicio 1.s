addi t0,x0,5        #cargo 5 en el registro t0 (t0=x0+5) (x0=0)
# esta operación toma 5 ciclos de reloj:
# fetch, decode, execute, memory, write back
addi t1,x0,7        #cargo 7 en t1
add t0,t1,t0        #t0=t1+t0
#t0 queda con el valor "c" en hex, que es 12.
