#!/bin/bash
benchmark_script="code/benchmarking/benchmark.bash"
fastp_script="code/processing/fastp/run_fastp.bash"
forward_path="data/raw/sr-ms/sr-ms_raw_1.fastq"
reverse_path="data/raw/sr-ms/sr-ms_raw_2.fastq"

forward_trimmed_path="data/raw/sr-ms/sr-ms_trimmed_1.fastq"
reverse_trimmed_path="data/raw/sr-ms/sr-ms_trimmed_2.fastq"

report_path="data/raw/sr-ms/logs/sr-ms_report.txt"

mkdir -p $(dirname "$report_path")

# Execute the benchmark script with the constructed command
fastp -i $forward_path -I $reverse_path -o $forward_trimmed_path -O $reverse_trimmed_path -h $report_path -q 20 -p 95 -l 30 -n 10

