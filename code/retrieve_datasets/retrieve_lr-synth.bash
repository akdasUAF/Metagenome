
#!/bin/bash

## Sets working directory to the Long read Synthetic community folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/PRJNA903965
## This uses the SRA toolkit from NCBI to retrieve the reads

mkdir -p data/raw/lr-synth
cd data/raw/lr-synth
~/Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~/Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR22366767
cd SRR22366767/
~/Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR22366767.sra
