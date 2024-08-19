#!/bin/bash
## Assembler: megahit

if [ $# -ne 6 ]; then
  echo "Usage: $0 <raw_directory> <MAG_directory> <analysis_directory> <name_assembly> <kmer_size> <bloom_filter_size>"
  exit 1
fi

reads_in=$1
path_output="$2"
path_log=$3
name_assembly=$4
kmer=$5
bloom=$6


echo "reads_in: $reads_in"
echo "path_output: $path_output"
echo "path_log: $path_log"
echo "name_assembly: $name_assembly"
echo "kmer: $kmer"
echo "bloom: $bloom"

abyss-pe k=$kmer name=$name_assembly B=$bloom j = 24 \
	in=$reads_in \
	out=$path_output
