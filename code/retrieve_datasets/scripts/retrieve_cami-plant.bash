#!/bin/bash

# Store the current working directory
root_dir=$(pwd)

## Make separate directories for each plant read type
mkdir -p data/raw/cami-plant/short/
mkdir -p data/raw/cami-plant/lr-nano/
mkdir -p data/raw/cami-plant/lr-pacbio/

# Get the short read plant reads
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_0_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_0_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_1_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_1_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_2_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_2_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_3_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_3_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_4_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_4_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_5_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_5_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_6_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_6_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_7_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_7_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_8_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_8_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_9_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_9_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_10_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_10_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_11_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_11_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_12_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_12_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_13_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_13_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_14_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_14_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_15_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_15_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_16_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_16_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_17_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_17_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_18_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_18_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_19_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_19_reads.tar.gz
wget -O data/raw/cami-plant/short/cami-plant-short_raw_rhimgCAMI2_sample_20_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_20_reads.tar.gz


# Get the Long read nanopore plant reads
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_0_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_0_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_1_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_1_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_2_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_2_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_3_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_3_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_4_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_4_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_5_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_5_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_6_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_6_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_7_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_7_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_8_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_8_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_9_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_9_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_10_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_10_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_11_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_11_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_12_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_12_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_13_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_13_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_14_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_14_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_15_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_15_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_16_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_16_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_17_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_17_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_18_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_18_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_19_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_19_reads.tar.gz
wget -O data/raw/cami-plant/lr-nano/cami-plant-lr-nano_raw_rhimgCAMI2_sample_20_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_nano/rhimgCAMI2_sample_20_reads.tar.gz


# Get the Long read pacbio plant reads
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_0_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_0_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_1_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_1_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_2_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_2_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_3_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_3_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_4_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_4_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_5_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_5_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_6_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_6_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_7_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_7_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_8_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_8_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_9_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_9_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_10_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_10_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_11_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_11_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_12_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_12_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_13_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_13_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_14_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_14_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_15_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_15_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_16_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_16_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_17_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_17_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_18_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_18_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_19_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_19_reads.tar.gz
wget -O data/raw/cami-plant/lr-pacbio/cami-plant-lr-pacbio_raw_rhimgCAMI2_sample_20_reads.tar.gz --show-progress --continue https://frl.publisso.de/data/frl:6425521/plant_associated/long_read_pacbio/rhimgCAMI2_sample_20_reads.tar.gz


#### Short Read Illumina
cd data/raw/cami-plant/short/
mkdir -p cleaned/sorted/
mkdir -p archives/

# Extracting each archive to cleaned folder
for archive_file in *.tar.gz; do
    echo "Extracting: $archive_file to archives/"
    tar -xzf "$archive_file" -C archives/
done


mkdir -p cleaned/sorted/

find archives/ -name "*.fq.gz" -print0 | \
while IFS= read -r -d $'\0' source_file; do
    path_suffix="${source_file#*sample_}"
    sample_num="${path_suffix%%/*}" 

    if [[ "$source_file" =~ (sample_[0-9]+) ]]; then
        sample_tag="${BASH_REMATCH[1]}" # e.g., "sample_001"
        sample_num="${sample_tag#sample_}" # Extracts "001"
    else
        echo "Warning: Could not extract sample number from path: $source_file. Skipping."
        continue
    fi

    # Get the original filename
    original_filename=$(basename "$source_file")

    # Construct the new destination filename
    destination_file="cleaned/sorted/cami-plant_short_raw_${sample_num}_${original_filename}"

    echo "Copying '$source_file' to '$destination_file'"
    cp "$source_file" "$destination_file"
done

cd ${root_dir}



#### Long read nanopore
cd data/raw/cami-plant/lr-nano/
mkdir -p cleaned/sorted/
mkdir -p archives/

# Extracting each archive to cleaned folder
for archive_file in rhimgCAMI2_sample_*.tar.gz; do
    echo "Extracting: $archive_file to archives/"
    tar -xzf "$archive_file" -C archives/
done


find archives/ -name "*.fq.gz" -print0 | \
while IFS= read -r -d $'\0' source_file; do
    path_suffix="${source_file#*sample_}"
    sample_num="${path_suffix%%/*}" 

    if [[ "$source_file" =~ (sample_[0-9]+) ]]; then
        sample_tag="${BASH_REMATCH[1]}" # "sample_001"
        sample_num="${sample_tag#sample_}" # Extracts "001"
    else
        echo "Warning: Could not extract sample number from path: $source_file. Skipping."
        continue
    fi

    # Get the original filename
    original_filename=$(basename "$source_file")

    # Construct the new destination filename
    destination_file="cleaned/sorted/cami-plant_short_raw_${sample_num}_${original_filename}"

    echo "Copying '$source_file' to '$destination_file'"
    cp "$source_file" "$destination_file"
done


cd ${root_dir}

#### Long read Pacbio
cd data/raw/cami-plant/lr-pacbio/
mkdir -p cleaned/sorted/
mkdir -p archives/

# Extracting each archive to cleaned foldede
for archive_file in rhimgCAMI2_sample_*.tar.gz; do
    echo "Extracting: $archive_file to archives/"
    tar -xzf "$archive_file" -C archives/
done


find archives/ -name "*.fq.gz" -print0 | \
while IFS= read -r -d $'\0' source_file; do
    path_suffix="${source_file#*sample_}"
    sample_num="${path_suffix%%/*}" 

    if [[ "$source_file" =~ (sample_[0-9]+) ]]; then
        sample_tag="${BASH_REMATCH[1]}" # e.g., "sample_001"
        sample_num="${sample_tag#sample_}" # Extracts "001"
    else
        echo "Warning: Could not extract sample number from path: $source_file. Skipping."
        continue # Skip to next file if sample number cannot be found
    fi

    # Get the original filename
    original_filename=$(basename "$source_file")

    # Construct the new destination filename
    destination_file="cleaned/sorted/cami-plant_short_raw_${sample_num}_${original_filename}"

    echo "Copying '$source_file' to '$destination_file'"
    cp "$source_file" "$destination_file"
done

cd ${root_dir}

