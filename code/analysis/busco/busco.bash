#!/bin/env bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_path> <MAG_path> <log_path>"
  exit 1
fi

path_contigs=$1
path_output=$2
path_log=$3

busco -m genome --auto-lineage-prok -c 24 -i $path_contigs -o $path_output | tee $path_log