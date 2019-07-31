# Instructions

```bash
$ conda activate workplace
$ export path_run_output="/home/ec2-user/runs/DACD404_b_CD45_ATAC_IGO_09971_4"
$ python fix_fragments.py --input ${path_run_output}/outs/fragments.tsv.gz
```

```bash
$ bgzip fragments.tsv
```

```bash
$ tabix -p bed fragments.tsv.gz
```

```bash
$ cp ./fragments.tsv.gz ${path_run_output}/outs/fragments.tsv.gz
```

```bash
$ rm -rf ${path_run_output}_reanalysis
```
