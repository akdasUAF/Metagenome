#!/bin/bash
## Dataset: Short read Diabetes
## Uses this Database
## Assembler: MEGAHIT

megahit -1 data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq -2 data/raw/sr-diabetes/SRR341725/SRR341725_2.fastq -o data/process/megahit/sr-diabetes/
