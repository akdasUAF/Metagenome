#!/bin/bash
## Dataset: Long-read Synthetic
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/PRJNA903965
## Assembler: Flye 

mkdir -p data/process/flye/lr-synth/
./tools/assemblers/raven/build/bin/raven -t 12 data/raw/lr-soil/SRR21053856/SRR21053856.fastq > data/process/raven/lr-soil/assembly_raven_lr-soil.fasta 2> data/process/raven/lr-soil/logs/log_raven_lr-soil.txt

