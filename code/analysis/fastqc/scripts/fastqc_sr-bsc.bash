#!/bin/bash
# Retrieving datasets
# Dataset: sr-bsc
# Dataset found at: 

mkdir -p data/analysis/sr-bsc/logs/
conda run -n pro_fastqc bash code/analysis/fastqc/run_fastqc.bash data/raw/sr-bsc/ data/analysis/sr-bsc/ | tee data/analysis/sr-bsc/logs/log_fastqc_sr-bsc.log