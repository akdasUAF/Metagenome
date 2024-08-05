#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 input_file output_file"
  exit 1
fi

input_file="$1"
output_file="$2"

awk '/^S/{header=">"$2; for(i=4; i<=NF; i++) {header=header" "$i}; print header; printf "%s", $3 | "fold -w 80"; close("fold -w 80"); print ""}' "$input_file" > "$output_file"

