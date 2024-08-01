#!/bin/bash

## Assembler: abyss
## Dataset: sr-marine_sediment

mkdir -p data/MAG/abyss/sr-marine_sediment/
mkdir -p data/analysis/abyss/sr-marine_sediment/

abyss-pe k=41 name=abyss_sr-marine_sediment B=5.4G \
	in='data/raw/sr-marine_sediment/SRR27456520/SRR27456520_1.fastq data/raw/sr-marine_sediment/SRR27456520/SRR27456520_2.fastq' \
	out='data/MAG/abyss/sr-marine_sediment/'

