from os import listdir, chdir
from os.path import isfile
chdir("C:\\Users\\annal\\Downloads\\practice") # set working directory to responses folder
allfiles = [f for f in listdir() if isfile(f)]

import pandas as pd
all_data = []
column_names = ['trial_type', 'time_elapsed', 'internal_node_id', 'rt', 'response', 'stimulus', 'success', 'item', 'task', 'correct_response', 'correct', 'name']
for f in allfiles:
    df = pd.read_csv(f, index_col=1) # separate into each line
    temp = df.to_dict("split")
    temp = dict(zip(temp["index"], temp["data"]))
    temp_length = len(temp.values())
    for x in range(temp_length): # replace response by column: reponse dictionary
        values = [i for i in temp.values()]
        value = values[x]
        value2 = {column_names[x]: value[x] for x in range(12)}
        temp[x] = value2
    all_data.append(temp)
    
import json
BLP_data = []
for x in range(len(all_data)):
    participant_data = all_data[x]
    participant_BLP_data = []
    for y in participant_data.keys():
        line = participant_data[y]
        if line['trial_type'] == 'survey-html-form':
            response_line = json.loads(line['response'])
            if  'consent1' not in response_line.keys() and 'testing_strategy' not in response_line.keys():
                participant_BLP_data.append(response_line)
    BLP_data.append(participant_BLP_data)

for x in range(len(BLP_data)):
    participant = BLP_data[x]
    sbj_ID = participant[0]['ID']
    
    bioinfo = pd.DataFrame.from_dict(participant[1], orient='index')
    bioinfo = bioinfo.transpose()
    bioinfo.rename(columns = {'Età': 'Age', 'Sesso': 'Sex', 'Formazione': 'Education'})
    bioinfo['sbj_ID'] = sbj_ID
    
    history = pd.DataFrame.from_dict(participant[2], orient='index')
    history = history.transpose()
    bioinfo['sbj_ID'] = sbj_ID
    
    use = pd.DataFrame.from_dict(participant[3], orient='index')
    use = use.transpose()
    use['sbj_ID'] = sbj_ID
    
    attitude = pd.DataFrame.from_dict(participant[4], orient='index')
    attitude = attitude.transpose()
    attitude['sbj_ID'] = sbj_ID