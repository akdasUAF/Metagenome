#!/bin/bash

benchmark_script="code/benchmarking/benchmark.bash"
fastp_script="code/processing/fastp/run_fastp.bash"
forward_path="data/raw/sr-even/sr-even_1_untrimmed.fastq"
reverse_path="data/raw/sr-even/sr-even_2_untrimmed.fastq"

forward_trimmed_path="data/raw/sr-even/sr-even_1_trimmed.fastq"
reverse_trimmed_path="data/raw/sr-even/sr-even_2_trimmed.fastq"

report_path="data/raw/sr-even/logs/sr-even_report.txt"

mkdir -p $(dirname "$report_path")

# Execute the benchmark script with the constructed command
fastp -i $forward_path -I $reverse_path -o $forward_trimmed_path -O $reverse_trimmed_path -h $report_path -q 20 -p 95 -l 30 -n 10