#!/bin/env bash

# Install Repo
mkdir -p tools/polishing/
cd tools/polishing/

git clone https://github.com/dominikstanojevic/herro.git

cd herro/

conda env create --file scripts/herro-env.yml

wget -O herro.sif https://zenodo.org/records/13802680/files/herro.sif?download=1
singularity build herro.sif herro-singularity.def