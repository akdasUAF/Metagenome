#!/bin/bash
# Retrieving datasets
# Dataset: Long read Synthetic
# Dataset found at: 

conda run -n sra_toolkit bash code/retrieve_datasets/etrieve_lr-synth.bash | tee logs/retrieve_datasets/log_retrieve_lr-synth.log
