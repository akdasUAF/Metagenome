#!/bin/bash

## Assembler: abyss
## Dataset: sr-diabetes

mkdir -p data/MAG/abyss/sr-diabetes

abyss-pe k=96 name=abyss_sr-diabetes B=4G \
	in='data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq data/raw/sr-diabetes/SRR341725/SRR341725_2.fastq' \
	out='data/MAG/abyss/sr-diabetes/'