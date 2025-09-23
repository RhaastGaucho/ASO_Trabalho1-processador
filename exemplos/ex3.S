addi r15, r0, 256       # r15 <- 0 + base do vetor V

# preenche vetor V = {0x13AF, 0xCAFE, 0xB01A, 0x1337, 0x1515}
addi r1, r0, 13AF       # r1 <- 0x13AF
sw   r1, 0(r15)         # M[V+0] = V[0] <- 0x13AF
addi r1, r0, CAFE       # r1 <- 0xCAFE
sw   r1, 1(r15)         # M[V+1] = V[1] <- 0xCAFE
addi r1, r0, B01A       # r1 <- 0xB01A
sw   r1, 2(r15)         # M[V+2] = V[2] <- 0xB01A
addi r1, r0, 1337       # r1 <- 0x1337
sw   r1, 3(r15)         # M[V+3] = V[3] <- 0x1337
addi r1, r0, 1515       # r1 <- 0x1515
sw   r1, 4(r15)         # M[V+4] = V[4] <- 0x1515

add  r3, r0, r0         # r3 = s <- 0
add  r4, r0, r0         # r4 = i <- 0
addi r15, r0, 256       # r15 <- 0 + base do vetor V
addi r10, r0, 5         # r10 <- 5
#while:
beq  r4, r10, 6         # i == 5 => fim (PC + 6)
add  r5, r15, r4        # r5 <- V + i
lw   r6, 0(r5)          # r6 <- M[V + i]
add  r3, r3, r6         # s <- s + V[i]
addi r4, r4, 1          # i <- i + 1
j    FFFB               # j while (PC - 5)
#fim:
addi r14, r0, FF00      # endereço 0xFF... acessa o terminal
sw   r4, 0(r14)         # mostra ri no terminal
add  r0, r0, r0         # nop: essa instrução não faz nada, só gasta tempo
sw   r0, 0(r14)         # mostra r0 no terminal
add  r0, r0, r0         # nop: essa instrução não faz nada, só gasta tempo
sw   r3, 0(r14)         # mostra rs no terminal

j    0                  # PC fica aqui eternamente
