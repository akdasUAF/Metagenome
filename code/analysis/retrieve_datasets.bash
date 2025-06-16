#!/bin/bash

# Define the base paths
BASE_LOG_DIR="/home/wwinnett/metagenome_replicates/attempt2/Metagenome/data/logs"
BASE_RESULT_DIR="/home/wwinnett/metagenome_results"

# Define the datasets and their associated assemblers
declare -A datasets
datasets["lr-even"]="raven flye canu"
datasets["lr-log"]="raven flye canu"
datasets["lr-ms"]="raven flye canu miniasm"
datasets["sr-even"]="megahit metaspades unicycler"
datasets["sr-log"]="megahit metaspades unicycler"
datasets["sr-ms"]="megahit metaspades"
datasets["cami-high"]="megahit"
datasets["cami-medium"]="megahit metaspades"
datasets["cami-low"]="megahit"

# Loop through each dataset
for dataset in "${!datasets[@]}"; do
    # Loop through each assembler associated with the current dataset
    for assembler in ${datasets[$dataset]}; do
        # Construct the source path
        SOURCE_FILE="${BASE_LOG_DIR}/${dataset}/${assembler}/log_dool_${assembler}_${dataset}.log"

        # Construct the destination directory (create if it doesn't exist)
        DEST_DIR="${BASE_RESULT_DIR}/${assembler}/${dataset}"
        mkdir -p "$DEST_DIR" # Ensure the destination directory exists

        # Construct the destination symlink path (with .csv extension)
        DEST_LINK="${DEST_DIR}/log_dool_${assembler}_${dataset}.csv"

        # Check if the source file actually exists before creating the link
        if [ -f "$SOURCE_FILE" ]; then
            # Create the symbolic link
            ln -s -f "$SOURCE_FILE" "$DEST_LINK"
            echo "Created link: $DEST_LINK -> $SOURCE_FILE"
        else
            echo "WARNING: Source file not found, skipping link: $SOURCE_FILE"
        fi
    done
done

echo "Symbolic link creation process complete."