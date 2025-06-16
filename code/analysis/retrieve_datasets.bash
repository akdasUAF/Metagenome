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
        # Construct the source path for log_dool
        SOURCE_FILE_DOOL="${BASE_LOG_DIR}/${dataset}/${assembler}/log_dool_${assembler}_${dataset}.log"

        # Construct the destination directory (create if it doesn't exist)
        DEST_DIR="${BASE_RESULT_DIR}/${assembler}/${dataset}"
        mkdir -p "$DEST_DIR" # Ensure the destination directory exists

        # Construct the destination symlink path for log_dool (with .csv extension)
        DEST_LINK_DOOL="${DEST_DIR}/log_dool_${assembler}_${dataset}.csv"

        # Check if the log_dool source file exists before creating the link
        if [ -f "$SOURCE_FILE_DOOL" ]; then
            # Create the symbolic link for log_dool (-f to force overwrite)
            ln -s -f "$SOURCE_FILE_DOOL" "$DEST_LINK_DOOL"
            echo "Created link: $DEST_LINK_DOOL -> $SOURCE_FILE_DOOL"
        else
            echo "WARNING: log_dool source file not found, skipping link: $SOURCE_FILE_DOOL"
        fi

        # Construct the source path for log_full
        SOURCE_FILE_FULL="${BASE_LOG_DIR}/${dataset}/${assembler}/log_full_${assembler}_${dataset}.log"

        # Construct the destination symlink path for log_full (keeping .log extension)
        DEST_LINK_FULL="${DEST_DIR}/log_full_${assembler}_${dataset}.log"

        # Check if the log_full source file exists before creating the link
        if [ -f "$SOURCE_FILE_FULL" ]; then
            # Create the symbolic link for log_full (-f to force overwrite)
            ln -s -f "$SOURCE_FILE_FULL" "$DEST_LINK_FULL"
            echo "Created link: $DEST_LINK_FULL -> $SOURCE_FILE_FULL"
        else
            echo "WARNING: log_full source file not found, skipping link: $SOURCE_FILE_FULL"
        fi

    done
done

echo "Symbolic link creation process complete."