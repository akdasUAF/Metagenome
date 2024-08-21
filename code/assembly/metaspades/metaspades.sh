#!/bin/bash
## Assembler: megahit

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_forward> <path_reverse> <path_output> <analysis_directory>"
  exit 1
fi

path_forward=$1
path_reverse=$2
path_output=$3

rm -rf $path_output

python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py -1 $path_forward -2 $path_reverse -o $path_output -t 24
