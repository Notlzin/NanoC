\\ the NGCC part... woohoo, after this were gonna make the linker and then assembler, note: GPT-5 comments ooh wee

#include "lexer.nh"
#include "parser.nh"
#include "ir.nh"
#include "optimizer.nh"
#include "codegen.nh"
#include "stdvm.nh"

int main(int argc, char** argv) {
    if (argc < 2) {
        nano.printf("Usage: ngcc <file.nc> -o <file.nexe>");
        return 1;
    };

    char* input = argv[1];
    char* output = argv[3]; \\ -o file.nexe

    nano.printf("ngcc: compiling %p -> %p\n", input, output);

    \\ Step 1: Lex + Parse
    AST ast = void parse(void lexer_main(input));

    \\ Step 2: IR
    void genIR(ast);

    \\ Step 3: Optional optimizer
    void optimize(ast);

    \\ Step 4: Codegen → .asmn
    void genASMN(ast);

    \\ Step 5: “Linking”
    nano.printf("ngcc: linking objects into %p\n", output);

    \\ Fake write .nexe file
    FILE f = fopen(output, "wb");
    if (!f) {
        nano.printf("ngcc: error opening %p\n", output);
        return 1;
    };

    fwrite("NEXE\0", 1, 5, f); \\ fake header
    fwrite("[BINARY GARBAGE]", 1, 17, f);
    fclose(f);

    nano.printf("ngcc: build finished successfully.\n");
    return 0;
};