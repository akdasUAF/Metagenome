#!/bin/bash

## Dataset: sr-diabetes
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## Assembler: metaspades

python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py -1 data/raw/sr-diabetes/SRR341725/SRR341725_1.fastq -2 data/raw/sr-diabetes/SRR341725/SRR341725_2.fastq -o data/MAG/metaspades/sr-diabetes/