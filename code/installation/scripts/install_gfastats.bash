#!/bin/bash

### Install Dependencies
cd tools/processing/

git clone https://github.com/vgl-hub/gfastats.git --recursive

cd gfastats/
make -j