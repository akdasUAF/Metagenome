#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <raw_directory> <MAG_out_dir>"
  exit 1
fi

# Directory containing FASTQ files
unpaired_in="$1"

# Ensure paired_trimmed_path ends with a slash
paired_trimmed_path="${2}/"

# Create output directory if it doesn't exist
mkdir -p "$paired_trimmed_path"

# Find all FASTQ files
fastq_files=($unpaired_in/*.fastq)

# Group FASTQ files by prefix
forward_reads=($(find "$path_reads" -name "*_1.fastq*"))
reverse_reads=($(find "$path_reads" -name "*_2.fastq*"))

for forward_read in "${forward_reads[@]}"; do
  base_name="${forward_read%_1.fastq}"
  reverse_read="${base_name}_2.fastq"

  # Check if the reverse read exists
  if [[ -f "$reverse_read" ]]; then
    # Run your command with forward and reverse reads
    tools/assemblers/idba/bin/fq2fa --merge --filter "$read1" "$read2" "$output"
  else
    echo "Reverse read not found for $forward_read"
  fi
done

