#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <raw_directory> <analysis_directory>"
  exit 1
fi

path_reads=$1
path_analysis=$2

bash_to_run="code/processing/trimmomatic/trimmomatic_basic.bash ""$path_reads" "$path_analysis"

mkdir -p path_analysis

conda run -n asm_megahit bash $bash_to_run | tee "$path_analysis"/log_trimmomatic.log
