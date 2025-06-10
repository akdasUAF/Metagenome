#!/bin/bash
## Assembler: megahit

if [ $# -ne 3 ]; then
  echo "Usage: $0 <combined_forward_reads> <combined_reverse_reads> <path_output>"
  exit 1
fi

combined_forward_reads=$1
combined_reverse_reads=$2
path_output=$3

# Construct the MEGAHIT command with comma-separated lists
megahit -t 24 \
  -1 "$combined_forward_reads" \
  -2 "$combined_reverse_reads" \
  -o "$path_output" \
  --min-contig-len 1000 2>&1

