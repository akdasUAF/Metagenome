#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <raw_directory> <analysis_directory>"
  exit 1
fi

raw_dir="$1"
path_analysis="$2"
fastqc_output="$path_analysis"/fastqc

mkdir -p "$fastqc_output"

for file in "$raw_dir"forward/*_1.fastq; do
  base_name=$(basename "$file" _1.fastq)
  output_dir="$fastqc_output/$base_name"
  mkdir -p "$output_dir"

  fastqc "$file" -o "$output_dir"
done

for file in "$raw_dir"reverse/*_2.fastq; do
  base_name=$(basename "$file" _2.fastq)
  output_dir="$fastqc_output/$base_name"
  mkdir -p "$output_dir"

  fastqc "$file" -o "$output_dir"
done
