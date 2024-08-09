#!/bin/bash
## Assembler: megahit

if [ $# -ne 2 ]; then
  echo "Usage: $0 <path_assembly> <path_log_file>"
  exit 1
fi

path_assembly=$1
path_log_file=$2

rm -rf $path_output

./tools/analysis/assembly-stats/build/assembly-stats $path_assembly | tee $path_log_file

