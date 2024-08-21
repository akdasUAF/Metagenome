#!/bin/bash
## Assembler: Abyss

if [ $# -ne 7 ]; then
  echo "Usage: $0 <forward_reads> <reverse_reads> <MAG_directory> <analysis_directory> <name_assembly> <kmer_size> <bloom_filter_size>"
  exit 1
fi

forward_reads=$1
reverse_reads=$2
path_output="$3"
path_log=$4
name_assembly=$5
kmer=$6
bloom=$7

echo "    "
echo "forward_in: $forward_reads"
echo "reverse_in: $reverse_reads"
echo "path_output: $path_output"
echo "path_log: $path_log"
echo "name_assembly: $name_assembly"
echo "kmer: $kmer"
echo "bloom: $bloom"
echo "    "

# abyss_pe_in="${forward_reads}_${reverse_reads}"

# abyss-pe k=$kmer name=$name_assembly B=$bloom j=24 \
# 	in=$abyss_pe_in \
# 	out=$path_output 2>&1 | tee "${path_log}"


abyss-pe k=117 name=sr-bmock_abyss B=10G j=24 in='data/process/sr-bmock/trimmed/sr-bmock_trimmed_1.fastq data/process/sr-bmock/trimmed/sr-bmock_trimmed_2.fastq' \
out='data/MAG/sr-bmock/abyss/' | tee "${path_log}"
