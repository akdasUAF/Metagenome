#!/bin/bash

## Sets working directory to the Long read Gut folder
## Uses this dataset: https://www.ncbi.nlm.nih.gov/sra/SRX14622818%5Baccn
## This uses the SRA toolkit from NCBI to retrieve the reads

cd data/raw/lr-gut
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/vdb-config --prefetch-to-cwd
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/prefetch SRR18491310
cd SRR18491310/
~/mailroom/sratoolkit.3.1.1-ubuntu64/bin/fasterq-dump SRR18491310.sra
