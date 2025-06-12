#!/bin/env bash
## Assembler: IDBA

if [ $# -ne 2 ]; then
  echo "Usage: $0 <path_combined> <path_output>"
  exit 1
fi

path_combined=$1
path_output=$2

./tools/assemblers/idba/bin/idba_ud \
    --read "$path_combined" \
    --out "$path_output" \
    --mink 20 \
    --maxk 100 \
    --step 10 \
    --min_count 2 \
    --num_threads 24


