#!/bin/bash

## Dataset: Short Read marine_sediment
## Uses this dataset: 
## Assembler: Abyss

mkdir -p data/process/abyss/sr-marine_sediment/

abyss-pe k=96 name=abyss_sr-marine_sediment B=4G \
	in='data/raw/sr-marine_sediment/SRR27456520/SRR27456520_1.fastq data/raw/sr-marine_sediment/SRR27456520/SRR27456520_2.fastq'
