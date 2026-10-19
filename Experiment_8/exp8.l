/* 
 * Experiment 8: Postfix Expression Evaluation
 * LEX file - Tokenizer for Postfix Expression Evaluator
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO3
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]       { yylval = yytext[0] - '0'; return NUMBER; }
[+\-*/]     { return yytext[0]; }
\n          { return '\n'; }
[ \t]       { ; }
.           { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
