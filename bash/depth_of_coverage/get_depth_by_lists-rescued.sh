#!/bin/bash


# input the name of the list when bash this

# submit the jobs by the list I feed in

# make the directory in gs
mkdir $1
touch hello
mv hello $1/
gsutil cp -r $1 gs://dinglab/yige/outputs4xhmm/depth_of_coverage
gsutil cp -r $1 gs://dinglab/yige/logs4xhmm/depth_of_coverage
rm -r $1

# submit jobs using files listed in the input list file
while read p; do
	echo $p | awk '{print $1}' > bam_barcode
	bam_link=$(echo $p | awk '{print $5}')
	bai_link=$bam_link.bai
	echo $bam_link | cut -d"/" -f 10 > bam_name
	size=$(echo $p | awk '{print $6}')
	if [[ $bam_link == *"legacy"* ]]; then
		echo $bam_link | cut -d"/" -f 11 > bam_name
	fi
	if [[ $(gsutil ls $bai_link) == "" ]]; then
		 bai_link=$(echo $bam_link | cut -d"/" -f 1-10)"/"$(cat bam_name | awk -F ".bam" '{print $1}').bai
	fi
	gcloud alpha genomics pipelines run --pipeline-file /home/yigewu2012/xhmm/stacks/xhmm_get_depth.yaml --inputs bamFile=$bam_link,baiFile=$bai_link,exonTargets=gs://dinglab/yige/dependencies4xhmm/data/GRCh37.ensGene.coding.exon.interval_list,refFasta=gs://dinglab/reference/GRCh37-lite.fa,refIndex=gs://dinglab/reference/GRCh37-lite.fa.fai,refDict=gs://dinglab/reference/GRCh37-lite.dict --inputs-from-file bamList=bam_name,bamBarcode=bam_barcode --outputs outputPath=gs://dinglab/yige/outputs4xhmm/depth_of_coverage/$1 --logging gs://dinglab/yige/logs4xhmm/depth_of_coverage/$1 --disk-size datadisk:$(($size/1073741824 + 20))
	rm bam_name
	rm bam_barcode
done < list2submit/$1
