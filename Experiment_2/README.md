# Experiment 2

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Count comments, keywords, identifiers, words, lines and spaces from an input file.

## Description
This LEX program performs lexical analysis on a source code file to identify and count:
- **Single-line comments** (`// ...`)
- **Multi-line comments** (`/* ... */`)
- **C language keywords** (e.g., `int`, `float`, `for`, `if`, `return`, `void`, etc.)
- **Identifiers** matching C naming rules (`[a-zA-Z_][a-zA-Z0-9_]*`)
- **Total words**, lines of code, and spaces/tabs

## How to Run

### Compilation & Execution
```bash
lex exp2.l
cc lex.yy.c -ll
./a.out input.txt
```

You can also run the program interactively by omitting the file argument:
```bash
./a.out
```

### Example Input (`input.txt`)
```c
// Sample comment
#include <stdio.h>
int main() {
    int x = 10;
    return 0;
}
```

### Expected Output
```
--- Source Code Analysis Results ---
Single-line Comments : 1
Multi-line Comments  : 0
Keywords             : 4
Identifiers          : 2
Total Words          : 7
Lines                : 6
Spaces / Tabs        : 14
```
