#!/bin/bash

conda run -n sra_toolkit bash -c "source code/retrieve_datasets/scripts/retrieve_sra.bash code/retrieve_datasets/sra_lists/sra-list_sr-ms.txt data/raw/sr-ms" | tee logs/retrieve_datasets/log_retrieve_lr-ms.log
