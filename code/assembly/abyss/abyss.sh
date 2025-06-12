#!/bin/bash
# Assembler: Abyss

# Ensure correct number of arguments are passed
if [ $# -ne 6 ]; then
  echo "Usage: $0 <forward_in> <reverse_in> <base_output_dir> <base_assembly_name> <kmer_size> <bloom_filter_size>"
  echo "Received $# arguments, expecting 6."
  exit 1
fi

forward_reads=$1
reverse_reads=$2
base_output_dir=$3
base_assembly_name=$4
kmer=$5
bloom=$6

# Construct the unique name for THIS k-mer specific assembly
current_assembly_name="${base_assembly_name}_k${kmer}"

# Construct the full path to the specific output directory for this k-mer run
# This ensures all intermediate and final files for this k-mer go here.
kmer_output_dir="${base_output_dir}/${current_assembly_name}"

# Create the k-mer specific output directory if it doesn't exist
mkdir -p "${kmer_output_dir}"

echo "--- Running ABySS for k-mer: $kmer ---"
echo "  Forward Reads: $forward_reads"
echo "  Reverse Reads: $reverse_reads"
echo "  Base Output Dir: $base_output_dir"
echo "  Specific K-mer Output Dir: $kmer_output_dir"
echo "  Assembly Name for ABySS: $current_assembly_name"
echo "  K-mer: $kmer"
echo "  Bloom Filter Size (B): $bloom"
echo "  Threads (j): 24" # Assuming j=24 is fixed from slurm script

# Navigate into the specific output directory before running abyss-pe.
# This ensures all intermediate files are created within this directory.
# ABySS's 'name' parameter also helps organize files within this dir.
# The 'out' parameter in abyss-pe defaults to the 'name' parameter for final contigs,
# so we don't need to explicitly set 'out' if we're in the correct directory.
pushd "${kmer_output_dir}" > /dev/null || { echo "ERROR: Could not change to directory ${kmer_output_dir}. Exiting."; exit 1; }

# Run abyss-pe
# The 'name' parameter will create subdirectories and files like 'my_metagenome_k77-contigs.fa'
# inside the current working directory ($kmer_output_dir).
abyss-pe k=$kmer name=$current_assembly_name B=$bloom j=24 \
  in="${forward_reads} ${reverse_reads}"

# Navigate back to the original directory
popd > /dev/null

echo "--- ABySS run for k-mer $kmer finished. ---"
echo "Final contigs for k=$kmer should be in: ${kmer_output_dir}/${current_assembly_name}-contigs.fa"