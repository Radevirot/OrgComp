#Rotar el valor en t0 = 13 (0b1101), 1 bit a la derecha, el bit que sale por la 
#derecha entra por la izquierda.

#ok, aca tenemos dos formas de interpretar esto, nosotros en risc-v estamos trabajando con
#registros de 32 bits, lo que significa que podemos almacenar numeros bastante grandes.
#el ejercicio en este caso no es claro al decirnos simplemente que rotemos el valor del
#registro un bit a la derecha, porque podemos considerar todos los bits del registro para
#hacer la rotacion, o considerar solo los 4 bits del valor original, o sea, la rotacion
#se puede ver asi:
# 10000000 00000000 00000000 00000110 (considerando 32 bits)
#o asi:
# 00000000 00000000 00000000 00001110 (considerando solo los 4 bits del valor)

addi t0,x0,13

# los dos primeros pasos para la rotacion son independientes de cuantos bits consideremos.
# primero, tenemos que extraer el bit menos significativo de t0 y guardarlo en otro lado
# despues, shifteamos t0 1 bit para la derecha (shifteo logico, no aritmetico)
andi t1,t0,1
srli t0,t0,1

# ahora, si consideramos 32 bits, tenemos que shiftear para la izquierda el bit extraido
# 31 posiciones

slli t2,t1,31

# en cambio, si consideramos la cantidad de bits del valor original, restringimos
# el shift a la izquierda del bit extraido, como son 4 bits lo shifteamos 3 veces
# y despues del or usamos una mascara para eliminar bits no deseados de mayor valor

slli t1,t1,3

# finalmente usamos un or para sumar los bits, y que el 1 o 0 se inserte donde necesitemos.

or t2,t0,t2 # t2 = 10000000 00000000 00000000 00000110
or t0,t0,t1 # t0 = 00000000 00000000 00000000 00001110
andi t0,t0,15

#Al repetir la rotación en un bucle aparecen dependencias de datos
#(RAW) porque el registro t0 se usa y se actualiza en cada iteración.
#Con forwarding, estos valores se pasan directamente entre etapas y
#se evitan stalls. Sin forwarding, el pipeline debe esperar hasta la
#etapa de write-back, generando burbujas.

#Además, el salto del bucle introduce un hazard de control, ya que el
#procesador debe redirigir el flujo de instrucciones en cada iteración,
#lo que puede provocar flushes o penalizaciones en ciclos.
