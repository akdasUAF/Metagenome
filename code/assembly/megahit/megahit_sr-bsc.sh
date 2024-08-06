#!/bin/bash

## Dataset: sr-bsc
## Assembler: megahit

rm -rf data/MAG/megahit/sr-bsc/ || continue
mkdir -p data/analysis/megahit/sr-bsc/

megahit -1 data/process/sr-bsc/sr-bsc_trimmed_1.fastq -2 data/process/sr-bsc/sr-bsc_trimmed_2.fastq -o data/MAG/megahit/sr-bsc/ --min-contig-len 1000

