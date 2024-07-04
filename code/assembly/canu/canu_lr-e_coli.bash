#!/bin/bash

## Dataset: Long-read E.coli
## Uses this dataset: 
## Assembler: Canu

mkdir -p data/process/canu/lr-ecoli/logs
touch data/process/canu/lr-ecoli/logs/log_canu_lr-ecoli.txt
{
./tools/assemblers/canu-2.2/bin/canu -p lr-ecoli -d data/process/canu/lr-ecoli/ genomeSize=26000 corOutCoverage=10000 corMhapSensitivity=high corMinCoverage=0 -nanopore data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta

} > data/process/canu/lr-ecoli/logs/log_canu_lr-ecoli.txt
