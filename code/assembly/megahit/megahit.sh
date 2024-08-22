#!/bin/bash
## Assembler: megahit

if [ $# -ne 3 ]; then
  echo "Usage: $0 <forward_reads> <reverse_reads> <path_output>"
  exit 1
fi

forward_reads=$1
reverse_reads=$2
path_output=$3

megahit -t 24 -1 $forward_reads -2 $reverse_reads -o $path_output --min-contig-len 1000 2>&1

