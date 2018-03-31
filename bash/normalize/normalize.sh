#!/bin/bash

gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_normalize.yaml --inputs RDtxt=gs://dinglab/yige/outputs4xhmm/filter_and_center/DATA.filtered_centered.RD.txt,PCA.PC.txt=gs://dinglab/yige/outputs4xhmm/PCA/DATA.RD_PCA.PC.txt,PCA.PC_SD.txt=gs://dinglab/yige/outputs4xhmm/PCA/DATA.RD_PCA.PC_SD.txt,PCA.PC_LOADINGS.txt=gs://dinglab/yige/outputs4xhmm/PCA/DATA.RD_PCA.PC_LOADINGS.txt --outputs outputPath=gs://dinglab/yige/outputs4xhmm/normalize --logging gs://dinglab/yige/logs4xhmm/normalize --disk-size datadisk:200
