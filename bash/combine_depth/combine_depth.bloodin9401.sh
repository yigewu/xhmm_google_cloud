#!/bin/bash

# make the output and log directories in gs if haven't done so

# make the sample ID to map

# pass the file to the pipeline
gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_combine_depth.bloodin9401.500.yaml --inputs normalDepth=gs://dinglab/yige/outputs4xhmm/combine_depth/bloodin9401/**,inputFilename=gs://dinglab/yige/outputs4xhmm/combine_depth/bloodin9401/barcodes500/** --outputs outputPath=gs://dinglab/yige/outputs4xhmm/combine_depth --logging gs://dinglab/yige/logs4xhmm/combine_depth --disk-size datadisk:250
