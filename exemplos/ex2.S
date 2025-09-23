addi r5, r0, AFE        # r5 <- 0AFE
addi r6, r0, FF0        # r6 <- 0FF0
addi r7, r0, C000       # r7 <- C000

addi r10, r0, 300       # r10 <- 300
addi r11, r0, 300       # r11 <- 300
beq  r10, r11, 3        # r10 == r11 => then (PC + 3)
#else:
or   r5, r5, r7         # r5 <- r5 OR r7
j    2                  # j cont (PC + 2)
#then:
and  r5, r5, r6         # r5 <- r5 AND r6
#cont:
addi r14, r0, FF00      # endereço 0xFF... acessa o terminal
sw   r5, 0(r14)         # mostra r5 no terminal

j    0                  # PC fica aqui eternamente
