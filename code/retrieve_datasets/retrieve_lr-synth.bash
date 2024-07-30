
#!/bin/bash

## Sets working directory to the Long read Synthetic community folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/PRJNA903965
## This uses the SRA toolkit from NCBI to retrieve the reads


# Store the current working directory
root_dir=$(pwd)


mkdir -p data/raw/lr-synth
cd data/raw/lr-synth
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR22366767 --max-size=40G
cd SRR22366767/
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR22366767.sra
