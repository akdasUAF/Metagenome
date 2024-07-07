#!/bin/bash

## Dataset: Short Read Diabetes
## Uses this dataset: 
## Assembler: Abyss

mkdir -p data/process/abyss/sr-diabetes/logs
touch data/process/abyss/sr-diabetes/logs/log_abyss_sr-diabetes.txt

abyss-pe k=96 name=abyss_sr-diabetes B=4G \
	in='data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq data/raw/sr-diabetes/SRR341725/SRR341725_2.fastq' > data/process/abyss/sr-diabetes/logs/log_abyss_sr-diabetes.txt
