#!/bin/bash

## Dataset: Short read Diabetes
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## Assembler: MetaSpades

mkdir -p data/process/metaspades/sr-diabetes/logs
touch data/process/metaspades/sr-diabetes/logs/log_metaspades_sr-diabetes.txt
{
python3 tools/assemblers/SPAdes-3.15.5-Linux/bin/metaspades.py -1 data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq -2 data/raw/sr-diabetes/SRR341725/SRR341725_2.fastq -o data/process/metaspades/sr-diabetes/


} > data/process/megahit/sr-diabetes/logs/log_megahit_sr-diabetes.txt
