#!/bin/bash

## Dataset: Long-read Marine Sediment
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX22826990%5Baccn
## Assembler: Flye

mkdir -p data/process/flye/lr-marine_sediment/logs
touch data/process/flye/lr-marine_sediment/logs/log_flye_lr-marine_sediment.txt
{
flye --meta --nano-raw data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq --out-dir data/process/flye/lr-marine_sediment --threads 12

} > data/process/flye/lr-marine_sediment/logs/log_flye_lr-marine_sediment.txt

