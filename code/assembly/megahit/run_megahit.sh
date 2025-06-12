#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_to_fastq_dir> <path_output> <path_log_dir>"
  exit 1
fi

fastq_dir=$1
path_output=$2
path_log_dir=$3
log_file="${path_log_dir}/megahit_console_output.log"

# --- Determine read type (paired-end or single-end) ---

# Find .fastq and .fastq.gz files for forward reads (paired-end)
forward_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*_1.fastq" -o -name "*_1.fastq.gz" \) | sort | paste -s -d ',')

# Find .fastq and .fastq.gz files for reverse reads (paired-end)
reverse_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*_2.fastq" -o -name "*_2.fastq.gz" \) | sort | paste -s -d ',')

# Check if paired-end files were found
if [ -n "$forward_reads_list" ] && [ -n "$reverse_reads_list" ]; then
    echo "Detected paired-end reads."
    read_type="paired"
    megahit_args="-1 \"$forward_reads_list\" -2 \"$reverse_reads_list\""
elif [ -z "$forward_reads_list" ] && [ -z "$reverse_reads_list" ]; then
    # If no paired reads, look for single-end reads (fasta or fasta.gz, no _1 or _2)
    single_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*.fastq" -o -name "*.fastq.gz" -o -name "*.fasta" -o -name "*.fasta.gz" \) ! -name "*_1.*" ! -name "*_2.*" | sort | paste -s -d ',')

    if [ -n "$single_reads_list" ]; then
        echo "Detected single-end reads."
        read_type="single"
        megahit_args="-r \"$single_reads_list\""
    else
        echo "Error: No matching FASTQ/FASTA files found in $fastq_dir."
        echo "Expected patterns for paired-end: *_1.fastq/gz and *_2.fastq/gz"
        echo "Expected patterns for single-end: *.fastq/gz or *.fasta/gz (without _1 or _2)"
        exit 1
    fi
else
    echo "Error: Found partial paired-end reads (e.g., only _1 but not _2). Please check your input files in $fastq_dir."
    exit 1
fi

# Construct the command to pass to the actual megahit.sh
# We will pass the constructed arguments directly to megahit.sh
bash_to_run="code/assembly/megahit/megahit.sh ${megahit_args} \"$path_output\""

echo "Executing: ${bash_to_run}"
echo "Output will be logged to: ${log_file}"

# Ensure the log directory exists
mkdir -p "${path_log_dir}"

# Execute the megahit command, redirecting output to log file
conda run -n asm_megahit bash -c "${bash_to_run}" | tee "$log_file"