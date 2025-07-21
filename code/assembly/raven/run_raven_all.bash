

### lr-even
## Test 5
## 
sbatch code/assembly/raven/run_raven.batch \
    lr-even \
    data/raw/lr-even/test5/ \
    test5 \
    raven_bench_lr-even_run5 \
    -x
	
	
	# <-- IMPORTANT: This is the new argument for the read type.
       #    Use -s for PacBio HiFi, -x for Oxford Nanopore, -p for PacBio CLR.