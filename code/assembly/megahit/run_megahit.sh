#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_to_fastq_dir> <path_output> <path_log_dir>"
  exit 1
fi

fastq_dir=$1
path_output=$2
path_log_dir=$3
log_file="${path_log_dir}/megahit_console_output.log"

# Find .fastq and .fastq.gz files for forward reads
forward_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*_1.fastq" -o -name "*_1.fastq.gz" \) | sort | paste -s -d ',')

# Find .fastq and .fastq.gz files for reverse reads
reverse_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*_2.fastq" -o -name "*_2.fastq.gz" \) | sort | paste -s -d ',')

# Basic check if any files were found
if [ -z "$forward_reads_list" ] || [ -z "$reverse_reads_list" ]; then
    echo "Error: No matching forward or reverse FASTQ files found in $fastq_dir."
    echo "Expected patterns: *_1.fastq, *_1.fastq.gz, *_2.fastq, *_2.fastq.gz"
    exit 1
fi

bash_to_run="code/assembly/megahit/megahit.sh \"$forward_reads_list\" \"$reverse_reads_list\" \"$path_output\""

echo "Executing: ${bash_to_run}"
echo "Output will be logged to: ${log_file}"

# Ensure the log directory exists
mkdir -p "${path_log_dir}"

conda run -n asm_megahit bash -c "${bash_to_run}" | tee "$log_file"