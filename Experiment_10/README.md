# Experiment 10

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  

## Aim
Parser for FOR loop statements.

## Description
This experiment implements a syntax parser for C-style `for` loop statements using LEX for lexical analysis and YACC for context-free grammar parsing.

The parser validates the complete structure of a `for` loop:
- `for` keyword recognition
- Parentheses matching `(` and `)`
- Semicolon separators between initialization, condition, and update expressions
- Initialization: simple assignments (`i = 0`), typed assignments (`int i = 0`), expressions, or empty
- Condition: relational comparisons (`i < 10`, `i <= n`, `==`, `!=`), expressions, or empty
- Update: increment/decrement (`i++`, `++i`, `i--`, `--i`), compound assignments (`i += 2`), expressions, or empty
- Scope of validation: Supports standalone loop headers (e.g. `for (i = 0; i < 10; i++)`) as well as loops with statement bodies (`for (...);` or `for (...) { ... }`).

It properly accepts valid `for` loop constructs and rejects malformed inputs (such as missing semicolons or unmatched parentheses) with error reporting.

## How to Run
```bash
yacc -d exp10.y
lex exp10.l
cc y.tab.c lex.yy.c -ly -ll
./a.out
```

### Example Input
```
for (i = 0; i < 10; i++)
for (i = 0; i < 10; i++);
for (i = 0; i < 10; i++) { count++; }
for (;;)
for (i = 0 i < 10; i++)
for (i = 0; i < 10; i++
```

### Expected Output
```
Parser for FOR Loop Statements
Enter for loop statements (one per line, e.g., for (i = 0; i < 10; i++)):
Valid for loop syntax
Valid for loop syntax
Valid for loop syntax
Valid for loop syntax
Invalid for loop syntax
Invalid for loop syntax
```
