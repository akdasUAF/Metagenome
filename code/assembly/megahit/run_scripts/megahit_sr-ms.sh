#!/bin/bash

# conda run -n asm-megahit bash -c "source code/assembly/megahit/run_megahit_with_options.sh data/process/sr-ms/ data/MAG/sr-ms/ data/analysis/megahit/sr-ms/"
conda run -n asm_megahit bash -c "code/assembly/megahit/run_megahit_with_options.sh data/process/sr-ms/ data/MAG/sr-ms/ data/analysis/megahit/sr-ms/"