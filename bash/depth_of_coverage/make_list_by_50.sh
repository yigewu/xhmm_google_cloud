#!/bin/bash

# depends on how long does it take to run one bash of jobs
c=0
while [ $c -le 7233 ] 
do
	start=`expr $c + 1`
	c=`expr $c + 50`
	head -$c /home/yigewu2012/xhmm/pipelines/GCS_listing.24jun2016.DNA.WXS.9401QCed.blood.normals.afSep01 | tail -50 > listBy50/9401QCed.blood.normal.afSep01.${start}_$c
done
		

