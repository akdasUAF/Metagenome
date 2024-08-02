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
#SBATCH --job-name="panmeta_asm_flye_lr-synth_bio"
#SBATCH --output=data/analysis/flye/lr-synth/log_slurm_flye_lr-synth_%j.log
#SBATCH --error=data/analysis/flye/lr-synth/log_slurm_flye_lr-synth_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

eval "$(conda shell.bash hook)"
/usr/bin/time -v bash -c "source code/assembly/flye/run_scripts/run_flye_lr-synth.sh" 2>&1 | tee -a data/analysis/flye/log_assemble_flye_lr-synth_slurm.log || echo 'Assembly failed : flye lr-synth'
