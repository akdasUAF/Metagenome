#!/bin/bash
## Assembler: megahit

conda run -n asm_megahit bash code/installation/install_megahit.bash | tee logs/installation/log_install_megahit.log

# Define the base directory
base_dir="code/analysis/megahit"

# Array of folder names
folders=("sr-diabetes" "sr-gut" "sr-bsc" "sr-marine_sediment")

# Create the folders
for folder in "${folders[@]}"
do
    mkdir -p "$base_dir/$folder"
done