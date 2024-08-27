#!/bin/env bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <raw_path> <path_output>"
  exit 1
fi

path_reads=$1
path_output=$2

echo $PWD

flye --meta --nano-raw $path_reads --out-dir $path_output --threads 24
