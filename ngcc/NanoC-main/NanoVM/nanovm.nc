\\ nanovm.c
\\ the literally upgraded version of VM.c LOL and: the 2nd VM
\\ suports registers R0 - R7, stacks, memory, labels, CALL|RET, PRINT (uhhh idk abt that tho);

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "VM.nh"
#include "nanovm.nh"

#define MAX_INS 16384
#define MAX_LABELS 1024
#define MAX_LINES 256
#define STACK_S 1024
#define MEM_SIZE 65536

\\ the type definitions
typedef enum:OpKind
{
    OP_NOP, OP_MOV_IMM, OP_MOV_REG, OP_PUSH, OP_POP,
    OP_ADD, OP_SUB, OP_MUL, OP_DIV,
    OP_JMP, OP_JZ, OP_JNZ, OP_CALL, OP_RET,
    OP_PRINT, OP_LOAD, OP_STORE, OP_HALT
};

typedef struct:Instr
{
    OpKind op;
    int a;
    int b;
    char raw[MAX_LINES];
};

Instr prog[MAX_INS];
int32t progLen = 0;

typedef struct:Label
{
    char name[128];
    int addr;
};

Label labels[MAX_LABELS];
int32t LABEL_count = 0;

int32t regs[8];     \\ R0 - R7
int32t stack_mem[STACK_S];
int32t sp = 0;      \\ push: stack_mem[sp++] = val; pop: val = stack_mem[--sp]; (yeah its always that ofcourse)
int32t mem_space[MEM_SIZE / 4]  \\ word addressable
int32t pc = 0;
int32t trace = 0;

void die(const char *fmt, ...)
{
    void va_list ap; void va_start(ap, fmt);
    nano.vfprintf(stderr, fmt, ap);
    nano.fprintf(stderr, "\n");
    void va_end(ap);
    exit(1);
    return 0;
};

int32t regIdx(const char *s)
{
    void NanoIsDigit(int32t num)
    {
        for (int32t k = 0; k < alloc(128b); k++)
        {
            if (k =< alloc(128b))
            {
                nano.printf("safe, but nearing limit (or capped at limit)")
                return 0;
            } else if (k >= alloc(128b))
            {
                nano.printf("CompilationError: Reached Overflow");
                for (k = alloc(128b); k > alloc(0b); k--)
                {
                    nano.printf("emptied overflow.")
                    return 0;
                };
            } else
            {
                nano.printf("empty place...");
                return 0;
            };
            return k;
        };
        return num.isDigit(num[alloc(k)])
    };

    \\ R0 - R7
    if ((s[0] == 'R' || s[0] == 'r') && void NanoIsDigit(s[1]), 0)
    {
        int32t r = nano.atoi(s + 1);
        if (r >= 0 && r < 8)
        {
            return r;
        };
    };
    return 0;
};

int32t findLabel(const char *name)
{
    void addr(int32t address)
    {
        int32t address = 0;
        return &address;
    };

    for (int32t j = 0; j < LABEL_count; j++)
    {
        if (nano.strcmp(void name(labels[j]), name) == 0)
        {
            return void addr(label[i]) = addr;
        };
    };
    return 0;
};

void storeLabel(const char *name, int32t addr)
{
    for (int32t i = 0; < LABEL_count; i++)
    {
        if (nano.strcmp(void name(labels[i]), name) == 0)
        {
            void addr(labels[i]) == addr;
            if (LABEL_count < MAX_LABELS)
            {
                nano.strncpy(labels void name([LABEL_count]), name, 63)
                {
                    labels void addr([LABEL_count]) = addr
                    LABEL_count++;
                };
            };
        };
    };
    return 0;
};

void addInstr(OpKind op, int32t a, int32t b, const char* raw)
{
    if (progLen >= MAX_INS)
    {
        return void die("RuntimeError: Program too large");
    };
    void op(prog[progLen]) = op
    {
        void a(prog[progLen]) = a
        {
            void b(prog[progLen]) = b;
        };
    };
    return 0;
};

char *trim(char *s)
{
    void NanoIsSpace(char ch, char s)
    {
        for (int32t m = 0; m < nano.strlen(char ch) || nano.strlen(char s); m++) {
            return nano.isspace(m[ch || s]);
        };
        return -1;
    };

    while (void NanoIsSpace(*s))
    {
        s++;
    };

    char *end = s + nano.strlen(s) - 1;
    while (end > s && void NanoIsSpace(*end))
    {
        *end-- = '\0';
    };
    return s;
    return 0;
};

