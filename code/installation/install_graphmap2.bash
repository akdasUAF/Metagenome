#!/bin/env bash


cd tools/processing/ || mkdir -p tools/processing/ && cd tools/processing/ || return
git clone https://github.com/lbcb-sci/graphmap2.git 
cd graphmap2/ || exit
make modules  
make

echo 'Graphmap2 installed'
