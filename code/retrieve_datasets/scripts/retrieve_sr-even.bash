#!/bin/env bash

mkdir -p data/raw/sr-even/

wget -o data/raw/sr-even/sr-even_raw_1.fasta.gz http://ftp.sra.ebi.ac.uk/vol1/run/ERR298/ERR2984773/in732_1_R1.fastq.gz
wget -o data/raw/sr-even/sr-even_raw_2.fasta.gz http://ftp.sra.ebi.ac.uk/vol1/run/ERR298/ERR2984773/in732_1_R2.fastq.gz


cd data/raw/sr-even/
gunzip --keep sr-even.sra
mv sr-even.sra lr-ms_raw.fastq