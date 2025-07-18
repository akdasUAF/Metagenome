#!/bin/bash
#SBATCH --job-name=polypolish           # Job name
#SBATCH --partition=t1small               # Partition name (e.g., debug, standard, highmem) - **Adjust this**
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks=1                      # Number of tasks
#SBATCH --cpus-per-task=24              # Number of CPU cores per task - **Adjust this based on available resources**
#SBATCH --mem=32G                       # Memory per node - **Adjust this based on your data size**
#SBATCH --error=slurm-polypolish_%j.err            # Standard error file - Changed from %j.err to polypolish_%j.err
#SBATCH --output=slurm-polypolish_%j.out           # Standard output file - Changed from %j.out to polypolish_%j.out

# --- Load necessary modules ---
module load GCC/11.3.0
module load BWA/0.7.17
module load SAMtools/1.17

echo "--- Starting Polypolish Job ---"
echo "Job ID: ${SLURM_JOB_ID}"
echo "Run on host: $(hostname)"
echo "Start time: $(date)"

# --- Get Input Arguments ---
ASSEMBLY_FASTA="$1"
R1_INPUT_STRING="$2"
R2_INPUT_STRING="$3"
OUTPUT_PREFIX="$4"

# --- Define Output and Temporary Directories ---
OUTPUT_BASE_DIR="data/polished_polypolish"
TEMP_DIR="${OUTPUT_BASE_DIR}/${OUTPUT_PREFIX}_temp"

mkdir -p "${OUTPUT_BASE_DIR}" "${TEMP_DIR}" || { echo "ERROR: Failed to create directories! Exiting."; exit 1; }

# Define full paths for output files
POLISHED_ASSEMBLY_OUT="${OUTPUT_BASE_DIR}/${OUTPUT_PREFIX}_polished.fasta"
ALIGNED_R1_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}_R1.sam"
ALIGNED_R2_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}_R2.sam"
FILTERED_R1_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}_R1_filtered.sam"
FILTERED_R2_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}_R2_filtered.sam"

# --- Prepare Read Files for BWA (handles multiple input files by concatenation) ---
CONCATENATED_R1_FASTQ=""
CONCATENATED_R2_FASTQ=""

# Check for R1 files needing concatenation
if [[ "${R1_INPUT_STRING}" == *","* ]]; then
    echo "$(date): Multiple R1 files detected. Concatenating into a single temporary file..."
    # Convert comma-separated string to space-separated arguments for cat
    R1_FILES_TO_CAT=$(echo "${R1_INPUT_STRING}" | tr ',' ' ')
    CONCATENATED_R1_FASTQ="${TEMP_DIR}/${OUTPUT_PREFIX}_R1_concatenated.fastq"
    cat ${R1_FILES_TO_CAT} > "${CONCATENATED_R1_FASTQ}" || { echo "$(date): ERROR: Failed to concatenate R1 files!"; exit 1; }
    echo "$(date): R1 files concatenated to: ${CONCATENATED_R1_FASTQ}"
else
    # Only one R1 file, use it directly
    CONCATENATED_R1_FASTQ="${R1_INPUT_STRING}"
fi

# Check for R2 files needing concatenation (only if R2 string is not empty)
if [ -n "${R2_INPUT_STRING}" ]; then
    if [[ "${R2_INPUT_STRING}" == *","* ]]; then
        echo "$(date): Multiple R2 files detected. Concatenating into a single temporary file..."
        R2_FILES_TO_CAT=$(echo "${R2_INPUT_STRING}" | tr ',' ' ')
        CONCATENATED_R2_FASTQ="${TEMP_DIR}/${OUTPUT_PREFIX}_R2_concatenated.fastq"
        cat ${R2_FILES_TO_CAT} > "${CONCATENATED_R2_FASTQ}" || { echo "$(date): ERROR: Failed to concatenate R2 files!"; exit 1; }
        echo "$(date): R2 files concatenated to: ${CONCATENATED_R2_FASTQ}"
    else
        # Only one R2 file, use it directly
        CONCATENATED_R2_FASTQ="${R2_INPUT_STRING}"
    fi
fi

# Determine BWA read arguments based on concatenated/single files
# BWA 'mem' expects exactly two (for PE) or one (for SE) file path arguments.
# We will use the concatenated files (or the original single file if no concatenation occurred).
# The variables CONCATENATED_R1_FASTQ and CONCATENATED_R2_FASTQ now hold the SINGLE path to use.


echo "--- Input Parameters ---"
echo "Assembly FASTA: ${ASSEMBLY_FASTA}"
echo "R1 Reads (Original Input): ${R1_INPUT_STRING}"
echo "R2 Reads (Original Input): ${R2_INPUT_STRING:-None (Single-End)}"
echo "Processed R1 for BWA: ${CONCATENATED_R1_FASTQ}"
echo "Processed R2 for BWA: ${CONCATENATED_R2_FASTQ:-None (Single-End)}" # Displays 'None (Single-End)' if empty
echo "Output Prefix: ${OUTPUT_PREFIX}"
echo "Polished Assembly Output: ${POLISHED_ASSEMBLY_OUT}"
echo "Temporary files will be in: ${TEMP_DIR}"
echo "------------------------"

