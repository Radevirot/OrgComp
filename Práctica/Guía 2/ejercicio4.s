.data
numero: .word 4


.text
main:
    
    lw a0, numero
    
    jal ra, countdown
    
    li a7,10
    ecall
    
countdown:
    
countdown_loop:
    beq a0,zero,countdown_loop_end
    addi a0,a0,-1
    
    jal x0, countdown_loop
countdown_loop_end:
    jalr ra