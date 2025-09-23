# Processador RISC-V
Este processador é inspirado em processadores RISC-V e na sua linguagem
Assembly. A arquitetura é do tipo /load-store/ e implementa 8 instruções de
lógica e aritmética, uma instrução de leitura e uma instrução de escrita na
memória, 2 instruções para desvios condicionais, além de 2 desvios
incondicionais. Todas as instruções possuem o mesmo formato, acomodado em 32
bits.

O arquivo principal que você deve abrir no simulador é o \verb|system.dig|.

## Memória de instruções
A ROM mais a esquerda no simulador é a memória de instruções (MI). Por
limitações do simulador, é endereçada com 24 bits. Portanto, a MI comporta
programas de no máximo 2^24 = 16M instruções de 32 bits. Cada uma das 16M
posições de memória armazena e acessa uma instrução completa de 32 bits. Como
consequência, PC + 1 acessa a próxima instrução.

## Memória de dados
A RAM mais a direita no simulador é a memória de dados (MD). Por limitações do
simulador, é endereçada com 24 bits. Portanto, a MD possui 2^24 = 16M posições
de 32 bits cada.

## Controle
No topo do circuito está a parte de controle do processador, responsável por
gerar os sinais adequados para selecionar os valores nos multiplexadores,
escrever na memória, escrever no registrador de destino, etc.

A unidade de controle é implementada, em sua maior parte, nesse processador como
uma memória ROM.

## Terminal
Próximo à MD existe um circuito chamado `Terminal`. Esse circuito utiliza
componentes do simulador Digital para simular uma tela/interface de 80x24
caracteres, onde podemos mostrar letras, números e símbolos.

Como a MD possui endereços de 0 a 16M (0x0000.0000 a 0x00FF.FFFF), o circuito
ativa o terminal apenas se a instrução for um /store/ (sw) e se o endereço
estiver na faixa 0xFF00.0000 a 0xFFFF.FFFF. Ou seja, se você executar um sw
nesses endereços, o simulador abrirá uma janela, mostrando o caractere:
```asm
addi r15, r0, FFFF    # r15 <- 0xFFFF.FFFF
sw   r4, 0(r15)       # store acessando endereço 0xFF...
# vai mostrar r4 no terminal!
```

Para mostrar caracteres legíveis, use a tabela ASCII. Mais especificamente,
caracteres com valores entre 32 e 126 (0x040 e 0x176). Outros valores ainda
abrirão a tela do terminal, mas mostrarão caracteres inválidos/estranhos.

## Como usar os scripts do processador
### `build_riscv_inst.py`
Esse script converte instruções do Assembly do RISC-V para hexadecimal e imprime
a respectiva string na tela, separando cada parte da instrução: opcode, ra, rb,
rc, constante

```bash
./build_riscv_inst.py < exemplos/ex1.S
```

### `build_riscv_rom.sh`
Esse script converte uma string de hexadecimais de uma instrução para a
representação binária.

* Esse script serve somente para inspecionar as instruções no formato
hexadecimal, mas não é utilizado no simulador.

```bash
./build_riscv_inst.py < exemplos/ex1.S | ./build_riscv_rom.sh | hexdump -C
```

### Criar arquivo do tipo 'intel hex'
Para carregar os dados na ROM do simulador Digital, você deve usar um arquivo do
tipo `intel hex`. Para criar esse arquivo faça:
```bash
{ echo 'v2.0 raw'; ./build_riscv_inst.py < exemplos/ex1.S | tr -d ' ' } > exemplos/ex1.hex
```

Para carregar o arquivo no simulador, clique com o botão direito sobre a MI,
clique no botão `Edit` ao lado de `Data`. Uma nova janela com o conteúdo da MI
será aberta. Clique em `File` -> `Load` e selecione o arquivo `.hex` que deseja
executar. Lembre-se de marcar a opção `Big-Endian`!

Depois de carregar seu programa, basta iniciar a simulação. Você deve clicar
sobre o botão do `clock` para que o relógio do circuito avance e as instruções
sejam executadas.

Se desejar, você pode clicar com o botão direito sobre o `clock` e marcar a
opção para que ele inicie automaticamente. Você também pode escolher a
velocidade desejada. Você deve fazer isso com a simulação parada.
