#!/bin/bash

if [ $# -ne 4 ]; then
  echo "Usage: $0 <path_forward> <path_reverse> <path_output> <path_log>"
  exit 1
fi

path_forward=$1
path_reverse=$2
path_output=$3

bash_to_run="code/assembly/metaspades/metaspades.sh $path_forward $path_reverse $path_output"
echo "${bash_to_run}"

conda run -n asm_metaspades $bash_to_run | tee $path_log


