#!/bin/bash
## Dataset: sr-gut
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX24330662%5Baccn
## Assembler: metaspades

python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py -1 data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq -2 data/raw/sr-gut/SRR18491254/SRR18491254_2.fastq -o data/MAG/metaspades/sr-gut/

