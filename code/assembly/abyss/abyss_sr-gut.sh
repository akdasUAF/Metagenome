#!/bin/bash

## Assembler: abyss
## Dataset: sr-gut

mkdir -p data/MAG/abyss/sr-gut/
mkdir -p data/analysis/abyss/sr-gut/

abyss-pe k=41 name=abyss_sr-gut B=4G \
	in='data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq' \
	out='data/MAG/abyss/sr-gut/'