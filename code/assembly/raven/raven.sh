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

# Define a temporary log file for Raven's internal stderr
RAVEN_INTERNAL_LOG="${path_output}/raven_internal.log"

# *** ADD THIS LINE FOR DEBUGGING ***
echo "DEBUG: Raven command will be:"
echo "raven \"${raven_read_args[@]}\" --threads 24 --graph-output \"$path_output/intermediate_graph\" > \"$path_output/final.contigs.fasta\" 2>\"${RAVEN_INTERNAL_LOG}\""
echo "*********************************"

# Construct the Raven command
# Raven outputs to stdout by default, so we redirect to a file.
# We also redirect stderr to a separate, temporary log file for robust capture.
raven "${raven_read_args[@]}" \
  --threads 24 \
  --graph-output "$path_output/intermediate_graph" \
  > "$path_output/final.contigs.fasta" \
  2> "${RAVEN_INTERNAL_LOG}" # <--- Redirect Raven's stderr to this specific file

# Check Raven's exit status. If it failed, print the internal log.
if [ $? -ne 0 ]; then
    echo "ERROR: Raven assembly failed. Check Raven's internal log for details:"
    cat "${RAVEN_INTERNAL_LOG}" # Print the content of the internal log
    exit 1 # Propagate the error
fi

# If Raven succeeded, you can optionally append the internal log to the main output or delete it
# For now, let's just make sure it exists for debugging a failure.

# Clean up the temporary log if desired after successful run
# rm -f "${RAVEN_INTERNAL_LOG}" # Uncomment this line if you want to delete the log on success