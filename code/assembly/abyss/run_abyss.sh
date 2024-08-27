#!/bin/env bash

if [ $# -ne 7 ]; then
  echo "Usage: $0 <forward_in> <reverse_in> <path_output> <name_assembly> <kmer_size> <bloom_filter_size> <path_log>"
  echo $#
  exit 1
fi

forward_reads=$1
reverse_reads=$2
path_output=$3
name_assembly=$4
kmer=$5
bloom=$6
path_log=$7

bash_to_run="code/assembly/abyss/abyss.sh ${forward_reads} ${reverse_reads} ${path_output} ${name_assembly} ${kmer} ${bloom}"

echo "${bash_to_run}"
echo $PWD
echo "Starting Abyss..."


conda run -n asm_abyss $bash_to_run | tee $path_log


