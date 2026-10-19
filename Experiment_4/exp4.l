/* 
 * Experiment 4: Introduction to YACC tool and format for writing YACC code
 * LEX file - Tokenizer for arithmetic expression parser
 * Name: Tanmay Sankulwar
 * PRN: 24070521058
 * CO2
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]       { return yytext[0]; }
\n              { return '\n'; }
[ \t]           { ; }
.               { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
