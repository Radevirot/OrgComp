# aparentemente tenemos dos formas de resolver esto, una es con sumas y restas
# y la otra es con el or exclusivo, vamos a ver primero el or exclusivo con un
# ejemplo hecho a mano de un numero de 4 bits para simplificar
# A = 5 | b 0101
# B = 7 | b 0111
# si hacemos A XOR B tenemos 0010, vamos a llamarlo placeholder
# si le hacemos XOR B al placeholder tenemos 0101, que es A
# si le hacemos XOR A al placeholder tenemos 0111, que es B
# entonces:
# B = A ^ B  tengo el placeholder en B
# A = A ^ B  me guardo el B original en A
# B = A ^ B  me guardo el A original en B
# listo! vamos a codearlo

addi t0,x0,5
addi t1,x0,7
xor t1,t0,t1
xor t0,t0,t1
xor t1,t0,t1

# ahora veamos con sumas y restas, asignemos valores
# A = 7, B = 5
# B = A - B ; acá queda B = 2, este sería nuestro placeholder
# ahora tratemos de hacer que A valga 5
# A = A - B ; ahora A vale lo que valía B originalmente, 5
# ahora necesitamos que B valga 7
# B = A + B ; listo, A = 5, B = 7.
# vamos a codearlo

sub t1,t0,t1
sub t0,t0,t1
add t1,t0,t1

# excelente, funcionan ambas.