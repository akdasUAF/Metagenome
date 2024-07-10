
#!/bin/bash

## Sets working directory to the Long read marine folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX22826990%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads

conda activate sra_toolkit

mkdir -p data/raw/lr-marine_sediment
cd data/raw/lr-marine_sediment/
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR27145287
cd SRR27145287/
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR27145287.sra
