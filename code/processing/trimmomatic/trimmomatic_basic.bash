#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <raw_directory> <analysis_directory>"
  exit 1
fi

raw_path=$1
out_path=$2

mkdir -p "$out_path""trimmed/"

for read_id in $(ls "$raw_path"forward/*.fastq | cut -d '/' -f 5 | cut -d '_' -f 1); do
  forward_file="$raw_path""forward/${read_id}_1.fastq"
  reverse_file="$raw_path""/reverse/${read_id}_2.fastq"
  output_prefix="$out_path""trimmed/sr-bsc_trimmed_${read_id}"
  output_paired_1="${output_prefix}_1.fastq"
  output_paired_2="${output_prefix}_2.fastq"

  trimmomatic PE -threads 24 "$forward_file" "$reverse_file" "$output_paired_1" "$output_paired_1.unpaired" "$output_paired_2" "$output_paired_2.unpaired" LEADING:5 TRAILING:5 SLIDINGWINDOW:4:15 MINLEN:36 ILLUMINACLIP:data/reference/adapters/TruSeq3-PE-2.fa:2:30:10
done
