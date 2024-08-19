#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <path_contigs> <path_log_file>"
  exit 1
fi

path_contigs=$1
path_log=$2

bash_to_run="code/analysis/assembly-stats/assembly-stats.sh $path_contigs $path_log"
echo "Running: ${bash_to_run}........"

conda run -n ana_assembly-stats bash $bash_to_run


