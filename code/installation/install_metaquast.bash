#!/bin/bash

conda activate ana_metaquast

### Install Dependencies
conda install pkg-config matplotlib
conda install -c bioconda quast

conda deactivate ana_metaquast