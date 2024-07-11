# retrieve_datasets.sh
#!/bin/bash
# Retrieving datasets
# Dataset: Short read Gut
# Dataset found at: 

conda run -n sra_toolkit bash ./code/retrieve_datasets/retrieve_sr-gut.bash | tee logs/retrieve_datasets/log_retrieve_sr-gut.log
