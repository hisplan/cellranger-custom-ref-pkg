# cellranger-atac mm9

## How to Build

```bash
$ ./mkref.sh
```

Move the reference package created to the directory where Cell Ranger ATAC is installed (e.g. `/opt`):

```bash
$ sudo cp -r mm9 /opt/refdata-cellranger-atac-mm9-1.1.0
$ sudo chown ec2-user /opt/refdata-cellranger-atac-mm9-1.1.0 -R
$ sudo chgrp ec2-user /opt/refdata-cellranger-atac-mm9-1.1.0 -R
```

## To Do

The following files are NOT included during the build:

```
├── genes
│   └── regulatory.gff      [pre-built references only, Ensembl sources: hg19, b37, GRCh38 and mm10]
└── regions
    ├── blacklist.bed       [pre-built references only, ENCODE sources: hg19, b37, GRCh38, mm10]
    ├── ctcf.bed            [pre-built references only]
    ├── dnase.bed           [pre-built references only, ENCODE sources: hg19, b37, mm10, Anshul Kundaje's pipeline: GRCh38]
    ├── enhancer.bed        [pre-built references only, source: Ensembl regulatory build release 95]
    └── promoter.bed        [pre-built references only, source: Ensembl regulatory build release 95]
```

## References

Instructions:

- https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/advanced/references#mkref

### Ensembl

- https://useast.ensembl.org/Mus_musculus/Info/Annotation
- http://apr2019.archive.ensembl.org/Mus_musculus/Info/Index
- ftp://ftp.ensembl.org/pub/release-96/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
- ftp://ftp.ensembl.org/pub/release-96/gtf/mus_musculus/Mus_musculus.GRCm38.96.gtf.gz

### Gencode

- https://www.gencodegenes.org/mouse/release_M1.html

### JASPAR

- http://jaspar.genereg.net/downloads/
