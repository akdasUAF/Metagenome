#!/bin/bash
# Retrieving datasets
# Dataset: Long read Marine Sediment
# Dataset found at: 

conda run -n sra_toolkit bash code/retrieve_datasets/retrieve_lr-marine_sediment.bash | tee logs/retrieve_datasets/log_retrieve_lr-marine_sediment.log


conda run -n pro_fastqc bash code/analysis/fastqc/run_fastqc.bash data/raw/sr-bsc/ data/analysis/sr-bsc/ | tee 