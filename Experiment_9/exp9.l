/* 
 * Experiment 9: Desk Calculator with Error Recovery
 * LEX file - Tokenizer for Desk Calculator
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO4
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]   { return yytext[0]; }
\n          { return '\n'; }
[ \t]       { ; }
.           { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
