import pyranges as pr

def get_biotypes(gtf):
    # Ensembl uses the attribute name `gene_biotype` whereas
    # GENCODE uses `gene_type`
    if "gene_biotype" in gtf.columns:
        return gtf.gene_biotype
    elif "gene_type" in gtf.columns:
        return gtf.gene_type
    else:
        logger.error("gene biotype is not found in the GTF!")
        sys.exit(1)


def check(path_gtf):

    gtf = pr.read_gtf(path_gtf)

    biotypes = get_biotypes(gtf)

    print(
        biotypes.value_counts().to_markdown(tablefmt="psql", floatfmt=",.0f")
    )

    del gtf


print(">>> ORIGINAL")
check("gencode.v28lift37.basic.annotation.gtf")

print(">>> FILTERED")
check("gencode.v28lift37.basic.annotation.filtered.gtf")

