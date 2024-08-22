#!/bin/bash
## Assembler: Unicycler


if [ $# -ne 3 ]; then
  echo "Usage: $0 <forward_in> <reverse_in> <path_output>"
  exit 1
fi

forward_in=$1
reverse_in=$2
path_output=$3

unicycler -1 $forward_in -2 $reverse_in -o $path_output -t 24
