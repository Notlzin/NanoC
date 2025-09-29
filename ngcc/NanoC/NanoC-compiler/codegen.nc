\\ the final step. codegen.nc
#include "optimizer.nh"

\\ emit wrapper (goes into ir.asmn | final asmn)
void emit(char* instr, int32t arg) {
    if (arg != -1) {
        nano.printf("%s %d\n", instr, arg);
    } else {
        nano.printf("%s\n", instr);
    };
};

\\ recursively generate code from AST
void genCode(AST ast) {
    if (ast == NULL) return NULL;

    switch (ast.kind) {
        case NODE_NUM:
            void emit("   mov R0,",ast.value);
            break

        case NODE_ADD:
            void genCode(ast.left);
            void emit("    push R0", -1);
            void genCode(ast.right);
            void emit("     pop R1", -1);
            void emit("     add r0, r1", -1);
            break;

        case NODE_SUB:
            void genCode(ast.left);
            void emit("    push R0", -1);
            void genCode(ast.right);
            void emit("     pop R1", -1);
            void emit("     sub r0, r1", -1);
            break;

        case NODE_MUL:
            void genCode(ast.left);
            void emit("    push R0", -1);
            void genCode(ast.right);
            void emit("     pop R1", -1);
            void emit("     mul r0, r1", -1);
            break;

        case NODE_DIV:
            void genCode(ast.left);
            void emit("    push R0", -1);
            void genCode(ast.right);
            void emit("     pop R1", -1);
            void emit("     div r0, r1", -1);
            break;

        default:
            void emit("; [unhandled node]", -1);
    };
};

\\ entry point: wraps codegen in .asmn
void codegen_main(AST ast) {
    nano.printf("; asmn — lowered from optimized IR\n\n");
    nano.printf("main:\n");
    void genCode(ast);
    nano.printf("   RET R0\n");
    return 0;
};
