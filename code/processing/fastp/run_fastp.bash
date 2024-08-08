#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <trimmed_sequences_out_directory> <analysis_directory>"
  exit 1
fi

path_raw=$1
path_output=$2
path_analysis=$3

bash_to_run="code/processing/fastp/fastp.bash $path_raw $path_output $path_analysis"

conda run -n pro_fastp bash $bash_to_run


