#!/bin/bash


# copy input files for combining depth
while read l; do
	grep $l blood.list.uniqsampleID.barcode.b4Sep01 | cut -f3 | awk -v list="${l}" '{printf "gs://dinglab/yige/outputs4xhmm/depth_of_coverage/"list"/"$1".sample_interval_summary\n"}' | gsutil -m cp -I gs://dinglab/yige/outputs4xhmm/combine_depth/bloodin9401
done < list2examine.b4Sep01

cut -f 2,3 backup/blood.list.uniqsampleID.barcode.within.9401QCed > blood.uniqsampleID.barcode.b4Sep01

cat blood.uniqsampleID.barcode blood.uniqsampleID.barcode.b4Sep01 > blood.uniqsampleID.barcode.in9401

gsutil cp blood.uniqsampleID.barcode.in9401 gs://dinglab/yige/outputs4xhmm/combine_depth/bloodin9401/
