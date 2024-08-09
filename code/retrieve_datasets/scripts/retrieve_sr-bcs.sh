#!/bin/bash

conda run -n sra_toolkit bash -c "source code/retrieve_datasets/retrieve_sra.bash code/retrieve_datasets/sra_lists/sra-list_sr-bsc.txt data/raw/sr-bsc" | tee logs/retrieve_datasets/log_retrieve_lr-ms.log
