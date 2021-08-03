#!/bin/bash

cellranger-arc mkgtf gencode.v28lift37.basic.annotation.gtf gencode.v28lift37.basic.annotation.filtered.gtf \
    --attribute=gene_type:protein_coding \
    --attribute=gene_type:lincRNA \
    --attribute=gene_type:antisense \
    --attribute=gene_type:IG_LV_gene \
    --attribute=gene_type:IG_V_gene \
    --attribute=gene_type:IG_D_gene \
    --attribute=gene_type:IG_J_gene \
    --attribute=gene_type:IG_C_gene \
    --attribute=gene_type:TR_V_gene \
    --attribute=gene_type:TR_D_gene \
    --attribute=gene_type:TR_J_gene \
    --attribute=gene_type:TR_C_gene
