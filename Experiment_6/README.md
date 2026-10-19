# Experiment 6

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Conversion of decimal to hexadecimal number in a file.

## Description
This LEX program reads an input text stream or file containing decimal numbers and replaces all decimal sequences (`[0-9]+`) with their formatted hexadecimal equivalents (e.g., `0x400`, `0x1F90`). All non-numeric characters, formatting, words, and structure remain completely intact.

## How to Run

### Compilation & Execution
```bash
lex exp6.l
cc lex.yy.c -ll
./a.out input.txt
```

You can also run interactively:
```bash
./a.out
```

### Example Input (`input.txt`)
```
Process id: 1024
Port number: 8080
Memory address offset: 255
Buffer size: 4096 bytes
```

### Expected Output
```
--- Decimal to Hexadecimal Conversion ---

Process id: 0x400
Port number: 0x1F90
Memory address offset: 0xFF
Buffer size: 0x1000 bytes
```
