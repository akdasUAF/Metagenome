#!/bin/bash

## Dataset: Long-read Marine Sediment
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX22826990%5Baccn
## Assembler: Canu

mkdir -p data/process/canu/lr-marine_sediment/log
touch data/process/canu/lr-marine_sediment/log/log_canu_lr-marine_sediment.txt
{
./tools/assemblers/canu-2.2/bin/canu -p lr-marine_sediment -d data/process/canu/lr-marine_sediment/ -nanopore data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq 

./tools/assemblers/canu-2.2/bin/canu -p lr-marine_sediment -d data/process/canu/lr-marine_sediment/ genomeSize=14100000 -nanopore data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq 


} > data/process/canu/lr-marine_sediment/logs/log_canu_lr-marine_sediment.txt
