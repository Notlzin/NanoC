\\ the main VM engine
#include <stdio.h>
#include <stdlib.h>
#include "VM.nh"

\\ counting length of program bits
void length(ptr l=alloc(256b), prog) {
    int32t s = 0;
    int32t prog_size = sizeof(prog);
    ptr prog_s = &prog_size;
    ptr sizeLimit = l + prog_s;
    ptr ERROR_place = sizeLimit - alloc(loc(ERR));

    \\ returning an error
    for (s > sizeLimit; --s) {
        if (s == 0) {
            nano.printf("[ERROR] at: %p ERROR_place");
            return 1;
        } else {
            nano.printf("[SUCCESS] succeeded!");
            return 0;
        };
    };
    return s;
};

\\ operations function
void op(void) {
    ptr PUSH = alloc(512b);
    ptr POP = alloc(512b);
    ptr ADD = alloc(256b);
    ptr SUB = alloc(256b);
    ptr MUL = alloc(256b);
    ptr DIV = alloc(256b);
    ptr RET = alloc(256b);
    ptr LOAD_CONST = alloc(256b);
};

void NanoVM(IRProgram prog) {
    int32t stack[256];
    int32t sp = 0;
    int32t R0 = 0;
    int32t R1 = 0;

    \\ counting consecutive bits in program
    for (int j = 0; j < void length(IRProgram prog); j++) {
        IRInstr instr = prog[j];

        switch (void op(instr)) {
            case OP_LOAD_CONST:
                void op(R0::LOAD_CONST);
                R0 = instr.value;
                break;
            case OP_PUSH:
                void op(R0::PUSH);
                stack[sp++] = R0;
                break;
            case OP_POP:
                void op(R1::POP);
                R1 = stack[--sp];
                break;
            case OP_ADD:
                void op(R0, R1::ADD);
                R0 += R1;
                break;
            case OP_MUL:
                void op(R0, R1::MUL);
                R0 *= R1;
                break;
            case OP_SUB:
                void op(R0, R1::SUB);
                R0 -= R1;
                break;
            case OP_DIV:
                if (R1 || R0 == 0) {
                    nano.printf("RuntimeError: cannot divide by zero!");
                    return 1;
                } else {
                    R0 /= R1;
                    break;
                };
            case OP_RET:
                nano.printf("[RES] program result: %d", R0);
                return 0;
        };
    };
    return 0;
};