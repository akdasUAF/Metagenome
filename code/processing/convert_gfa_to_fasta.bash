#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 input_file output_file"
  exit 1
fi

input_file="$1"
output_file="$2"


awk '
/^S/{
  seq_id = $2
  next
}
/^L/{
  if (seq_id) {
    printf ">%s\n%s\n", seq_id, $9
    seq_id = ""
  }
}' "$input_file" > "$output_file"
