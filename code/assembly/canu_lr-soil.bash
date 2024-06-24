#!/bin/bash

## Dataset: Long-read Soil
## Uses this dataset:  https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## Assembler: Canu

mkdir -p data/process/canu/lr-soil/log
touch data/process/canu/lr-soil/logs/log_canu_lr-marine_sediment.txt
{
./tools/assemblers/canu-2.2/bin/canu -p lr-soil -d data/process/canu/lr-soil/ genomeSize=162.3M -nanopore data/raw/lr-gut/SRR21053856/SRR21053856.fastq

} > data/process/canu/lr-soil/logs/log_canu_lr-soil.txt
