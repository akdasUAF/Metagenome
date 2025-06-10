#!/bin/env bash
## Assembler: IDBA

if [ $# -ne 2 ]; then
  echo "Usage: $0 <path_combined> <path_output>"
  exit 1
fi

path_combined=$1
path_output=$2

./tools/assemblers/idba/bin/idba_ud -r $path_combined -o $path_output --num_threads 24

