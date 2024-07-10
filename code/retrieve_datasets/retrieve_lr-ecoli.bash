#!/bin/bash

## Sets working directory to the Long read Ecoli
## Uses this dataset: 
## This uses the SRA toolkit from NCBI to retrieve the reads

mkdir -p data/raw/lr-ecoli
wget -O data/raw/lr-ecoli/Loman_E.coli_MAP006-1_2D_50x.fasta https://zenodo.org/record/1172816/files/Loman_E.coli_MAP006-1_2D_50x.fasta
