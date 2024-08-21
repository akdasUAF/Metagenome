#!/bin/bash

if [ $# -ne 5 ]; then
  echo "Usage: $0 <path_forward> <path_reverse> <forward_trimmed_path> <reverse_trimmed_path> <path_report>"
  exit 1
fi

path_forward=$1
path_reverse=$2
forward_trimmed_path=$3
reverse_trimmed_path=$4
path_report=$5



fastp -i $path_forward -I $path_reverse -o "$output_paired_1" -O "$output_paired_2" -h "$path_report" -q 20 -p 95 -l 30 -n 10

