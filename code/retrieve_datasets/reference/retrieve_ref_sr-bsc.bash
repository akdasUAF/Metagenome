#!/bin/bash

mkdir -p data/reference/sr-bsc/

source code/retrieve_datasets/reference/misc_scripts/switch_config.sh
switch_config "sr-bsc"

## First setup FETCH Structure
python3 tools/retrieval/FETCH/FETCH.py -s

## Retrieve references
python3 tools/retrieval/FETCH/FETCH.py -f code/retrieve_datasets/reference/references_by_accession/references_sr-bsc.txt
cat data/reference/sr-bsc/storage/*.fasta > data/reference/sr-bsc/ref_combined_sr-bsc.fasta

reset_config
