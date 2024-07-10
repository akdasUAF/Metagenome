#!/bin/bash

### Install Dependencies
conda activate pro_fetch
conda install numpy

cd tools/
git clone https://github.com/bwinnett12/FETCH.git

conda deactivate pro_fetch
