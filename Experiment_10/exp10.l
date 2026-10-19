/* 
 * Experiment 10: Parser for FOR Loop Statements
 * LEX file - Tokenizer for C-style FOR loop parser
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

"for"                   { return FOR; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[0-9]+                  { return NUM; }

"<="                    { return LE; }
">="                    { return GE; }
"=="                    { return EQ; }
"!="                    { return NE; }
"<"                     { return LT; }
">"                     { return GT; }

"++"                    { return INC; }
"--"                    { return DEC; }

"+="                    { return ADD_ASSIGN; }
"-="                    { return SUB_ASSIGN; }
"*="                    { return MUL_ASSIGN; }
"/="                    { return DIV_ASSIGN; }

"="                     { return '='; }
";"                     { return ';'; }
","                     { return ','; }
"("                     { return '('; }
")"                     { return ')'; }
"{"                     { return '{'; }
"}"                     { return '}'; }
[+\-*/]                 { return yytext[0]; }

\n                      { return '\n'; }
[ \t\r]+                { /* ignore whitespace */ }
.                       { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
