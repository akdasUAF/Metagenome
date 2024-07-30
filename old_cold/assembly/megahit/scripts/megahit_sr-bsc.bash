#!/bin/bash

## Dataset: Short read BSC Soil
## Assembler: MEGAHIT

mkdir -p data/process/megahit/sr-bsc/
megahit -1 data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq -2 data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq -o data/process/megahit/sr-bsc/

