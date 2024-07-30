#!/bin/bash
# Retrieving datasets
# Dataset: Short read marine sediment
# Dataset found at: 

conda run -n sra_toolkit bash ./code/retrieve_datasets/scripts/retrieve_sr-marine_sediment.bash | tee logs/retrieve_datasets/log_retrieve_sr-marine_sediment.log
