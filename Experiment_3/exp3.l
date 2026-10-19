/* 
 * Experiment 3: Count words starting with "A"
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO1
 */

%{
#include <stdio.h>
#include <stdlib.h>

int count_A = 0;
int total_words = 0;
%}

%%

[Aa][a-zA-Z0-9_]*           { 
    count_A++; 
    total_words++; 
    printf("Found word starting with 'A'/'a': %s\n", yytext); 
}

[a-zA-Z0-9_]+               { 
    total_words++; 
}

[ \t\n\r]                   { ; }
.                           { ; }

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
        printf("Enter text input (Ctrl+D to end):\n");
    }

    yylex();

    printf("\n--- Summary of Words ---\n");
    printf("Total Words Detected            : %d\n", total_words);
    printf("Words Starting with 'A' or 'a'  : %d\n", count_A);

    return 0;
}
