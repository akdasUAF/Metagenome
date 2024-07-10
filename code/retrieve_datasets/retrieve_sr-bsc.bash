
#!/bin/bash

## Sets working directory to the short read BSC metagenome
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX24330662%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads


mkdir -p data/raw/sr-bsc/
cd data/raw/sr-bsc
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR28765359
cd SRR28765359/
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR28765359.sra
