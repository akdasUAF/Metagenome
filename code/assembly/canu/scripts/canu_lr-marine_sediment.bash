#!/bin/bash

## Dataset: Long-read Marine Sediment
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX22826990%5Baccn
## Assembler: Canu

mkdir -p data/process/canu/lr-marine_sediment
# ./tools/assemblers/canu-2.2/bin/canu -p lr-marine_sediment -d data/process/canu/lr-marine_sediment/ -nanopore data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq 
./tools/assemblers/canu-2.2/bin/canu -p lr-marine_sediment -d data/process/canu/lr-marine_sediment/ genomeSize=141000 -nanopore data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq 