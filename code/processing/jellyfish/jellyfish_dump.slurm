#!/bin/bash
#SBATCH --partition=t1standard
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
####SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_jellyfish"
#SBATCH --output=data/logs/jellyfish_sr-bmock.log

jellyfish dump mer_counts.jf > mer_counts_dumps.fa