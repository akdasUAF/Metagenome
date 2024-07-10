
#!/bin/bash

## Sets working directory to the Short Read Marine Sediment folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## This uses the SRA toolkit from NCBI to retrieve the reads

mkdir -p data/raw/sr-marine_sediment
cd data/raw/sr-marine_sediment
~/Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~/Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR27456520
cd SRR27456520/
~/Metagenome/tools/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR27456520.sra

