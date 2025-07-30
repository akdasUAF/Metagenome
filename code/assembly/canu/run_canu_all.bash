###### lr-even

### Test 1
## 
sbatch code/assembly/canu/run_canu.batch \
    lr-even \
    data/raw/lr-even/test1/ \
    test1 \
    canu_bench_lr-even_run1 \
    42m \
    -nanopore

### Test 2
## 
sbatch code/assembly/canu/run_canu.batch \
    lr-even \
    data/raw/lr-even/test2/ \
    test2 \
    canu_bench_lr-even_run2 \
    42m \
    -nanopore

### Test 3
## 
sbatch code/assembly/canu/run_canu.batch \
    lr-even \
    data/raw/lr-even/test3/ \
    test3 \
    canu_bench_lr-even_run3 \
    42m \
    -nanopore


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
### Test 1
## 
sbatch code/assembly/canu/run_canu.batch \
    lr-log \
    data/raw/lr-log/test1/ \
    test1 \
    canu_bench_lr-log_run1 \
    42m \
    -nanopore

### Test 2
## 
sbatch code/assembly/canu/run_canu.batch \
    lr-log \
    data/raw/lr-log/test2/ \
    test2 \
    canu_bench_lr-log_run2 \
    42m \
    -nanopore

### Test 5
## 
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