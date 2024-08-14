#!/bin/bash

## Assembler: abyss
## Dataset: sr-bmock

mkdir -p data/MAG/sr-bsc/abyss/
mkdir -p data/analysis/sr-bmock/abyss/

abyss-pe k=auto name=abyss_sr-bmock B=10G \
	in='data/process/sr-bmock/trimmed/sr-bmock_trimmed_SRR8073716_1.fastq.gz data/process/sr-bmock/trimmed/sr-bmock_trimmed_SRR8073716_2.fastq.gz' \
	out='data/MAG/abyss/sr-bmock/'