# // encontrar um elemento x < 0 no vetor V
# N = 5;
# int V[N];
# i = 0;
# c = 0;
# x = V[0];
# while ( (x >= 0) && (i < N) ) {
#     c = c + 1;
#     i = i + 1;
#     x = V[i];
# }

addi r15, r0, 256       # r15 <- 0 + base do vetor V

# preenche vetor V = {0xC, 0x7, 0xE, 0xF, 0xD}
#                    { 12,   7,  -2,  -1,  -3}
addi r1, r0, 000C       # r1 <- 0xC
sw   r1, 0(r15)         # M[V+0] = V[0] <- 0xC
addi r1, r0, 0007       # r1 <- 0x7
sw   r1, 1(r15)         # M[V+1] = V[1] <- 0x7
addi r1, r0, FFFE       # r1 <- 0xE
sw   r1, 2(r15)         # M[V+2] = V[2] <- 0xE
addi r1, r0, FFFF       # r1 <- 0xF
sw   r1, 3(r15)         # M[V+3] = V[3] <- 0xF
addi r1, r0, FFFD       # r1 <- 0xD
sw   r1, 4(r15)         # M[V+4] = V[4] <- 0xD

# programa em si inicia aqui:
add  r3, r0, r0         # r3 = c <- 0
add  r4, r0, r0         # r4 = i <- 0
addi r15, r0, 256       # r15 <- 0 + base do vetor V
addi r10, r0, 5         # r10 = N <- 5
lw   r1, 0(r15)         # r1 = x <- M[V + 0]
#while:
blt  r1, r0, 7          # x < 0 => fim (PC + 7)
beq  r4, r10, 6         # i == 5 => fim (PC + 6)
addi r3, r3, 1          # c <- c + 1
addi r4, r4, 1          # i <- i + 1
add  r14, r15, r4       # r14 <- V + i
lw   r1, 0(r14)         # x <- M[V + i]
j    FFFA               # j while (PC - 6)
#fim:
# vamos mostrar 9 - x na tela
addi r14, r0, FF00      # endereço 0xFF... acessa o terminal
addi r13, r0, 0039      # r13 <- 0039 = caractere '9'
add  r13, r13, r1       # r13 <- '9' + x (x é negativo!)
sw   r13, 0(r14)        # mostra o número no terminal

j    0                  # PC fica aqui eternamente
