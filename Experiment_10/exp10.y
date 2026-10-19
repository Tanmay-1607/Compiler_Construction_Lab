/* 
 * Experiment 10: Parser for FOR Loop Statements
 * YACC file - Parser for C-style FOR loop statements
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO4
 */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

int valid = 1;
%}

%token FOR ID NUM
%token LE GE EQ NE LT GT
%token INC DEC
%token ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN

%left '+' '-'
%left '*' '/'

%%

program:
    program line
    | /* empty */
    ;

line:
    '\n'
    | for_statement '\n' {
        if (valid) {
            printf("Valid for loop syntax\n");
        }
        valid = 1;
    }
    | error '\n' {
        printf("Invalid for loop syntax\n");
        yyerrok;
        valid = 1;
    }
    ;

for_statement:
    FOR '(' init ';' condition ';' update ')' body
    ;

init:
    /* empty */
    | init_list
    ;

init_list:
    init_item
    | init_list ',' init_item
    ;

init_item:
    ID '=' expr
    | ID ID '=' expr
    | expr
    ;

condition:
    /* empty */
    | cond_expr
    ;

cond_expr:
    expr relop expr
    | expr
    ;

relop:
    LT | GT | LE | GE | EQ | NE
    ;

update:
    /* empty */
    | update_list
    ;

update_list:
    update_item
    | update_list ',' update_item
    ;

update_item:
    ID INC
    | INC ID
    | ID DEC
    | DEC ID
    | ID '=' expr
    | ID ADD_ASSIGN expr
    | ID SUB_ASSIGN expr
    | ID MUL_ASSIGN expr
    | ID DIV_ASSIGN expr
    | expr
    ;

body:
    /* empty - supports loop header alone */
    | ';'
    | simple_stmt ';'
    | '{' stmt_list '}'
    ;

stmt_list:
    stmt_list stmt
    | /* empty */
    ;

stmt:
    simple_stmt ';'
    | for_statement
    | '{' stmt_list '}'
    ;

simple_stmt:
    ID '=' expr
    | ID INC
    | INC ID
    | ID DEC
    | DEC ID
    | expr
    ;

expr:
    expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | ID
    | NUM
    ;

%%

void yyerror(const char *s) {
    valid = 0;
}

int main() {
    printf("Parser for FOR Loop Statements\n");
    printf("Enter for loop statements (one per line, e.g., for (i = 0; i < 10; i++)):\n");
    yyparse();
    return 0;
}
