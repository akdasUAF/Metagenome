#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_reads> <path_output> <path_log>"
  exit 1
fi

path_reads=$1
path_output=$2
path_log=$3

# Execute idba_ud within the conda environment and tee its output
conda run -n asm_idba ./tools/assemblers/idba/bin/idba_ud \
    --read "$path_reads" \
    --out "$path_output" \
    --mink 20 \
    --maxk 100 \
    --step 10 \
    --min_count 2 \
    --num_threads 24 \
    2>&1 | tee "$log_file"