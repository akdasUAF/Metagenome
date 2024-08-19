#!/bin/env bash

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


mkdir -p $path_output
mkdir -p "$(dirname "$path_log")"

bash_to_run="code/assembly/abyss/abyss.sh ${forward_reads} ${reverse_reads} ${path_output} ${path_log} ${name_assembly} ${kmer} ${bloom}"

echo "${bash_to_run}"
echo $PWD
echo "Starting ABySS on ${name_assembly}..."

conda run -n asm_abyss $bash_to_run


