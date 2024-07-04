#!/bin/bash
## Dataset: Long-read Synthetic
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/PRJNA903965
## Assembler: Flye 

mkdir -p data/process/flye/lr-synth/logs
touch data/process/flye/lr-gut/logs/log_flye_lr-synth.txt
{
	flye -meta --nano-raw data/raw/lr-synth/SRR22366767/SRR22366767.fastq --out-dir data/process/flye/lr-synth --threads 12

} > data/process/flye/lr-synth/logs/log_flye_lr-synth.txt
