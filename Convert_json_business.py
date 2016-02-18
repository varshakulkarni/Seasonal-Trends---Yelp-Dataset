import json
import pandas as pd
from glob import glob
import re

def category_filtering(categories):
    with open('categories.json') as data_file:
        data = json.load(data_file)
        for item in categories:
            for i in range(0, len(data)):
                if(data[i]['title'] == item):
                    if data[i]['parents'] != []:
                        return data[i]['parents'][0]
                    elif data[i]['alias'] != '':
                        return data[i]['alias']
                    else:
                        return 'None'



def convert(x):
    ob = json.loads(x)
    business = {}
    check = 0
    state = ''
    
    if ob['latitude'] > 25.958045 and ob['latitude'] < 49.382373:
        check = check + 1
    if ob['longitude'] > -124.628906 and ob['longitude'] < -66.621094:
        check = check + 1
    if check == 2 :
        postal_code = re.search(r'.*(\d{5}(\-\d{4})?)$', ob['full_address'])
        pc = ''
        if postal_code!=None:
            postal_code = re.match('^.*?(\d+)$', postal_code.group())
            pc = (postal_code.group(1))
        else:
            pc = 'None'
        business['business_id'] = ob['business_id']
        business['zip_code'] = pc
        business['categories'] = category_filtering(ob['categories'])
        return business
    else :
        return {'business_id' : ob['business_id'], 'zip_code': 'None', 'categories' : []}

for json_filename in glob('yelp_academic_dataset_business.json'):
    
    csv_filename = '%s.csv' % json_filename[:-5]
    print ('Converting %s to %s' % (json_filename, csv_filename))
    df = pd.DataFrame([convert(line) for line in open(json_filename)])
    df.to_csv(csv_filename, encoding='utf-8', index=False)
