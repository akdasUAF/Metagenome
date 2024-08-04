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
#SBATCH --job-name="panmeta_quast_canu_lr-ecoli"
#SBATCH --output=data/analysis/canu/lr-ecoli/log_slurm_canu_lr-ecoli_%j.log
#SBATCH --error=data/analysis/canu/lr-ecoli/log_slurm_canu_lr-ecoli_err_%j.log

## Clean out any modules, then reload slurm
# Since conda will be used, no other modules will be loaded
module purge
module load slurm

ulimit -l unlimited

eval "$(conda shell.bash hook)"
/usr/bin/time -v bash -c "source code/analysis/metaquast/canu/run_scripts/run_quast_canu_lr-ecoli.sh" 2>&1 | tee -a data/analysis/canu/lr-ecoli/log_quast_canu_lr-ecoli_slurm.log || echo 'Quast failed : canu lr-ecoli'
