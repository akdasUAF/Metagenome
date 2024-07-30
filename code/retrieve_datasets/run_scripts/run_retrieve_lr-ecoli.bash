#!/bin/bash
# Retrieving datasets
# Dataset: lr-ecoli
# Dataset found at: 

conda run -n sra_toolkit bash code/retrieve_datasets/retrieve_lr-ecoli.bash | tee logs/retrieve_datasets/log_retrieve_lr-ecoli.log
