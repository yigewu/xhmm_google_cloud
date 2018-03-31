#!/bin/bash

gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_zScore_center.yaml --inputs PCA_normalized.txt=gs://dinglab/yige/outputs4xhmm/normalize/DATA.PCA_normalized.txt --outputs outputPath=gs://dinglab/yige/outputs4xhmm/zScore_center --logging gs://dinglab/yige/logs4xhmm/zScore_center --disk-size datadisk:50
