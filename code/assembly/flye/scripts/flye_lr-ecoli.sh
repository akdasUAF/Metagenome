#!/bin/bash

## Dataset: lr-ecoli
## Uses this dataset: 
## Assembler: Flye

mkdir -p data/MAG/flye/lr-ecoli
flye --meta --nano-raw data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta --out-dir data/MAG/flye/lr-ecoli --threads 20
