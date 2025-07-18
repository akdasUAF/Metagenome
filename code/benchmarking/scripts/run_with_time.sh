#!/bin/bash

# Check if script name is provided as an argument
if [ $# -lt 2 ]; then # Changed to less than 2, as it expects script_name and time_output_file
  echo "Error: Usage: $0 <command_to_run> <output_log_file>"
  exit 1
fi

# The command string to run (e.g., "conda run -n asm_megahit ...")
command_to_run="$1"
# The file to write the time output to (this is `log_full` from benchmarking_script.sh)
time_output_file="$2"

# Run the command with time measurement and capture output
# IMPORTANT: Removed 'source'. Directly execute the command string using bash -c.
# We are redirecting the output of the timed command directly to the file,
# so we don't need to capture it in a variable first if we just want to append.
/usr/bin/time -v bash -c "${command_to_run}" > "$time_output_file" 2>&1

# Propagate the exit status of the command that was just run and timed
# This is crucial for your higher-level scripts to know if the step succeeded.
exit $?