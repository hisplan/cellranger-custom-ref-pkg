#!/bin/bash

# http://genomewiki.ucsc.edu/index.php/Genes_in_gtf_or_gff_format#Use_genePredToGtf_with_a_downloaded_genePred_table

# for MacOSX
# wget http://hgdownload.soe.ucsc.edu/admin/exe/macOSX.x86_64/genePredToGtf
# for Linux
# wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/genePredToGtf

wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/genePredToGtf
chmod +x ./genePredToGtf

# wget http://hgdownload.soe.ucsc.edu/goldenPath/mm9/database/knownGene.txt.gz
# gunzip -c knownGene.txt.gz | cut -f1-10 | ./genePredToGtf file stdin mm9-UCSC.gtf -source=UCSC

wget http://hgdownload.soe.ucsc.edu/goldenPath/mm9/database/refGene.txt.gz
gunzip -c refGene.txt.gz | cut -f2- | ./genePredToGtf file stdin mm9-UCSC.gtf -source=UCSC
