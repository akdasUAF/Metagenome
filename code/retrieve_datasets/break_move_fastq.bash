#!/bin/bash

directory="/path/to/my/data"
command="python my_script.py"


for subdir in "$directory"/*; do
  if [ -d "$subdir" ]; then
    cd "$subdir"
    ~/metagenome_replicates/full_dataset/Metagenome/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR*.sra
	mv *_1.fastq ../forward/
	mv *_2.fastq ../reverse/
    cd ..
  fi
done


mv "$line"/*_1.fastq "$forward"/