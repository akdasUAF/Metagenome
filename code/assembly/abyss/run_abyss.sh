#!/bin/env bash

if [ $# -ne 6 ]; then
  echo "Usage: $0 <raw_directory> <MAG_directory> <analysis_directory> <name_assembly> <kmer_size> <bloom_filter_size>"
  exit 1
fi

path_reads=$1
path_output="$2"
path_log=$3
name_assembly=$4
kmer=$5
bloom=$6


mkdir -p $path_output
mkdir -p (dirname $path_log)

bash_to_run="code/assembly/abyss/abyss.sh ${path_raw} ${path_MAG} ${path_log_file} ${name_assembly} ${kmer} ${bloom}"

echo "${bash_to_run}"
echo $PWD
echo "Starting ABySS on ${name_assembly}..."

conda run -n asm_raven $bash_to_run


