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

# --- Dynamically find all paired-end FASTQ files ---
# This assumes your files are named like SRRxxxxxx_1.fastq or SRRxxxxxx_1.fastq.gz
# and their pairs are SRRxxxxxx_2.fastq or SRRxxxxxx_2.fastq.gz
# We build a string of all '-1 file1 -2 file1 -1 file2 -2 file2' arguments.
METASPADES_INPUT_ARGS=""

# Use a loop over a combined set of possible forward read patterns
# The brace expansion {fastq,fastq.gz} creates two patterns: *_1.fastq and *_1.fastq.gz
for fwd_read_pattern in "$fastq_dir"/*_1.{fastq,fastq.gz}; do
    # Check if the pattern matched any files
    # The -e check is important here in case the glob doesn't find any files (e.g., if no .fastq files exist)
    if [ -e "$fwd_read_pattern" ]; then
        # Extract the base name (e.g., SRRxxxxxx)
        # We need to handle both .fastq and .fastq.gz extensions
        base_name=$(basename "$fwd_read_pattern")
        
        # Remove the specific _1.fastq or _1.fastq.gz suffix
        base_name_no_suffix=""
        if [[ "$base_name" == *_1.fastq.gz ]]; then
            base_name_no_suffix="${base_name%_1.fastq.gz}"
            fwd_ext=".fastq.gz"
        elif [[ "$base_name" == *_1.fastq ]]; then
            base_name_no_suffix="${base_name%_1.fastq}"
            fwd_ext=".fastq"
        else
            # This case should ideally not be hit due to the glob pattern,
            # but good for robustness if patterns change.
            echo "Warning: Unrecognized forward read file pattern: $fwd_read_pattern. Skipping." >&2
            continue
        fi

        # Now, construct the expected reverse read filename with the same base name and original extension
        rev_read="${fastq_dir}/${base_name_no_suffix}_2${fwd_ext}"

        # Check if the corresponding reverse read exists
        if [ -e "$rev_read" ]; then
            METASPADES_INPUT_ARGS+=" -1 \"$fwd_read_pattern\" -2 \"$rev_read\""
        else
            echo "Warning: No matching reverse read found for $fwd_read_pattern (expected $rev_read). Skipping pair." >&2
        fi
    fi
done

# Check if any input files were found
if [ -z "$METASPADES_INPUT_ARGS" ]; then
    echo "Error: No matching paired-end FASTQ files found in '$fastq_dir'." >&2
    echo "Ensure files are named like *_1.fastq, *_2.fastq or *_1.fastq.gz, *_2.fastq.gz." >&2
    exit 1
fi

# Construct the command to be executed by metaspades.sh
bash_to_run="code/assembly/metaspades/metaspades.sh $METASPADES_INPUT_ARGS \"$path_output\""

echo "Executing: ${bash_to_run}"
echo "Output will be logged to: ${log_file}"

# Execute the command within the conda environment and tee its output
conda run -n asm_metaspades bash -c "${bash_to_run}" | tee "$log_file"