# Instructions

```bash
$ conda activate workplace
$ python fix_fragments.py --input /home/ec2-user/runs/DACD404_b_CD45_ATAC_IGO_09971_4/outs/fragments.tsv.gz
```

```bash
$ bgzip fragments.tsv
```

```bash
$ tabix -p bed fragments.tsv.gz
```

```bash
$ cp ./fragments.tsv.gz /home/ec2-user/runs/DACD404_b_CD45_ATAC_IGO_09971_4/outs/fragments.tsv.gz
```
