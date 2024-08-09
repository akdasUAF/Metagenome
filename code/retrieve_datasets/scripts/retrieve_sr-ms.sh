#!/bin/bash

bash code/retrieve_datasets/run_retrieve_sra.bash code/retrieve_datasets/sra_lists/sra-list_sr-ms.txt data/raw/sr-ms | tee logs/retrieve_datasets/log_retrieve_lr-ms.log
