#!/bin/bash
# Retrieving datasets
# Dataset: Short read Diabetes
# Dataset found at: 

conda run -n sra_toolkit bash ./code/retrieve_datasets/retrieve_sr-diabetes.bash | tee logs/retrieve_datasets/log_retrieve_sr-diabetes.log
