#!/bin/bash
## Dataset: sr-marine_sediment
## Uses this dataset:
## Assembler: metaspades

mkdir -p data/MAG/metaspades/sr-marine_sediment
python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py -t 20 -1 data/raw/sr-marine_sediment/SRR27456520/SRR27456520_1.fastq -2 data/raw/sr-marine_sediment/SRR27456520/SRR27456520_2.fastq -o data/MAG/metaspades/sr-marine_sediment/
