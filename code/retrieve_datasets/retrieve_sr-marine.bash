
#!/bin/bash

## Sets working directory to the Short Read Marine Sediment folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/?term=SRR341725
## This uses the SRA toolkit from NCBI to retrieve the reads


cd data/raw/sr-marine_sediment
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR27456520
cd SRR27456520/
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR27456520.sra

