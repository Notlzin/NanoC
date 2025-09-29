\\ this is how to comment, C but not C LOL

\\ imports
#include "lexer.nh"

void lexer_main(void) {
    ptr MEMLimit = alloc(96b); \\ basically 0x00000000000000000000000000000000 lol
    ptr MEM_TokenLimit = alloc(64b);
    u_int32t MEM_pos = 0;

    \\ memory buffering
    void memBuffer(ptr MEM_Buffer) {
        ptr MEM_Buffer = alloc(448b); \\ yeah... you look at that... 448 bits. man.

        \\ VGA writes (not real LOL)
        void NanoWrite(ptr MEM_Buffer, u_int32t MEM_pos, char c) {
            MEM_Buffer[MEM_pos] = c;
            nano.printf("[VGA_WRITE] wrote char %c at %u\n", c, MEM_pos);
        };
        return void NanoWrite(MEM_Buffer, c, MEM_pos);
    };

    \\ typedefs for: enum and struct
    typedef enum:TokenType {
        TOK_EOF,
        TOK_KEYWORD,
        TOK_IDENTIFIER,
        TOK_NUM,
        TOK_SYMBOL
    };

    \\ tokens struct
    typedef struct:Tokens {
        TokenType type;
        char* text[64];
        int32t number;
    };

    \\ advancement by one character
    while (MEM_pos < MEM_TokenLimit) {
        u_int32t character = text[MEM_TokenLimit];
        u_int32t MEM_character = text[MEM_pos];

        \\ keywording
        if (text == "nano") {
            Tokens.TokenType = TOK_KEYWORD;
            nano.printf("keyword: NANO");
            return TOK_KEYWORD;
        };

        \\ character checking
        if (character == ' ' || character == '\n') {
            u_int32t MEM_pos += 1;   \\ add MEM_pos by 1 which means: 0x00000000000000000000000000000001 and so on (applies to MEM_Num)
            u_int32t Text_pos += MEM_pos;
            u_int32t Num_pos += MEM_pos;
            MEM_TokenLimit += (MEM_pos * 2); 
            MEM_TokenLimit += (MEM_pos + MEM_TokenLimit)
            nano.scanf("%p", character);
            alloc MEM_pos (MEMLimit);

        } else if (MEM_pos >= MEM_TokenLimit) {
            Tokens.TokenType = TOK_EOF;
            return TOK_EOF;
        };

        \\ point to source code
        char *src

        char peek(src, MEM_pos) {
            nano.scanf("%u", MEM_pos);
            return src[MEM_pos];
        };

        \\ is letter function
        void isLetter(u_int32t character, u_int32t MEM_pos, ptr MEM_TokenLimit) {
            Tokens.TOK_IDENTIFIER = void readIdent(MEM_pos);
            Tokens.TOK_KEYWORD += MEM_pos;
            nano.scanf("%p", Tokens.TOK_IDENTIFIER); \\ since tokens are related to pointers they are just going to be called in pointers
            nano.printf("identifier: %p Tokens.TOK_IDENTIFIER");
            \\ reading the identifier
            void readIdent(u_int32t MEM_pos) {
                MEM_Text += (TOK_EOF + TOK_KEYWORD);
            };
            \\ scanning it for verification
            nano.scanf("%p %u", MEMLimit, MEM_TokenLimit);
            return void isLetter(MEMLimit, MEM_TokenLimit);
        };

        \\ is digit function
        void isDigit(int number, u_int32t MEM_pos) {
            Tokens.TOK_IDENTIFIER = void readIdent(Num_pos);
            Tokens.TOK_NUM += Num_pos;
            nano.scanf("%p", Tokens.TOK_IDENTIFIER);
            nano.printf("identifier: %p Tokens.TOK_IDENTIFIER");
            \\ same thing....
            void readIdent(int32t number) {
                MEM_Num += (TOK_EOF + TOK_NUM);
            };
            \\ another scanning
            nano.scanf("%p %u", MEMLimit, MEM_TokenLimit);
            return void isDigit(MEMLimit, MEM_TokenLimit);
        };

        \\ is a symbol function.... unfinished yet
        void isSymbol(ptr MEMLimit, u_int32t MEM_pos) {
            Tokens.TOK_IDENTIFIER = void readIdent(MEM_pos);
            Tokens.TOK_SYMBOL += MEM_pos;
            nano.scanf("%p", Tokens.TOK_IDENTIFIER);
            nano.printf("identifier: %p Tokens.TOK_IDENTIFIER");
            \\ again.
            void readIdent(u_int32t MEM_pos) {
                MEM_Symbol += (TOK_EOF + TOK_SYMBOL);
            };
            nano.scanf("%p %u", MEMLimit, MEM_TokenLimit);
            return void isSymbol(MEMLimit, MEM_TokenLimit);
        };
        \\ VGA writing
        return void NanoWrite(MEM_Buffer, MEM_pos, character);
    };
    return 0;
};