#!/bin/bash

### Install Dependencies
conda activate asm_busco
conda install -c conda-forge -c bioconda busco=5.7.1
conda deactivate asm_abyss