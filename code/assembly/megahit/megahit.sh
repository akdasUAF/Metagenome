#!/bin/bash
## Assembler: megahit

# The last argument is always path_output.
# The arguments before that are the MEGAHIT specific read arguments (-1 <reads1>, -2 <reads2> or -r <reads>)

# Get the last argument as path_output
path_output="${!#}" # This gets the value of the last argument

# Remove the last argument from the arguments list to get only read arguments
read_args=("${@:1:$#-1}") # Get all arguments from 1 to the second to last

if [ ${#read_args[@]} -eq 0 ]; then
  echo "Usage: $0 <read_arguments> <path_output>"
  echo "  <read_arguments> can be: -1 <fwd_reads> -2 <rev_reads> OR -r <single_reads>"
  exit 1
fi

# Construct the MEGAHIT command
megahit -t 24 \
  "${read_args[@]}" \ # This will expand to -1 "..." -2 "..." or -r "..."
  -o "$path_output" \
  --min-contig-len 1000 2>&1