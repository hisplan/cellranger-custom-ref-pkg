# cellranger-atac-hg19

Cell Ranger ATAC v2 no longer provides the hg19 reference package out of the box. This is the instructions to create a hg19 reference package for Cell Ranger ATAC v2.

## Build

Download FASTA, GTF, and transcription factor motif position-weight matrices in JASPAR format:

```bash
./download.sh
```

Fix the chromosome names:

```bash
python fix_chr_names.py
```

Run the `mkref` command:

```bash
./mkref.sh
```

## Final Directory Structure

```
.
├── download.sh
├── fix_chr_names.py
├── gencode.v28lift37.basic.annotation.gtf
├── gencode.v28lift37.basic.annotation.gtf.chr.txt
├── gencode.v28lift37.basic.annotation.prefixed.gtf
├── hg19-Gencode_v28.config
├── hs37d5.fa
├── JASPAR2018_CORE_vertebrates_non-redundant_pfms_jaspar.txt
├── mkref.sh
├── outs
│   ├── fasta
│   │   ├── genome.fa
│   │   ├── genome.fa.amb
│   │   ├── genome.fa.ann
│   │   ├── genome.fa.bwt
│   │   ├── genome.fa.fai
│   │   ├── genome.fa.pac
│   │   └── genome.fa.sa
│   ├── genes
│   │   └── genes.gtf.gz
│   ├── reference.json
│   └── regions
│       ├── motifs.pfm
│       ├── transcripts.bed
│       └── tss.bed
├── README.md
└── refdata-cellranger-atac-hg19-Gencode-v28
    ├── fasta
    │   ├── genome.fa
    │   ├── genome.fa.amb
    │   ├── genome.fa.ann
    │   ├── genome.fa.bwt
    │   ├── genome.fa.fai
    │   ├── genome.fa.pac
    │   └── genome.fa.sa
    ├── genes
    │   └── genes.gtf.gz
    ├── reference.json
    └── regions
        ├── motifs.pfm
        ├── transcripts.bed
        └── tss.bed

8 directories, 34 files
```