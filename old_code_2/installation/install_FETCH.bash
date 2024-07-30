#!/bin/bash

### Install Dependencies
conda install numpy

## Get base directory
base_dir=$(pwd)

cd tools/retrieval || mkdir -p tools/retrieval/ && cd tools/retrieval || return
git clone -b contained https://github.com/bwinnett12/FETCH.git
cd FETCH/ || exit
python3 setup.py develop --user

cd "$base_dir" || exit

echo "python3 ./tools/retrieval/FETCH/FETCH.py" > code/retrieval/path_retriever/FETCH.txt || echo 'FETCH not installed'
