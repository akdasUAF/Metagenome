#!/bin/env bash

if [ $# -ne 4 ]; then
  echo "Usage: $0 <raw_directory> <MAG_out_dir> <path_log_file> <path_reference>"
  exit 1
fi

path_contigs=$1
path_output=$2
path_log_file=$3
path_reference=$4

bash_to_run="code/analysis/metaquast/metaquast.bash $path_contigs $path_output $path_log_file $path_reference"
echo "${bash_to_run}"

conda run -n ana_metaquast $bash_to_run


