#!/bin/bash

## Dataset: lr-gut
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## Assembler: raven

mkdir -p data/MAG/raven/lr-gut/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-gut/SRR18491310/SRR18491310.fastq > data/MAG/raven/lr-gut/assembly_raven_lr-gut.fasta 2> data/analysis/raven/lr-gut/log_assemble_raven_lr-gut.log

