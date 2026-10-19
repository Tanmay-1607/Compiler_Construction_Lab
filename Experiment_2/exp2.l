/* 
 * Experiment 2: Count comments, keywords, identifiers, words, lines and spaces from input file
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO1
 */

%{
#include <stdio.h>
#include <stdlib.h>

int single_comment = 0;
int multi_comment = 0;
int keywords = 0;
int identifiers = 0;
int words = 0;
int lines = 0;
int spaces = 0;
%}

%%

\/\/.*                      { single_comment++; }
\/\*([^*]|\*+[^*/])*\*+\/   { 
    multi_comment++; 
    for (int i = 0; yytext[i] != '\0'; i++) {
        if (yytext[i] == '\n') lines++;
    }
}

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"main"|"printf"|"scanf"|"include" {
    keywords++;
    words++;
}

[a-zA-Z_][a-zA-Z0-9_]*      {
    identifiers++;
    words++;
}

[0-9]+(\.[0-9]+)?           {
    words++;
}

[ \t]                       { spaces++; }
\n                          { lines++; }
.                           { /* ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (!f) {
            fprintf(stderr, "Error: Cannot open input file '%s'\n", argv[1]);
            return 1;
        }
        yyin = f;
    } else {
        printf("Usage: ./a.out <input_file>\n");
        printf("Or enter source code directly (Ctrl+D to end):\n");
    }

    yylex();

    printf("\n--- Source Code Analysis Results ---\n");
    printf("Single-line Comments : %d\n", single_comment);
    printf("Multi-line Comments  : %d\n", multi_comment);
    printf("Keywords             : %d\n", keywords);
    printf("Identifiers          : %d\n", identifiers);
    printf("Total Words          : %d\n", words);
    printf("Lines                : %d\n", lines);
    printf("Spaces / Tabs        : %d\n", spaces);

    return 0;
}
