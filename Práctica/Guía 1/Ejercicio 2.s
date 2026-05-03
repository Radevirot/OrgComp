addi t0,x0,3        #t0=3
addi t1,x0,5        #t1=5
addi t2,x0,7        #t2=7
add t0,t0,t1        #t0=t0+t1
add t3,t0,t2        #t3=t0+t2

#La ejecucion con forwarding toma 9 ciclos de reloj
#La ejecucion sin forwarding toma 12 ciclos de reloj

# la diferencia entre tener y no tener forwarding es que con
# forwarding hay conexiones que salen del bloque EX/MEM (post-ejecucion) y 
# del bloque MEM/WB (pre-writeback) que vuelven directamente a la fase de ejecución (ALU).
# Esto permite que se puedan obtener los datos calculados antes de que
# se guarden en el banco de registros y evitar tener que leerlos desde alli, es como
# una especie de atajo que permite evitar la espera de esos datos actualizados
# en los registros, ya que contamos con ellos desde antes.