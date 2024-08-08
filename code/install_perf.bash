#!/bin/bash

# Define list of environment names as an array
env_names=("pro_fastp" "asm_abyss" "asm_canu" "asm_flye" "asm_megahit" "asm_metamdbg" "asm_metaspades" "asm_metavelvet" "asm_miniasm" "asm_raven" "ana_assembly-stats" "ana_busco" "ana_metaquast" "ana_jellyfish" "pro_fetch" "pro_trimmomatic" "pro_fastqc" "pro_gfastats" "sra_toolkit")

# Loop through the list
for env_name in "${env_names[@]}"; do
  # Check if environment exists
  if conda env list | grep -q "^$env_name$" >/dev/null; then
    echo "Activating environment: $env_name"
    conda activate "$env_name"
    # Replace with your desired script or command
    bash code/installation/install_perf.bash
    conda deactivate
  else
    echo "Environment '$env_name' does not exist."
  fi
done
