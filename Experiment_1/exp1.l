/* 
 * Experiment 1: Introduction to LEX tool, metadata and patterns
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO1
 */

%{
#include <stdio.h>
#include <stdlib.h>

int vowels = 0;
int consonants = 0;
int digits = 0;
int spaces = 0;
int words = 0;
int lines = 0;
int special = 0;
%}

%%

[a-zA-Z0-9]+ {
    words++;
    for (int i = 0; yytext[i] != '\0'; i++) {
        char c = yytext[i];
        if (c >= '0' && c <= '9') {
            digits++;
        } else if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' ||
                   c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') {
            vowels++;
        } else if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
            consonants++;
        }
    }
}
[ \t]   { spaces++; }
\n      { lines++; }
.       { special++; }

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
        printf("Introduction to LEX Tool — Pattern & Metadata Analyzer\n");
        printf("Enter text input (Press Ctrl+D on Linux or Ctrl+Z on Windows to end):\n");
    }

    yylex();

    printf("\n--- Metadata & Pattern Summary ---\n");
    printf("Total Words      : %d\n", words);
    printf("Vowels           : %d\n", vowels);
    printf("Consonants       : %d\n", consonants);
    printf("Digits           : %d\n", digits);
    printf("Spaces / Tabs    : %d\n", spaces);
    printf("Lines            : %d\n", lines);
    printf("Special Chars    : %d\n", special);

    return 0;
}
