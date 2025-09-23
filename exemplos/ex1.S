addi r15, r0, 256       # r15 <- 0 + base do vetor V

# preenche vetor V = {0x13AF, 0xCAFE, 0xB01A, 0x1337, 0x1515}
addi r1, r0, 13AF       # r1 <- 0x13AF
sw   r1, 0(r15)         # M[]V+0] = V[0] <- 0x13AF
addi r1, r0, CAFE       # r1 <- 0xCAFE
sw   r1, 1(r15)         # M[V+1] = V[1] <- 0xCAFE
addi r1, r0, B01A       # r1 <- 0xB01A
sw   r1, 2(r15)         # M[V+2] = V[2] <- 0xB01A
addi r1, r0, 1337       # r1 <- 0x1337
sw   r1, 3(r15)         # M[V+3] = V[3] <- 0x1337
addi r1, r0, 1515       # r1 <- 0x1515
sw   r1, 4(r15)         # M[V+4] = V[4] <- 0x1515

addi r15, r0, 256       # r15 <- 0 + base do vetor V
lw   r1, 0(r15)         # r1 <- M[V+0] = V[0]
lw   r2, 1(r15)         # r2 <- M[V+1] = V[1]
add  r3, r1, r2         # r3 <- V[0] + V[1]
sw   r3, 4(r15)         # M[V+4] = V[4] <- V[0] + V[1]
lw   r10, 4(r15)        # r10 <- M[V+4] = V[4]

addi r14, r0, FFFF      # endereço 0xFF... acessa o terminal
sw r10, 0(r14)          # mostra r10 no terminal
