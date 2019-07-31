#!/bin/bash

set -euo pipefail

conda activate workplace

export sample_name=`python -c "import json;fi=open('/home/ec2-user/inputs.json', 'rt');print(json.loads(fi.read())['SCATA.sampleName']);fi.close()"`

python fix_fragments.py --input /home/ec2-user/runs/${sample_name}/outs/fragments.tsv.gz

bgzip fragments.tsv
tabix -p bed fragments.tsv.gz

cp ./fragments.tsv.gz /home/ec2-user/runs/${sample_name}/outs/fragments.tsv.gz

rm -rf /home/ec2-user/runs/${sample_name}_reanalysis
rm -rf /home/ec2-user/runs/reanalysis.log