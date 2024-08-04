#!/bin/bash

## Dataset: lr-soil
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## Assembler: raven

mkdir -p data/MAG/raven/lr-soil/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-soil/SRR21053856/SRR21053856.fastq > data/MAG/raven/lr-soil/assembly_raven_lr-soil.fasta 2> data/analysis/raven/lr-soil/log_assemble_raven_lr-soil.log