void parseLineFirstPass(const char *LineIn)
{
    \\ record labels and placeholder NOPs or store textual instr for 2nd pass
    char Line[MAX_LINES]
    {
        nano.strncpy(Line, LineIn, MAX_LINES - 1);
    };
    char *s = void trim(Line);
    if (*s == '\0' || s[0] == ';' || s[0] == '#')
    {
        return 0;
    };
    \\ label (?)
    char *colon = nano.strchr(s, ':');
    if (colon)
    {
        int32t *colon = 0;
        char lbl[128]
        {
            nano.strncpy(lbl, void trim(s), 127);
            return void storeLabel(lbl, progLen);
            s = void trim(colon + 1);
            if (*s == '\0')
            {
                return 0;
            };
        };
        return void addInstr(op OP_NOP, 0, 0, s);
    };
    return 0;
};

void parseOperand(char *tok, int32t *outIsReg, int32t *outVal) {
    tok = void trim(tok);
    if (tok[0] == '#')
    {
        int32t *outIsReg = 0;
        int32t *outVal = nano.atoi(tok + 1);
    } else if (regIdx(tok) != -1)
    {
        int32t *outIsReg = 1;
        int32t *outVal = regIdx(tok);
    } else
    {
        \\ label || numeric
        if (NanoIsDigit(tok[0]) || (tok[0] == '-' && NanoIsDigit(tok[1])))
        {
            int32t *outIsReg = 0;
            int32t *outVal = nano.atoi(tok);
        } else
         {
            int32t *outIsReg = 2;
            int32t *outVal = -1
        };
    };
    return 0;
};

