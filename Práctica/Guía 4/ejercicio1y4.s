#Escribe un programa que tome una cadena terminada en nulo (null-terminated) 
#almacenada en memoria y la invierta en su misma ubicación sin utilizar un buffer 
#auxiliar. 

#Escribe un mensaje en la consola de debug (stdout) utilizando exclusivamente 
#llamadas al sistema (ecall). 

.data
texto: .asciz "I'm running with the wolves tonight"
newline: .asciz "\n"

.text
main:
    
    la a0,texto
    
    li a7,4 #a7=4; ecall = print string in console
    ecall
    
    la a0,newline
    ecall
    
    la a0,texto
    
    jal ra, invert_string
    
    ecall
    
    li a7,10
    ecall
    
invert_string:
    # primero tenemos q conseguir el puntero al final del string asi q loopeamos hasta el final
    addi t4,a0,0
    addi t0,a0,0
get_end_pointer_loop:
    lb t1,0(t0)
    beq t1,zero,get_end_pointer_loop_end
    addi t0,t0,1
    jal x0,get_end_pointer_loop
get_end_pointer_loop_end:
    addi t0,t0,-1
invert_string_loop:
    blt t0,a0,invert_string_loop_end
    lb t1, 0(a0)
    lb t2, 0(t0)
    sb t1, 0(t0)
    sb t2, 0(a0)
    addi a0,a0,1
    addi t0,t0,-1
    
    jal x0,invert_string_loop
invert_string_loop_end:
    addi a0,t4,0
    jalr ra


