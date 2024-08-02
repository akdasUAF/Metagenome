#!/bin/bash
## Assembler: miniasm

conda run -n asm_miniasm bash code/installation/install_miniasm.bash | tee logs/installation/log_install_miniasm.log

# Define the base directory
base_dir="code/analysis/miniasm"

# Array of folder names
folders=("lr-ecoli" "lr-gut" "lr-soil" "lr-synth" "lr-marine_sediment")

# Create the folders
for folder in "${folders[@]}"
do
    mkdir -p "$base_dir/$folder"
done