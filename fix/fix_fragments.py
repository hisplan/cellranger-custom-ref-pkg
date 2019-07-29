import pandas as pd
import pysam
from frogress import bar


path_source = "fragments0.tsv.gz"
path_output = "fragments.tsv"

# read the original fragments file
df = pd.read_csv(
    path_source,
    sep="\t",
    header=None,
    names=["chr", "start", "end", "cb", "counts"]
)

# generate a table describing each chromosome's length
chrs = "chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chrX chrY chrM"
ends = "197195432 181748087 159599783 155630120 152537259 149517037 152524553 131738871 124076172 129993255 121843856 121257530 120284312 125194864 103494974 98319150 95272651 90772031 61342430 166650296 15902555 16299"

chrs = chrs.split(" ")
ends = ends.split(" ")

df_contigs = pd.DataFrame({"chromosome": chrs, "len": ends})

df_contigs.len = df_contigs.len.astype(int)


# find problematic fragments that exceed contig size (due to cell ranger bug)
problematics = []

with pysam.Tabixfile(path_source) as tbx:
    for i, contig in df_contigs[ df_contigs.chromosome != "chrM" ].iterrows():

        for row in tbx.fetch(
            contig.chromosome,
            contig.len - 1,
            contig.len,
            parser=pysam.asBed()
        ):
            problematics.append(row)

# iterate through problematic fragments and correct the coordinates
for p in bar(problematics):

    # retrieve the proper end of the contig
    proper_end = df_contigs.loc[ df_contigs.chromosome == p.contig, "len" ].values[0]

    # correct
    df.loc[ (df.chr == p.contig) & (df.start == p.start) & (df.cb == p.name), "end" ] = proper_end

# save
df.to_csv(
    path_output,
    sep="\t",
    header=False,
    index=False
)
