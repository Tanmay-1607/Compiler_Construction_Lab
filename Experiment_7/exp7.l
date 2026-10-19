/* 
 * Experiment 7: Test lines ending with "COM"
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO3
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int total_lines = 0;
int com_lines = 0;
%}

%%

.*COM\r?\n      {
    total_lines++;
    com_lines++;
    while (yyleng > 0 && (yytext[yyleng - 1] == '\n' || yytext[yyleng - 1] == '\r')) {
        yytext[--yyleng] = '\0';
    }
    printf("Line %d (ends with COM): %s\n", total_lines, yytext);
}

.*\r?\n         {
    total_lines++;
}

.+              {
    total_lines++;
    if (yyleng >= 3 && strcmp(yytext + yyleng - 3, "COM") == 0) {
        com_lines++;
        printf("Line %d (ends with COM): %s\n", total_lines, yytext);
    }
}

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
        printf("Enter lines of text (Press Ctrl+D to finish):\n");
    }

    yylex();

    printf("\n--- Analysis Summary ---\n");
    printf("Total Lines Evaluated    : %d\n", total_lines);
    printf("Lines Ending with 'COM'  : %d\n", com_lines);

    return 0;
}
