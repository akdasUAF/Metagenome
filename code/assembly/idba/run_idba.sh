#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_combined> <path_output> <path_log>"
  exit 1
fi

path_combined=$1
path_output=$2
path_log=$3

bash_to_run="code/assembly/idba/idba.sh $path_combined $path_output"
echo "${bash_to_run}"

conda run -n asm_idba $bash_to_run | tee $path_log


