#!/bin/bash

## Dataset: Short Read marine sediment
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## Assembler: MEGAHIT

mkdir -p data/process/megahit/sr-marine_sediment/logs
touch data/process/megahit/sr-diabetes/logs/log_megahit_sr-marine_sediment.txt
{
megahit -1 data/raw/sr-marine_sediment/SRR27456520/SRR27456520_1.fastq -2 data/raw/sr-marine_sediment/SRR27456520/SRR27456520_2.fastq -o data/process/megahit/sr-marine_sediment/asm_sr-marine_sediment_SRR27456520.megahit_asm
} > data/process/megahit/sr-marine_sediment/logs/log_megahit_sr-marine_sediment.txt
