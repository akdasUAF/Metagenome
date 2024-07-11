#!/bin/bash

## Dataset: Short read Gut Microbiome
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622874%5Baccn
## Assembler: MEGAHIT

megahit -1 data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq -2 data/raw/sr-gut/SRR18491254/SRR18491254_2.fastq -o data/process/megahit/sr-gut/

