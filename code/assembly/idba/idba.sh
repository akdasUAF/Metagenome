#!/bin/bash
## Assembler: idba

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <MAG_directory> <analysis_directory>"
  exit 1
fi

path_reads=$1
path_output=$2
path_log=$3

rm -rf $path_output

reads=($(find "$path_reads" -name ".fasta*"))

# Echo the number of forward and reverse reads
echo "Number of reads: ${#reads[@]}"

tools/assemblers/idba/bin/idba_ud -r $reads --num_threads 24 -o $path_output 2>&1 | tee "${path_log}"

