#!/bin/bash
# This script is a wrapper for Unicycler, designed to be called by a Slurm submission script.
# It handles finding input files based on common naming conventions and constructs the
# appropriate unicycler command.

# Arguments:
# $1: <path_to_fastq_dir> (e.g., "data/raw/sr-log/test1/")
# $2: <path_output_dir> (e.g., "data/unicycler/sr-log/unicycler_assembly_run1")
# $3: <num_threads> (e.g., 24, typically from $SLURM_CPUS_PER_TASK)

# CHANGED: Only 3 arguments now
if [ $# -ne 3 ]; then
  echo "Usage: $0 <path_to_fastq_dir> <path_output_dir> <num_threads>" >&2
  exit 1
fi

fastq_dir="$1"
path_output="$2"
num_threads="$3"

# Unicycler's main output is to its output directory. We'll capture its console output.
log_file="${path_output}/unicycler_console_output.log"

# Resolve to absolute path, important for tools like Unicycler/SPAdes
ABS_FASTQ_DIR="$(readlink -f "$fastq_dir")"
if [ ! -d "$ABS_FASTQ_DIR" ]; then
    echo "Error: Input FASTQ directory '$fastq_dir' (resolved to '$ABS_FASTQ_DIR') does not exist or is not a directory." >&2
    exit 1
fi

# Ensure the output directory exists. The parent script should also create this.
# Unicycler will try to create it, but if it exists, it might complain unless it's empty.
# It's safer to let Unicycler handle creation if it doesn't exist, and *we* ensure it's empty.
# The parent script creates it, and we ensure it's empty here.
# Removed path_log_dir specific mkdir as Unicycler doesn't have internal logs like SPAdes.
# The `rm -rf` below handles a clean start.

UNICYCLER_INPUT_ARGS_ARRAY=() # Array to build -1 and -2 arguments

# --- Collect ONE paired-end library ---
# Unicycler expects _R1 and _R2. We'll search for *trimmed.fastq.gz
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

# Extract base name (e.g., sample_trimmed)
base_prefix_fwd=$(basename "$fwd_file" "_R1_trimmed.fastq.gz")
expected_rev_file_name="${base_prefix_fwd}_R2_trimmed.fastq.gz"

if [ "$(basename "$rev_file")" != "$expected_rev_file_name" ]; then
    echo "Error: The detected R1 file '$fwd_file' does not have a matching R2 file '$rev_file' based on '${base_prefix_fwd}_R2_trimmed.fastq.gz' naming convention." >&2
    exit 1
fi

echo "Detected paired-end reads: $fwd_file and $rev_file"
UNICYCLER_INPUT_ARGS_ARRAY+=("-1" "$fwd_file")
UNICYCLER_INPUT_ARGS_ARRAY+=("-2" "$rev_file")

# Remove the output directory if it exists, as Unicycler can complain if it's not empty.
# The parent script ensures the base directory exists, but this ensures a clean start for Unicycler.
rm -rf "$path_output"

echo "Running unicycler with the following input arguments:"
echo "${UNICYCLER_INPUT_ARGS_ARRAY[@]} -o \"$path_output\" -t \"$num_threads\""
echo "Output will be logged to: ${log_file}"

set -x # Enable command echoing for debugging
unicycler \
  "${UNICYCLER_INPUT_ARGS_ARRAY[@]}" \
  -o "$path_output" \
  -t "$num_threads" \
  # Add other Unicycler specific flags here if needed, e.g.:
  # --mode normal # For short-read only assembly, 'normal' mode is typical.
  # --no_pilon    # If you want to skip the Pilon polishing step.
  2>&1 | tee "$log_file"
set +x # Disable command echoing

if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    echo "ERROR: Unicycler assembly failed. Check ${log_file} for details." >&2
    exit 1
fi

echo "Unicycler assembly finished successfully."