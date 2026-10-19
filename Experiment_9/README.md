# Experiment 9

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Desk calculator with error recovery.

## Description
This experiment implements an interactive desk calculator using YACC and LEX with error-recovery mechanisms. It evaluates standard infix arithmetic expressions with operator precedence and associativity rules, supports nested parentheses, multiple expressions in a single session, and handles syntax errors gracefully.

When a syntax error (such as a malformed expression like `7+`) is encountered, YACC catches the error using the `error` pseudo-token rule, reports the problem, and recovers at the newline boundary (`yyerrok`), allowing subsequent expressions to be evaluated without terminating the program.

It supports:
- Addition, subtraction, multiplication, and division
- Unary minus and parentheses `(...)`
- Standard operator precedence (`*`, `/` over `+`, `-`)
- Division by zero detection
- Error recovery at newline delimiter

## How to Run

### Compilation & Execution
```bash
yacc -d exp9.y
lex exp9.l
cc y.tab.c lex.yy.c -ly -ll
./a.out
```

### Example Input
```
2+3
(4+5)*2
7+
6/2
```

### Expected Output
```
Desk Calculator with Error Recovery
Enter arithmetic expressions (one per line, e.g., 2+3, (4+5)*2, 7+, 6/2):
Result = 5
Result = 18
Error: Syntax error in expression. Recovered at newline.
Result = 3
```
