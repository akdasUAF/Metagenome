#!/bin/bash
## Dataset: Short read BSC Soil
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX24330662%5Baccn
## Assembler: MetaSpades

mkdir -p data/process/metaspades/sr-bsc/logs
touch data/process/metaspades/sr-bsc/logs/log_metaspades_sr-bsc.txt
{

	python3 tools/assemblers/SPAdes-3.15.5-Linux/bin/spades.py -1 data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq -2 data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq -o data/process/metaspades/sr-bsc/asm_sr-bsc_SRR341725.metaspades_asm --meta
} > data/process/metaspades/sr-bsc/logs/metaspades_sr-bsc.txt
