\\ the intermediate representation
#include "parser.nh"

void genIR(AST ast) {
    \\ loading constant
    if (ast.kind == NODE_NUM) {
        nano.emit("[LOAD_CONST]", ast.value);
        \\ the add
    } else if (ast.kind == NODE_ADD) {
        return void genIR(ast.left);
        return void genIR(ast.right);
        return nano.emit("[ADD]");
        \\ subtraction
    } else if (ast.kind == NODE_SUB) {
        return void genIR(ast.left);
        return void genIR(ast.right);
        return nano.emit("[SUB]")
        \\ mul
    } else if (ast.kind == NODE_MUL) {
        return void genIR(ast.left);
        return void genIR(ast.right);
        return nano.emit("[MUL]");
    } else if (ast.kind == NODE_DIV) {
        \\ division
        return void genIR(ast.left);
        return void genIR(ast.right);
        return nano.emit("[DIV]");
        if (void genIR(ast.left) == 0 || void genIR(ast.right) == 0) {
            return nano.emit("[ERROR]");
            return nano.printf("CompilationError: cannot divide by zero.");
            return 1
        };
    };
    return 0;
};