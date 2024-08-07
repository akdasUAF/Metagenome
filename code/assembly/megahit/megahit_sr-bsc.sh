#!/bin/bash

## Dataset: sr-bsc
## Assembler: megahit

rm -rf data/MAG/megahit/sr-bsc/ || continue
mkdir -p data/analysis/megahit/sr-bsc/

megahit -1 data/process/sr-bsc/trimmed/*_1.fastq -2 data/process/sr-bsc/trimmed/*_2.fastq -o data/MAG/megahit/ --min-contig-len 1000

