#!/bin/bash
# Retrieving datasets
# Dataset: sr-ms
# Dataset found at: 

conda run -n pro_fastqc bash code/analysis/fastqc/run_fastqc.bash data/raw/sr-ms/ data/analysis/sr-ms/ | tee data/analysis/sr-ms/logs/log_fastqc_sr-ms.log