#!/bin/bash
## Assembler: flye

conda run -n asm_flye bash code/installation/install_flye.bash | tee logs/installation/log_install_flye.log

# Define the base directory
base_dir="code/analysis/flye"

# Array of folder names
folders=("lr-ecoli" "lr-gut" "lr-soil" "lr-synth" "lr-marine_sediment")

# Create the folders
for folder in "${folders[@]}"
do
    mkdir -p "$base_dir/$folder"
done