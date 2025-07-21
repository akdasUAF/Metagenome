#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_to_fastq_dir> <path_output_dir> <path_log_dir>"
  exit 1
fi

fastq_dir=$1
path_output=$2
path_log_dir=$3


log_file="${path_log_dir}/unicycler_console_output.log"

# --- Dynamically find all paired-end FASTQ files ---
# This assumes your files are named like SRRxxxxxx_1.fastq and SRRxxxxxx_2.fastq
# in the $fastq_dir.
# We build a string of all '-1 file1 -2 file1 -1 file2 -2 file2' arguments.
UNICYCLER_INPUT_ARGS=""
for fwd_read in "$fastq_dir"/*_1.fastq; do
    if [ -e "$fwd_read" ]; then # Check if the file exists
        base_name=$(basename "$fwd_read" _1.fastq)
        rev_read="${fastq_dir}/${base_name}_2.fastq"
        if [ -e "$rev_read" ]; then
            UNICYCLER_INPUT_ARGS+=" -1 \"$fwd_read\" -2 \"$rev_read\""
        else
            echo "Warning: No matching reverse read found for $fwd_read. Skipping pair." >&2
        fi
    fi
done

# Check if any input files were found
if [ -z "$UNICYCLER_INPUT_ARGS" ]; then
    echo "Error: No matching paired-end FASTQ files found in '$fastq_dir'. Ensure files are named like *_1.fastq and *_2.fastq." >&2
    exit 1
fi

# Construct the command to be executed by unicycler.sh
# Note: unicycler.sh only needs the input args and the output path.
# The log path is handled by run_unicycler.sh (this script)
bash_to_run="code/assembly/unicycler/unicycler.sh $UNICYCLER_INPUT_ARGS \"$path_output\""

echo "Executing: ${bash_to_run}"
echo "Output will be logged to: ${log_file}"

# Execute the command within the conda environment and tee its output
# Using 'bash -c' to ensure the entire command string is parsed correctly
conda run -n asm_unicycler bash -c "${bash_to_run}" | tee "$log_file"