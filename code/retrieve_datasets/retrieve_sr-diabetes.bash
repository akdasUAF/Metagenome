
#!/bin/bash

## Sets working directory to the Short read Gut Diabetes folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## This uses the SRA toolkit from NCBI to retrieve the reads


conda activate sra_toolkit

mkdir -p data/raw/sr-diabetes
cd data/raw/sr-diabetes
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR341725
cd SRR341725/
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR341725.sra
