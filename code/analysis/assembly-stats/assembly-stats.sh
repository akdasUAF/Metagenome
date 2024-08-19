#!/bin/env bash


if [ $# -ne 2 ]; then
  echo "Usage: $0 <contigs_path> <log_path>"
  exit 1
fi

path_contigs=$1
path_log=$2

./tools/analysis/assembly-stats/build/assembly-stats $path_contigs | tee $path_log