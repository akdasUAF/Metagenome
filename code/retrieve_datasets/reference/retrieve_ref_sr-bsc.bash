#!/bin/bash

top_dir="$PWD"

mkdir -p data/reference/sr-bsc/

source code/retrieve_datasets/reference/misc_scripts/switch_config.sh
switch_config "sr-bsc"

cd tools/retrieval/FETCH/

## First setup FETCH Structure
python3 FETCH.py -s

## Retrieve references
python3 FETCH.py -f code/retrieve_datasets/reference/references_by_accession/references_sr-bsc.txt

cd "$top_dir"

cat data/reference/sr-bsc/storage/*.fasta > data/reference/sr-bsc/ref_combined_sr-bsc.fasta

reset_config
