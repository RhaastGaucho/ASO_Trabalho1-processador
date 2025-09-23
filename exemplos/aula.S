addi r1, r0, CAFE       # r1 <- 0xCAFE
addi r2, r0, DEAD       # r2 <- 0xDEAD
add  r3, r1, r2         # r3 <- 0xCAFE + 0xDEAD
addi r6, r0, 000C       # r6 <- 0xC (12 decimal)
sw   r3, 0(r6)          # M[12+0] <- r3
sw   r2, 1(r6)          # M[12+1] <- 0xDEAD
lw   r7, 1(r6)          # r7 <- M[12+1]

addi r13, r0, FF00      # endereço 0xFF... acessa o terminal
addi r7, r0, 0041       # r7 <- 0x0041 (65 em decimal, letra A em ASCII)
sw   r7, 0(r13)         # mostra r7 ("A") no terminal
