#!/bin/bash

mkdir -p data/MAG/metavelvet/sr-bsc/

# Quality trimming and adapter removal
trimmomatic PE -phred33 fasta_1.fasta fasta_2.fasta trimmed_1.fastq trimmed_unpaired_1.fastq trimmed_2.fastq trimmed_unpaired_2.fastq ILLUMINACLIP:adapters.fasta:2:30:10

# Velvet graph construction
velveth data/MAG/metavelvet/sr-bsc/ 41 -shortPaired -separate -fastq data/raw/sr-bsc/SRR28765359/SRR28765359_1.fastq data/raw/sr-bsc/SRR28765359/SRR28765359_2.fastq

velvetg data/MAG/metavelvet/sr-bsc/ -exp_cov auto


meta-velvetg data/MAG/metavelvet/sr-bsc/ | tee logfile
# MetaVelvet assembly