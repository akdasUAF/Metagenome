#!/bin/env bash

if [ $# -ne 4 ]; then
  echo "Usage: $0 <raw_reads> <output_directory> <genomeSize> <name>"
  exit 1
fi

raw_reads=$1
output_directory=$2
genomeSize=$3
name=$4

./tools/assemblers/canu-2.2/bin/canu -p $name -d $output_directory genomeSize=$genomeSize -nanopore $raw_reads useGrid=false stopOnLowCoverage=5
