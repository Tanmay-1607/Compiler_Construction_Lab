# Experiment 8

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Postfix Expression Evaluation.

## Description
This experiment implements a postfix arithmetic expression evaluator using YACC with LEX for tokenization. In postfix notation (Reverse Polish Notation), operators follow their operands, eliminating the need for parentheses. The parser evaluates expressions using grammar rules and semantic actions on a bottom-up shift-reduce parse stack.

It supports:
- Single-digit integer operands
- Arithmetic operators: `+`, `-`, `*`, `/`
- Division by zero detection
- Invalid expression detection with error recovery across input lines

## How to Run

### Compilation & Execution
```bash
yacc -d exp8.y
lex exp8.l
cc y.tab.c lex.yy.c -ly -ll
./a.out
```

### Example Input
```
23+
23*54*+
84/
80/
2+
```

### Expected Output
```
Postfix Expression Evaluator
Enter postfix expressions (e.g., 23+ or 23*54*+):
Result = 5
Result = 26
Result = 2
Error: Division by zero!
Error: Invalid postfix expression (syntax error)
```
