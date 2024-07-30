#!/bin/bash

## Dataset: Short read Diabetes
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## Assembler: MetaSpades

mkdir -p data/process/metaspades/sr-gut/
python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py -1 data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq -2 data/raw/sr-gut/SRR18491254/SRR18491254_1.fastq -o data/process/metaspades/sr-gut/