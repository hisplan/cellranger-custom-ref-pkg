# cellranger-arc-hg19

Cell Ranger ARC v2 no longer provides the hg19 reference package out of the box. This is the instructions to create a hg19 reference package for Cell Ranger ARC v2.

## Build

Download FASTA, GTF, and transcription factor motif position-weight matrices in JASPAR format:

```bash
./download.sh
```

Filter unnecessary genes (e.g. pseudogenes):

```bash
./filter_gtf.sh
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
├── check.py
├── download.sh
├── filter_gtf.sh
├── fix_chr_names.py
├── gencode.v28lift37.basic.annotation.filtered.fixed.gtf
├── gencode.v28lift37.basic.annotation.filtered.gtf
├── gencode.v28lift37.basic.annotation.gtf
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

5 directories, 40 files
```