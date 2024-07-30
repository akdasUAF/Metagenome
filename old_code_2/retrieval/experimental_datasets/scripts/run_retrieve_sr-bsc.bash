#!/bin/bash
# Retrieving datasets
# Dataset: Short read BSC
# Dataset found at: 

conda run -n sra_toolkit bash ./code/retrieve_datasets/retrieve_sr-bsc.bash | tee logs/retrieve_datasets/log_retrieve_sr-bsc.log
