# Experiment 7

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Test lines ending with "COM".

## Description
This LEX program reads input line-by-line and checks whether each line terminates with the specific uppercase substring `"COM"`. Matching lines are printed alongside their line numbers, and a final summary reports the total lines read and the number of lines ending with `"COM"`.

## How to Run

### Compilation & Execution
```bash
lex exp7.l
cc lex.yy.c -ll
./a.out
```

Or pass a file:
```bash
./a.out sample.txt
```

### Example Input
```
google.COM
yahoo.org
amazon.COM
github.io
```

### Expected Output
```
Line 1 (ends with COM): google.COM
Line 3 (ends with COM): amazon.COM

--- Analysis Summary ---
Total Lines Evaluated    : 4
Lines Ending with 'COM'  : 2
```
