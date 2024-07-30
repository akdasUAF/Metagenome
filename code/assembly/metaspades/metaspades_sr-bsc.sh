#!/bin/bash
## Dataset: sr-bsc
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX24330662%5Baccn
## Assembler: metaspades

mkdir -p data/MAG/metaspades/sr-bsc/
python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py -1 data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq -2 data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq -o data/MAG/metaspades/sr-bsc/
