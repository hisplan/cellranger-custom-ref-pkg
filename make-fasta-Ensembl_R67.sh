#!/bin/bash

chrs="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 X Y MT"
for chr in $chrs
do
  wget ftp://ftp.ensembl.org/pub/release-67/fasta/mus_musculus/dna/Mus_musculus.NCBIM37.67.dna.chromosome.${chr}.fa.gz
  gzip -d Mus_musculus.NCBIM37.67.dna.chromosome.${chr}.fa.gz
done

cat Mus_musculus.NCBIM37.67.dna.chromosome.*.fa > mm9-Ensembl_R67.fa

rm -rf Mus_musculus.NCBIM37.67.dna.chromosome.*.fa
