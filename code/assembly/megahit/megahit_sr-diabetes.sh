#!/bin/bash
## Dataset: sr-diabetes
## Assembler: MEGAHIT

rm -rf data/MAG/megahit/sr-diabetes/
mkdir -p data/analysis/megahit/sr-diabetes/

megahit -1 data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq -2 data/raw/sr-diabetes/SRR341725/SRR341725_2.fastq -o data/MAG/megahit/sr-diabetes/
