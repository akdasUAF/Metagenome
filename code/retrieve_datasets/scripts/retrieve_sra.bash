#!/bin/bash

# Store the current working directory
root_dir=$(pwd)

if [ $# -ne 2 ]; then
  echo "Usage: $0 <filename> <output_directory>"
  exit 1
fi

filename="$1"
path_output="$2"

cd "$path_output"

mkdir -p forward/
mkdir -p reverse/

forward=forward/
reverse=reverse/


${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd


while IFS= read -r line; do
  ${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/prefetch "$line"
  ${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump "$line"/"$line".sra -O "$line"/
  ## Fasterq dump
  
  mv "$line"/*_1.fastq "$forward"/
  mv "$line"_2.fastq "$reverse"/

done < "$root_dir"/"$filename"

