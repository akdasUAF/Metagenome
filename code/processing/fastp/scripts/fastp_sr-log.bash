#!/bin/env bash
fastp_script="code/processing/fastp/run_fastp.bash"
forward_path="data/sr-log/raw/sr-log_forward.fastq"
reverse_path="data/sr-log/raw/sr-log_reverse.fastq"
forward_trimmed_path="data/sr-log/trimmed/sr-log_trimmed_1.fastq"
reverse_trimmed_path="data/sr-log/trimmed/sr-log_trimmed_2.fastq"

path_report="data/sr-log/analysis/sr-log_fastp_report.html"
log_dir="data/sr-log/logs/"
dataset="sr-log"
task="fastp"

mkdir -p $(dirname $forward_trimmed_path)
mkdir -p $(dirname $path_report)
mkdir -p ${log_dir}
log_file="${log_dir}/log_${task}_${dataset}.log"

# Construct the command to be executed
command="$fastp_script $forward_path $reverse_path $forward_trimmed_path $reverse_trimmed_path $path_report $log_file"
bash $command