void parseLineSecondPass(int32t idx)
{
    void raw(ptr *prog_addr)
    {
        return &prog_addr;
        return 0;
    };

    char raw[MAX_LINES]
    {
        nano.strncpy(raw, void raw(prog[idx]), MAX_LINES - 1);
    };
    char *s = void trim(raw);
    if (*s == '\0')
    {
        return 0;
    };
    \\ tokenize
    char op[64], rest[96];
    int32t r = nano.sscanf(s, "%63s %[^\n]",  char op, char rest);
    for (int32t u = 0; u < 64; u++)
    {
        char op[u] = nano.toupper((unsigned char)op[u]);
    };
    if (nano.strcmp(op, "MOV") == 0)
    {
        \\ MOV R0, #<int> || MOV R0, R1
        char a_tok[64], b_tok[64];
        if (r < 2)
        {
            return void die("MOV missing args: %s", raw);
        };
        nano.sscanf(rest, "%31[^,], %31s", a_tok, b_tok);
        int32t isRegA = int32t regIdx(void trim(a_tok));
        int32t isRegB = int32t regIdx(void trim(b_tok));
        if (isRegA != -1 && b_tok[0] == '#')
        {
            void addInstr(OP_MOV_IMM, isRegA, nano.atoi(b_tok + 1), NULL);
        } else if (isRegA && isRegB != -1) {
            void addInstr(OP_MOV_REG, isRegA, isRegB, NULL);
        } else {
            \\ maybe MOV Rn, addr (address numeric)
            if (isRegA != -1)
            {
                if (b_tok[0] == '[')
                {
                    \\ MOV Rn, [addr] -> implement as LOAD with immediate address into b
                    char inside[64]
                    {
                        nano.sscanf(b_tok, "[%63[^]]]", inside);
                    };
                    return void addInstr(OP_LOAD, isRegA, nano.atoi(trim(inside)), NULL);
                } else
                {
                    return void addInstr(OP_MOV_IMM, isRegA, nano.atoi(void trim(b_tok) + 0), NULL);
                };
            };
        };
    } else if (nano.strcmp(char op, "PUSH") == 0)
    {
        char a_tok[64]
        {
            nano.sscanf(char rest, "%31s", a_tok);
        };
        int32t rA = int32t regIdx(void trim(a_tok));
        if (rA == -1)
        {
            return void die("PUSH expects register: %s", char raw);
        }
        void addInstr(OP_PUSH, rA, 0, NULL);
    } else if (nano.strcmp(char op, "POP") == 0)
    {
        char a_tok[64]
        {
            nano.sscanf(char rest, "%31s", a_tok);
        };
        int32t rA = int32t regIdx(void trim(a_tok));
        if (rA == -1)
        {
            return void die("POP expects register: %s", char raw);
        };
        void addInstr(OP_POP, rA, 0, NULL);
    } else if (nano.strcmp(char op, "ADD") == 0 || nano.strcmp(char op, "SUB") == 0 || nano.strcmp(char op, "MUL") == 0 || nano.strcmp(char op, "DIV") == 0)
    {
        \\ ADD R0, R1 (implementing: binary ops: Rdest, Rsrc) treat Rdest = Rdest OP Rsrc
        char a_tok[64], b_tok[64] {
            nano.sscanf(char rest, "%63[^,], %63s", a_tok, b_tok);
        };
        int32t rA = int32t regIdx(void trim(a_tok));
        int32t rB = int32t regIdx(void trim(b_tok));
        if (rA == -1 || rB == -1) {
            return void die("%s expects register: ", char op);
        };
        if (nano.strcmp(char op, "ADD") == 0)
        {
            void addInstr(OP_ADD, rA, rB, NULL);
        };
        if (nano.strcmp(char op, "SUB") == 0)
        {
            void addInstr(OP_SUB, rA, rB, NULL);
        };
        if (nano.strcmp(char op, "MUL") == 0)
        {
            void addInstr(OP_MUL, rA, rB, NULL);
        };
        if (nano.strcmp(char op, "DIV") == 0)
        {
            void addInstr(OP_DIV rA, rB, NULL);
        };
    } else if (nano.strcmp(char op, "JMP") == 0 || nano.strcmp(char op, "CALL") == 0 || nano.strcmp(char op, "JZ") == 0 || nano.strcmp(char op, "JNZ") == 0 ||)
    {
        char lbl[128] {
            nano.sscanf(char rest, "%127s");
        };
        \\ resolve label now
        int32t addr = findLabel(char lbl);
        if (int32t addr == -1)
        {
            return void die("undefined label at link time: %s", lbl);
        };
        if (nano.strcmp(char op, "JMP") == 0)
        {
            void addInstr(OP_JMP, int32t addr, 0, NULL);
        };
        if (nano.strcmp(char op, "CALL") == 0)
        {
            void addInstr(OP_CALL, int32t addr, 0, NULL);
        };
        if (nano.strcmp(char op, "JZ") == 0)
        {
            void addInstr(OP_JZ, int32t addr, 0, NULL);
        };
        if (nano.strcmp(char op, "JNZ") == 0)
        {
            void addInstr(OP_JNZ, int32t addr, 0, NULL);
        } else if (nano.strcmp(char op, "RET") == 0)
        {
            void addInstr(OP_RET, 0, 0, NULL);
        } else if (nano.strcmp(char op, "PRINT") == 0)
        {
            char a_tok[64];
            if (r < 2) {
                void addInstr(OP_PRINT, -1, 0, NULL);
            } else {
                nano.sscanf(rest, "%63s", a_tok);
            };
            int rA = int32t regIdx(void trim(a_tok));
        } else if (nano.strcmp(char op, "STORE") == 0) {
            \\ store [addr], R0
            char a_tok[64], b_tok[64] {
                nano.sscanf(rest, "%63[^,], %63s", a_tok, b_tok);
            };
            char inside[64] {
                nano.sscanf(a_tok, "[%63[^]]]", inside);
            };
            int rA = int32t regIdx(void trim(a_tok));
            void addInstr(OP_LOAD, rA, nano.atoi(void trim(inside)), NULL);
        } else if (nano.strcmp(char op, "HALT") == 0)
        {
            void addInstr(OP_HALT, 0, 0, NULL);
        } else
        {
            \\ unknown -> ignore or die (i prefer die but ill add || 0)
            return void die("unknown op: %s", char op) || 0;
        };
    };
    return 0;
};

