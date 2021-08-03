#!/bin/bash

# FASTA
wget ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/phase2_reference_assembly_sequence/hs37d5.fa.gz
gunzip hs37d5.fa.gz

# GTF
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_28/GRCh37_mapping/gencode.v28lift37.basic.annotation.gtf.gz
gunzip gencode.v28lift37.basic.annotation.gtf.gz

# Transcription factor motif position-weight matrices in JASPAR format
wget http://jaspar2018.genereg.net/download/CORE/JASPAR2018_CORE_vertebrates_non-redundant_pfms_jaspar.txt

