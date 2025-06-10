#!/bin/bash

# Script to investigate metaSPAdes assembly output using QUAST and BUSCO

# --- Usage and Input Validation ---
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
  echo "Usage: $0 <metaspades_output_directory> [busco_lineage_dataset]"
  echo "  <metaspades_output_directory>: Path to your metaSPAdes output folder (e.g., data/my_metaspades_assembly)"
  echo "                                 This directory should contain 'contigs.fasta' or 'scaffolds.fasta'."
  echo "  [busco_lineage_dataset]:      Optional. The BUSCO lineage dataset to use (e.g., bacteria_odb10, eukaryota_odb10, viridiplantae_odb10)."
  echo "                                If provided, BUSCO will run. You might need to set your BUSCO_DATA_PATH."
  exit 1
fi

METASPADES_DIR="$1"
BUSCO_LINEAGE="$2" # Optional argument for BUSCO

# --- Define Assembly Files ---
# QUAST and BUSCO can take either contigs.fasta or scaffolds.fasta.
# We'll prioritize scaffolds.fasta if it exists, otherwise use contigs.fasta.
ASSEMBLY_FILE=""
if [ -f "${METASPADES_DIR}/scaffolds.fasta" ]; then
  ASSEMBLY_FILE="${METASPADES_DIR}/scaffolds.fasta"
  ASSEMBLY_TYPE="scaffolds"
elif [ -f "${METASPADES_DIR}/contigs.fasta" ]; then
  ASSEMBLY_FILE="${METASPADES_DIR}/contigs.fasta"
  ASSEMBLY_TYPE="contigs"
else
  echo "ERROR: Neither 'contigs.fasta' nor 'scaffolds.fasta' found in '${METASPADES_DIR}'."
  echo "Please ensure the specified directory is a valid metaSPAdes output folder."
  exit 1
fi

# --- Define Output Directory for Quality Reports ---
# All reports will be saved here
QC_REPORT_DIR="${METASPADES_DIR}/assembly_qc_reports/"
mkdir -p "$QC_REPORT_DIR"

echo "---------------------------------------------------"
echo "Investigating metaSPAdes assembly: ${ASSEMBLY_FILE}"
echo "All quality reports will be saved in: ${QC_REPORT_DIR}"
echo "---------------------------------------------------"

# --- 1. Run QUAST ---
echo "Starting QUAST analysis..."
QUAST_OUTPUT_DIR="${QC_REPORT_DIR}/quast_results/"
mkdir -p "$QUAST_OUTPUT_DIR"

# --min-contig 500 is a common value to filter out very short contigs (noise)
# If you have a reference genome, add: --reference /path/to/your/reference.fasta

conda run -n ana_quast quast | tee $path_log
quast.py "$ASSEMBLY_FILE" -o "$QUAST_OUTPUT_DIR" --min-contig 500

if [ $? -eq 0 ]; then
  echo "QUAST completed successfully. Report available:"
  echo "  HTML report: ${QUAST_OUTPUT_DIR}/report.html"
  echo "  Text report: ${QUAST_OUTPUT_DIR}/report.txt"
  echo "Open the HTML report in your web browser for easy viewing."
else
  echo "QUAST failed. Check logs in ${QUAST_OUTPUT_DIR}"
fi
echo "---------------------------------------------------"

# --- 2. Run BUSCO (Optional) ---
if [ -n "$BUSCO_LINEAGE" ]; then # Check if a BUSCO lineage was provided
  echo "Starting BUSCO analysis with lineage: ${BUSCO_LINEAGE}..."
  BUSCO_OUTPUT_DIR="${QC_REPORT_DIR}/busco_results_${BUSCO_LINEAGE}/"
  mkdir -p "$BUSCO_OUTPUT_DIR"

  # Important for BUSCO:
  # - If BUSCO_DATA_PATH is set in your environment, BUSCO will use pre-downloaded datasets.
  # - If not, BUSCO will attempt to download the dataset to a default location (usually ~/.cache/busco).
  # - '-m genome' specifies assembly mode for a genome/metagenome.
  # - '-c $(nproc)' uses all available CPU cores. Replace $(nproc) with a specific number if needed.
  # - '--offline' is recommended if you have BUSCO_DATA_PATH set for consistency.
  busco -i "$ASSEMBLY_FILE" -o "$BUSCO_OUTPUT_DIR" -l "$BUSCO_LINEAGE" -m genome -c "$(nproc)"

  if [ $? -eq 0 ]; then
    echo "BUSCO completed successfully. Summary report:"
    echo "  ${BUSCO_OUTPUT_DIR}/short_summary.txt"
  else
    echo "BUSCO failed. Check logs in ${BUSCO_OUTPUT_DIR}"
  fi
  echo "---------------------------------------------------"
else
  echo "BUSCO skipped. No lineage dataset provided."
  echo "To run BUSCO, rerun the script and provide a lineage dataset (e.g., bacteria_odb10)."
fi

echo "Assembly investigation complete. Check the generated reports in '${QC_REPORT_DIR}'."