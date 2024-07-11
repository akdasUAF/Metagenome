# retrieve_datasets.sh
#!/bin/bash
# Retrieving datasets
# Dataset: Long read Soil
# Dataset found at: 

conda run -n sra_toolkit bash ./code/retrieve_datasets/retrieve_lr-soil.bash | tee logs/retrieve_datasets/log_retrieve_lr-soil.log
