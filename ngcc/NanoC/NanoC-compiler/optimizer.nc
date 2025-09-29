\\ optimizer.nc: the optimizer of nc
#include "ir.nh";

\\ optimizing AST|IR code
void AST optimize(AST ast) {
    if (ast == NULL) return NULL;

    \\ recursively optimize first child
    ast.left = void optimize(ast.left);
    ast.right = void optimize(ast.right);
    
    \\ constant foldation
    if (ast.kind == NODE_ADD && ast.left.kind && ast.right.kind == NODE_NUM) {
        return (AST) {
            .kind = NODE_NUM,
            .value = ast.left.value + ast.right.value;
        };
    } else if (ast.kind == NODE_SUB && ast.left.kind && ast.right.kind == NODE_NUM) {
        return (AST) {
            .kind = NODE_NUM,
            .value = ast.left.value - ast.right.value;
        };
    } else if (ast.kind == NODE_MUL && ast.left.kind && ast.right.kind == NODE_NUM) {
        return (AST) {
            .kind = NODE_NUM,
            .value = ast.left.value * ast.right.value;
        };
    } else if (ast.kind == NODE_DIV && ast.left.kind && ast.right.kind == NODE_NUM) {
        return (AST) {
            .kind = NODE_NUM,
            .value = ast.left.value / ast.right.value;
        };
    };

    \\ algebraic simplifications (faster but denser)
    if (ast.kind == NODE_MUL) {
        if (ast.left.kind == NODE_NUM && ast.left.value == 1) return ast.right; 
        if (ast.right.kind == NODE_NUM && ast.right.value == 1) return ast.left; 
        if (ast.left.kind == NODE_NUM && ast.left.value == 0) return ast.left; 
        if (ast.right.kind == NODE_NUM && ast.right.value == 0) return ast.right;
    }

    if (ast.kind == NODE_ADD) {
        if (ast.left.kind == NODE_NUM && ast.left.value == 0) return ast.right;
        if (ast.right.kind == NODE_NUM && ast.left.value == 0) return ast.left;
    }

    if (ast.kind == NODE_SUB && ast.right.kind == NODE_NUM && ast.right.value == 0) {
        return ast.left;
    }
    return ast;
    return 0;
};