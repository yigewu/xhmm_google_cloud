#!/bin/bash

# copy input files for combining depth
while read l; do
	gsutil ls gs://dinglab/yige/outputs4xhmm/depth_of_coverage/$l/*.sample_interval_summary | gsutil -m cp -I gs://dinglab/yige/outputs4xhmm/combine_depth/bloodin9401
done < list2examine.rescued

