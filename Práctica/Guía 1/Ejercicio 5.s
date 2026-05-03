#  Calcular el valor absoluto de t0 = -42 y guardarlo en t1. 
# voy a suponer que tengo que implementar esto usando un condicional, ni idea si será así.
# sabemos que
# |x| = x, x >= 0
# |x| = -x, x < 0
# o sea q si el registro es menor a 0 (intuyo que comparamos con x0) tenemos que
# negativizar el número (intuyo que restandoselo a x0), y si es mayor o igual a 0 no le
# hacemos nada

# los condicionales en assembler se fabrican usando las instrucciones
# blt t0,x0,[branch] (branch to [branch] if t0 less than x0)
# bge t0,x0,[branch] (branch to [branch] if t0 greater or equal to x0)
# las branches pueden tener cualquier nombre

# tenemos dos opciones
# 1. nuestra condicion de "si x es mayor o igual a cero no hacer nada" va a ser la que
# brancheemos para saltearnos el codigo que niega el valor de x

addi t0,x0,-42
bge t0,x0,es_mayor  # si es mayor salta derecho a es_mayor
sub t0,x0,t0 # si es menor, pasamos por la instrucción de negar el valor

es_mayor:
add t1,x0,t0 #esta instrucción se ejecuta sin importar si es mayor o menor, por la secuencialidad

# con esta estructura estamos obligados a modificar t0 para recuperar t1 con el signo correcto
# 2. pero podemos hacer bien el if usando un jump para refinarlo y mantener t0 intacto

addi t0,x0,-42    #asignamos -42
blt t0,x0,es_menor #checkeamos si t0 es negativo y si lo es pasamos directo a es_menor

add t1,x0,t0 #esto se ejecuta si t0 es positivo, guardamos t0 en t1
jal x0, end #saltamos al end, no queremos que se ejecute el caso de negativo

es_menor:
    sub t1,x0,t0 #se ejecuta si es negativo, guardamos el número cambiado de signo en t1
    
end:
    jal x0,end #esto es para que ripes esté de acuerdo con el "end", sino no me deja ejecutar
               #pero en realidad no hace falta para el algoritmo

