#!/bin/bash
## Assembler: Unicycler

# Find the output path (it should be the last argument)
path_output="${@: -1}"
num_args=$(($# - 1)) # Number of arguments excluding the last one (output path)

# The remaining arguments are the Unicycler input read arguments (-1 file1 -2 file1 etc.)
unicycler_input_args="${@:1:$num_args}"

# Remove the output directory if it exists (good practice for clean runs)
rm -rf "$path_output"

# Now run Unicycler
# Use 'eval' to correctly parse the input arguments string with quotes
eval "unicycler $unicycler_input_args -o \"$path_output\" -t 24"