#!/bin/bash
#SBATCH --partition=t1standard
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
#####SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_abyss_sr-bsc"
#SBATCH --output=data/analysis/abyss/log_slurm_abyss_sr-bsc.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
/usr/bin/time -v bash -c "source code/assembly/abyss/run_scripts/run_abyss_sr-bsc.sh" 2>&1 | tee -a data/analysis/abyss/log_assemble_abyss_sr-bsc_slurm.log || echo 'Assembly failed : abyss sr-bsc'
