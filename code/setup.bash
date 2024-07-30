#!/bin/bash

### Create several base folders
mkdir -p logs/retrieve_datasets/
mkdir -p logs/installation/
mkdir -p logs/processing/
mkdir -p logs/assembly/
mkdir -p logs/analysis/dool/
mkdir -p logs/analysis/metaquast/
mkdir -p logs/analysis/assembly-stats/
mkdir -p logs/analysis/busco/

mkdir -p code/assembly/args_assembler
mkdir -p code/assembly/path_assembler
mkdir -p code/analysis/path_analyzer
mkdir -p code/retrieval/path_retrieval
mkdir -p code/processing/path_processor


mkdir -p data/assembled_MAG//
mkdir -p data/raw/
mkdir -p data/analysis




mkdir -p tools/assemblers/
mkdir -p tools/analysis/



# Define list of environment names as an array
env_names=("asm_abyss" "asm_canu" "asm_flye" "asm_megahit" "asm_metaspades" "asm_miniasm" "asm_raven" "ana_assembly-stats" "ana_busco" "ana_metaquast" "ana_jellyfish" "pro_fetch" "pro_gfastats" "sra_toolkit")

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
