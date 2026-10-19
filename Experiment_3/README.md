# Experiment 3

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

## Aim
Count words starting with "A".

## Description
This LEX program inspects input text, isolates individual words, and identifies all words that begin with the letter 'A' or 'a'. It prints each matching word as it is discovered and outputs a final count showing total words and matching words.

## How to Run

### Compilation & Execution
```bash
lex exp3.l
cc lex.yy.c -ll
./a.out
```

Or pass an input file:
```bash
./a.out input.txt
```

### Example Input
```
Apple and banana are fruits. An aeroplane flew across America.
```

### Expected Output
```
Found word starting with 'A'/'a': Apple
Found word starting with 'A'/'a': and
Found word starting with 'A'/'a': are
Found word starting with 'A'/'a': An
Found word starting with 'A'/'a': aeroplane
Found word starting with 'A'/'a': across
Found word starting with 'A'/'a': America

--- Summary of Words ---
Total Words Detected            : 10
Words Starting with 'A' or 'a'  : 7
```
