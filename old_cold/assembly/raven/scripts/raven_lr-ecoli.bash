#!/bin/bash

## Dataset: Long-read E.coli
## Uses this dataset: 
## Assembler: Raven

mkdir -p data/process/raven/lr-ecoli/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta > data/process/raven/lr-ecoli/assembly_raven_lr-ecoli.fasta 2> logs/assembly/log_assemble_raven_lr-ecoli.log
