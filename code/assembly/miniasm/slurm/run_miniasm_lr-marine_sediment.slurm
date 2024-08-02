#!/bin/bash
#SBATCH --partition=bio
#SBATCH --ntasks=24
#SBATCH --tasks-per-node=24
#If running on the bio or analysis queue add:
#SBATCH --mem=214G
#SBATCH --mail-user=wwinnett@alaska.edu
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --job-name="panmeta_asm_miniasm_lr-marine_sediment_bio"
#SBATCH --output=data/analysis/miniasm/lr-marine_sediment/log_slurm_miniasm_lr-marine_sediment_%j.log
#SBATCH --error=data/analysis/miniasm/lr-marine_sediment/log_slurm_miniasm_lr-marine_sediment_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
/usr/bin/time -v bash -c "source code/assembly/miniasm/run_scripts/run_miniasm_lr-marine_sediment.sh" 2>&1 | tee -a data/analysis/miniasm/log_assemble_miniasm_lr-marine_sediment_slurm.log || echo 'Assembly failed : miniasm lr-marine_sediment'
