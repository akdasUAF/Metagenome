
#!/bin/bash

## Sets working directory to the short read BSC metagenome
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX24330662%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads


cd data/raw/sr-bsc
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR28765359
cd SRR28765359/
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR28765359.sra