# --- Step 1: BWA Index Assembly ---
echo "$(date): Step 1/5 - Indexing assembly with BWA..."
bwa index "${ASSEMBLY_FASTA}" || { echo "$(date): ERROR: BWA indexing failed for ${ASSEMBLY_FASTA}!"; exit 1; }
echo "$(date): BWA indexing complete."

# --- Step 2: BWA Align Short Reads (separate for R1 and R2) ---
echo "$(date): Step 2/5 - Aligning R1 reads to assembly with BWA MEM..."
# Pass the single (possibly concatenated) R1 file to BWA
bwa mem -t "${SLURM_CPUS_PER_TASK}" -a "${ASSEMBLY_FASTA}" "${CONCATENATED_R1_FASTQ}" > "${ALIGNED_R1_SAM}" || \
    { echo "$(date): ERROR: BWA alignment for R1 failed!"; exit 1; }
echo "$(date): R1 alignment complete. Output SAM: ${ALIGNED_R1_SAM}"

# Only run R2 alignment if R2 files are provided (paired-end scenario)
if [ -n "${R2_INPUT_STRING}" ]; then
    echo "$(date): Step 2.5/5 - Aligning R2 reads to assembly with BWA MEM..."
    # Pass the single (possibly concatenated) R2 file to BWA
    bwa mem -t "${SLURM_CPUS_PER_TASK}" -a "${ASSEMBLY_FASTA}" "${CONCATENATED_R2_FASTQ}" > "${ALIGNED_R2_SAM}" || \
        { echo "$(date): ERROR: BWA alignment for R2 failed!"; exit 1; }
    echo "$(date): R2 alignment complete. Output SAM: ${ALIGNED_R2_SAM}"
fi

# --- Step 3: Polypolish Filter (only for paired-end) ---
POLISH_SAM_INPUTS=""
if [ -n "${R2_INPUT_STRING}" ]; then # If R2 string is NOT empty, it's paired-end, so run filter
    echo "$(date): Step 3/5 - Running Polypolish filter for paired-end alignments..."
    ./tools/polishing/Polypolish/target/release/polypolish filter \
        --in1 "${ALIGNED_R1_SAM}" \
        --in2 "${ALIGNED_R2_SAM}" \
        --out1 "${FILTERED_R1_SAM}" \
        --out2 "${FILTERED_R2_SAM}" || \
        { echo "$(date): ERROR: Polypolish filter failed!"; exit 1; }
    echo "$(date): Polypolish filter complete. Filtered SAMs: ${FILTERED_R1_SAM}, ${FILTERED_R2_SAM}"
    POLISH_SAM_INPUTS="${FILTERED_R1_SAM} ${FILTERED_R2_SAM}"
else # Single-end reads, skip filter and use raw R1 SAM directly
    echo "$(date): Step 3/5 - Skipping Polypolish filter (single-end reads detected)."
    POLISH_SAM_INPUTS="${ALIGNED_R1_SAM}"
fi

# --- Step 4: Run Polypolish Polish ---
echo "$(date): Step 4/5 - Running Polypolish polish..."
# FIXED: Placed the error handling block on the same line to prevent syntax errors.
tools/polishing/Polypolish/target/release/polypolish polish "${ASSEMBLY_FASTA}" ${POLISH_SAM_INPUTS} > "${POLISHED_ASSEMBLY_OUT}" || { echo "$(date): ERROR: Polypolish polish failed!"; exit 1; }
echo "$(date): Polypolish polish complete. Polished assembly saved to: ${POLISHED_ASSEMBLY_OUT}"

# --- Step 5: Clean up temporary files ---
echo "$(date): Step 5/5 - Cleaning up temporary files..."

# Remove BWA index files (generated in the same directory as the assembly FASTA)
BWA_INDEX_PREFIX_FOR_CLEANUP=$(basename "${ASSEMBLY_FASTA}")
BWA_INDEX_DIR_FOR_CLEANUP=$(dirname "${ASSEMBLY_FASTA}")

rm -f "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.amb" \
      "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.ann" \
      "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.bwt" \
      "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.pac" \
      "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.sa" || \
      { echo "$(date): WARNING: Could not remove all BWA index files in ${BWA_INDEX_DIR_FOR_CLEANUP}."; }

# Remove concatenated FASTQ files if they were created (important cleanup!)
if [ -f "${CONCATENATED_R1_FASTQ}" ] && [[ "${R1_INPUT_STRING}" == *","* ]]; then
    rm -f "${CONCATENATED_R1_FASTQ}" || { echo "$(date): WARNING: Could not remove concatenated R1 file ${CONCATENATED_R1_FASTQ}."; }
fi
if [ -f "${CONCATENATED_R2_FASTQ}" ] && [[ "${R2_INPUT_STRING}" == *","* ]]; then
    rm -f "${CONCATENATED_R2_FASTQ}" || { echo "$(date): WARNING: Could not remove concatenated R2 file ${CONCATENATED_R2_FASTQ}."; }
fi

# Remove the temporary directory and all its contents (SAM/BAM files, etc.)
rm -rf "${TEMP_DIR}" || { echo "$(date): WARNING: Failed to clean up temporary directory ${TEMP_DIR}. Manual removal may be needed."; }

echo "$(date): All Polypolish steps for ${OUTPUT_PREFIX} completed successfully."
echo "End time: $(date)"