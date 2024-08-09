#!/bin/bash

bash code/retrieve_datasets/run_retrieve_sra.bash code/retrieve_datasets/sra_lists/sra-list_sr-log.txt data/raw/sr-log | tee logs/retrieve_datasets/log_retrieve_sr-log.log
