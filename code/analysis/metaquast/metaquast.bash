#!/bin/env bash

if [ $# -ne 4 ]; then
  echo "Usage: $0 <contigs_path> <output_path> <log_path <reference_path>"
  exit 1
fi

path_contigs=$1
path_output=$2
path_log=$3
path_reference=$4

python3 tools/analysis/quast/metaquast.py -t 24 -o $path_output $path_contigs --glimmer \
-r $path_reference | tee $path_log