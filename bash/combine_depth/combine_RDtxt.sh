#!/bin/bash

mkdir RDtxt
touch DATA.RD.txt
c=0
while [ ${c} -le 7500 ] 
do
	c=`expr $c + 500`
	gsutil -m cp gs://dinglab/yige/outputs4xhmm/combine_depth/DATA.$c.RD.txt RDtxt/
	cat RDtxt/DATA.$c.RD.txt >> DATA.RD.txt
done
head -1 DATA.RD.txt > DATA.RD.head
grep -v "GATK" DATA.RD.txt > DATA.RD.nohead.txt
cat DATA.RD.head DATA.RD.nohead.txt > DATA.RD.f.txt
rm DATA.RD.head
rm DATA.RD.nohead.txt
rm DATA.RD.txt
gsutil -m cp DATA.RD.f.txt gs://dinglab/yige/outputs4xhmm/combine_depth
