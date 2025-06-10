#!/bin/bash

## Sets working directory to the Long read Marine Sediment
## Uses this dataset: 
## This uses the SRA toolkit from NCBI to retrieve the reads

mkdir -p data/raw/lr-ms
wget -o data/raw/lr-ms/lr-ms.sra https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos8/sra-pub-run-834/SRR015/15372/SRR15372773/SRR15372773.1

cd data/raw/lr-ms/
gunzip --keep lr-ms.sra
mv lr-ms.fastq lr-ms_raw.fastq