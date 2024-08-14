#!/bin/env bash

# if [ $# -ne 3 ]; then
#   echo "Usage: $0 <raw_directory> <MAG_out_dir> <path_log_file>"
#   exit 1
# fi

# path_raw=$1
# path_MAG=$2
# path_log_file=$3

bash_to_run="./tools/assemblers/raven/build/bin/raven -t 24 data/raw/lr-bd/SRR22366767/SRR22366767.fastq > data/MAG/lr-bd/raven/assembly_raven_lr-ecoli.fasta 2> data/analysis/lr-bd/log_assemble_raven_lr-ecoli.log"

echo "${bash_to_run}"

conda run -n asm_raven bash "${bash_to_run}"


