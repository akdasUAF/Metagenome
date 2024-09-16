#!/bin/env bash
mkdir -p data/lr-log/raw/
wget -O data/lr-log/raw/Zymo-GridION-LOG-BB-SN.fq.gz https://nanopore.s3.climb.ac.uk/Zymo-GridION-LOG-BB-SN.fq.gz

cd data/lr-log/raw/
gunzip --keep Zymo-GridION-LOG-BB-SN.fq.gz