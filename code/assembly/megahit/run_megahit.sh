#!/bin/bash

if [ $# -ne 4 ]; then
  echo "Usage: $0 <forward_reads> <reverse_reads> <path_output> <path_log_file>"
  exit 1
fi

forward_reads=$1
reverse_reads=$2
path_output=$3
path_log_file=$4

bash_to_run="code/assembly/megahit/megahit.sh $forward_reads $reverse_reads $path_output $path_log_file"
echo "${bash_to_run}"

conda run -n asm_megahit bash $bash_to_run | tee $path_log_file


