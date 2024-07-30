
#!/bin/bash

## Sets working directory to the Long read soil folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads

# Store the current working directory
root_dir=$(pwd)

mkdir -p data/raw/lr-soil
cd data/raw/lr-soil
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR21053856
cd SRR21053856/
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR21053856.sra