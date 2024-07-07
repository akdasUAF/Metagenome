
#!/bin/bash

## Sets working directory to the Long read marine folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX22826990%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads

cd data/raw/lr-marine_sediment/
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR27145287
cd SRR27145287/
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR27145287.sra
