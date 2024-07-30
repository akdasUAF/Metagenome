#!/bin/bash

## Dataset: sr-marine_sediment
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## Assembler: megahit

rm -rf data/MAG/megahit/sr-marine_sediment/

megahit -1 data/raw/sr-marine_sediment/SRR27456520/SRR27456520_1.fastq -2 data/raw/sr-marine_sediment/SRR27456520/SRR27456520_2.fastq -o data/MAG/megahit/sr-marine_sediment/

