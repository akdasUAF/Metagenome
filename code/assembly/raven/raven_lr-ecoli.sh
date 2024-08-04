#!/bin/bash

## Dataset: lr-ecoli
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## Assembler: raven

mkdir -p data/MAG/raven/lr-ecoli/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta > data/MAG/raven/lr-ecoli/assembly_raven_lr-ecoli.fasta 2> data/analysis/raven/lr-ecoli/log_assemble_raven_lr-ecoli.log

