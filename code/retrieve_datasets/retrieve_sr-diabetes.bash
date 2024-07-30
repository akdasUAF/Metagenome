
#!/bin/bash

## Sets working directory to the Short read Gut Diabetes folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## This uses the SRA toolkit from NCBI to retrieve the reads

# Store the current working directory
root_dir=$(pwd)

mkdir -p data/raw/sr-diabetes
cd data/raw/sr-diabetes
${root_dir}/tools/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
${root_dir}/tools/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR341725
cd SRR341725/
${root_dir}/tools/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR341725.sra
