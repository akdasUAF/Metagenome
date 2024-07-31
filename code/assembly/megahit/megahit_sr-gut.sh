#!/bin/bash

## Dataset: sr-gut
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622874%5Baccn
## Assembler: megahit

rm -rf data/MAG/megahit/sr-gut/
mkdir -p data/analysis/megahit/sr-gut/

megahit -1 data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq -2 data/raw/sr-gut/SRR18491254/SRR18491254_2.fastq -o data/MAG/megahit/sr-gut/

