#!/bin/bash
## Assembler: Canu

# Arguments expected:
# $1: <canu_read_type_flag> (e.g., -nanopore, -pacbio-raw, -pacbio-hifi)
# $2: <space_separated_read_paths> (e.g., "file1.fastq file2.fastq")
# $3: <output_path> (e.g., /path/to/canu_output_dir)
# $4: <genome_size> (e.g., 5m, 1.2g)
# $5: <num_threads> (e.g., 24)
# $6: <memory_requested> (e.g., 64G)

if [ "$#" -ne 6 ]; then
  echo "Usage: $0 <canu_read_type_flag> <space_separated_read_paths> <output_path> <genome_size> <num_threads> <memory_requested>"
  echo "Example: $0 -nanopore \"data/raw/reads1.fastq data/raw/reads2.fastq\" \"data/canu_output\" 5m 24 64G"
  exit 1
fi

declare -r CANU_READ_TYPE_FLAG="$1"
# The second argument is a single string containing space-separated paths.
# We need to expand it properly so Canu sees individual filenames.
declare -r READ_PATHS="$2" # This is a string, e.g., "file1.fastq file2.fastq"
declare -r PATH_OUTPUT="$3"
declare -r GENOME_SIZE="$4"
declare -r NUM_THREADS="$5"
declare -r MEMORY_REQUESTED="$6" # e.g., "64G"

# Extract numeric memory value for Canu's maxMemory parameter (e.g., 64G -> 64)
# Canu's maxMemory needs to be in GB, so remove the 'G'. Leave some overhead for OS.
MEMORY_GB_VALUE=$(echo "${MEMORY_REQUESTED}" | sed 's/G$//')
MEMORY_GB_FOR_CANU=$(( MEMORY_GB_VALUE - 4 )) # Deduct 4GB for OS/other processes as a buffer

# Determine Canu project name from the output directory
# For example, if PATH_OUTPUT is data/canu/lr-log/test5, PROJECT_NAME will be test5
PROJECT_NAME=$(basename "${PATH_OUTPUT}")

# --- DEBUGGING COMMAND ECHO ---
echo "DEBUG: Canu command will be:"
echo "./tools/assemblers/canu-2.2/bin/canu -p ${PROJECT_NAME} -d ${PATH_OUTPUT} genomeSize=${GENOME_SIZE} ${CANU_READ_TYPE_FLAG} ${READ_PATHS} threads=${NUM_THREADS} maxMemory=${MEMORY_GB_FOR_CANU}g useGrid=false 2>&1 | tee \"${PATH_OUTPUT}/canu_run.log\""
echo "******************************************************************"
# ------------------------------

# Construct and execute the Canu command
# Canu writes its main log file and assembly output to the specified -d directory.
# We'll tee stdout/stderr to a general log file within the output directory for capturing all console output.

./tools/assemblers/canu-2.2/bin/canu \
     -p "${PROJECT_NAME}" \
     -d "${PATH_OUTPUT}" \
     genomeSize="${GENOME_SIZE}" \
     "${CANU_READ_TYPE_FLAG}" "${READ_PATHS}" \
     threads="${NUM_THREADS}" \
     maxMemory="${MEMORY_GB_FOR_CANU}g" \
     useGrid=false \
     2>&1 | tee "${PATH_OUTPUT}/canu_run.log"

# Check Canu's exit status.
if [ $? -ne 0 ]; then
    echo "ERROR: Canu assembly failed."
    echo "Check Canu's main log in its output directory: ${PATH_OUTPUT}/canu_run.log"
    exit 1 # Propagate the error status
fi

# Canu places its final assembly in <output_dir>/<project_name>.contigs.fasta
# You might want to symlink/copy it to a common name like final.contigs.fasta
if [ -f "${PATH_OUTPUT}/${PROJECT_NAME}.contigs.fasta" ]; then
    ln -s "${PATH_OUTPUT}/${PROJECT_NAME}.contigs.fasta" "${PATH_OUTPUT}/final.contigs.fasta"
    echo "Canu final assembly linked to: ${PATH_OUTPUT}/final.contigs.fasta"
elif [ -f "${PATH_OUTPUT}/assembly.fasta" ]; then # Fallback for some Canu versions/settings
    ln -s "${PATH_OUTPUT}/assembly.fasta" "${PATH_OUTPUT}/final.contigs.fasta"
    echo "Canu final assembly linked to: ${PATH_OUTPUT}/final.contigs.fasta"
else
    echo "WARNING: Could not find a primary assembly file in ${PATH_OUTPUT}. Check Canu logs."
fi

# Canu creates many intermediate files. Consider if you want to clean them up.
# For now, no cleanup is explicitly added.