#!/bin/bash

### Install Dependencies
conda activate asm_abyss
conda install -c bioconda -c conda-forge abyss
conda deactivate asm_abyss