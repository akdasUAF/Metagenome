#!/bin/bash
## Assembler: MetaSPAdes

# Find the output path (it should be the last argument passed to this script)
path_output="${@: -1}"

# All arguments except the last one are the input arguments for metaspades.py.
# Capture them into an array. This is crucial because `"$@"` will preserve the exact arguments
# as they were passed from the calling script.
metaspades_py_input_args=("${@:1:$(( $# - 1 ))}") 

# Remove the output directory if it exists (good practice for clean runs)
rm -rf "$path_output"

# Execute metaspades.py. Expand the array to pass each element as a distinct argument.
# IMPORTANT: No 'eval' is needed, and no extra quotes around "${metaspades_py_input_args[@]}"
# This `"${array[@]}"` syntax correctly passes each element as a separate argument.
python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py --meta \
  "${metaspades_py_input_args[@]}" \
  -o "$path_output" \
  -t 24 2>&1