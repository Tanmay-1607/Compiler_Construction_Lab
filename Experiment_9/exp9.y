/* 
 * Experiment 9: Desk Calculator with Error Recovery
 * YACC file - Desk Calculator with Error Recovery
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO4
 */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

int error_occurred = 0;
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

program:
    program line
    | /* empty */
    ;

line:
    '\n'
    | expression '\n' {
        if (!error_occurred) {
            printf("Result = %d\n", $1);
        }
        error_occurred = 0;
    }
    | error '\n' {
        printf("Error: Syntax error in expression. Recovered at newline.\n");
        yyerrok;
        error_occurred = 0;
    }
    ;

expression:
    expression '+' expression   { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression {
        if ($3 == 0) {
            printf("Error: Division by zero!\n");
            error_occurred = 1;
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
    | '-' expression %prec UMINUS { $$ = -$2; }
    | '(' expression ')'       { $$ = $2; }
    | NUMBER                    { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    /* Flag error; line recovery action handles reporting and recovery */
    error_occurred = 1;
}

int main() {
    printf("Desk Calculator with Error Recovery\n");
    printf("Enter arithmetic expressions (one per line, e.g., 2+3, (4+5)*2, 7+, 6/2):\n");
    yyparse();
    return 0;
}
