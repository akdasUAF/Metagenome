#!/bin/bash
# Retrieving datasets
# Dataset: sr-bsc
# Dataset found at: 

conda run -n pro_fastqc bash code/analysis/fastqc/run_fastqc.bash data/raw/sr-bsc/ data/analysis/sr-bsc/ | tee 