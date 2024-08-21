#!/bin/bash

if [ $# -ne 5 ]; then
  echo "Usage: $0 <path_forward> <path_reverse> <path_combinedy> <path_output> <path_log>"
  exit 1
fi

path_forward=$1
path_reverse=$2
path_combined=$3
path_output=$4
path_log=$5

bash_to_run="code/assembly/idba/idba.sh $path_forward $path_reverse $path_combined $path_output"
echo "${bash_to_run}"

conda run -n asm_idba $bash_to_run | tee $path_log


