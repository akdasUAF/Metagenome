#!/bin/bash
## Assembler: MetaSPAdes

# Find the output path (it should be the last argument)
path_output="${@: -1}"
num_args=$(($# - 1))

metaspades_input_args="${@:1:$num_args}"

# Remove the output directory if it exists (good practice for clean runs)
rm -rf "$path_output"

eval "python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py --meta \
  $metaspades_input_args \
  -o \"$path_output\" \
  -t 24" 2>&1