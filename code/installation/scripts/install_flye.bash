#!/bin/bash

### Install Dependencies

cd tools/assemblers/
git clone https://github.com/fenderglass/Flye
cd Flye
python3 setup.py install --user