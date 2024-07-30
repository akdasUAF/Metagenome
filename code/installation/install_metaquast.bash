#!/bin/bash

### Install Dependencies
conda install pkg-config matplotlib gcc_linux-64 python-matplotlib


cd tools/analysis/ || exit
git clone https://github.com/ablab/quast.git

