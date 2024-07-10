
#!/bin/bash

## Sets working directory to the Long read soil folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX17069014%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads

conda activate sra_toolkit

mkdir -p data/raw/lr-soil
cd data/raw/lr-soil
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR21053856
cd SRR21053856/
~Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR21053856.sra

conda deactivate sra_toolkit