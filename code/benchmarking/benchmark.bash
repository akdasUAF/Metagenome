#!/bin/bash

# Check for required arguments
if [ $# -lt 3 ]; then
  echo "Usage: $0 <command_to_run> <dataset> <task>"
  exit 1
fi

file_to_run="$1"
dataset="$2"
task="$3"


echo "File_to_run is: ${file_to_run}"
echo "Dataset is: ${dataset}"
echo "Task is: ${task}"

# Check if filename is empty, use default if so
dir_output="data/logs/${dataset}/${task}/"
mkdir -p "$dir_output"


log_dool="${dir_output}/log_dool_${task}_${dataset}.log"
log_full="${dir_output}/log_full_${task}_${dataset}.log"


# Start dool
bash code/benchmarking/scripts/start_dool.sh "${log_dool}"

#### Buffer of 10 seconds to capture baseline system processes before capturing tool metrics
sleep 10

## Run script:
bash code/benchmarking/scripts/run_with_time.sh "$file_to_run" "$log_full"

process_pid=$!

# Wait for the subshell process to finish
wait $process_pid

sleep 10

bash code/benchmarking/scripts/kill_dool.sh
