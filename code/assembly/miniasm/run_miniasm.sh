#!/bin/env bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <path_out_dir> <path_log_file>"
  exit 1
fi

reads_in=$1
path_output=$2
dataset=$3

bash_to_run="code/assembly/miniasm/miniasm.sh ${path_raw} ${path_output} ${dataset}"

echo "Starting MiniASM..."
echo "Running: ${bash_to_run}"
echo " "

conda run -n asm_miniasm $bash_to_run | tee "$path_output/log_asm_miniasm_${dataset}.log"


