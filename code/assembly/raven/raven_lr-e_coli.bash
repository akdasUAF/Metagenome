#!/bin/bash

## Dataset: Long-read E.coli
## Uses this dataset: 
## Assembler: Raven

mkdir -p data/process/raven/lr-e_coli/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/sample1/Loman_E.coli_MAP006-1_2D_50x.fasta > assembly.fasta 2> log.txt