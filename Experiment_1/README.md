# Experiment 1

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Introduction to LEX tool, metadata and patterns.

## Description
This experiment introduces lexical analysis using the LEX (Fast Lexical Analyzer) tool. The program analyzes an input stream or file, recognizes regular expression patterns, and gathers metadata about the text including total words, vowels, consonants, digits, whitespace/tabs, lines, and special characters.

### Key Concepts:
1. **Regular Expressions**: Defines lexical patterns using character classes (`[aeiouAEIOU]`, `[a-zA-Z]`, `[0-9]`).
2. **LEX Execution Flow**: LEX translates regular expression patterns into a deterministic finite automaton (DFA) generated as `lex.yy.c`.
3. **Actions**: C code blocks executed upon matching specific input tokens.

## How to Run

### Compilation & Execution
```bash
lex exp1.l
cc lex.yy.c -ll
./a.out
```

Enter your input text and press `Ctrl+D` (Linux/Mac) or `Ctrl+Z` (Windows) to end input. You can also pass a file directly:
```bash
./a.out sample.txt
```

### Example Input
```
Hello World! 123
```

### Expected Output
```
--- Metadata & Pattern Summary ---
Total Words      : 3
Vowels           : 3
Consonants       : 7
Digits           : 3
Spaces / Tabs    : 2
Lines            : 1
Special Chars    : 1
```
