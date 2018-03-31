#!/bin/bash


gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_combine_depth.yaml --inputs normalDepth=gs://dinglab/yige/outputs4xhmm/combine_depth/bloodin9401/**,rescuedDepth=gs://dinglab/yige/outputs2xhmm/combine_depth/bloodin9401/*.sample_interval_summary,sampleList=gs://dinglab/isb-cgc/tcga/germline/release1.0/sample_list/pca_table.20171019.wclin.tsv --outputs outputPath=gs://dinglab/yige/outputs4xhmm/combine_depth --logging gs://dinglab/yige/logs4xhmm/combine_depth --disk-size datadisk:250
