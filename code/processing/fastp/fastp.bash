#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <trimmed_sequences_out_directory> <analysis_directory> <number of >"
  exit 1
fi

path_raw=$1
path_output=$2
path_analysis=$3


mkdir -p "$path_output""trimmed/"

for read_id in $(ls "$path_raw"forward/*.fastq | cut -d '/' -f 5 | cut -d '_' -f 1); do
  forward_file="$path_raw""forward/${read_id}_1.fastq"
  reverse_file="$path_raw""/reverse/${read_id}_2.fastq"
  output_prefix="$path_output""trimmed/sr-bsc_trimmed_${read_id}"
  output_paired_1="${output_prefix}_1.fastq.gz"
  output_paired_2="${output_prefix}_2.fastq.gz"
  output_report="${path_analysis}/${read_id}/fastp${read_id}_report.html"

  fastp -i "$forward_file" -I "$reverse_file" -o "$output_paired_1" -O "$output_paired_2" -h "$output_report" -q 20 -p 95 -l 30 -n 10
done

