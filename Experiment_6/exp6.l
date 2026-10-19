/* 
 * Experiment 6: Conversion of decimal to hexadecimal number in a file
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO2
 */

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+          { 
    long long num = atoll(yytext);
    printf("0x%llX", num);
}
.               { printf("%s", yytext); }
\n              { printf("\n"); }

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
        printf("--- Decimal to Hexadecimal Conversion ---\n\n");
    } else {
        printf("Enter text with decimal numbers (Ctrl+D to end):\n");
    }

    yylex();
    return 0;
}
