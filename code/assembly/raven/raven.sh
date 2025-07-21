#!/bin/bash
## Assembler: Raven

# The last argument is the path_output
path_output="${!#}"

# All arguments except the last one are the read arguments for raven (e.g., -s /path/to/reads.fastq.gz)
raven_read_args=("${@:1:$#-1}")

if [ ${#raven_read_args[@]} -eq 0 ]; then
  echo "Usage: $0 <read_arguments_for_raven> <path_output>"
  echo "  <read_arguments_for_raven> should be the path(s) to your long-read FASTQ/FASTA file(s)."
  exit 1
fi

# Define a temporary log file for Raven's internal stderr
RAVEN_INTERNAL_LOG="${path_output}/raven_internal.log"

# Define the path for the assembly graph output (using the correct flag)
RAVEN_GRAPH_OUTPUT="${path_output}/assembly.gfa" # Raven's help says it's GFA format

# *** ADD THIS LINE FOR DEBUGGING ***
echo "DEBUG: Raven command will be:"
echo "raven \"${raven_read_args[@]}\" --threads 24 -F \"${RAVEN_GRAPH_OUTPUT}\" > \"$path_output/final.contigs.fasta\" 2>\"${RAVEN_INTERNAL_LOG}\""
echo "*********************************"

# Construct the Raven command
# Raven outputs to stdout by default, so we redirect to a file.
# We also redirect stderr to a separate, temporary log file for robust capture.
# Use -F for graphical fragment assembly (GFA output).
raven "${raven_read_args[@]}" \
  --threads 24 \
  -F "${RAVEN_GRAPH_OUTPUT}" \ # <--- CHANGED THIS FLAG
  > "$path_output/final.contigs.fasta" \
  2> "${RAVEN_INTERNAL_LOG}"

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