

### lr-even

## Test 2
## 
sbatch code/assembly/raven/run_raven.batch \
    lr-even \
    data/raw/lr-even/test2/ \
    test2 \
    raven_bench_lr-even_run2

## Test 4
## 
sbatch code/assembly/raven/run_raven.batch \
    lr-even \
    data/raw/lr-even/test4/ \
    test4 \
    raven_bench_lr-even_run4


## Test 5
## 
sbatch code/assembly/raven/run_raven.batch \
    lr-even \
    data/raw/lr-even/test5/ \
    test5 \
    raven_bench_lr-even_run5
	









### lr-log

## Test 1
## 
sbatch code/assembly/raven/run_raven.batch \
    lr-log \
    data/raw/lr-log/test1/ \
    test1 \
    raven_bench_lr-log_run5

## Test 5
## 
sbatch code/assembly/raven/run_raven.batch \
    lr-log \
    data/raw/lr-log/test5/ \
    test5 \
    raven_bench_lr-log_run5







### lr-ms
## Test 1
sbatch code/assembly/raven/run_raven.batch \
    lr-ms \
    data/raw/lr-ms/test1/ \
    test1 \
    raven_bench_lr-ms_run1

## Test 5
## 
sbatch code/assembly/raven/run_raven.batch \
    lr-ms \
    data/raw/lr-ms/test5/ \
    test5 \
    raven_bench_lr-ms_run5
