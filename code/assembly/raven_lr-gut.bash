#!/bin/bash

## Dataset: Long-read Gut
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## Assembler: Raven

mkdir -p data/process/raven/lr-gut/logs
touch data/process/raven/lr-gut/logs/log_raven_lr-gut.txt

./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-gut/SRR18491310/SRR18491310.fastq > data/process/raven/lr-gut/assembly_raven_lr-gut.fasta 2> data/process/raven/lr-gut/logs/log_raven_lr-gut.txt
