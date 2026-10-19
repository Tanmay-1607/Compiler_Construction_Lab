# Compiler Construction Lab — SEM 5

**Name:** Tanmay Sankulwar  
**PRN:** 24070521058  
**Subject:** Compiler Construction Lab  
**Semester:** 5  

---

## Experiment List

| Exp No. | CO  | Aim |
|:---:|:---:|:---|
| [1](Experiment_1) | CO1 | [Introduction to LEX tool, metadata and patterns](Experiment_1) |
| [2](Experiment_2) | CO1 | [Count comments, keywords, identifiers, words, lines and spaces from an input file](Experiment_2) |
| [3](Experiment_3) | CO1 | [Count words starting with "A"](Experiment_3) |
| [4](Experiment_4) | CO2 | [Introduction to YACC tool and format for writing YACC code](Experiment_4) |
| [5](Experiment_5) | CO2 | [Conversion of lowercase to uppercase and vice versa](Experiment_5) |
| [6](Experiment_6) | CO2 | [Conversion of decimal to hexadecimal number in a file](Experiment_6) |
| [7](Experiment_7) | CO3 | [Test lines ending with "COM"](Experiment_7) |
| [8](Experiment_8) | CO3 | [Postfix Expression Evaluation](Experiment_8) |
| [9](Experiment_9) | CO4 | [Desk calculator with error recovery](Experiment_9) |
| [10](Experiment_10) | CO4 | [Parser for FOR loop statements](Experiment_10) |

---

## How to Compile & Run

### LEX Programs (Experiments 1, 2, 3, 5, 6, 7)
```bash
lex filename.l
cc lex.yy.c -ll
./a.out
```

### YACC Programs (Experiments 4, 8, 9, 10)
```bash
yacc -d filename.y
lex filename.l
cc y.tab.c lex.yy.c -ly -ll
./a.out
```
