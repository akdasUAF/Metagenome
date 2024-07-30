#!/bin/bash
## Analyzer: kmergenie

conda install bioconda::kmergenie zlib r-base

wget -O tools/analysis/kmergenie-1.7051.tar.gz http://kmergenie.bx.psu.edu/kmergenie-1.7051.tar.gz
tar -xzvf tools/analysis/kmergenie-1.7051.tar.gz -C tools/analysis/

cd tools/analysis/kmergenie-1.7051/ || exit


