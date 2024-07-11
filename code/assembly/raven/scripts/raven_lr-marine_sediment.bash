#!/bin/bash

## Dataset: Long-read Marine Sediment
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX22826990%5Baccn
## Assembler: Raven

mkdir -p data/process/raven/lr-marine_sediment/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq > data/process/raven/lr-marine_sediment/assembly_raven_lr-marine_sediment.fasta 2> data/process/raven/lr-marine_sediment/logs/log_raven_lr-marine_sediment.txt