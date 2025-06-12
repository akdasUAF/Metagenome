#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_to_fastq_dir> <path_output_dir> <path_log_dir>"
  exit 1
fi

fastq_dir=$1
path_output=$2
path_log_dir=$3

log_file="${path_log_dir}/metaspades_console_output.log"

# --- CRITICAL CHANGE: Convert input_fastq_dir to an absolute path ---
# `readlink -f` resolves any symbolic links and returns the absolute path.
ABS_FASTQ_DIR="$(readlink -f "$fastq_dir")"
if [ ! -d "$ABS_FASTQ_DIR" ]; then
    echo "Error: Input FASTQ directory '$fastq_dir' (resolved to '$ABS_FASTQ_DIR') does not exist or is not a directory." >&2
    exit 1
fi

# Ensure the log directory exists
mkdir -p "${path_log_dir}"

# --- Dynamically determine MetaSPAdes input arguments (paired-end or single-end) ---
METASPADES_INPUT_ARGS_ARRAY=()
READ_TYPE_DETECTED=""

# Now use ABS_FASTQ_DIR in the find commands
forward_reads_list=$(find "$ABS_FASTQ_DIR" -maxdepth 1 \( -name "*_1.fastq" -o -name "*_1.fastq.gz" \) | sort | paste -s -d ',')
reverse_reads_list=$(find "$ABS_FASTQ_DIR" -maxdepth 1 \( -name "*_2.fastq" -o -name "*_2.fastq.gz" \) | sort | paste -s -d ',')

if [ -n "$forward_reads_list" ] && [ -n "$reverse_reads_list" ]; then
    echo "Detected paired-end reads."
    METASPADES_INPUT_ARGS_ARRAY+=("-1" "$forward_reads_list")
    METASPADES_INPUT_ARGS_ARRAY+=("-2" "$reverse_reads_list")
    READ_TYPE_DETECTED="paired-end"
elif [ -z "$forward_reads_list" ] && [ -z "$reverse_reads_list" ]; then
    single_reads_list=$(find "$ABS_FASTQ_DIR" -maxdepth 1 \
        \( -name "*.fastq" -o -name "*.fastq.gz" -o -name "*.fasta" -o -name "*.fasta.gz" \) \
        ! -name "*_1.*" ! -name "*_2.*" | sort | paste -s -d ',')

    if [ -n "$single_reads_list" ]; then
        echo "Detected single-end reads."
        METASPADES_INPUT_ARGS_ARRAY+=("-s" "$single_reads_list")
        READ_TYPE_DETECTED="single-end"
    fi
else
    echo "Error: Found partial paired-end reads (e.g., only _1 but not _2). Please check your input files in $fastq_dir." >&2
    exit 1
fi

if [ ${#METASPADES_INPUT_ARGS_ARRAY[@]} -eq 0 ]; then
    echo "Error: No suitable FASTQ/FASTA files found in '$fastq_dir'." >&2
    echo "Ensure files are named like *_1.fastq, *_2.fastq or *_1.fastq.gz, *_2.fastq.gz." >&2
    echo "Or for single-end: *.fastq/gz or *.fasta/gz (without _1 or _2)." >&2
    exit 1
fi

# Add the output path as the last argument to the array
METASPADES_INPUT_ARGS_ARRAY+=("$path_output")

echo "Executing: code/assembly/metaspades/metaspades.sh ${METASPADES_INPUT_ARGS_ARRAY[@]}"
echo "Output will be logged to: ${log_file}"

# Execute the command within the conda environment. This part is already correct.
conda run -n asm_metaspades bash -c "code/assembly/metaspades/metaspades.sh \"\$@\"" _ "${METASPADES_INPUT_ARGS_ARRAY[@]}" | tee "$log_file"