#!/bin/bash
## Assembler: megahit

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_directory> <MAG_directory> <analysis_directory>"
  exit 1
fi

path_reads=$1
path_output=$2
path_log=$3




./tools/assemblers/raven/build/bin/raven -t 24 data/raw/lr-bd/SRR22366767/SRR22366767.fastq > data/MAG/lr-bd/raven/assembly_raven_lr-ecoli.fasta 2> data/analysis/lr-bd/log_assemble_raven_lr-ecoli.log
