#!/bin/bash

## Dataset: Short Read gut
## Uses this dataset: 
## Assembler: Abyss

mkdir -p data/process/abyss/sr-gut

abyss-pe k=96 name=abyss_sr-gut B=4G \
	in='data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq'
