#!/bin/bash

conda run -n pro_fetch bash code/retrieve_datasets/reference/retrieve_ref_lr-ecoli.bash | tee logs/retrieval/log_retrieve_reference_lr-ecoli.log
