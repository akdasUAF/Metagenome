
path_contigs=$1
path_output=$2
path_log=$3


sbatch code/analysis/busco/run_busco.batch \
    data/megahit/sr-even/test1/final.contigs.fa \
	results/megahit/sr-even/test1/busco/ \
	results/megahit/sr-even/test1/busco.log