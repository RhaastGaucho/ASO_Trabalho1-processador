#loop:
addi 15, 0, CCFC
sw   8, 0(15)
lw   8, 0(15)
addi 3, 0, 2000
addi 4, 0, 0
addi 8, 0, 32
#printSine:
addi 7, 3, 2000
addi 15, 0, 10
sra  9, 7, 15
addi 15, 0, 9
sra  10, 7, 15
add  7, 9, 10
#blnks:
beq  7, 0, 7
addi 9, 0, 20
addi 15, 0, CCFF
sw   9, 0(15)
addi 15, 0, 1
sub  7, 7, 15
j    FFFA
#printStar:
addi 15, 0, CCFF
addi 9, 0, 2A
sw   9, 0(15)
addi 9, 0, 0D
sw   9, 0(15)
addi 15, 0, 3
sra  6, 3, 15
sub  6, 4, 6
addi 15, 0, 7
sra  9, 6, 15
sub  6, 6, 9
addi 15, 0, 3
sra  5, 4, 15
add  5, 3, 5
addi 15, 0, 7
sra  9, 5, 15
sub  5, 5, 9
addi 4, 6, 0
addi 3, 5, 0
addi 15, 0, 1
sub  8, 8, 15
beq  8, 0, FFD8
j    FFDD
