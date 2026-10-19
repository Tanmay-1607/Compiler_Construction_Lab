/* 
 * Experiment 4: Introduction to YACC tool and format for writing YACC code
 * YACC file - Arithmetic Calculator demonstrating YACC grammar format
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO2
 */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

program:
    program statement '\n'
    | /* empty */
    ;

statement:
    expression    { printf("Result = %d\n", $1); }
    ;

expression:
    expression '+' expression   { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression { 
        if ($3 == 0) {
            yyerror("Division by zero!");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
    | '(' expression ')'       { $$ = $2; }
    | NUMBER                    { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Simple Calculator (YACC Demo)\n");
    printf("Enter expressions (e.g., 3+5*2):\n");
    yyparse();
    return 0;
}
