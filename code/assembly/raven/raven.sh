#!/bin/bash
## Assembler: Raven

# The last argument is the path_output
path_output="${!#}"

# All arguments except the last one are the read arguments for raven
# (e.g., /path/to/reads.fastq.gz or "file1.fastq,file2.fastq")
raven_read_args=("${@:1:$#-1}")

if [ ${#raven_read_args[@]} -eq 0 ]; then
  echo "Usage: $0 <read_paths> <output_path>"
  echo "  <read_paths> should be the path(s) to your long-read FASTQ/FASTA file(s)."
  echo "  <output_path> is the directory where assembly results will be stored."
  exit 1
fi

# Define a temporary log file for Raven's internal stderr
RAVEN_INTERNAL_LOG="${path_output}/raven_internal.log"

# Define the path for the assembly graph output (using the correct flag -F)
RAVEN_GRAPH_OUTPUT="${path_output}/assembly.gfa" # Raven's help indicates GFA format for -F

# --- DEBUGGING COMMAND ECHO (RETAINED FOR CLARITY IF YOU NEED IT) ---
# This block prints the exact Raven command that will be executed.
# It's useful for debugging but can be removed once successful.
echo "DEBUG: Raven command will be:"
echo "raven \"${raven_read_args[@]}\" --threads 24 -F \"${RAVEN_GRAPH_OUTPUT}\" > \"$path_output/final.contigs.fasta\" 2>\"${RAVEN_INTERNAL_LOG}\""
echo "******************************************************************"
# ---------------------------------------------------------------------

# Construct and execute the Raven command
# Raven outputs contigs to stdout by default, so we redirect to 'final.contigs.fasta'.
# Its detailed progress/errors are often on stderr, which we redirect to 'raven_internal.log'.
raven "${raven_read_args[@]}" \
  --threads 24 \
  -F "${RAVEN_GRAPH_OUTPUT}" \
  > "$path_output/final.contigs.fasta" \
  2> "${RAVEN_INTERNAL_LOG}"

# Check Raven's exit status.
if [ $? -ne 0 ]; then
    echo "ERROR: Raven assembly failed. Check Raven's internal log for details:"
    # Print the content of the internal log to the main Slurm log for easier debugging
    cat "${RAVEN_INTERNAL_LOG}"
    exit 1 # Propagate the error status
fi

# If Raven succeeded, you can clean up the temporary internal log if you don't need it
# For now, it's safer to leave it for review unless disk space is extremely tight.
# rm -f "${RAVEN_INTERNAL_LOG}"