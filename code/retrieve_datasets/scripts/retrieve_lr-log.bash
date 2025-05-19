#!/bin/env bash
mkdir -p data/raw/lr-log/
wget -O data/raw/lr-log/Zymo-GridION-LOG-BB-SN.fq.gz https://nanopore.s3.climb.ac.uk/Zymo-GridION-LOG-BB-SN.fq.gz

cd data/raw/lr-log/
gunzip --keep Zymo-GridION-LOG-BB-SN.fq.gz
