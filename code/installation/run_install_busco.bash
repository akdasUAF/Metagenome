#!/bin/bash
## Analyzer: busco

conda run -n ana_busco bash code/installation/scripts/install_busco.bash | tee logs/installation/log_install_busco.log
