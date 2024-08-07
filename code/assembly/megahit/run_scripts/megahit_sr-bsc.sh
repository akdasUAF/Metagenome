#!/bin/bash


bash code/analysis/dool/start_dool.sh "$path_analysis"/dool_asm_megahit_sr-bsc.csv

conda run -n asm_megahit bash -c "source code/analysis/time/run_with_time.sh code/assembly/megahit/run_megahit_sr-ms.bash" | tee data/analysis/megahit/sr-bsc/log_assemble_megahit_sr-bsc.log

bash code/analysis/dool/kill_dool.sh
