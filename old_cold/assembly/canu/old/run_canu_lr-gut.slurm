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
#SBATCH --job-name="panmeta_asm_canu_lr-gut"


## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"

bash code/analysis/dool/start_dool.bash logs/analysis/dool/log_dool_canu_lr-gut.log
/usr/bin/time -v bash -c "source code/assembly/canu/run_canu_lr-gut.bash" 2>&1 | tee -a logs/assembly/log_assemble_canu_lr-gut.log || echo 'Assembly failed : canu lr-gut'
bash code/analysis/dool/kill_dool.bash


