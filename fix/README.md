# Instructions

```bash
$ conda activate workplace
$ export sample_name="DACD404_b_CD45_ATAC_IGO_09971_4"
$ python fix_fragments.py --input /home/ec2-user/runs/${sample_name}/outs/fragments.tsv.gz
```

```bash
$ bgzip fragments.tsv
```

```bash
$ tabix -p bed fragments.tsv.gz
```

```bash
$ cp ./fragments.tsv.gz /home/ec2-user/runs/${sample_name}/outs/fragments.tsv.gz
```

```bash
$ rm -rf /home/ec2-user/runs/${sample_name}_reanalysis
```
