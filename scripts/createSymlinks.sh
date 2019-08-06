#!/bin/bash

## Raw 6 month wild type fastq.gz files for each dataset:
Q96_2017_Morgan=/data/biohub/20170906_Morgan_Hypoxia/01_mergedData/fastq/*6P-PN*
Q96_2017_Lardelli=/data/biohub/2017_Lardelli_Q96K97del/0_rawData/fastq/*non_mutant*_6mth*R1.fastq.gz
K97_2017_Lardelli=/data/biohub/2017_Lardelli_K97Gfs/0_rawData/fastq/*non_mutant*6mth*R1.fastq.gz
PSEN2_2018=/data/biohub/20181113_MorganLardelli_mRNASeq/0_rawData/fastq/*__-_[1-5]_R1*
NextSeq_2017=/data/biohub/170327MichaelLardelli_Nextseq/0_rawData/fastq/*WT_6month*R1*
## To add: Karissa's data

## Create an array to store all the fastq.gz files:
FASTQ=($Q96_2017_Morgan $Q96_2017_Lardelli $K97_2017_Lardelli $PSEN2_2018 $NextSeq_2017)

## Directory which the symlinks will be created at:
SYMLINKDIR=/data/biohub/2019_Lardelli_AllWT_6month_RNASeq/0_rawData/fastq

echo "_______________________________________________"
echo "Create symlinks to the following fastq.gz files"
echo "_______________________________________________"
ls ${FASTQ[*]}
echo "_______________________________________________"

## Create the symlinks
for fastq in ${FASTQ[*]}
do
	basename=`echo $fastq | xargs basename`
	ln -s $fastq ${SYMLINKDIR}/$basename
done
