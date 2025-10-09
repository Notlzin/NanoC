// the main CPU part thingmajig //
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

// cpu state //
#define MEMSIZE 256
#define NUMREGS 8

typedef struct {
    uint8_t mem[MEMSIZE];
    uint8_t regs[NUMREGS];
    uint8_t pc;
    bool halted;
} CPU;

// opcodes //
enum {
    NOP = 0x00,
    MOV = 0x01,     // MOV reg, imm
    ADD = 0x02,     // ADD reg1, reg2
    SUB = 0x03,     // SUB reg1, reg2
    JMP = 0x04,     // JMP addr
    PRINT = 0x05,   // PRINT reg
    HALT = 0xFF     // stop execution point
};

uint8_t fetch(CPU* c) {
    return c->mem[c->pc++];
}

// instruction-execution //
void exec(CPU* c) {
    uint8_t op = fetch(c);
    switch (op) {
        case NOP: break;

        case MOV: {
            uint8_t r = fetch(c);
            uint8_t v = fetch(c);
            c->regs[r] = v;
            break;
        }
        case ADD: {
            uint8_t rA = fetch(c);
            uint8_t rB = fetch(c);
            c->regs[rA] += c->regs[rB];
            break;
        }
        case SUB: {
            uint8_t rA = fetch(c);
            uint8_t rB = fetch(c);
            c->regs[rA] -= c->regs[rB];
            break;
        }
        case JMP: {
            uint8_t addr = fetch(c);
            c->pc = addr;
            break;
        }
        case PRINT: {
            uint8_t r = fetch(c);
            printf("[nano-x32_43::PRINT] R%d = %d\n", r, c->regs[r]);
            break;
        }
        case HALT:
            c->halted = true;
            break;

        default:
            printf("[nano-x32_43::ERROR] unknown opcode 0x%02X at %d\n", op, c->pc - 1);
            c->halted = true;
            break;
    }
}

// runner //
void run_cpu(CPU* c) {
    while (!c->halted && c->pc < MEMSIZE) {
        exec(c);
    }
}

// demonstration //
int main(void) {
    CPU cpu = {0};

    uint8_t program[] = {
        MOV, 0, 10,
        MOV, 1, 20,
        ADD, 0, 1,
        PRINT, 0,
        HALT
    };

    for (size_t i = 0; i < sizeof(program); i++)
        cpu.mem[i] = program[i];

    printf("[nano-x32_43] Booting...\n");
    run_cpu(&cpu);
    printf("[nano-x32_43] Halted.\n");
}
