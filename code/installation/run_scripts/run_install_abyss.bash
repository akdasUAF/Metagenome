#!/bin/bash
## Assembler: Abyss

conda run -n asm_abyss bash code/installation/install_abyss.bash | tee logs/installation/log_install_abyss.log

# Define the base directory
base_dir="code/analysis/abyss"

# Array of folder names
folders=("sr-diabetes" "sr-gut" "sr-bsc" "sr-marine_sediment")

# Create the folders
for folder in "${folders[@]}"
do
    mkdir -p "$base_dir/$folder"
done
