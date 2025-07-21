###### lr-log


### Test 4
## 
sbatch code/assembly/canu/run_canu.batch \
    lr-even \
    data/raw/lr-even/test4/ \
    test4 \
    canu_bench_lr-even_run4 \
    42m \
    -nanopore


### Test 5
## 
sbatch code/assembly/canu/run_canu.batch \
    lr-even \
    data/raw/lr-even/test5/ \
    test5 \
    canu_bench_lr-even_run5 \
    42m \
    -nanopore


###### lr-log
### Test 5
## 4431731
sbatch code/assembly/canu/run_canu.batch \
    lr-log \
    data/raw/lr-log/test5/ \
    test5 \
    canu_bench_lr-log_run5 \
    42m \
    -nanopore


##### lr-ms
### Test 5
## 
sbatch code/assembly/canu/run_canu.batch \
    lr-ms \
    data/raw/lr-ms/test5/ \
    test5 \
    canu_bench_lr-ms_run5 \
    37m \
    -nanopore