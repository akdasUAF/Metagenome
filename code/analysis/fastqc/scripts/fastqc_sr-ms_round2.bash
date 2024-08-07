#!/bin/bash
# Retrieving datasets
# Dataset: sr-ms
# Dataset found at: 

mkdir -p data/analysis/sr-ms/logs/
mkdir -p data/analysis/sr-ms/trimmed_fastqc_round2
conda run -n pro_fastqc bash code/analysis/fastqc/run_fastqc.bash data/raw/sr-ms/ data/analysis/sr-ms/trimmed_fastqc_round2| tee data/analysis/sr-ms/logs/log_fastqc_sr-ms_round2.log