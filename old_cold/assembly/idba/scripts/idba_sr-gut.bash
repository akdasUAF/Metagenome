#!/bin/bash

## Dataset: Short Read Gut
## Uses this dataset: 
## Assembler: IBDA-UD

mkdir -p data/process/idba/sr-gut/

### Setting up reads. They must be in a single fasta and not two fastq
./tools/assemblers/idba/bin/fq2fa --merge --filter data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq data/raw/sr-gut/SRR18491254/SRR18491254_2.fastq data/raw/sr-gut/SRR18491254/SRR18491254_combined.fastq


tools/assemblers/idba/bin/idba_ud -r data/raw/sr-gut/SRR18491254/SRR18491254_combined.fasta -o data/process/idba_ud/sr-gut

