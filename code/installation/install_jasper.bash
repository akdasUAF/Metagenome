#!/bin/bash

conda install bioconda::jasper biopython

mkdir -p tools/polishing/
cd tools/polishing/

wget https://github.com/alekseyzimin/JASPER_release/releases/download/v1.0.5/JASPER-1.0.5.tar.gz
tar -xvzf JASPER-1.0.5.tar.gz
cd JASPER-1.0.5/
./install.sh