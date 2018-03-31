#!/bin/bash

gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_discover_cnv.yaml --inputs zScore.filtered.RD=gs://dinglab/yige/outputs4xhmm/zScore_center/DATA.PCA_normalized.filtered.sample_zscores.RD.txt,same.filtered.RD=gs://dinglab/yige/outputs4xhmm/same_filter/DATA.same_filtered.RD.txt --outputs outputPath=gs://dinglab/yige/outputs4xhmm/discover_cnv --logging gs://dinglab/yige/logs4xhmm/discover_cnv --disk-size datadisk:200
