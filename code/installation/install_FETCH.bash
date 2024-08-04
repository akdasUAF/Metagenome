#!/bin/bash

### Install Dependencies
conda install numpy

cd tools/retrieval || mkdir -p tools/retrieval/ && cd tools/retrieval || return
git clone -b contained https://github.com/bwinnett12/FETCH.git
cd FETCH/ || exit
python3 setup.py install --user
