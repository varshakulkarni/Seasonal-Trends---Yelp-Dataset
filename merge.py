import csv
from collections import defaultdict
from collections import OrderedDict

import pandas as pd

a = pd.read_csv(yelp_academic_dataset_review.csv)
b = pd.read_csv(yelp_academic_dataset_business.csv)
merged = a.merge(b, on='business_id')
merged.to_csv(output-combined.csv, index=False)
