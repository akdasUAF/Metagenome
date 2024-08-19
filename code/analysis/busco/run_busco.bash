#!/bin/env bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <MAG_out_dir> <path_log_file>"
  exit 1
fi

path_contigs=$1
path_output=$2
path_log_file=$3

bash_to_run="code/assembly/metaspades/metaspades.sh $path_contigs $path_output $path_log_file"
echo "${bash_to_run}"

conda run -n ana_busco $bash_to_run


