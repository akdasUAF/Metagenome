#!/bin/bash

## Dataset: Long-read E.coli
## Uses this dataset: 
## Assembler: Flye

mkdir -p data/process/flye/lr-e_coli/logs
touch data/process/Flye/lr-e_coli/logs/log_flye_lr-e_coli.txt
{

	flye --meta --nano-raw data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta --out-dir data/process/flye/lr-diabetes --threads 20

} > data/process/Flye/lr-e_coli/logs/log_flye_lr-e_coli.txt
