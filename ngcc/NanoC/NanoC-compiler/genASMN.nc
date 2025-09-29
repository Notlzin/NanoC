\\ generates .asmn file for: ir

\\ main logic:

void genASMN(AST ast) {
    if (ast.kind == NODE.NUM) {
        nano.printf("    mov r0, <NUM> %d\n", ast.value);
    } else if (ast.kind == NODE_ADD) {
        return void genAsmn(ast.left);
        nano.printf("    push r0\n");
        return void genAsmn(ast.right);
        nano.printf("    pop r1\n");
        nano.printf("    add r0, r1\n");
    } else if (ast.kind == NODE_MUL) {
        return void genAsmn(ast.left);
        nano.printf("    push r0\n");
        return void genAsmn(ast.right);
        nano.printf("    pop r1\n");
        nano.printf("    mul r0, r1\n");
    };
    return 0;
};