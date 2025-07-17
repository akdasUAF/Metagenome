#!/bin/bash

#SBATCH --job-name=MetaQuast_Conda   # A name for your job (changed to reflect Conda)
#SBATCH --partition=t1small           # Specify the partition/queue you want to use (e.g., debug, standard, highmem)
#SBATCH --nodes=1                    # Request 1 node
#SBATCH --ntasks-per-node=1          # Request 1 task per node (your script runs as a single process)
#SBATCH --cpus-per-task=24           # Request 24 CPUs (cores) for your task
#SBATCH --mem=64G                    # Request 64GB of memory. Adjust based on your expected memory usage.
#SBATCH --error=metaquast_%j.err     # Standard error file (will be named metaquast_JOBID.err)
#SBATCH --output=metaquast_%j.out    # Standard output file (will be named metaquast_JOBID.out)
#SBATCH --mail-type=END,FAIL         # Email notifications for job completion or failure
#SBATCH --mail-user=your_email@example.com # Replace with your actual email address

# --- Conda Environment Setup ---
# Define the name of your Conda environment
CONDA_ENV_NAME="ana_metaquast" # <--- IMPORTANT: Replace with the actual name of your Conda environment

# Path to your Miniconda/Anaconda installation if not in default PATH
# If `conda` command is not found, uncomment and adjust this line.
# export PATH="/path/to/your/miniconda3/bin:$PATH"

# Initialize Conda for the current shell session
# This is crucial for `conda activate` to work in a non-interactive script.
# Option 1: eval "$(conda shell.bash hook)" (Recommended for modern Conda)
eval "$(conda shell.bash hook)"
# Option 2: source your conda.sh (Alternative, if Option 1 doesn't work or for older Conda)
# source /path/to/your/miniconda3/etc/profile.d/conda.sh # <--- Adjust this path if needed

# Activate the Conda environment
conda activate "$CONDA_ENV_NAME" || { echo "Error: Failed to activate Conda environment '$CONDA_ENV_NAME'. Exiting."; exit 1; }

# --- End Conda Environment Setup ---


# Define variables for input arguments
# When submitting the job, you will provide these as arguments to sbatch:
# sbatch your_slurm_script.sh <contigs_path> <output_path> <reference_list_file>
path_contigs=$1
path_output=$2
reference_list_file=$3 # This will now be the path to your text file

# Check if the correct number of arguments are provided
if [ $# -ne 3 ]; then
  echo "Usage: sbatch $0 <contigs_path> <output_path> <reference_list_file>"
  exit 1
fi

# Construct the reference string for MetaQuast
reference_args=""
if [ -f "$reference_list_file" ]; then
    while IFS= read -r line; do
        trimmed_line=$(echo "$line" | xargs)
        if [ -n "$trimmed_line" ]; then
            reference_args+=" -r $trimmed_line"
        fi
    done < "$reference_list_file"
else
    echo "Error: Reference list file '$reference_list_file' not found."
    exit 1
fi

# Check if any references were actually found
if [ -z "$reference_args" ]; then
    echo "Error: No valid reference paths found in '$reference_list_file'."
    exit 1
fi


echo "Starting MetaQuast analysis..."
echo "Conda environment activated: $(conda env list | grep '*' | awk '{print $1}')"
echo "Contigs path: $path_contigs"
echo "Output path: $path_output"
echo "Reference list file: $reference_list_file"
echo "References to be used: $reference_args"
echo "Running on host: $(hostname)"
echo "Current directory: $(pwd)"
echo "SLURM Job ID: $SLURM_JOB_ID"

# Execute the MetaQuast command
# The python3 command will now point to the one inside your activated Conda environment
eval "python3 tools/analysis/quast/metaquast.py -t 24 -o \"$path_output\" \"$path_contigs\" --glimmer $reference_args"

# Deactivate the Conda environment (optional, but good practice if you don't need it later in the script)
conda deactivate

echo "MetaQuast analysis completed!"