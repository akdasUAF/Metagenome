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

forward_reads=($(find "$path_reads" -name *_1.fastq*))
concatenated_forward_reads=$(IFS=' ' ; echo "${forward_reads[*]}")
reverse_reads=($(find "$path_reads" -name "*_2.fastq*"))
concatenated_reverse_reads=$(IFS=' ' ; echo "${reverse_reads[*]}")

# Echo the number of forward and reverse reads
echo "Number of forward reads: ${#concatenated_forward_reads[@]}"
echo "Number of reverse reads: ${#concatenated_reverse_reads[@]}"

if [[ ${#concatenated_forward_reads[@]} -ne ${#concatenated_reverse_reads[@]} ]]; then
  echo "Error: Unequal number of forward and reverse reads. Please check your data."
  exit 1
fi



abyss_in="$concatenated_forward_reads $concatenated_reverse_reads"

abyss-pe k=41 name=abyss_sr-bsc B=214G j = 24 \
	in='$concatenated_forward_reads $concatenated_reverse_reads' \
	out='data/MAG/abyss/sr-bsc/'
