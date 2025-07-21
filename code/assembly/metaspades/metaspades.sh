#!/bin/bash
# This script is a wrapper for metaspades.py, designed to be called by a Slurm submission script
# It handles finding input files based on common naming conventions and constructs the
# appropriate metaspades.py command.

# Arguments:
# $1: <path_to_fastq_dir> (e.g., "data/raw/sr-log/test1/")
# $2: <path_output_dir> (e.g., "data/metaspades/sr-log/metaspades_assembly_run1")
# $3: <path_log_dir_for_metaspades_internal> (e.g., "data/metaspades/sr-log/metaspades_assembly_run1/metaspades_logs")
# $4: <num_threads> (e.g., 24, typically from $SLURM_CPUS_PER_TASK)
# $5: <memory_limit_gb> (e.g., 64, typically from $SLURM_MEM_PER_NODE)

if [ $# -ne 5 ]; then # Only 5 arguments now
  echo "Usage: $0 <path_to_fastq_dir> <path_output_dir> <path_log_dir> <num_threads> <memory_limit_gb>" >&2
  exit 1
fi

fastq_dir="$1"
path_output="$2"
path_log_dir="$3"
num_threads="$4"
memory_limit_gb="$5"

log_file="${path_log_dir}/metaspades_console_output.log"

# Resolve to absolute path, important for SPAdes
ABS_FASTQ_DIR="$(readlink -f "$fastq_dir")"
if [ ! -d "$ABS_FASTQ_DIR" ]; then
    echo "Error: Input FASTQ directory '$fastq_dir' (resolved to '$ABS_FASTQ_DIR') does not exist or is not a directory." >&2
    exit 1
fi

mkdir -p "${path_log_dir}" # Ensure the internal log directory exists

METASPADES_INPUT_ARGS_ARRAY=() # Array to build -1 and -2 arguments

# --- REVISED LOGIC: Collect ONE paired-end library ---
# MetaSPAdes expects _R1 and _R2. We'll search for *trimmed.fastq.gz
# Use find with -print0 and mapfile for robustness
mapfile -d $'\0' FWD_FILES < <(find "$ABS_FASTQ_DIR" -maxdepth 1 -name "*_R1_trimmed.fastq.gz" -print0 | sort -z)
mapfile -d $'\0' REV_FILES < <(find "$ABS_FASTQ_DIR" -maxdepth 1 -name "*_R2_trimmed.fastq.gz" -print0 | sort -z)

if [ ${#FWD_FILES[@]} -ne 1 ] || [ ${#REV_FILES[@]} -ne 1 ]; then
    echo "Error: Expected exactly ONE pair of _R1_trimmed.fastq.gz and _R2_trimmed.fastq.gz files in '$ABS_FASTQ_DIR'." >&2
    echo "Found R1 files: ${FWD_FILES[*]}" >&2
    echo "Found R2 files: ${REV_FILES[*]}" >&2
    echo "If you have multiple samples or single-end reads, this script needs modification." >&2
    exit 1
fi

# Ensure the detected R1 and R2 files are a matching pair
fwd_file="${FWD_FILES[0]}"
rev_file="${REV_FILES[0]}"

# Extract base name (e.g., sr-even_trimmed)
base_prefix_fwd=$(basename "$fwd_file" "_R1_trimmed.fastq.gz")
expected_rev_file_name="${base_prefix_fwd}_R2_trimmed.fastq.gz"

if [ "$(basename "$rev_file")" != "$expected_rev_file_name" ]; then
    echo "Error: The detected R1 file '$fwd_file' does not have a matching R2 file '$rev_file' based on '${base_prefix_fwd}_R2_trimmed.fastq.gz' naming convention." >&2
    exit 1
fi

echo "Detected paired-end reads: $fwd_file and $rev_file"
METASPADES_INPUT_ARGS_ARRAY+=("-1" "$fwd_file")
METASPADES_INPUT_ARGS_ARRAY+=("-2" "$rev_file")

echo "Running metaspades.py with the following input arguments:"
echo "${METASPADES_INPUT_ARGS_ARRAY[@]}"
echo "Output will be logged to: ${log_file}"

SPADES_BIN_DIR="/import/home/wwinnett/metagenome_replicates/attempt2/Metagenome/tools/assemblers/SPAdes-4.0.0-Linux/bin"

METASPADES_MEMORY_ARG=""
if [[ -n "$memory_limit_gb" && "$memory_limit_gb" -gt 0 ]]; then
    METASPADES_MEMORY_ARG="-m ${memory_limit_gb}"
    echo "MetaSPAdes memory limit set to: ${memory_limit_gb} GB"
else
    echo "Warning: No valid memory limit provided. MetaSPAdes will use its default or auto-detect."
fi

set -x # Enable command echoing for debugging
"${SPADES_BIN_DIR}/metaspades.py" \
  --meta \
  "${METASPADES_INPUT_ARGS_ARRAY[@]}" \
  -o "$path_output" \
  -t "$num_threads" \
  ${METASPADES_MEMORY_ARG} \
  2>&1 | tee "$log_file"
set +x # Disable command echoing

if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    echo "ERROR: MetaSPAdes assembly failed. Check ${log_file} for details." >&2
    exit 1
fi

echo "MetaSPAdes assembly finished successfully."