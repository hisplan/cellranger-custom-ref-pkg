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


