#!/bin/bash

## Dataset: lr-marine_sediment
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX22826990%5Baccn
## Assembler: Raven

mkdir -p data/MAG/raven/lr-marine_sediment/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq > data/MAG/raven/lr-marine_sediment/assembly_raven_lr-marine_sediment.fasta 2> data/analysis/raven/lr-marine_sediment/log_assemble_raven_lr-marine_sediment.log