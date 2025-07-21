sbatch code/assembly/metaspades/run_metaspades.batch \
    sr-even \
    data/raw/sr-even/raw/test1/ \
    metaspades_assembly_run1 \
    metaspades_bench_sr-even_run1

sbatch code/assembly/metaspades/run_metaspades.batch \
    SRR18488969 \
    data/raw/sr-log/raw/test2/ \
    metaspades_assembly_SRR18488969 \
    metaspades_bench_SRR18488969_test2