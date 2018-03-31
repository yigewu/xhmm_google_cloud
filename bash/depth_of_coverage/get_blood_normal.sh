#!/bin/bash

awk -F "-" '$8>=10A&&$8<11A' GCS_listing.02jun2016.tcga.all.DNA.WXS.normals.tsv.noDupBam.fastqcMaxFail_2_exclKmerCont.minGoodCvg20x.analysisID_w_barcodes > GCS_listing.WXS.9401QCed.blood.normals.barcodes

cd combine_depth
grep -f ../GCS_listing.WXS.9401QCed.blood.normals.barcodes blood.list.uniqsampleID.barcode > blood.list.uniqsampleID.barcode.within.9401QCed
cut -f 3 blood.list.uniqsampleID.barcode.within.9401QCed > GCS_listing.WXS.9401QCed.blood.normals.barcodes.b4Sep01
cd ..

grep -f GCS_listing.WXS.9401QCed.blood.normals.barcodes.b4Sep01 -v GCS_listing.WXS.9401QCed.blood.normals.barcodes | sort > GCS_listing.WXS.9401QCed.blood.normals.barcodes.afSep01

sort -k1 GCS_listing.24jun2016.DNA.WXS.tsv > GCS_listing.24jun2016.DNA.WXS.sorted.tsv

join -j 1 -o 2.1,2.2,2.3,2.4,2.5 GCS_listing.WXS.9401QCed.blood.normals.barcodes.afSep01 GCS_listing.24jun2016.DNA.WXS.sorted.tsv > GCS_listing.24jun2016.DNA.WXS.9401QCed.blood.normals.afSep01
