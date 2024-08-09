#!/bin/bash
## Assembler: megahit

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <MAG_directory> <analysis_directory>"
  exit 1
fi

path_reads=$1
path_output=$2
path_log=$3

rm -rf $path_output

forward_reads=($(find "$path_reads" -name "*_1.fastq*"))
reverse_reads=($(find "$path_reads" -name "*_2.fastq*"))

# Echo the number of forward and reverse reads
echo "Number of forward reads: ${#forward_reads[@]}"
echo "Number of reverse reads: ${#reverse_reads[@]}"

if [[ ${#forward_reads[@]} -ne ${#reverse_reads[@]} ]]; then
  echo "Error: Unequal number of forward and reverse reads. Please check your data."
  exit 1
fi

python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py -1 $forward_reads -2 $reverse_reads -o $path_output | tee "${path_log}"
