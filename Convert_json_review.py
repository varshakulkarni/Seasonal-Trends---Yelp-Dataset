import json
import pandas as pd
from glob import glob

def convert(x):
    ob = json.loads(x)
    ob1 = json.loads(x)
    for k, v in ob.items():
        if k == 'votes':
            del ob1[k]
        if k == 'text':
            del ob1[k]
        if k == 'user_id':
            del ob1[k]
        if k == 'type':
            del ob1[k]
        if k == 'stars':
            del ob1[k]
        if k == 'review_id':
            del ob1[k]
        if k == 'date':
            ob1[k] = "-".join(ob1[k].split("-")[:2])
    return ob1

for json_filename in glob('yelp_academic_dataset_review.json'):
    csv_filename = '%s.csv' % json_filename[:-5]
    print ('Converting %s to %s' % (json_filename, csv_filename))
    df = pd.DataFrame()
    df = pd.DataFrame([convert(line) for line in open(json_filename)])
    df.to_csv(csv_filename, encoding='utf-8', index=False)
