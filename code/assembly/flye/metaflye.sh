#!/bin/env bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_path> <MAG_path> <log_path>"
  exit 1
fi

path_reads=$1
path_output=$2
path_log=$3

echo $PWD

flye --meta --nano-raw $path_reads --out-dir $path_output --threads 24 2>&1 | tee "${path_log}"
