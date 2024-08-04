#!/bin/bash

mkdir -p data/reference/lr-ecoli/

cd data/reference/lr-ecoli/

esearch -db nucleotide -query "NC_000913.3[accn]" | efetch -format fasta > NC_000913.3.fasta
esearch -db nucleotide -query "BA000007.3[accn]" | efetch -format fasta > BA000007.3.fasta

cat data/reference/lr-ecoli/*.3.fasta > data/reference/lr-ecoli/ref_combined_lr-ecoli.fasta
