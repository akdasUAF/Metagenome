#!/bin/bash

## Dataset: Long-read Soil
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## Assembler: Flye

mkdir -p data/process/flye/lr-soil/
flye --meta --nano-raw data/raw/lr-soil/SRR21053856/SRR21053856.fastq --out-dir data/process/flye/lr-soil --threads 12



