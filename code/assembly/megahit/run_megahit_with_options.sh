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

# Call run_with_time to capture execution time
# time_output=$(./code/analysis/time/run_with_time.sh "$script_name" "$path_reads" "$path_output")

# Check for script execution error (optional)
if [ $? -ne 0 ]; then
  echo "Error: Script '$script_name' failed to execute."
  echo "$time_output" > time_output.txt  # Optional: Save error output
  exit 1
fi



# dataset=$(basename "$path_output")
# log_file="$path_analysis/log_assemble_megahit_${dataset}"


# # conda run -n asm_megahit bash -c "source code/analysis/time/run_with_time.sh "$bash_to_run"" | tee data/analysis/megahit/sr-bsc/log_assemble_megahit_sr-bsc.log
# conda run -n asm_megahit bash -c "source code/analysis/time/run_with_time.sh $script_name '$path_reads' '$path_output'" > "$log_file"


bash code/analysis/dool/kill_dool.sh

