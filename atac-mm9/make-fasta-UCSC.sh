#!/bin/bash

wget http://hgdownload.cse.ucsc.edu/goldenPath/mm9/bigZips/chromFa.tar.gz

# uncompress the downloaded file
tar -xvzf chromFa.tar.gz

# remove `*random.fa` chromosomes
rm -rf *_random.fa

# concatenate all FASTA files into a single file
chrs="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 X Y M"
rm -rf mm9-UCSC.fa
for chr in $chrs
do
  echo ${chr}
  cat chr${chr}.fa >> mm9-UCSC.fa
done

# remove `chr*.fa` (individual chromosomes)
rm -rf chr*.fa

rm -rf chromFa.tar.gz

