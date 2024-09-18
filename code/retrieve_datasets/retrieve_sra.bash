#!/bin/bash

# Store the current working directory
root_dir=$(pwd)

if [ $# -ne 2 ]; then
  echo "Usage: $0 <filename> <output_directory>"
  exit 1
fi

filename=$1
path_output=$2

mkdir -p $path_output
## Gets into dataset path
cd $path_output

## Makes folders for each set of reads
mkdir -p forward/
mkdir -p reverse/
forward=forward/
reverse=reverse/


## current working directory to prefetch location
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd

## Loops through each 
while IFS= read -r line; do

  ## Fetches each line
  ${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/prefetch $line
  cd ${line}/
  ${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump *.fastq


done < "$root_dir"/"$filename"

## Separates readse

## Moves reads into forward and reverse
mv */*_1.fastq "$forward"/
mv */*_2.fastq "$reverse"/
