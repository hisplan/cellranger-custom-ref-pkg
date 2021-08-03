#!/bin/env python

from tqdm import tqdm

# input
path_src_gtf="gencode.v28lift37.basic.annotation.gtf"
# output
path_dst_gtf="gencode.v28lift37.basic.annotation.fixed.gtf"

with open(path_dst_gtf, "wt") as fout:
    with open(path_src_gtf, "rt") as fin:
        for line in tqdm(fin):
            # remove new line characters
            line = line.strip()

            # each line is tab-separated
            cols = line.split("\t")

            # 1st column is the chromosome name
            chromo = cols[0]

            if chromo == "chrM":
                # chrM --> MT
                fout.write("MT" + "\t" + "\t".join(cols[1:]) + "\n")
            elif chromo.startswith("chr"):
                # chr1 --> 1, chrX --> X, ...
                chromo = chromo.replace("chr", "")
                fout.write(chromo + "\t" + "\t".join(cols[1:]) + "\n")
            else:
                fout.write(line + "\n")

print("DONE.")
