#!/bin/bash

## Dataset: Long-read E.coli
## Uses this dataset: 
## Assembler: Flye

mkdir -p data/process/flye/lr-e_coli
flye --meta --nano-raw data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta --out-dir data/process/flye/lr-diabetes --threads 20
