#!/bin/bash

# Check for required arguments
if [ $# -lt 3 ]; then
  echo "Usage: $0 <command_to_run> <dataset> <task>"
  exit 1
fi

file_to_run="$1"
dataset="$2"
task="$3"

# Parse command-line options
while getopts "d:t:c:" opt; do
  case $opt in
    d)
      dataset="$OPTARG"
      ;;
	  t)
      task="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

echo "Dataset is: ${dataset}"

# Check if mandatory dataset option is provided
if [ -z "$dataset" ]; then
  echo "Error: -d or --dataset is required."
  exit 1
fi

if [ -z "$task" ]; then
  echo "Error: -t or --task is required."
  exit 1
fi


# Check if filename is empty, use default if so
dir_output="data/logs/${dataset}/${assembler}/${task}/"
mkdir -p "$dir_output"


log_dool="${dir_output}/log_dool_${task}_${dataset}_${assembler}.log"
log_full="${dir_output}/log_full_${task}_${dataset}_${assembler}.log"


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
