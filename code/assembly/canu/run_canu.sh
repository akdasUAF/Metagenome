#!/bin/bash

#!/bin/env bash

if [ $# -ne 5 ]; then
  echo "Usage: $0 <raw_reads> <output_directory> <genomeSize> <name> <path_log>"
  exit 1
fi

raw_reads=$1
output_directory=$2
genomeSize=$3
name=$4
path_log=$5

bash_to_run="code/assembly/canu/canu.sh $raw_reads $output_directory $genomeSize $name"
echo "Running Canu..."
echo "${bash_to_run}"
echo " "


conda run -n asm_canu bash $bash_to_run | tee $path_log


