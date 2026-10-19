/* 
 * Experiment 5: Conversion of lowercase to uppercase and vice versa
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO2
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
%}

%%

[a-z]       { printf("%c", toupper(yytext[0])); }
[A-Z]       { printf("%c", tolower(yytext[0])); }
\n          { printf("\n"); }
.           { printf("%s", yytext); }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (!f) {
            fprintf(stderr, "Error: Cannot open file '%s'\n", argv[1]);
            return 1;
        }
        yyin = f;
    } else {
        printf("Case Inversion Tool (LEX)\n");
        printf("Enter text to toggle case (Ctrl+D to end):\n");
    }

    yylex();
    return 0;
}
