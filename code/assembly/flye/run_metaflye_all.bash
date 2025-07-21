###### Lr-even
## Test 5
## 431699
sbatch code/assembly/flye/run_metaflye.batch \
    lr-even \
    data/raw/lr-even/test5/ \
    test5 \
    metaflye_bench_lr-even_run5 \
    --nano-raw


###### Lr-log
## Test 5
## 431700
sbatch code/assembly/flye/run_metaflye.batch \
    lr-log \
    data/raw/lr-log/test5/ \
    test5 \
    metaflye_bench_lr-log_run5 \
    --nano-raw


###### lr-ms
## Test 5
## 431723
sbatch code/assembly/flye/run_metaflye.batch \
    lr-ms \
    data/raw/lr-ms/test5/ \
    test5 \
    metaflye_bench_lr-ms_run5 \
    --nano-raw