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
# Use an array to store arguments for metaspades.sh. This is crucial for proper passing.
METASPADES_SCRIPT_ARGS=()
READ_TYPE_DETECTED=""

# 1. Attempt to find paired-end reads first
forward_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*_1.fastq" -o -name "*_1.fastq.gz" \) | sort | paste -s -d ',')
reverse_reads_list=$(find "$fastq_dir" -maxdepth 1 \( -name "*_2.fastq" -o -name "*_2.fastq.gz" \) | sort | paste -s -d ',')

if [ -n "$forward_reads_list" ] && [ -n "$reverse_reads_list" ]; then
    echo "Detected paired-end reads."
    # Add -1 and -2 arguments to the array. The comma-separated list itself is the value.
    METASPADES_SCRIPT_ARGS+=("-1" "$forward_reads_list")
    METASPADES_SCRIPT_ARGS+=("-2" "$reverse_reads_list")
    READ_TYPE_DETECTED="paired-end"
elif [ -z "$forward_reads_list" ] && [ -z "$reverse_reads_list" ]; then
    # No paired-end files, check for single-end reads
    single_reads_list=$(find "$fastq_dir" -maxdepth 1 \
        \( -name "*.fastq" -o -name "*.fastq.gz" -o -name "*.fasta" -o -name "*.fasta.gz" \) \
        ! -name "*_1.*" ! -name "*_2.*" | sort | paste -s -d ',')

    if [ -n "$single_reads_list" ]; then
        echo "Detected single-end reads."
        METASPADES_SCRIPT_ARGS+=("-s" "$single_reads_list")
        READ_TYPE_DETECTED="single-end"
    fi
else
    echo "Error: Found partial paired-end reads (e.g., only _1 but not _2). Please check your input files in $fastq_dir." >&2
    exit 1
fi

# Check if any input files were found at all
if [ ${#METASPADES_SCRIPT_ARGS[@]} -eq 0 ]; then
    echo "Error: No suitable FASTQ/FASTA files found in '$fastq_dir'." >&2
    echo "Ensure files are named like *_1.fastq, *_2.fastq or *_1.fastq.gz, *_2.fastq.gz." >&2
    echo "Or for single-end: *.fastq/gz or *.fasta/gz (without _1 or _2)." >&2
    exit 1
fi

# Add the output path as the last argument to the array
METASPADES_SCRIPT_ARGS+=("$path_output")

# The command to be executed by metaspades.sh will be constructed and passed carefully
echo "Executing: code/assembly/metaspades/metaspades.sh ${METASPADES_SCRIPT_ARGS[@]}"
echo "Output will be logged to: ${log_file}"

# Execute the command within the conda environment.
# This is the most robust way to pass an array of arguments through 'bash -c'.
# We pass the script name as $0, and the rest of the arguments as $@ to the inner bash shell.
conda run -n asm_metaspades bash -c "code/assembly/metaspades/metaspades.sh \"\$@\"" _ "${METASPADES_SCRIPT_ARGS[@]}" | tee "$log_file"
# Explanation:
# - `code/assembly/metaspades/metaspades.sh`: The actual script path that the inner bash will execute.
# - `"\$@"`: This is a literal "$@" string passed to the inner `bash -c`. The inner `bash` will then expand
#            this to all the arguments that follow its `$0` placeholder.
# - `_`: This is the placeholder for `$0` in the inner `bash -c` shell. It's often set to an underscore.
# - `"${METASPADES_SCRIPT_ARGS[@]}"`: This expands the array `METASPADES_SCRIPT_ARGS` into separate,
#   properly quoted arguments that are then passed to the inner `bash -c` command.