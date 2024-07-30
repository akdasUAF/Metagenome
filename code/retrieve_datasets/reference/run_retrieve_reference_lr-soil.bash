#!/bin/bash

conda run -n pro_fetch bash code/retrieve_datasets/reference/scripts/retrieve_reference_lr-soil.bash | tee logs/processing/log_retrieve_reference_lr-soil.log
