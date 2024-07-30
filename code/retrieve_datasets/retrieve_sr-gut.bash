#!/bin/bash

## Sets working directory to the Short Read Gut metagenome folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622874%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads

# Store the current working directory
root_dir=$(pwd)

mkdir -p data/raw/sr-gut
cd data/raw/sr-gut
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR18491254
cd SRR18491254/
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR18491254.sra
