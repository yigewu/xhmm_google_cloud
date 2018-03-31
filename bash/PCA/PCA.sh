#!/bin/bash

gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_PCA.yaml --inputs RDtxt=gs://dinglab/yige/outputs4xhmm/filter_and_center/DATA.filtered_centered.RD.txt --outputs outputPath=gs://dinglab/yige/outputs4xhmm/PCA --logging gs://dinglab/yige/logs4xhmm/PCA --disk-size datadisk:200

