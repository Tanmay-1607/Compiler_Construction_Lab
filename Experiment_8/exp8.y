/* 
 * Experiment 8: Postfix Expression Evaluation
 * YACC file - Postfix Expression Evaluator
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO3
 */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

int error_occurred = 0;
%}

%token NUMBER

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
        error_occurred = 0;
        yyerrok;
    }
    ;

expression:
    expression expression '+'   { $$ = $1 + $2; }
    | expression expression '-' { $$ = $1 - $2; }
    | expression expression '*' { $$ = $1 * $2; }
    | expression expression '/' {
        if ($2 == 0) {
            printf("Error: Division by zero!\n");
            error_occurred = 1;
            $$ = 0;
        } else {
            $$ = $1 / $2;
        }
    }
    | NUMBER                    { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    printf("Error: Invalid postfix expression (%s)\n", s);
    error_occurred = 1;
}

int main() {
    printf("Postfix Expression Evaluator\n");
    printf("Enter postfix expressions (e.g., 23+ or 23*54*+):\n");
    yyparse();
    return 0;
}
