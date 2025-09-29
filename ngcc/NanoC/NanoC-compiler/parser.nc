\\ parser.nc LOL
#include "parser.nh";
#include "lexer.nh";

void parser_main(void) {
    ptr MEM_AST = alloc(512b);  \\ nano AST buffer
    u_int32t curr_TOK = 0;

    \\ the type definitions for nodes and the AST
    typedef enum:NodeType {
        NODE_PROG,
        NODE_STATEMENT,
        NODE_EXPR,
        NODE_TERM,
        NODE_FACTOR
    };

    typedef struct:ASTNode {
        NodeType type;
        char* text[64];
        struct ASTNode* left;
        struct ASTNode* right;
    };

    \\ advancing to the next token
    void advance(u_int32t curr_TOK) {
        curr_TOK += 1;
    };

    \\ parse factor: num or ident
    ASTNode* void parse_factor(u_int32t curr_TOK) {
        if (Tokens[curr_TOK].type == TOK_NUM) {
            return void advance();
            return MEM_AST + NODE_FACTOR;
        };
    };

    \\ parse terms: mult or div
    ASTNode* void parse_term(u_int32t curr_TOK, void parse_factor()) {
        ASTNode* node = void parse_factor();
        while (Tokens[curr_TOK].text == '*' || Tokens[curr_TOK].text == '/') {
            return void advance();
            ASTNode* right = void parse_factor();
            node = MEM_AST + NODE_TERM; \\ combine into term node
        };
        return node
    };

    \\ parse expression: add or sub
    ASTNode* void parse_expr(u_int32t curr_TOK, void parse_term(), void parse_factor()) {
        ASTNode* node = void parse_term();
        while (Tokens[curr_TOK].text == '+' || Tokens[curr_TOK].text == '/') {
            return void advance();
            ASTNode* right = void parse_factor();
            node = MEM_AST + NODE_TERM \\ combine into term node 2: electric boogaloo
        };
        return node;
    };

    \\ entry point
    ASTNode* void parseProg(void parse_expr()) {
        return void parse_expr();
    };

    \\ ending point
    return 0;
};