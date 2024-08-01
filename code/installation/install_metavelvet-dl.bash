#!/bin/bash

conda install tensorflow keras numpy

mkdir -p tools/assembly/metavelvet-dl/ && cd tools/assembly/metavelvet-dl/ || exit

wget http://metavelvet.dna.bio.keio.ac.jp/srcSL/LearningModelFeatures.tar.gz
wget http://metavelvet.dna.bio.keio.ac.jp/srcSL/MetaVelvetSLv1.0.tar.gz

tar zxvf MataVelvetSL-v1.0.tgz

cd MetaVelvetSL-v1.0
make ['MAXKMERLENGTH = 31'] ['CATEGORIES = cat']

