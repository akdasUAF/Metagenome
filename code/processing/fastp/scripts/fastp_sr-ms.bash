#!/bin/bash

benchmark_script="code/benchmarking/benchmark.bash"
fastp_script="code/processing/fastp/run_fastp.bash"
raw_dir="data/raw/sr-ms/"
trimmed_dir="data/process/sr-ms/"
analysis_dir="data/analysis/sr-ms/"
bash_to_run="$fastp_script" "$raw_dir" "$trimmed_dir" "$analysis_dir"

bash "$benchmark_script" "$bash_to_run" -d sr-ms -t fastp
