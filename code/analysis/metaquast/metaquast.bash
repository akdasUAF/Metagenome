#!/bin/env bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <contigs_path> <output_path> <reference_path>"
  exit 1
fi

path_contigs=$1
path_output=$2
path_reference=$3

python3 tools/analysis/quast/metaquast.py -t 24 -o $path_output $path_contigs --glimmer \
-r $path_reference