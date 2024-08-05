#!/bin/bash

### Install Dependencies
mkdir -p tools/processing/ 
cd tools/processing/ || exit

git clone https://github.com/vgl-hub/gfastats.git --recursive

cd gfastats/ || exit
make -j
