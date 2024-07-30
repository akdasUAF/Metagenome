#!/bin/bash

base_dir=$(pwd)

cd tools/retrieval || exit
wget --output-document sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -vxzf sratoolkit.tar.gz
export PATH=$PATH:$PWD/sratoolkit.3.1.1-ubuntu64/bin

cd $base_dir || exit


tools/sratoolkit.3.1.1-ubuntu64/
find ./tools/sratoolkit* -maxdepth 1 -type d -print | head -n 1 > code/retrieval/path_retrieval/sratoolkit || echo 'SRAtoolkit not installed'


