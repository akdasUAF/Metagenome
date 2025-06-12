#!/bin/bash
mkdir -p data/raw/cami-marine_short/

wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_0_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_0_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_1_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_1_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_2_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_2_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_3_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_3_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_4_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_4_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_5_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_5_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_6_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_6_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_7_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_7_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_8_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_8_reads.tar.gz
wget -O ddata/raw/cami-marine_short/marmgCAMI2_sample_9_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/marine/short_read/marmgCAMI2_sample_9_reads.tar.gz

cd data/raw/cami-marine_short/

OUTPUT_DIR="data/raw/cami-marine_short"

echo "Starting extraction and renaming of .tar.gz files..."

for tar_file in "$OUTPUT_DIR"/marmgCAMI2_sample_*_reads.tar.gz; do
    if [ -e "$tar_file" ]; then # Check if the tar.gz file exists
        FILENAME=$(basename "$tar_file") # e.g., marmgCAMI2_sample_0_reads.tar.gz
        
        # Extract the sample number from the filename
        # Example: marmgCAMI2_sample_0_reads.tar.gz -> 0
        SAMPLE_NUMBER=$(echo "$FILENAME" | sed -E 's/marmgCAMI2_sample_([0-9]+)_reads.tar.gz/\1/')

        EXTRACT_TMP_DIR="${OUTPUT_DIR}/tmp_extract_${SAMPLE_NUMBER}" # Temporary directory for extraction
        mkdir -p "$EXTRACT_TMP_DIR"

        echo ""
        echo "--- Extracting ${FILENAME} to temporary directory ${EXTRACT_TMP_DIR} ---"
        tar -xzvf "$tar_file" -C "$EXTRACT_TMP_DIR" # -C option extracts to a specific directory

        if [ $? -eq 0 ]; then
            echo "Successfully extracted ${FILENAME}. Now renaming files..."

            # Find the extracted _1 and _2 fastq.gz files and rename them
            # This assumes a common pattern like *_1.fastq.gz and *_2.fastq.gz inside the tarball.
            # You might need to adjust the patterns below if the actual filenames are different.
            
            # Find the forward reads
            FORWARD_READS=$(find "$EXTRACT_TMP_DIR" -maxdepth 2 -name "*_1.fastq.gz" -o -name "*_R1.fastq.gz" | head -n 1) # Prioritize _1 then _R1
            
            # Find the reverse reads
            REVERSE_READS=$(find "$EXTRACT_TMP_DIR" -maxdepth 2 -name "*_2.fastq.gz" -o -name "*_R2.fastq.gz" | head -n 1) # Prioritize _2 then _R2

            if [ -n "$FORWARD_READS" ] && [ -n "$REVERSE_READS" ]; then
                NEW_FORWARD_NAME="${OUTPUT_DIR}/cami-marine_short_raw_${SAMPLE_NUMBER}_R1.fastq.gz"
                NEW_REVERSE_NAME="${OUTPUT_DIR}/cami-marine_short_raw_${SAMPLE_NUMBER}_R2.fastq.gz"

                mv "$FORWARD_READS" "$NEW_FORWARD_NAME"
                mv "$REVERSE_READS" "$NEW_REVERSE_NAME"

                if [ $? -eq 0 ]; then
                    echo "Renamed: ${FORWARD_READS} -> ${NEW_FORWARD_NAME}"
                    echo "Renamed: ${REVERSE_READS} -> ${NEW_REVERSE_NAME}"
                    # You might want to delete the original .tar.gz file after successful extraction and renaming:
                    # rm "$tar_file"
                else
                    echo "Error: Failed to rename files for sample ${SAMPLE_NUMBER}."
                fi
            else
                echo "Error: Could not find expected '_1.fastq.gz/_R1.fastq.gz' or '_2.fastq.gz/_R2.fastq.gz' files within ${FILENAME}."
                echo "Please check the contents of the .tar.gz file manually."
                # You can list the contents of a tar.gz without extracting to debug:
                # tar -tzvf "$tar_file"
            fi
            
            # Clean up the temporary extraction directory
            rm -rf "$EXTRACT_TMP_DIR"
            echo "Cleaned up temporary directory: ${EXTRACT_TMP_DIR}"

        else
            echo "Error: Failed to extract ${FILENAME}."
        fi
    else
        echo "Warning: ${tar_file} not found. Skipping extraction."
    fi
done

echo ""
echo "--- All .tar.gz files processed. ---"
echo "Your renamed fastq.gz files should now be directly in '$OUTPUT_DIR'."
