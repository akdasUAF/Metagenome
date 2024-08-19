#!/bin/bash
## Dataset: Long-read Synthetic
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/PRJNA903965
## Assembler: Flye 

mkdir -p data/MAG/flye/lr-bd/

flye -meta --nano-raw data/raw/lr-bd/SRR22366767/SRR22366767.fastq --out-dir data/MAG/flye/lr-synth --threads 12
