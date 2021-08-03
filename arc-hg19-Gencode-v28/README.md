# cellranger-arc-hg19

Cell Ranger ARC v2 no longer provides the hg19 reference package out of the box. This is the instructions to create a hg19 reference package for Cell Ranger ARC v2.

## Prerequisites

- The Cell Ranger ARC executables/binaries should be accessible from anywhere.
- Python 3

Create a Python virtual environment and install the dependencies:

```bash
pip install -r requirements.txt
```

## Build

Download FASTA, GTF, and transcription factor motif position-weight matrices in JASPAR format:

```bash
./download.sh
```

Filter unnecessary genes (e.g. pseudogenes):

```bash
./filter_gtf.sh
```

Fix the chromosome names (e.g. chr1 --> 1, chrX --> X, chrM --> MT, ...):

```bash
python fix_chr_names.py
```

Run the Cell Ranger's `mkref` command:

```bash
./mkref.sh
```

## Final Directory Structure

```
.
├── check.py
├── download.sh
├── filter_gtf.sh
├── fix_chr_names.py
├── gencode.v28lift37.basic.annotation.filtered.fixed.gtf
├── gencode.v28lift37.basic.annotation.filtered.gtf
├── gencode.v28lift37.basic.annotation.gtf
├── hg19-Gencode_v28.config
├── hs37d5.fa
├── JASPAR2018_CORE_vertebrates_non-redundant_pfms_jaspar.txt
├── Log.out
├── mkref.sh
├── README.md
└── refdata-cellranger-arc-hg19-Gencode-v28
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
    ├── regions
    │   ├── motifs.pfm
    │   ├── transcripts.bed
    │   └── tss.bed
    └── star
        ├── chrLength.txt
        ├── chrNameLength.txt
        ├── chrName.txt
        ├── chrStart.txt
        ├── exonGeTrInfo.tab
        ├── exonInfo.tab
        ├── geneInfo.tab
        ├── Genome
        ├── genomeParameters.txt
        ├── SA
        ├── SAindex
        ├── sjdbInfo.txt
        ├── sjdbList.fromGTF.out.tab
        ├── sjdbList.out.tab
        └── transcriptInfo.tab
```
