#!/bin/bash

# --- Configuration ---
# Set the directory where your log_dool_*.csv files are located.
LOG_DIR="$HOME/Research/metagenome_results" 
# and you want to process all subdirectories, set LOG_DIR to the highest common parent.
# If files are in assembler/dataset subdirectories, you'll need to adjust the find command.

# Number of lines to remove from the top of each file
LINES_TO_SKIP=5

# --- Script Logic ---

echo "Starting log file cleaning process in: $LOG_DIR"
echo "Will remove the first $LINES_TO_SKIP lines from each file."

# Use find to locate all log_dool_*.csv files recursively
# The -print0 and xargs -0 are used for safely handling filenames with spaces or special characters
find "$LOG_DIR" -type f -name "log_dool_*.csv" -print0 | while IFS= read -r -d $'\0' file; do
    # Get the directory of the current file
    file_dir=$(dirname "$file")
    # Get the base filename (e.g., log_dool_flye_lr-even.csv)
    filename=$(basename "$file")

    # Construct the output filename (e.g., log_dool_flye_lr-even_clean.csv)
    output_filename="${filename%.csv}_clean.csv"
    output_path="${file_dir}/${output_filename}"

    echo "Processing: $file"
    echo "Saving cleaned output to: $output_path"

    # Use tail to skip the first N lines and redirect output to the new clean file
    # The +N syntax for tail starts output from the Nth line.
    tail -n +$((LINES_TO_SKIP + 1)) "$file" > "$output_path"

    if [ $? -eq 0 ]; then
        echo "Successfully cleaned and saved: $output_path"
    else
        echo "ERROR: Failed to process $file"
    fi
    echo "---"
done

echo "Log file cleaning process complete."