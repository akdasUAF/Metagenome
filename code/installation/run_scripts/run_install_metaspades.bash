#!/bin/bash
## Assembler: metaspades

conda run -n asm_metaspades bash code/installation/install_metaspades.bash | tee logs/installation/log_install_metaspades.log


# Define the base directory
base_dir="code/analysis/metaspades"

# Array of folder names
folders=("sr-diabetes" "sr-gut" "sr-bsc" "sr-marine_sediment")

# Create the folders
for folder in "${folders[@]}"
do
    mkdir -p "$base_dir/$folder"
done