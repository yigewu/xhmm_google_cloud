#!/bin/bash

gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_repeat_masked_targets.yaml --inputs exonTargets=gs://dinglab/yige/dependencies4xhmm/data/GRCh37.ensGene.coding.exon.interval_list --outputs outputPath=gs://dinglab/yige/outputs4xhmm/targets2filter --logging gs://dinglab/yige/logs4xhmm/targets2filter --disk-size datadisk:20
