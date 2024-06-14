#!/bin/bash
## Dataset: Long-read Gut
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## Assembler: Flye 

mkdir -p data/process/flye/lr-gut/logs
touch data/process/flye/lr-gut/logs/log_flye_sr-gut.txt
{
	flye --nano-raw data/raw/lr-gut/SRR18491310/SRR18491310.fastq --out-dir data/process/flye/lr-gut --threads 4

} > data/process/flye/lr-gut/logs/log_megahit_lr-gut.txt
