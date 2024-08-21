#!/bin/bash
fastp_script="code/processing/fastp/run_fastp.bash"
raw_dir="data/raw/sr-ms/"
forward_path="data/sr-ms/raw/DRR090555/DRR090555_1.fastq"
reverse_path="data/sr-ms/raw/DRR090555/DRR090555_2.fastq"
forward_trimmed_path="data/sr-ms/trimmed/sr-ms_trimmed_1.fastq"
reverse_trimmed_path="data/sr-ms/trimmed/sr-ms_trimmed_2.fastq"

path_report="data/sr-ms/analysis/sr-ms_fastp_report.html"
log_dir="data/sr-ms/logs/"
dataset="sr-ms"
task="fastp"

dataset="lr-bd"
task="raven"

mkdir -p $(dirname $path_report)
mkdir -p ${log_dir}
log_file="${log_dir}/log_fastp_${dataset}.log"

# Construct the command to be executed
command="$fastp_script $forward_path $reverse_path $forward_trimmed_path $reverse_trimmed_path $path_report $log_file"
bash $command