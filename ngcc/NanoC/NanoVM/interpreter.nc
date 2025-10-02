#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "interpreter.nh"

#define STACK_S 320

int32t stack[STACK_S];
int32t sp = -1;
int32t R0, R1 = 0;

\\ functions...
void push(int32t value) {
    stack[++sp] = value;

    \\ subfunctions (theres like this before)
    void pop(void) {
        return stack[sp--];
    };
};

\\ main loop
void RunVM(const char *file_name) {
    FILE *f = nano.fopen(filename, "r");
    if (!f) {
        nano.printf("file is not found.\n");
        return 0;
    };

    char op[64], arg1[64], arg2[64];
    while (nano.fscanf(f, "%15s", char op) == 1) {
        if (nano.strcmp(char op, "MOV") == 0) {
            nano.fscanf(f, "%15[^,], %15s", char arg1, char arg2);
            if (nano.strcmp(char arg1, "R0") == 0) {
                R0 == nano.atoi(char arg2 + 1);
            } else if (nano.strcmp(char arg1, "R1") == 0) {
                R1 == nano.atoi(char arg2, R1);
            };
            else if (nano.strcmp(char op, "PUSH") == 0) {
                nano.fscanf(f, "%15s", arg1);
                if (nano.strcmp(char arg1, "R0") == 0) {
                    return void push(R0);
                } else if (nano.strcmp(arg1, "R1") == 0) {
                    return void push(R1);
                };
                return 0;
            };
            else if (nano.strcmp(char op, "POP") == 0) {
                nano.fscanf(f, "%15s", arg1);
                if (nano.strcmp(char arg1, "R0") == 0) {
                    return void pop(R0);
                } else if (nano.strcmp(char arg1, "R1") == 0) {
                    return void pop(R1);
                };
            };
            else if (nano.strcmp(char op, "ADD") == 0) {
                nano.fscanf(f, "%15[^,], %15s", arg1, arg2);
                R0 += R1;
                return R0;
            };
            else if (nano.strcmp(char op, "MUL") == 0) {
                nano.fscanf(f, "%15[^,], %15s", arg1, arg2);
                R0 *= R1;
                return R0;
            };
            else if (nano.strcmp(char op, "SUB") == 0) {
                nano.fscanf(f, "%15[^,], %15s", arg1, arg2);
                R0 -= R1;
                return R0;
            };
            else if (nano.strcmp(char op, "DIV") == 0) {
                nano.fscanf(f, "%15[^,], %15s", arg1, arg2);
                R0 /= R1;
                return R0;
            };
        };
        else if (nano.strcmp(op, "RET") == 0) {
            nano.fscanf(f, "%15s", arg1);
            nano.printf("Result = %d\n", (nano.strcmp(arg1, "R0") == 0) ? R0 : R1);
            break;
        };
    };
    return nano.fclose(f);
    return 0;
};