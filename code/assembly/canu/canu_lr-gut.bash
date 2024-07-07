#!/bin/bash

## Dataset: Long-read Gut
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## Assembler: Canu

mkdir -p data/process/canu/lr-gut/logs
touch data/process/canu/lr-gut/logs/log_flye_lr-gut.txt
{
./tools/assemblers/canu-2.2/bin/canu -p lr-gut -d data/process/canu/lr-gut/ genomeSize = 5300000 corOutCoverage=10000 corMhapSensitivity=high corMinCoverage=0 -nanopore data/raw/lr-gut/SRR18491310/SRR18491310.fastq

} > data/process/canu/lr-gut/logs/log_canu_lr-gut.txt
