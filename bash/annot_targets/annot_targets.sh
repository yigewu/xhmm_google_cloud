#!/bin/bash

gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_annot_targets.yaml --inputs exonTargets=gs://dinglab/yige/dependencies4xhmm/data/GRCh37.ensGene.coding.exon.interval_list,xcnvFile=gs://dinglab/yige/outputs4xhmm/discover_cnv/DATA.xcnv --outputs outputPath=gs://dinglab/yige/outputs4xhmm/annot_targets --logging gs://dinglab/yige/logs4xhmm/annot_targets --disk-size datadisk:20
