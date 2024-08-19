#!/bin/bash

## Dataset: Long-read Marine Sediment
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX22826990%5Baccn
## Assembler: Flye

mkdir -p data/MAG/flye/lr-marine_sediment/
flye --meta --nano-raw data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq --out-dir data/MAG/flye/lr-marine_sediment --threads 12

