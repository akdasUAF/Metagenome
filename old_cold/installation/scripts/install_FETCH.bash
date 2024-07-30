#!/bin/bash

### Install Dependencies
conda install numpy

cd tools/
git clone -b contained https://github.com/bwinnett12/FETCH.git
cd FETCH/
python3 setup.py develop --user
