### IMPORTING ###
from os import listdir, chdir
from os.path import isfile
chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\data") # set working directory to responses folder
allfiles = [f for f in listdir() if isfile(f)] # get all file names

import pandas as pd
all_data = []
column_names = ['trial_type', 'time_elapsed', 'internal_node_id', 'sbj_ID', 'study_id', 'session_id', 'rt', 'response', 'stimulus', 'success', 'item', 'task', 'correct_response', 'testing_condition', 'correct', 'target', 'confound', 'name']
for file in allfiles:
    df = pd.read_csv(file, index_col=1) # separate into each line
    temp = df.to_dict("split")
    temp = dict(zip(temp["index"], temp["data"]))
    temp_length = len(temp.values())
    for x in range(temp_length): # replace response by column: reponse dictionary
        values = [i for i in temp.values()]
        value = values[x]
        try:
            value2 = {column_names[x]: value[x] for x in range(len(column_names))}
        except IndexError:
            column_names = ['trial_type', 'time_elapsed', 'internal_node_id', 'sbj_ID', 'study_id', 'session_id', 'rt', 'response', 'stimulus', 'success', 'item', 'task', 'correct_response', 'correct', 'target', 'confound', 'name']
            value2 = {column_names[x]: value[x] for x in range(len(column_names))}
            column_names = ['trial_type', 'time_elapsed', 'internal_node_id', 'sbj_ID', 'study_id', 'session_id', 'rt', 'response', 'stimulus', 'success', 'item', 'task', 'correct_response', 'testing_condition', 'correct', 'target', 'confound', 'name']
        temp[x] = value2
    all_data.append([file,temp])
    
import ast
testing_data = []
for x in range(len(all_data)): # extract testing responses
    file_name = all_data[x][0]
    participant_data = all_data[x][1]
    participant_testing_data = []
    for y in participant_data.keys():
        line = participant_data[y]
        if type(line) == list and line[0] == 'fullscreen':
            continue
        if type(line['response']) == str and line['response'] != ' ' and line['task'] != 'testing' and line['task'] != 'familiarity' and len(line['response']) > 20:
            response_line = ast.literal_eval(line['response']) # convert from string to dict
        if line['trial_type'] == 'survey-html-form' and 'ID' in response_line.keys():
            ID = line['sbj_ID']
            testing_data.append([file_name,ID])
    
import numpy as np
np.savetxt("IDs_files.csv",
        testing_data,
        delimiter =", ",
        fmt ='% s')