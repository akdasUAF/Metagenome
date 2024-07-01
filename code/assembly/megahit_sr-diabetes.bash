#!/bin/bash
## Dataset: Short read Diabetes
## Uses this Database
## Assembler: MEGAHIT

mkdir -p data/process/megahit/sr-diabetes/logs
touch data/process/megahit/sr-diabetes/logs/log_megahit_sr-diabetes.txt
{
	megahit -1 data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq -2 data/raw/sr-diabetes/SRR341725/SRR341725_2.fastq -o data/process/megahit/sr-diabetes/asm_sr-bsc_SRR341725.megahit_asm
} > data/process/megahit/sr-diabetes/logs/log_megahit_sr-diabetes.txt

