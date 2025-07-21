#!/bin/bash
## Assembler: Raven

# The last argument is the path_output
path_output="${!#}"

# All arguments except the last one are the read arguments for raven (e.g., -s /path/to/reads.fastq.gz)
raven_read_args=("${@:1:$#-1}")

if [ ${#raven_read_args[@]} -eq 0 ]; then
  echo "Usage: $0 <read_arguments_for_raven> <path_output>"
  echo "  <read_arguments_for_raven> can be: -p <pacbio_clr_reads> OR -x <nanopore_reads> OR -s <pacbio_hifi_reads>"
  exit 1
fi

# *** ADD THIS LINE FOR DEBUGGING ***
echo "DEBUG: Raven command will be:"
echo "raven \"${raven_read_args[@]}\" --threads 24 --graph-output \"$path_output/intermediate_graph\" > \"$path_output/final.contigs.fasta\""
echo "*********************************"

# Construct the Raven command
# Raven outputs to stdout by default, so we redirect to a file.
# It also allows for graph output for debugging/visualization.
# Note: Raven uses --threads, not -t
raven "${raven_read_args[@]}" \
  --threads 24 \
  --graph-output "$path_output/intermediate_graph" \
  > "$path_output/final.contigs.fasta" \
  2>&1 # Redirect stderr to stdout as well