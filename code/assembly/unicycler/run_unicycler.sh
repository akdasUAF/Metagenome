#!/bin/env bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <forward_in> <reverse_in> <path_output> <path_log>"
  exit 1
fi

forward_in=$1
reverse_in=$2
path_output=$3
path_log=$4

bash_to_run="code/assembly/unicycler/unicycler.sh ${forward_in} ${reverse_in} ${path_output}"

echo "Starting MiniASM..."
echo "Running: ${bash_to_run}"
echo " "

conda run -n asm_miniasm $bash_to_run | tee $path_log


