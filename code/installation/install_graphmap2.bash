#!/bin/env bash


cd tools/processing/ || mkdir -p tools/processing/ && cd tools/processing/ || return
git clone https://github.com/lbcb-sci/graphmap2.git 
cd dool/ || exit
python3 ./install.py

echo 'Dool installed'

git clone  
cd graphmap2
make modules  
make  
