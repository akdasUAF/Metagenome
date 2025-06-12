#!/bin/bash
## Assembler: megahit

# The last argument is the path_output
path_output="${!#}"

# All arguments except the last one are the read arguments for megahit
megahit_read_args=("${@:1:$#-1}")

if [ ${#megahit_read_args[@]} -eq 0 ]; then
  echo "Usage: $0 <read_arguments_for_megahit> <path_output>"
  echo "  <read_arguments_for_megahit> can be: -1 <fwd_reads> -2 <rev_reads> OR -r <single_reads>"
  exit 1
fi

# *** ADD THIS LINE FOR DEBUGGING ***
echo "DEBUG: MEGAHIT command will be:"
echo "megahit -t 24 \"${megahit_read_args[@]}\" -o \"$path_output\" --min-contig-len 1000"
echo "*********************************"

# Construct the MEGAHIT command
megahit -t 24 \
  "${megahit_read_args[@]}" \
  -o "$path_output" \
  --min-contig-len 1000 2>&1