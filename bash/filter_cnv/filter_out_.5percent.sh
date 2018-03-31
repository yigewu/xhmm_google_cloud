#!/bin/bash

## all the CNVs called by XHMM
gsutil -m cp gs://dinglab/yige/outputs4xhmm/discover_cnv/DATA.aux_xcnv .

## sort each exon within each CNV
cat DATA.aux_xcnv | grep -v [DU][+-] | sort -k5 > DATA.sorted.aux_xcnv

## get the frequency of exons with CNV
cut -f 5 DATA.sorted.aux_xcnv | grep -v TARGET | sort | uniq -c > target_freq.txt

cat target_freq.txt | awk '$1>=10' | sort -k2 > target_common.txt

gsutil -m cp gs://dinglab/yige/outputs4xhmm/discover_cnv/DATA.xcnv .
cat DATA.xcnv | awk '$5!="X"&&$5!="Y"' > DATA.auto.xcnv

join -1 2 -2 5 target_common.txt DATA.sorted.aux_xcnv -o 2.1,2.3,2.5 > sample_overlap_common_targets
cut -f 1,2 -d" " sample_overlap_common_targets | sort | uniq -c | awk '{print $2":"$3,$1,$2,$3}' | sort -k1 > sample_overlap_common_targets_number

cat DATA.xcnv | awk '{print $1":"$3,$8}' | sort -k1 > xcnv.number.sorted
join -j 1 sample_overlap_common_targets_number xcnv.number.sorted -o 1.3,1.4,1.2,2.2,1.1 > sample_overlap_common_targets_number.txt
cat sample_overlap_common_targets_number.txt | awk '$3>($4/2)' | sort -k5 > common_cnv.txt

cat DATA.xcnv | awk '{print $1":"$3,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15}' | sort -k1 > DATA.xcnv.sorted

join -1 5 -2 1 common_cnv.txt DATA.xcnv.sorted -v 2 -o 2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,2.10,2.11,2.12,2.13,2.14,2.15,2.16 | awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15}' OFS="\t" > DATA.rare.xcnv

awk '$10>=60' DATA.rare.xcnv > DATA.rare.q60.xcnv

cat cnv_count_per_case.txt | awk '$1>44' | awk '{print $2}' > hyperCNV_samples
grep -f hyperCNV_samples -v DATA.rare.q60.xcnv | grep -v SAMPLE > DATA.rare.q60.rm3sdCNV.xcnv.tmp
head -1 DATA.xcnv > DATA.xcnv.head
cat DATA.xcnv.head DATA.rare.q60.rm3sdCNV.xcnv.tmp > DATA.rare.q60.rm3sdCNV.xcnv
rm DATA.rare.q60.rm3sdCNV.xcnv.tmp
