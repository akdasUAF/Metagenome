#!/bin/bash

## Assembler: abyss
## Dataset: sr-bsc

mkdir -p data/MAG/abyss/sr-bsc/
mkdir -p data/analysis/abyss/sr-bsc/

abyss-pe k=41 name=abyss_sr-bsc B=4G \
	in='data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq' \
	out='data/MAG/abyss/sr-bsc/'