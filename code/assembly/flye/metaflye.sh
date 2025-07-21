#!/bin/bash
## Assembler: MetaFlye

# Arguments expected:
# $1: <read_type_flag> (e.g., --nano-raw, --pacbio-raw, --pacbio-hifi)
# $2: <space_separated_read_paths> (e.g., "file1.fastq file2.fastq")
# $3: <output_path> (e.g., /path/to/output_dir)

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <read_type_flag> <space_separated_read_paths> <output_path>"
  echo "Example: $0 --nano-raw \"data/raw/reads1.fastq data/raw/reads2.fastq\" \"data/assembly_output\""
  exit 1
fi

declare -r READ_TYPE_FLAG="$1"
# The second argument is a single string containing space-separated paths, need to expand it.
declare -r READ_PATHS="$2"
declare -r PATH_OUTPUT="$3"

# Define a temporary log file for Flye's internal stderr/stdout (Flye logs to its output dir anyway)
# We'll still capture general errors here if they occur before Flye creates its own log.
FLYE_INTERNAL_LOG="${PATH_OUTPUT}/flye_internal.log"

# --- DEBUGGING COMMAND ECHO ---
echo "DEBUG: MetaFlye command will be:"
echo "flye --meta ${READ_TYPE_FLAG} ${READ_PATHS} --out-dir ${PATH_OUTPUT} --threads 24 2> \"${FLYE_INTERNAL_LOG}\""
echo "******************************************************************"
# ------------------------------

# Construct and execute the MetaFlye command
# Flye automatically creates an assembly.fasta (or contigs.fasta) in the output directory.
# Flye's detailed log is also written to <output_dir>/flye.log
flye --meta ${READ_TYPE_FLAG} ${READ_PATHS} --out-dir "${PATH_OUTPUT}" --threads 24 2> "${FLYE_INTERNAL_LOG}"

# Check MetaFlye's exit status.
if [ $? -ne 0 ]; then
    echo "ERROR: MetaFlye assembly failed."
    echo "Check Flye's main log in its output directory: ${PATH_OUTPUT}/flye.log"
    echo "Also check internal log for initial errors: ${FLYE_INTERNAL_LOG}"
    cat "${FLYE_INTERNAL_LOG}" # Print the content of the internal log for quick review
    exit 1 # Propagate the error status
fi

# Clean up the temporary internal log if desired after successful run
# For MetaFlye, its own detailed log (flye.log) is usually sufficient.
rm -f "${FLYE_INTERNAL_LOG}" # MetaFlye has its own robust logging.