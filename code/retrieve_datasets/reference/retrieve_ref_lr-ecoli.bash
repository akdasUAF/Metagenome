#!/bin/bash

top_dir="$PWD"

mkdir -p data/reference/lr-ecoli/

source code/retrieve_datasets/reference/misc_scripts/switch_config.sh
switch_config "code/retrieve_datasets/reference/config/fetch_lr-ecoli.config"

cd tools/retrieval/FETCH/

## First setup FETCH Structure
python3 FETCH.py -s

## Retrieve references
python3 FETCH.py -f "${top_dir}"/code/retrieve_datasets/reference/references_by_accession/references_lr-ecoli.txt

cd "$top_dir"

cat data/reference/lr-ecoli/storage/genome/*.fa > data/reference/lr-ecoli/ref_combined_lr-ecoli.fasta

switch_config "code/retrieve_datasets/reference/config/fetch_default.config"
