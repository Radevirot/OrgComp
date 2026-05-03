# Contar cuantos bits están en 1 en t0 = 21(b10101) y guardar el resultado en t1. 

# para esto necesitamos saber ciertos conceptos importantes.
# para saber cuando el bit menos significativo del numero es 1, tenemos que hacerle
# un and a ese numero con 1 haciendo
# andi t2,t0,1 (t0 and 1, guarda 1 en t2 si lo es, 0 si no lo es)

# otra cosita que necesitamos es empujar nuestros bits hacia la derecha, para poder ir
# contandolos, esto lo hacemos con el comando
# srli t0, t0, 1 (guardamos en t0 el resultado de poner 1 cero a la izquierda de t0)
#                (esto borra el bit menos significativo)
# srli significa shift right logical immediate
# shift right: movemos para la derecha
# logical: insertando ceros sin importar si es negativo o positivo
# immediate: la cantidad de ceros es una constante
# !!! importante que sea LOGICAL en este caso, porque sino vamos a romper el loop con la
# condición de corte que le vamos a poner. o sea, esta arithmetic tambien que seria srai,
# pero este comando inserta 0s o 1s dependiendo del signo del registro, por lo que si fuera
# un número negativo insertaria unos y nunca terminaria el loop

# lo mas importante de todo es que necesitamos loopear para ir contando los bits, esto podemos
# hacerlo con un while que diga "mientras el numerito sea distinto de cero, seguimos contando"
# al codearlo tenemos que invertir la condicion porque el corte está apenas arranca la branch
# del while, entonces cada vez que empieza se fija "vale 0? si true salto al final".

addi t0,x0,21 #10101
addi t1,x0,0
#aca originalmente tenia un addi t2,x0,0 para inicializar, pero realmente no hace falta
#inicializarlo porque le hacemos un andi dentro del while entonces el resultado siempre
#va a depender de la constante y algo que ya inicialize

while:
    beq t0,x0,end  # condicion de corte, si t0 es 0 saltamos al final, sino seguimos el loop
    andi t2,t0,1 # nos fijamos si el LSB es 1, si es guardamos 1 en t2 si no es guardamos 0
    add t1,t1,t2 # t1=t1+t2, este seria el contador
    srli t0,t0,1 # movemos para la derecha
    jal x0, while # continuamos el loop
    
end:
    jal x0,end
    
#esto toma un total de 42 ciclos de reloj