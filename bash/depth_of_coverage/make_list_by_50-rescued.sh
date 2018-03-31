#!/bin/bash

# depends on how long does it take to run one bash of jobs
c=0
left=0
while [ ${left} -ge 0 ] 
do
	c=`expr $c + 50`
	if [ ${c} -le 2730 ]; then
		head -$c /home/yigewu2012/xhmm/pipelines/depth_of_coverage7887/pca_table.20171019.wclin.unprocessed.nohead.tsv | tail -50 > listBy50/pca_table.20171019.wclin.unprocessed.$c.tsv
	fi
	if [ ${c} -ge 2730 ]; then
		head -$c /home/yigewu2012/xhmm/pipelines/depth_of_coverage7887/pca_table.20171019.wclin.unprocessed.nohead.tsv | tail -n ${left} > listBy50/pca_table.20171019.wclin.unprocessed.$c.tsv
	fi
	left=`expr 2730 - $c`
done
		

