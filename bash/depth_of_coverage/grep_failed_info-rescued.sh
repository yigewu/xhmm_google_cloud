#!/bin/bash

# input the name of the list when bash this
gsutil ls gs://dinglab/yige/outputs4xhmm/depth_of_coverage/$1 | grep sample | cut -f 8 -d"/" | cut -f 1 -d"." | sort -u >submittedBarcodes/$1.barcodes

echo $(wc submittedBarcodes/$1.barcodes)
n=$(wc submittedBarcodes/$1.barcodes | awk '{print $1}') 
s=$(wc list2submit/$1 | awk '{print $1}')

if [ "$n" != "$s" ]; then

# get failed barcodes
grep -f submittedBarcodes/$1.barcodes -v list2submit/$1 > list2submit/$1.f

# cp the log files
mkdir failed_log/$1
mkdir failed_log/$1/$1
gsutil -m cp -r gs://dinglab/yige/logs4xhmm/depth_of_coverage/$1 failed_log/$1/
ls failed_log/$1/$1 > failed_log/$1/all.log

# grep the failed barcodes, rm the others
while read l; do
	d=$(echo $l | awk '{print $5}')
	while read p; do
		if grep -q $d failed_log/$1/$1/$p ; then
			cp failed_log/$1/$1/$p failed_log/$1/.
			if grep -q "No space left on device" failed_log/$1/$1/$p ; then
				mkdir failed_log/$1/space
				mv failed_log/$1/$p failed_log/$1/space/.
			fi
			if grep -q "No URLs matched" failed_log/$1/$1/$p ; then
				mkdir failed_log/$1/noURL
				mv failed_log/$1/$p failed_log/$1/noURL/.
			fi
		fi
	done < failed_log/$1/all.log
done < list2submit/$1.f

rm failed_log/$1/all.log
rm -r failed_log/$1/$1

echo $(wc submittedBarcodes/$1.barcodes)

fi
