#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 input_file output_file"
  exit 1
fi

input_file="$1"
output_file="$2"

awk '/^>/ {printf ">%s\n", $2} /^$/ {printf "\n"} /^@/{printf "@%s\n", $2} /^+/ {printf "+%s\n", $3} /[^>@]/ {printf "%s", $0}' "$input_file" > "$output_file"

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
