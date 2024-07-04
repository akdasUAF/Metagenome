#!/bin/bash

## Dataset: Short read soil (BSC)
## Uses this dataset: 
## Assembler: IBDA-UD

### Setting up reads. They must be in a single fasta and not two fastq
./tools/assemblers/idba/bin/fq2fa --merge --filter data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_combined.fasta

mkdir -p data/process/idba/sr-bsc/logs
touch data/process/idba/sr-bsc/logs/log_idba_sr-bsc.txt


tools/assemblers/idba/bin/idba_ud -r data/raw/sr-bsc/SRR28765359/SRR28765359_combined.fastq -o data/process/idba_ud/sr-bsc/
