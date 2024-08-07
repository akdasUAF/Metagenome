#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <output_directory> <analysis_directory>"
  exit 1
fi

path_reads=$1
path_output=$2
path_analysis=$3

script_name="code/assembly/megahit/run_megahit.sh"
bash_to_run="$script_name ""$path_reads" "$path_analysis"


rm -rf $path_output
mkdir -p path_analysis


bash code/analysis/dool/start_dool.sh "$path_analysis"/dool_asm_megahit_sr-bsc.csv

conda run -n asm_megahit bash -c "source code/analysis/time/run_with_time.sh "$bash_to_run"" | tee data/analysis/megahit/sr-bsc/log_assemble_megahit_sr-bsc.log

bash code/analysis/dool/kill_dool.sh