#!/bin/bash
#SBATCH --job-name=polypolish           # Job name
#SBATCH --partition=debug               # Partition name (e.g., debug, standard, highmem) - **Adjust this**
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks=1                      # Number of tasks
#SBATCH --cpus-per-task=24              # Number of CPU cores per task - **Adjust this based on available resources**
#SBATCH --mem=32G                       # Memory per node - **Adjust this based on your data size**
#SBATCH --error=slurm-polypolish_%j.err            # Standard error file - Changed from %j.err to polypolish_%j.err
#SBATCH --output=slurm-polypolish_%j.out           # Standard output file - Changed from %j.out to polypolish_%j.out

# --- Load necessary modules ---
# IMPORTANT: These are the correct module load commands based on your 'module spider' output.
module load GCC/11.3.0
module load BWA/0.7.17
module load SAMtools/1.17
# Note: 'polypolish' is assumed to be in your PATH or specified by its full path below.
# If you built it yourself in '~/Polypolish/target/release/polypolish',
# you'll use './target/release/polypolish' or the full path.

echo "--- Starting Polypolish Job ---"
echo "Job ID: ${SLURM_JOB_ID}"
echo "Run on host: $(hostname)"
echo "Start time: $(date)"

# --- Get Input Arguments ---
# These correspond to the arguments you pass to sbatch after the script name.
ASSEMBLY_FASTA="$1"       # Path to the assembly FASTA file (e.g., data/megahit/sr-even/final.contigs.fa)
R1_INPUT_STRING="$2"      # Comma-separated list of R1 FASTQ files (can be .gz)
R2_INPUT_STRING="$3"      # Comma-separated list of R2 FASTQ files (can be .gz), or an empty string "" for single-end
OUTPUT_PREFIX="$4"        # Prefix for output files (e.g., megahit_sr-even_polypolished)

# --- Define Output and Temporary Directories ---
# All final polished assemblies will go into 'data/polished_polypolish'.
# Temporary alignment files will be stored in a sub-directory and cleaned up.
OUTPUT_BASE_DIR="data/polished_polypolish"
TEMP_DIR="${OUTPUT_BASE_DIR}/${OUTPUT_PREFIX}_temp"

# Create directories if they don't exist
mkdir -p "${OUTPUT_BASE_DIR}" "${TEMP_DIR}" || { echo "ERROR: Failed to create directories! Exiting."; exit 1; }

# Define full paths for output files
POLISHED_ASSEMBLY_OUT="${OUTPUT_BASE_DIR}/${OUTPUT_PREFIX}_polished.fasta"
ALIGNED_R1_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}_R1.sam"
ALIGNED_R2_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}_R2.sam"
FILTERED_R1_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}_R1_filtered.sam"
FILTERED_R2_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}_R2_filtered.sam"

# --- Prepare Read Files for BWA ---
# BWA 'mem' command expects space-separated file paths for multiple input files.
R1_FILES_BWA_ARGS=$(echo "${R1_INPUT_STRING}" | tr ',' ' ')
R2_FILES_BWA_ARGS=$(echo "${R2_INPUT_STRING}" | tr ',' ' ')

echo "--- Input Parameters ---"
echo "Assembly FASTA: ${ASSEMBLY_FASTA}"
echo "R1 Reads: ${R1_INPUT_STRING}"
echo "R2 Reads: ${R2_INPUT_STRING:-None (Single-End)}"
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
bwa mem -t "${SLURM_CPUS_PER_TASK}" -a "${ASSEMBLY_FASTA}" ${R1_FILES_BWA_ARGS} > "${ALIGNED_R1_SAM}" || \
    { echo "$(date): ERROR: BWA alignment for R1 failed!"; exit 1; }
echo "$(date): R1 alignment complete. Output SAM: ${ALIGNED_R1_SAM}"

# Only run R2 alignment if R2 files are provided (paired-end scenario)
if [ -n "${R2_INPUT_STRING}" ]; then
    echo "$(date): Step 2.5/5 - Aligning R2 reads to assembly with BWA MEM..."
    bwa mem -t "${SLURM_CPUS_PER_TASK}" -a "${ASSEMBLY_FASTA}" ${R2_FILES_BWA_ARGS} > "${ALIGNED_R2_SAM}" || \
        { echo "$(date): ERROR: BWA alignment for R2 failed!"; exit 1; }
    echo "$(date): R2 alignment complete. Output SAM: ${ALIGNED_R2_SAM}"
fi # <--- This 'fi' closes the 'if' block. It must be present!

# --- Step 3: Polypolish Filter (only for paired-end) ---
POLISH_SAM_INPUTS=""
if [ -n "${R2_INPUT_STRING}" ]; then # If R2 string is NOT empty, it's paired-end, so run filter
    echo "$(date): Step 3/5 - Running Polypolish filter for paired-end alignments..."
    # Assuming polypolish executable is in ./target/release/polypolish as per your -h output,
    # or modify to just 'polypolish' if it's in your PATH
    ./target/release/polypolish filter \
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
# The 'POLISH_SAM_INPUTS' variable dynamically holds either one or two SAM files.
./target/release/polypolish polish "${ASSEMBLY_FASTA}" ${POLISH_SAM_INPUTS} > "${POLISHED_ASSEMBLY_OUT}" || \
    { echo "$(date): ERROR: Polypolish polish failed!"; exit 1; }
echo "$(date): Polypolish polish complete. Polished assembly saved to: ${POLISHED_ASSEMBLY_OUT}"

# --- Step 5: Clean up temporary files ---
echo "$(date): Step 5/5 - Cleaning up temporary files..."

# Remove BWA index files (generated in the same directory as the assembly FASTA)
# Be careful: Ensure these are specifically the index files created by this run.
# The basename removes path, and %.* removes extension, giving the prefix BWA uses.
BWA_INDEX_PREFIX_FOR_CLEANUP=$(basename "${ASSEMBLY_FASTA}")
BWA_INDEX_DIR_FOR_CLEANUP=$(dirname "${ASSEMBLY_FASTA}")

rm -f "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.amb" \
      "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.ann" \
      "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.bwt" \
      "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.pac" \
      "${BWA_INDEX_DIR_FOR_CLEANUP}/${BWA_INDEX_PREFIX_FOR_CLEANUP}.sa" || \
      { echo "$(date): WARNING: Could not remove all BWA index files in ${BWA_INDEX_DIR_FOR_CLEANUP}."; }

# Remove the temporary directory and all its contents (SAM/BAM files, etc.)
rm -rf "${TEMP_DIR}" || { echo "$(date): WARNING: Failed to clean up temporary directory ${TEMP_DIR}. Manual removal may be needed."; }

echo "$(date): All Polypolish steps for ${OUTPUT_PREFIX} completed successfully."
echo "End time: $(date)"