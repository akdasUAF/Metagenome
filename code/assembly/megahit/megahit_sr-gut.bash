#!/bin/bash

## Dataset: Short read Gut Microbiome
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622874%5Baccn
## Assembler: MEGAHIT

mkdir -p data/process/megahit/sr-gut/logs
touch data/process/megahit/sr-gut/logs/log_megahit_sr-gut.txt
{
megahit -1 data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq -2 data/raw/sr-gut/SRR18491254/SRR18491254_2.fastq -o data/process/megahit/sr-gut/asm_sr-gut_SRR18491254.megahit_asm
} > data/process/megahit/sr-gut/logs/log_megahit_sr-gut.txt

