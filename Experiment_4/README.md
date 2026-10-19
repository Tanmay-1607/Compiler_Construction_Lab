# Experiment 4

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Introduction to YACC tool and format for writing YACC code.

## Description
This experiment demonstrates the YACC (Yet Another Compiler Compiler) tool by implementing an arithmetic calculator parser. The YACC specification file (`exp4.y`) defines the context-free grammar rules for arithmetic expressions along with operator precedence and associativity, while the LEX file (`exp4.l`) acts as the lexical analyzer providing tokens to the parser.

### YACC Specification Structure:
1. **Declarations Section** (`%{ ... %}` and `%token`, `%left`): Contains C headers, function prototypes, token declarations, and precedence declarations.
2. **Grammar Rules Section** (`%% ... %%`): Context-free grammar productions accompanied by semantic action blocks (`{ $$ = ...; }`).
3. **C User Code Section**: Supporting C functions including `main()` which invokes `yyparse()`, and error-handling routine `yyerror()`.

## How to Run

### Compilation & Execution
```bash
yacc -d exp4.y
lex exp4.l
cc y.tab.c lex.yy.c -ly -ll
./a.out
```

### Example Input
```
3+5*2
(10+20)/6
```

### Expected Output
```
Simple Calculator (YACC Demo)
Enter expressions (e.g., 3+5*2):
Result = 13
Result = 5
```
