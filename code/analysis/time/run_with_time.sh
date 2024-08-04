#!/bin/bash

# Check if script name is provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide a script name as an argument."
  exit 1
fi

# Script name provided by the user
script_name="$1"

# Extract only the filename (ignoring path)
script_filename=$(basename "$script_name")

# Extract assembler and dataset names (assuming underscore separation)
IFS="_" read -r assembler dataset <<< "$script_filename"

# Build base output directory
output_dir="data/analysis/$assembler/$dataset"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Build custom output filename
time_output_file="$output_dir/time_${assembler}_${dataset}.csv"

# Run the script with time measurement and capture output
time_output=$(/usr/bin/time -v bash -c "source $script_name" 2>&1)

# Check if script execution was successful
if [ $? -ne 0 ]; then
  echo "Error: Script '$script_name' failed to execute."
  echo "$time_output" >> "$time_output_file"  # Still log time even on script failure
  exit 1
fi

# Append time output to custom filename
echo "$time_output" >> "$time_output_file"

echo "Script '$script_name' execution time recorded in $time_output_file"
