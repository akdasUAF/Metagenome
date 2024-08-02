
#!/bin/bash
## Assembler: canu

conda run -n asm_canu bash code/installation/install_canu.bash | tee logs/installation/log_install_canu.log

# Define the base directory
base_dir="data/analysis/canu"

# Array of folder names
folders=("lr-ecoli" "lr-gut" "lr-soil" "lr-synth" "lr-marine_sediment")

# Create the folders
for folder in "${folders[@]}"
do
    mkdir -p "$base_dir/$folder"
done