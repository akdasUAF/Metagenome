#!/bin/bash

cd tools/assemblers/

git clone https://github.com/rrwick/Unicycler.git
cd Unicycler
python3 setup.py install --user


conda install conda-forge::libgcc-ng python=3.12