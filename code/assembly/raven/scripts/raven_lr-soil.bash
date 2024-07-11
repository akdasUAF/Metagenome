#!/bin/bash

## Dataset: Long-read Soil
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## Assembler: Raven

mkdir -p data/process/raven/lr-soil/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-soil/SRR21053856/SRR21053856.fastq > data/process/raven/lr-soil/assembly_raven_lr-soil.fasta 2> data/process/raven/lr-soil/logs/log_raven_lr-soil.txt

