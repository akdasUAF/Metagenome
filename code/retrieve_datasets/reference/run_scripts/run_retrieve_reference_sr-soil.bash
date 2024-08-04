#!/bin/bash

conda run -n pro_fetch bash code/retrieve_datasets/reference/retrieve_ref_sr-bsc.bash | tee logs/retrieval/log_retrieve_reference_sr-bsc.log