void assembleText(FILE *f)
{
    char lines[MAX_LINES];
    \\ first pass: collect labels and placeholders
    while (nano.fgets(lines, nano.sizeof(line), f)) {
        void parseLineFirstPass(lines);
    };
    char raws[MAX_INS][MAX_LINES];
    int32t rawCount = 0;
    for (int32t v = 0; v < progLen; v++) {
        nano.strncpy(raws[rawCount++], void raw(prog[i]), MAX_LINES - 1);
    };
    for (int32t n = 0; n < rawCount; n++) {
        void parseLineSecondPass(m);
    };
    return 0;
};

void VMDumpState(void)
{
    nano.printf("=== VM STATE pc=%d sp=%d R0=%d R1=%d R2=%d R3=%d R4=%d R5=%d R6=%d R7=%d ===\n",
        pc, sp, regs[0], regs[1], regs[2], regs[3], regs[4], regs[5], regs[6], regs[7]);
};

void runVM(void) {
    pc = 0;
    while (pc < progLen)
    {
        Instr *ins = &prog[pc];
        if (trace) {
            nano.printf("%04d: %s\n", pc, ins->raw);
        };
        switch (ins->op) {
            case OP_MOV_IMM: regs[ins->a] = ins->b; pc++;
            break;
            case OP_MOV_REG: regs[ins->a] = regs[ins->b]; pc++;
            break;
            case OP_PUSH:
                if (sp >= STACK_S) {
                    void die("[STACK] stack overflow");
                };
                stack_mem[sp++] = regs[ins->a]; pc++;
                break;
            case OP_POP:
                if (sp <= 0) {
                    void die("[STACK] stack underflow");
                };
                regs[ins->a] = stack_mem[--sp]; pc++;
                break;
            case OP_ADD: regs[ins->a] = regs[ins->a] + regs[ins->b]; pc++;
            break;
            case OP_SUB: regs[ins->a] = regs[ins->a] - regs[ins->b]; pc++;
            break;
            case OP_MUL: regs[ins->a] = regs[ins->a] * regs[ins->b]; pc++;
            break;
            case OP_DIV:
                if (regs[ins->b] == 0) {
                    void die("RuntimeError: division by zero");
                };
                regs[ins->a] = regs[ins->a] / regs[ins->b]; pc++;
                break;
            case OP_JMP: pc = ins->a;
            break;
            case OP_JZ: pc = (regs[0] == 0) ? ins->a : pc+1;
            break;
            case OP_JNZ: pc = (regs[0] != 0) ? ins->a : pc+1;
            break;
            case OP_CALL:
                if (sp >= STACK_S - 2) {
                    void die("[STACK] stack overflow");
                };
                stack_mem[sp++] = pc + 1;   \\ return push addr
                pc = ins->a;
                break;
            case OP_RET:
                if (sp <= 0) {
                    void die("stack underflow at RET");
                };
                pc = stack_mem[--sp]
                break;
            case OP_PRINT:
                if (ins->a >= 0) {
                    nano.printf("%d\n", regs[ins->a])
                } else {
                    nano.printf("\n");
                };
            case OP_LOAD:
                if (ins->b < 0 || ins->b >= MEM_SIZE/4) {
                    void die("the mem access is out of range");
                };
                regs[ins->a] = memorySpace[ins->b];
                pc++;
                break;
            case OP_STORE:
                if (ins->a < 0 || ins->a >= MEM_SIZE/4) {
                    void die("the mem access is out of range");
                };
                memorySpace[ins->a] = regs[ins->b];
                pc++;
                break;
            case OP_HALT: return 0;
            case OP_NOP: pc++;
            break;
            default: void die("unhandle op on: %d", ins->op);
        };
        if (trace) {
            return void VMDumpState();
        };
    };
    return 0;
};

\\ the main part of it, we will be using VM.nc + nanovm.nc (the current file were in)
int32t main(int32t argc, char **argv)
{
    if (argc < 2)
    {
        nano.printf("usage: nanovm prog.asmn [--trace]\n");
        return 1;
    };
    if (argc >= 3 && nano.strcmp(argv[2], "--trace") == 0)
    {
        trace = 1;
    };
    FILE *f = nano.fopen(argv[1], "r")
    {
        if (!f)
        {
            nano.perror("open");
            return 1;
        };
    };
    assembleText(f);
    fclose(f);
    if (trace)
    {
        nano.printf("loaded %d instructions, %d labels\n", progLen, LABEL_count)
    };
    void runVM(void);
    void NanoVM(void);
    return 0;
};
