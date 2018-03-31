#!/bin/bash

gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_filter_and_center.yaml --inputs RDtxt=gs://dinglab/yige/outputs4xhmm/combine_depth/DATA.RD.txt,GCtargets=gs://dinglab/yige/outputs4xhmm/targets2filter/extreme_gc_targets.txt,RMtargets=gs://dinglab/yige/outputs4xhmm/targets2filter/low_complexity_targets.txt --outputs outputPath=gs://dinglab/yige/outputs4xhmm/filter_and_center2 --logging gs://dinglab/yige/logs4xhmm/filter_and_center --disk-size datadisk:200

