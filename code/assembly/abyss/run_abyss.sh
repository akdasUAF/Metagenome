#!/bin/env bash

# if [ $# -ne 7 ]; then
#   echo "Usage: $0 <forward_reads> <reverse_reads> <MAG_directory> <analysis_directory> <name_assembly> <kmer_size> <bloom_filter_size>"
#   exit 1
# fi

# forward_reads=$1
# reverse_reads=$2
# path_output="$3"
# path_log=$4
# name_assembly=$5
# kmer=$6
# bloom=$7


conda run -n asm_abyss code/assembly/abyss/abyss.sh


