#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <path_assembly> <path_log_file>"
  exit 1
fi

path_assembly=$1
path_log_file=$2

bash_to_run="code/assembly/megahit/megahit.sh $path_assembly $path_log_file"
echo "${bash_to_run}"

conda run -n ana_assembly-stats bash $bash_to_run


