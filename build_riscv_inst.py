#!/usr/bin/env python3

while True:
    ra, rb, rc, const = 0, 0, 0, "0000"

    try:
        instr = input()
    except EOFError:
        break

    if not instr:
        continue

    instr_no_comm = instr.split("#")[0]
    if not instr_no_comm:
        continue

    # pseudoinstructions
    instr = instr.replace("nop", "addi 0, 0, 0")
    instr = instr.replace("j ", "jal 0, ")

    switch={
        'add': 0,
        'sub': 1,
        'xor': 2,
        'or': 3,
        'and': 4,
        'sll': 5,
        'srl': 6,
        'sra': 7,
        'addi': 8,
        'lw': 9,
        'sw': 10,
        'beq': 11,
        'blt': 12,
        'jal': 13,
        'jalr': 14
        }
    opc = int(switch.get(instr.split()[0], -1))
    if opc == -1:
        print("Invalid instruction (opc)", instr.split()[0])
        exit()

    instr = instr.split("#")[0] \
                 .replace(",", " ") \
                 .replace("(", " ").replace(")", " ") \
                 .replace("srl", "SHL").replace("sra", "SHA") \
                 .replace("r", " ").strip().split()

    if opc < 9:
        rc = instr[1]
        ra = instr[2]
        if opc < 8:
            rb = instr[3]
        else:
           const = instr[3]
    elif opc == 9:
        rc = instr[1]
        const = instr[2]
        ra = instr[3]
    elif opc == 10:
        rb = instr[1]
        const = instr[2]
        ra = instr[3]
    elif opc == 11 or opc == 12:
        ra = instr[1]
        rb = instr[2]
        const = instr[3]
    elif opc == 13:
        rc = instr[1]
        const = instr[2]
    elif opc == 14:
        rc = instr[1]
        const = instr[2]
        ra = instr[3]

    try:
        ra = int(ra)
        rb = int(rb)
        rc = int(rc)
    except:
        print("Invalid instruction", instr)
        exit()

    const = const.rjust(4, '0')

    print(f'{opc:0>1X}', f'{ra:0>1X}', f'{rb:0>1X}', f'{rc:0>1X}', const[0],
                                                                   const[1],
                                                                   const[2],
                                                                   const[3])
