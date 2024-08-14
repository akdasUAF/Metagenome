#!/bin/bash
## Assembler: megahit

if [ $# -ne 3 ]; then
  echo "Usage: $0 <raw_path> <MAG_path> <log_path>"
  exit 1
fi

path_reads=$1
path_output=$2
path_log=$3


./tools/assemblers/raven/build/bin/raven -t 24 $path_reads > $path_output 2> $path_log
