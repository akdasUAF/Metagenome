#!/bin/bash

if [ $# -ne 6 ]; then
  echo "Usage: $0 <path_forward> <path_reverse> <forward_trimmed_path> <reverse_trimmed_path> <path_report> <path_log>"
  exit 1
fi

path_forward=$1
path_reverse=$2
forward_trimmed_path=$3
reverse_trimmed_path=$4
path_report=$5
path_log=$6

bash_to_run="code/processing/fastp/fastp.bash $path_forward $path_reverse $forward_trimmed_path $reverse_trimmed_path $path_report"
echo "${bash_to_run}"

conda run -n pro_fastp bash $bash_to_run | tee $path_log


