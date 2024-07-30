#!/bin/bash

cd tools/analysis/ || mkdir -p tools/analysis/ && cd tools/analysis/ || return
git clone https://github.com/scottchiefbaker/dool.git
cd dool/ || exit
python3 ./install.py

echo 'Dool installed'