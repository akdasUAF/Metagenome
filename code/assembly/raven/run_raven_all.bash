

### lr-even
## Test 5
## 431697
sbatch code/assembly/raven/run_raven.batch \
    lr-even \
    data/raw/lr-even/test5/ \
    test5 \
    raven_bench_lr-even_run5
	









### lr-log
## Test 5
## 431701
sbatch code/assembly/raven/run_raven.batch \
    lr-log \
    data/raw/lr-log/test5/ \
    test5 \
    raven_bench_lr-log_run5
	
	# <-- IMPORTANT: This is the new argument for the read type.
       #    Use -s for PacBio HiFi, -x for Oxford Nanopore, -p for PacBio CLR.