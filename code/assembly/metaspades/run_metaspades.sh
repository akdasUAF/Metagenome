#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_to_fastq_dir> <path_output_dir> <path_log_dir>"
  exit 1
fi

fastq_dir=$1
path_output=$2
path_log_dir=$3

log_file="${path_log_dir}/metaspades_console_output.log"

# Ensure the log directory exists
mkdir -p "${path_log_dir}"

# --- Dynamically determine MetaSPAdes input arguments (paired-end or single-end) ---
METASPADES_INPUT_ARGS=""
READ_TYPE_DETECTED=""

# 1. Attempt to find paired-end reads first
# Find .fastq and .fastq.gz files for forward reads (paired-end)
forward_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*_1.fastq" -o -name "*_1.fastq.gz" \) | sort | paste -s -d ',')

# Find .fastq and .fastq.gz files for reverse reads (paired-end)
reverse_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*_2.fastq" -o -name "*_2.fastq.gz" \) | sort | paste -s -d ',')

if [ -n "$forward_reads_list" ] && [ -n "$reverse_reads_list" ]; then
    # Paired-end files found
    echo "Detected paired-end reads."
    # Using comma-separated lists for -1 and -2, as SPAdes supports this.
    METASPADES_INPUT_ARGS="-1 \"$forward_reads_list\" -2 \"$reverse_reads_list\""
    READ_TYPE_DETECTED="paired-end"
elif [ -z "$forward_reads_list" ] && [ -z "$reverse_reads_list" ]; then
    # No paired-end files, check for single-end reads
    # Look for files ending in .fastq, .fastq.gz, .fasta, .fasta.gz but NOT containing _1 or _2
    single_reads_list=$(find "$fastq_dir" -maxdepth 1 \
        \( -name "*.fastq" -o -name "*.fastq.gz" -o -name "*.fasta" -o -name "*.fasta.gz" \) \
        ! -name "*_1.*" ! -name "*_2.*" | sort | paste -s -d ',')

    if [ -n "$single_reads_list" ]; then
        echo "Detected single-end reads."
        # Using comma-separated list for -s, as SPAdes supports this.
        METASPADES_INPUT_ARGS="-s \"$single_reads_list\""
        READ_TYPE_DETECTED="single-end"
    fi
else
    # Mismatch: _1 found but no _2, or vice-versa
    echo "Error: Found partial paired-end reads (e.g., only _1 but not _2). Please check your input files in $fastq_dir." >&2
    exit 1
fi

# Check if any input files were found at all
if [ -z "$METASPADES_INPUT_ARGS" ]; then
    echo "Error: No suitable FASTQ/FASTA files found in '$fastq_dir'." >&2
    echo "Expected patterns for paired-end: *_1.fastq/gz and *_2.fastq/gz" >&2
    echo "Expected patterns for single-end: *.fastq/gz or *.fasta/gz (without _1 or _2)" >2
    exit 1
fi

# Construct the command to be executed by metaspades.sh
# Note: The `metaspades.sh` script currently expects the output path as the last argument.
# Make sure your `metaspades.sh` still correctly parses this.
bash_to_run="code/assembly/metaspades/metaspades.sh $METASPADES_INPUT_ARGS \"$path_output\""

echo "Executing: ${bash_to_run}"
echo "Output will be logged to: ${log_file}"

# Execute the command within the conda environment and tee its output
conda run -n asm_metaspades bash -c "${bash_to_run}" | tee "$log_file"