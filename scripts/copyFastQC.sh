#!/bin/bash

## Relevant FastQC files:
Q96_2017_Morgan=/data/biohub/20170906_Morgan_Hypoxia/01_mergedData/FastQC/*6P-PN*
Q96_2017_Lardelli=/data/biohub/2017_Lardelli_Q96K97del/0_rawData/fastqc/*non_mutant*_6mth*R1*
K97_2017_Lardelli=/data/biohub/2017_Lardelli_K97Gfs/0_rawData/fastqc/*non_mutant*6mth*R1*
PSEN2_2018=/data/biohub/20181113_MorganLardelli_mRNASeq/0_rawData/FastQC/*__-_[1-5]_R1*
NextSeq_2017=/data/biohub/170327MichaelLardelli_Nextseq/fastQC/*WT_6month*R1*.*

## Create array to store the FastQC files:
FASTQC=($Q96_2017_Morgan $Q96_2017_Lardelli $K97_2017_Lardelli $PSEN2_2018 $NextSeq_2017)

## Directory to copy FastQC files to::
DIR=/data/biohub/2019_Lardelli_AllWT_6month_RNASeq/0_rawData/fastqc

echo "_______________________________________________"
echo "Copying the following FastQC files."
echo "_______________________________________________"
ls ${FASTQC[*]}
echo "_______________________________________________"

## Move the files
for fastqc in ${FASTQC[*]}
do
	basename=`echo $fastqc | xargs basename`
	cp $fastqc ${DIR}/$basename
done

