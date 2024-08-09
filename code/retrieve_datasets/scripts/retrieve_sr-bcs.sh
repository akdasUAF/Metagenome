#!/bin/bash

bash code/retrieve_datasets/run_retrieve_sra.bash code/retrieve_datasets/sra_lists/sra-list_sr-bsc.txt data/raw/sr-bsc | tee logs/retrieve_datasets/log_retrieve_lr-ms.log
