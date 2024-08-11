#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <raw_directory> <MAG_out_dir>"
  exit 1
fi

# Directory containing FASTQ files
unpaired_in="$1"

# Remove trailing slash from paired_trimmed_path (optional)
paired_trimmed_path="${2%%/}"  # Removes trailing slash, if any

# Find all FASTQ files
fastq_files=($unpaired_in/*.fastq)

# Group FASTQ files by prefix
for file in "${fastq_files[@]}"; do
  prefix="${file%%_*}"
  pairs[$prefix]+="$file "
done

# Process each pair
for prefix in "${!pairs[@]}"; do
  read1="${pairs[$prefix]}"
  read1="${read1% }" # Remove trailing space
  read2="${pairs[$prefix]}"
  read2="${read2##* }" # Extract last file
  output="${paired_trimmed_path}/${prefix}.fa"

  tools/assemblers/idba/bin/fq2fa --merge --filter "$read1" "$read2" "$output"
done
