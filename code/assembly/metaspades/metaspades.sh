#!/bin/bash
# This script is a wrapper for metaspades.py, designed to be called by a Slurm submission script
# It handles finding input files based on common naming conventions and constructs the
# appropriate metaspades.py command.

# Arguments:
# $1: <path_to_fastq_dir> (e.g., "data/raw/sr-log/test1/")
# $2: <path_output_dir> (e.g., "data/metaspades/sr-log/metaspades_assembly_run1")
# $3: <path_log_dir_for_metaspades_internal> (e.g., "data/metaspades/sr-log/metaspades_assembly_run1/metaspades_logs")
# $4: <num_threads> (e.g., 24, typically from $SLURM_CPUS_PER_TASK)

if [ $# -ne 4 ]; then
  echo "Usage: $0 <path_to_fastq_dir> <path_output_dir> <path_log_dir> <num_threads>" >&2
  exit 1
fi

fastq_dir="$1"
path_output="$2"
path_log_dir="$3"
num_threads="$4"

log_file="${path_log_dir}/metaspades_console_output.log"

# Resolve to absolute path, important for SPAdes
ABS_FASTQ_DIR="$(readlink -f "$fastq_dir")"
if [ ! -d "$ABS_FASTQ_DIR" ]; then
    echo "Error: Input FASTQ directory '$fastq_dir' (resolved to '$ABS_FASTQ_DIR') does not exist or is not a directory." >&2
    exit 1
fi

mkdir -p "${path_log_dir}" # Ensure the internal log directory exists

METASPADES_INPUT_ARGS_ARRAY=() # Array to build individual -1, -2, or -s arguments

# --- NEW LOGIC: Collect individual file paths for direct passing to SPAdes ---
FWD_FILES=()
REV_FILES=()
SINGLE_FILES=()

# Collect all forward reads (_1.fastq.gz or _1.fastq)
while IFS= read -r -d $'\0' f; do
    FWD_FILES+=("$f");
done < <(find "$ABS_FASTQ_DIR" -maxdepth 1 \( -name "*_1.fastq" -o -name "*_1.fastq.gz" \) -print0 | sort -z)

# Collect all reverse reads (_2.fastq.gz or _2.fastq)
while IFS= read -r -d $'\0' f; do
    REV_FILES+=("$f");
done < <(find "$ABS_FASTQ_DIR" -maxdepth 1 \( -name "*_2.fastq" -o -name "*_2.fastq.gz" \) -print0 | sort -z)

READ_TYPE_DETECTED=""

# 1. Prioritize paired-end reads if both FWD and REV files are found
if [ ${#FWD_FILES[@]} -gt 0 ] && [ ${#REV_FILES[@]} -gt 0 ]; then
    echo "Detected paired-end reads. Processing individual pairs."
    READ_TYPE_DETECTED="paired-end"
    
    # Iterate through forward files to find matching reverse files
    for fwd_file in "${FWD_FILES[@]}"; do
        # Extract base name (e.g., Set1)
        base_name=$(basename "$fwd_file")
        if [[ "$base_name" == *_1.fastq.gz ]]; then
            base_prefix="${base_name%_1.fastq.gz}"
            suffix="_2.fastq.gz"
        elif [[ "$base_name" == *_1.fastq ]]; then
            base_prefix="${base_name%_1.fastq}"
            suffix="_2.fastq"
        else
            # This case should ideally not be hit if `find` patterns are correct
            echo "Warning: Unrecognized forward read pattern for pairing: $fwd_file. Skipping." >&2
            continue
        fi
        expected_rev_file="${ABS_FASTQ_DIR}/${base_prefix}${suffix}"

        # Check if the corresponding reverse read exists in the collected REV_FILES
        found_match=0
        for rev_path in "${REV_FILES[@]}"; do
            if [[ "$rev_path" == "$expected_rev_file" ]]; then
                METASPADES_INPUT_ARGS_ARRAY+=("-1" "$fwd_file") # Add each file as a separate argument
                METASPADES_INPUT_ARGS_ARRAY+=("-2" "$rev_path") # Add each file as a separate argument
                found_match=1
                break
            fi
        done
        if [ "$found_match" -eq 0 ]; then
            echo "Warning: No matching reverse read found for $fwd_file (expected $expected_rev_file). Skipping this pair." >&2
        fi
    done

# 2. If no paired-end reads, look for single-end reads (files not ending in _1 or _2)
elif [ ${#FWD_FILES[@]} -eq 0 ] && [ ${#REV_FILES[@]} -eq 0 ]; then
    # Populate SINGLE_FILES 
    while IFS= read -r -d $'\0' f; do
        SINGLE_FILES+=("$f");
    done < <(find "$ABS_FASTQ_DIR" -maxdepth 1 \
        \( -name "*.fastq" -o -name "*.fastq.gz" -o -name "*.fasta" -o -name "*.fasta.gz" \) \
        ! -name "*_1.*" ! -name "*_2.*" -print0 | sort -z)

    if [ ${#SINGLE_FILES[@]} -gt 0 ]; then
        echo "Detected single-end reads. Processing individual files."
        READ_TYPE_DETECTED="single-end"
        for single_file in "${SINGLE_FILES[@]}"; do
            METASPADES_INPUT_ARGS_ARRAY+=("-s" "$single_file") # Add each file as a separate argument
        done
    fi
else
    # This block handles cases where only _1 or only _2 files are found, but not complete pairs.
    echo "Error: Found partial paired-end reads (e.g., only _1 but not _2). Please check your input files in $fastq_dir." >&2
    exit 1
fi

# Final check if any valid input arguments were gathered
if [ ${#METASPADES_INPUT_ARGS_ARRAY[@]} -eq 0 ]; then
    echo "Error: No suitable FASTQ/FASTA files found in '$fastq_dir' after attempting to match pairs/single-ends." >&2
    echo "Expected patterns for paired-end: *_1.fastq/gz and *_2.fastq/gz" >&2
    echo "Expected patterns for single-end: *.fastq/gz or *.fasta/gz (without _1 or _2 suffixes)" >&2
    exit 1
fi

echo "Running metaspades.py with the following input arguments:"
echo "${METASPADES_INPUT_ARGS_ARRAY[@]}"
echo "Output will be logged to: ${log_file}"

# Execute metaspades.py
# The 'tee' command captures both stdout and stderr to the log file,
# while also displaying it on the console (if not redirected by Slurm).
set -x # Enable command echoing for debugging
python3 tools/assemblers/SPAdes-4.0.0-Linux/bin/metaspades.py --meta \
  "${METASPADES_INPUT_ARGS_ARRAY[@]}" \
  -o "$path_output" \
  -t "$num_threads" 2>&1 | tee "$log_file"
set +x # Disable command echoing

if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    echo "ERROR: MetaSPAdes assembly failed. Check ${log_file} for details." >&2
    exit 1
fi

echo "MetaSPAdes assembly finished successfully."