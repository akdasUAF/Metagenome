#!/bin/bash

### Install Dependencies
conda install pkg-config matplotlib gcc_linux-64 python-matplotlib

mkdir -p tools/analysis/
cd tools/analysis/ || exit
git clone https://github.com/ablab/quast.git

cd quast/ || exit
./setup.py install_full