#!/bin/bash

bash_to_run="bash code/processing/fastp/run_fastp.bash data/raw/sr-ms/ data/process/sr-ms/ data/analysis/sr-ms/"

bash code/benchmarking/benchmark.bash "${bash_to_run}" -d sr-ms -t fastp