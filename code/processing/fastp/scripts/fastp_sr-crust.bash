#!/bin/env bash
fastp_script="code/processing/fastp/run_fastp.bash"
forward_path="data/sr-crust/raw/sr-crust_1.fastq"
reverse_path="data/sr-crust/raw/sr-crust_2.fastq"
forward_trimmed_path="data/sr-crust/trimmed/sr-crust_trimmed_1.fastq"
reverse_trimmed_path="data/sr-crust/trimmed/sr-crust_trimmed_2.fastq"

path_report="data/sr-crust/analysis/sr-crust_fastp_report.html"
log_dir="data/sr-crust/log/"
dataset="sr-crust"
task="fastp"

mkdir -p $(dirname $forward_trimmed_path)
mkdir -p $(dirname $path_report)
mkdir -p ${log_dir}
log_file="${log_dir}/log_fastp_${dataset}.log"

# Construct the command to be executed
command="$fastp_script $forward_path $reverse_path $forward_trimmed_path $reverse_trimmed_path $path_report $log_file"
bash $command