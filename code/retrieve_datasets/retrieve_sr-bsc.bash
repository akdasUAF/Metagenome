
#!/bin/bash

## Sets working directory to the short read BSC metagenome
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX24330662%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads

# Store the current working directory
root_dir=$(pwd)

cd data/raw/sr-bsc
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/prefetch -db code/retrieve_datasets/sra_lists/sra-list_sr-bsc.txt



bash code/retrieve_datasets/scripts/retrieve_sra.bash 


${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR28765359


cd SRR28765359/
${root_dir}/tools/retrieval/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR28765359.sra
