#!/bin/bash

# make the output and log directories in gs if haven't done so
mkdir blood
touch hello
mv hello blood
gsutil mv ./blood gs://dinglab/yige/outputs4xhmm/combine_depth/
rm -r blood

# record sample ID in coverage file with bam barcode because the sample ID might be different from TCGA barcode
echo -e 'list\tfromID\ttoID' > blood.sampleID.barcode

while read l; do

	cat /home/yigewu2012/xhmm/pipelines/depth_of_coverage/list2combine/$l | cut -f 1,2 -d " " | awk '{print $1,$2,$2}' | cut -d"-" -f 1,2,3,4,5,6,7,8,9,10,11,14 | awk -F "TCGA-" '{print $1"TCGA-"$2,$3}' > barcodes.tmp

	cat barcodes.tmp | grep '\s10[A-Z]' | cut -f 1 -d" "> blood.barcodes.tmp

	while read b; do
		gsutil -m cp gs://dinglab/yige/outputs4xhmm/depth_of_coverage/$l/$b.sample_interval_summary .
		head -1 $b.sample_interval_summary | cut -f 4 | awk -F "_total_cvg" '{print $1}' | awk -v barcode="${b}" '{printf $1"\t"barcode"\n"}' | awk -v list="${l}" '{printf list"\t"$1"\t"$2"\n"}' >> blood.sampleID.barcode
		rm $b.sample_interval_summary
	done < blood.barcodes.tmp

done < list2examine

rm barcodes.tmp
rm blood.barcodes.tmp

# remove depth for duplicate cases
echo -e 'list\tfromID\ttoID' > blood.list.uniqsampleID.barcode
cat blood.sampleID.barcode | awk '{print $1"\t"$2"\t"$3"\t"$2}' | sort -k2 | uniq -f 3 | cut -f 1,2,3 | grep -v "fromID"  >> blood.list.uniqsampleID.barcode

# copy input files for combining depth
while read l; do
	grep $l blood.list.uniqsampleID.barcode | cut -f3 | awk -v list="${l}" '{printf "gs://dinglab/yige/outputs4xhmm/depth_of_coverage/"list"/"$1".sample_interval_summary\n"}' | gsutil -m cp -I gs://dinglab/yige/outputs4xhmm/combine_depth/blood
done < list2examine

cut -f 2,3 blood.list.uniqsampleID.barcode > blood.uniqsampleID.barcode

gsutil cp blood.uniqsampleID.barcode gs://dinglab/yige/outputs4xhmm/combine_depth/blood/
