#!/bin/bash

# Check if script name is provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide a script name as an argument."
  exit 1
fi

# Script name provided by the user
script_name="$1"
time_output_file=$2


# Run the script with time measurement and capture output
time_output=$(/usr/bin/time -v bash -c "source $script_name" 2>&1) &

# Check if script execution was successful
if [ $? -ne 0 ]; then
  echo "Error: Script '$script_name' failed to execute."
  echo "$time_output" >> "$time_output_file"  # Still log time even on script failure
  exit 1
fi

# Append time output to custom filename
echo "$time_output" >> "$time_output_file"

echo "Script '$script_name' execution time recorded in $time_output_file"
