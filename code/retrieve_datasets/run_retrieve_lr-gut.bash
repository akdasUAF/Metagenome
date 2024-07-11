#!/bin/bash
# Retrieving datasets
# Dataset: Long read Gut
# Dataset found at: 

conda run -n sra_toolkit bash ./code/retrieve_datasets/scripts/retrieve_lr-gut.bash | tee logs/retrieve_datasets/log_retrieve_lr-gut.log
