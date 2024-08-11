#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <MAG_out_dir> <path_log_file>"
  exit 1
fi

path_raw=$1
path_MAG=$2
path_log_file=$3

bash_to_run="code/assembly/megahit/megahit.sh $path_raw $path_MAG $path_log_file"
echo "${bash_to_run}"

conda run -n asm_megahit bash $bash_to_run


