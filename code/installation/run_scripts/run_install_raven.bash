#!/bin/bash
## Assembler: raven

conda run -n asm_raven bash code/installation/install_raven.bash | tee logs/installation/log_install_raven.log

# Define the base directory
base_dir="code/analysis/raven"

# Array of folder names
folders=("lr-ecoli" "lr-gut" "lr-soil" "lr-synth" "lr-marine_sediment")

# Create the folders
for folder in "${folders[@]}"
do
    mkdir -p "$base_dir/$folder"
done