#!/bin/bash

gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_gc_targets.yaml --inputs exonTargets=gs://dinglab/yige/dependencies4xhmm/data/GRCh37.ensGene.coding.exon.interval_list,refFasta=gs://dinglab/reference/GRCh37-lite.fa,refIndex=gs://dinglab/reference/GRCh37-lite.fa.fai,refDict=gs://dinglab/reference/GRCh37-lite.dict --outputs outputPath=gs://dinglab/yige/outputs4xhmm/targets2filter --logging gs://dinglab/yige/logs4xhmm/targets2filter --disk-size datadisk:20
