#!/bin/bash
## Assembler: Abyss

if [ $# -ne 5 ]; then
  echo "Usage: $0 <raw_directory> <MAG_directory> <analysis_directory> <name_assembly> <kmer_size> <bloom_filter_size>"
  exit 1
fi

forward_reads=$1
reverse_reads=$2
path_output="$3"
path_log=$4
name_assembly=$5
kmer=$6
bloom=$7


echo "forward_in: $forward_reads"
echo "reverse_in: $reverse_reads"
echo "path_output: $path_output"
echo "path_log: $path_log"
echo "name_assembly: $name_assembly"
echo "kmer: $kmer"
echo "bloom: $bloom"

abyss_pe_in="${forward_reads}_${reverse_reads}"

abyss-pe k=$kmer name=$name_assembly B=$bloom j = 24 \
	in=$abyss_pe_in \
	out=$path_output
