#!/bin/bash

# record sample ID in coverage file with bam barcode because the sample ID might be different from TCGA barcode
touch blood.sampleID.barcode.patch1

while read l; do

	cat /home/yigewu2012/xhmm/pipelines/depth_of_coverage7887/list2combine/$l | cut -f 1,2 -d " " | awk '{print $1,$2,$2}' | cut -d"-" -f 1,2,3,4,5,6,7,8,9,10,11,14 | awk -F "TCGA-" '{print $1"TCGA-"$2,$3}' > barcodes.tmp

	cat barcodes.tmp | grep '\s10[A-Z]' | cut -f 1 -d" "> blood.barcodes.tmp

	while read b; do
		gsutil -m cp gs://dinglab/yige/outputs4xhmm/depth_of_coverage/$l/$b.sample_interval_summary .
		head -1 $b.sample_interval_summary | cut -f 4 | awk -F "_total_cvg" '{print $1}' | awk -v barcode="${b}" '{printf $1"\t"barcode"\n"}' | awk -v list="${l}" '{printf list"\t"$1"\t"$2"\n"}' >> blood.sampleID.barcode.patch1
		rm $b.sample_interval_summary
	done < blood.barcodes.tmp

done < list2examine.patch1

rm barcodes.tmp
rm blood.barcodes.tmp

# remove depth for duplicate cases
cat blood.sampleID.barcode.patch1 | awk '{print $1"\t"$2"\t"$3"\t"$2}' | sort -k2 | uniq -f 3 | cut -f 1,2,3 > blood.list.uniqsampleID.barcode.patch1

# copy input files for combining depth
while read l; do
	grep $l blood.list.uniqsampleID.barcode.patch1 | cut -f3 | awk -v list="${l}" '{printf "gs://dinglab/yige/outputs4xhmm/depth_of_coverage/"list"/"$1".sample_interval_summary\n"}' | gsutil -m cp -I gs://dinglab/yige/outputs4xhmm/combine_depth/bloodin9401
done < list2examine.patch1

cut -f 2,3 blood.list.uniqsampleID.barcode.patch1 > blood.uniqsampleID.barcode.patch1

cat blood.uniqsampleID.barcode.in9401 blood.uniqsampleID.barcode.patch1 > blood.uniqsampleID.barcode.in9401.patched1

gsutil cp blood.uniqsampleID.barcode.in9401.patched1 gs://dinglab/yige/outputs4xhmm/combine_depth/bloodin9401/
