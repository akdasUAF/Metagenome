#!/bin/bash

## Dataset: Short read BSC Soil
## Assembler: MEGAHI


mkdir -p data/process/megahit/sr-bsc/logs
touch data/process/megahit/sr-bsc/logs/log_megahit_sr-bsc.txt
{
	megahit -1 data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq -2 data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq -o data/process/megahit/sr-bsc/
} > data/process/megahit/sr-diabetes/logs/log_megahit_sr-diabetes.txt

