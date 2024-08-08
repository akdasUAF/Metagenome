#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <output_directory> <analysis_directory>"
  exit 1
fi

path_reads=$1
path_output=$2
path_analysis=$3
script_name="code/assembly/megahit/run_megahit.sh"
command_to_run="$script_name $path_reads $path_output"

rm -rf $path_output
mkdir -p path_analysis

bash code/analysis/dool/start_dool.sh "$path_analysis"/dool_asm_megahit_sr-bsc.csv

time_output=$(/usr/bin/time -v bash -c "$command_to_run" 2>&1)

# Check for script execution error (optional)
if [ $? -ne 0 ]; then
  echo "Error: Script '$script_name' failed to execute."
  echo "$time_output" > time_output.txt  # Optional: Save error output
  exit 1
fi

bash code/analysis/dool/kill_dool.sh

