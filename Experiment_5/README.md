# Experiment 5

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Conversion of lowercase to uppercase and vice versa.

## Description
This LEX program inspects incoming characters and toggles the letter casing: all lowercase alphabetic characters (`[a-z]`) are transformed to uppercase, and all uppercase characters (`[A-Z]`) are transformed to lowercase. All other characters (punctuation, numbers, whitespace, symbols) are echoed without modification.

## How to Run

### Compilation & Execution
```bash
lex exp5.l
cc lex.yy.c -ll
./a.out
```

You can also pass a file directly:
```bash
./a.out input.txt
```

### Example Input
```
Hello World! Welcome to Compiler Construction Lab 2026.
```

### Expected Output
```
hELLO wORLD! wELCOME TO cOMPILER cONSTRUCTION lAB 2026.
```
