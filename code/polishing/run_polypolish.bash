#!/bin/bash
#SBATCH --job-name=polypolish           # Job name
#SBATCH --partition=debug               # Partition name (e.g., debug, standard, highmem) - **Adjust this**
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks=1                      # Number of tasks
#SBATCH --cpus-per-task=24              # Number of CPU cores per task - **Adjust this based on available resources**
#SBATCH --mem=32G                       # Memory per node - **Adjust this based on your data size**
#SBATCH --error=slurm-polypolish_%j.err            # Standard error file
#SBATCH --output=slurm-polypolish_%j.out           # Standard output file

# --- Load necessary modules ---
# These commands load the software into your environment.
# If these modules aren't available on your HPC, you might need to
# adjust your PATH environment variable to point directly to the executables.
module load GCC/11.3.0
module load BWA/0.7.17
module load SAMtools/1.17

echo "--- Starting Polypolish Job ---"
echo "Job ID: ${SLURM_JOB_ID}"
echo "Run on host: $(hostname)"
echo "Start time: $(date)"

# --- Get Input Arguments ---
# These correspond to the arguments you pass to sbatch after the script name.
ASSEMBLY_FASTA="$1"       # Path to the assembly FASTA file
R1_INPUT_STRING="$2"      # Comma-separated list of R1 FASTQ files (can be .gz)
R2_INPUT_STRING="$3"      # Comma-separated list of R2 FASTQ files (can be .gz), or an empty string "" for single-end
OUTPUT_PREFIX="$4"        # Prefix for output files (e.g., megahit_sr-even_polypolished)

# --- Define Output and Temporary Directories ---
# All final polished assemblies will go into 'data/polished_polypolish'.
# Temporary alignment files will be stored in a sub-directory and cleaned up.
OUTPUT_BASE_DIR="data/polished_polypolish"
TEMP_DIR="${OUTPUT_BASE_DIR}/${OUTPUT_PREFIX}_temp"

# Create directories if they don't exist
mkdir -p "${OUTPUT_BASE_DIR}" "${TEMP_DIR}" || { echo "ERROR: Failed to create directories!"; exit 1; }

# Define full paths for output files
POLISHED_ASSEMBLY_OUT="${OUTPUT_BASE_DIR}/${OUTPUT_PREFIX}_polished.fasta"
ALIGNED_SAM="${TEMP_DIR}/${OUTPUT_PREFIX}.sam"
ALIGNED_BAM="${TEMP_DIR}/${OUTPUT_PREFIX}.bam"
SORTED_BAM="${TEMP_DIR}/${OUTPUT_PREFIX}.sorted.bam"
# SAMtools automatically adds .bai extension for index

# --- Prepare Read Files for BWA ---
# BWA 'mem' command expects space-separated file paths for multiple input files.
R1_FILES_BWA_ARGS=$(echo "${R1_INPUT_STRING}" | tr ',' ' ')
R2_FILES_BWA_ARGS=$(echo "${R2_INPUT_STRING}" | tr ',' ' ')

# Determine if single-end or paired-end for BWA command
BWA_READ_ARGS=""
if [ -z "${R2_INPUT_STRING}" ]; then # If R2 string is empty, treat as single-end
    BWA_READ_ARGS="${R1_FILES_BWA_ARGS}"