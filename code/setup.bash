#!/bin/bash

function run_script() {
  local script_name="$1"
  local script_path="$2"

  echo "Running script: $script_name..."
  bash "$script_path"
  if [ $? -ne 0 ]; then
    echo "Error running script: $script_name"
  fi
}

### Create several base folders
mkdir -p logs/retrieve_datasets/
mkdir -p logs/installation/
mkdir -p logs/processing/
mkdir -p logs/analysis/dool/
mkdir -p logs/analysis/metaquast/
mkdir -p logs/analysis/assembly-stats/
mkdir -p logs/analysis/busco/


mkdir -p data/MAG/
mkdir -p data/raw/
mkdir -p data/analysis/
mkdir -p data/reference/


mkdir -p tools/assemblers/
mkdir -p tools/analysis/
mkdir -p tools/retrieval/



# Define list of environment names as an array
env_names=("asm_abyss" "asm_canu" "asm_flye" "asm_megahit" "asm_metaspades" "asm_metavelvet" "asm_miniasm" "asm_raven" "ana_assembly-stats" "ana_busco" "ana_metaquast" "ana_jellyfish" "pro_fetch" "pro_gfastats" "sra_toolkit")

# Loop through the list
for env_name in "${env_names[@]}"; do
  # Check if environment exists (using silent grep)
  if ! conda env list | grep -q "$env_name"; then
    echo "Creating environment: $env_name"
    conda create -n "$env_name"  # Add any base package specifications here
  else
    echo "Environment '$env_name' already exists."
  fi
done

echo "All environment creation checks complete."

# Install retrieval tools
run_script "Install retrieval tools" "code/installation/run_scripts/run_install_all_retrieval.sh"

# Retrieve datasets
run_script "Retrieve datasets" "code/retrieve_datasets/run_scripts/run_retrieve_all.sh"

# Install analyzers
run_script "Install analyzers" "code/installation/run_scripts/run_install_all_analyzers.sh"

# Install assemblers
run_script "Install assemblers" "code/installation/run_scripts/run_install_all_assemblers.sh"

echo "Script execution complete."