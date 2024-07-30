#!/bin/bash

### Install Dependencies

cd tools/assemblers/ || exit
git clone https://github.com/fenderglass/Flye
cd Flye || exit
python3 setup.py install --user
