#!/bin/bash

## Dataset: Long-read Soil
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## Assembler: Flye

mkdir -p data/process/flye/lr-soil/logs
touch data/process/flye/lr-soil/logs/log_flye_lr-soil.txt
{
flye --nano-raw data/raw/lr-marine_sediment/SRR27145287/SRR27145287.fastq --out-dir data/process/flye/lr-soil --threads 4

} > data/process/flye/lr-soil/logs/log_flye_lr-soil.txt


