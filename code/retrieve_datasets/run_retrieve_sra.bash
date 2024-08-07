#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <raw_directory> <output_directory> <analysis_directory>"
  exit 1
fi

path_txt_file=$1
path_output=$2
bash_to_run="code/retrieve_datasets/retrieve_sra.bash ""$path_txt_file" "$path_output"


rm -rf $path_output

conda run -n sra_toolkit bash -c "source $bash_to_run" | tee "$path_output"/retrieve.log
