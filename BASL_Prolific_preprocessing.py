### IMPORTING ###
from os import listdir, chdir
from os.path import isfile
chdir("C:\\Users\\annal\\Downloads\\practice") # set working directory to responses folder
allfiles = [f for f in listdir() if isfile(f)] # get all file names

import pandas as pd
all_data = []
column_names = ['trial_type', 'time_elapsed', 'internal_node_id', 'sbj_ID', 'study_id', 'session_id', 'rt', 'response', 'stimulus', 'success', 'item', 'task', 'correct_response', 'correct', 'name']
for f in allfiles:
    df = pd.read_csv(f, index_col=1) # separate into each line
    temp = df.to_dict("split")
    temp = dict(zip(temp["index"], temp["data"]))
    temp_length = len(temp.values())
    for x in range(temp_length): # replace response by column: reponse dictionary
        values = [i for i in temp.values()]
        value = values[x]
        value2 = {column_names[x]: value[x] for x in range(len(column_names))}
        temp[x] = value2
    all_data.append(temp)
   
### BLP PRE-PROCESSING ###
import json
BLP_data = []
for x in range(len(all_data)): # extract BLP responses
    participant_data = all_data[x]
    participant_BLP_data = []
    for y in participant_data.keys():
        line = participant_data[y]
        if line['trial_type'] == 'survey-html-form':
            response_line = json.loads(line['response']) # convert from string to dict
            if  'consent1' not in response_line.keys() and 'testing_strategy' not in response_line.keys():
                participant_BLP_data.append(response_line)
    BLP_data.append(participant_BLP_data)
    
def BLP_preprocessing(BLP_file):
    '''
    Function taking a DataFrame of BLP data & scoring responses

    Parameters
    ----------
    BLP_file : DataFrame
        Raw DataFrame of BLP data.

    Returns
    -------
    BLP_data2 : DataFrame
        Sorted & scored DataFrame with a line per participant.
    '''
    # replacing individual responses with their equivalent score
    AoA12_mapping = {"20+": 0, "19": 1, "18": 2, "17": 3, "16": 4, "15": 5, "14": 6, "13": 7, "12": 8, "11": 9, "10": 10, "9": 11, "8": 12, "7": 13, "6": 14, "5": 15, "4": 16, "3": 17, "2": 18, "1": 19, "0": 0, "Dalla nascita": 20, "Da quando ne ho ricordo": 20, "notyet": 0}
    BLP_data2 = BLP_file.replace({"AoAL1": AoA12_mapping, "AoAL2": AoA12_mapping, "AoAL3": AoA12_mapping, "AoAL4": AoA12_mapping})
    BLP_data3 = BLP_data2.replace({"AoAgioL1": AoA12_mapping, "AoAgioL2": AoA12_mapping, "AoAgioL3": AoA12_mapping, "AoAgioL4": AoA12_mapping})
    AoA_mapping = {"20+": 20, "19": 19, "18": 18, "17": 17, "16": 16, "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9, "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1, "0": 0}
    BLP_data2 = BLP_data3.replace({"anniInstrL1": AoA_mapping, "anniInstrL2": AoA_mapping, "anniInstrL3": AoA_mapping, "anniInstrL4": AoA_mapping})
    BLP_data3 = BLP_data2.replace({"anniPaeseL1": AoA_mapping, "anniPaeseL2": AoA_mapping, "anniPaeseL3": AoA_mapping, "anniPaeseL4": AoA_mapping})
    BLP_data2 = BLP_data3.replace({"anniFamigliaL1": AoA_mapping, "anniFamigliaL2": AoA_mapping, "anniFamigliaL3": AoA_mapping, "anniFamigliaL4": AoA_mapping})
    BLP_data3 = BLP_data2.replace({"anniLavoroL1": AoA_mapping, "anniLavoroL2": AoA_mapping, "anniLavoroL3": AoA_mapping, "anniLavoroL4": AoA_mapping})
    
    percent_mapping = {"0": 0, "10": 1, "20": 2, "30": 3, "40": 4, "50": 5, "60": 6, "70": 7, "80": 8, "90": 9, "100": 10}
    BLP_data2 = BLP_data3.replace({"PercAmiciL1": percent_mapping, "PercAmiciL2": percent_mapping, "PercAmiciL3": percent_mapping, "PercAmiciL4": percent_mapping})
    BLP_data3 = BLP_data2.replace({"PercFamigliaL1": percent_mapping, "PercFamigliaL2": percent_mapping, "PercFamigliaL3": percent_mapping, "PercFamigliaL4": percent_mapping})
    BLP_data2 = BLP_data3.replace({"PercLavoroL1": percent_mapping, "PercLavoroL2": percent_mapping, "PercLavoroL3": percent_mapping, "PercLavoroL4": percent_mapping})
    BLP_data3 = BLP_data2.replace({"PercStessoL1": percent_mapping, "PercStessoL2": percent_mapping, "PercStessoL3": percent_mapping, "PercStessoL4": percent_mapping})
    BLP_data2 = BLP_data3.replace({"PercCalcoliL1": percent_mapping, "PercCalcoliL2": percent_mapping, "PercCalcoliL3": percent_mapping, "PercCalcoliL4": percent_mapping})
    
    # summing up scores per section per language
    # HISTORY
    all_history_scoreL1 = []
    all_history_scoreL2 = []
    all_history_scoreL3 = []
    all_history_scoreL4 = []
    BLP_data2 = BLP_data2.astype({"AoAL1":"int","AoAgioL1":"int","anniInstrL1":"int","anniPaeseL1":"int","anniFamigliaL1":"int","anniLavoroL1":"int"}) # transform scores into integers
    history_scoreL1 = (BLP_data2["AoAL1"][0] + BLP_data2["AoAgioL1"][0] + BLP_data2["anniInstrL1"][0] + BLP_data2["anniPaeseL1"][0] + BLP_data2["anniFamigliaL1"][0] + BLP_data2["anniLavoroL1"][0])*0.454
    try:
        BLP_data2 = BLP_data2.astype({"AoAL2":"int","AoAgioL2":"int","anniInstrL2":"int","anniPaeseL2":"int","anniFamigliaL2":"int","anniLavoroL2":"int"})
        history_scoreL2 = (BLP_data2["AoAL2"][0] + BLP_data2["AoAgioL2"][0] + BLP_data2["anniInstrL2"][0] + BLP_data2["anniPaeseL2"][0] + BLP_data2["anniFamigliaL2"][0] + BLP_data2["anniLavoroL2"][0])*0.454
    except KeyError: # if participant doesn't have L2 (so L2 questions weren't displayed - so have no data)
        history_scoreL2 = 0            
    try:
        BLP_data2 = BLP_data2.astype({"AoAL3":"int","AoAgioL3":"int","anniInstrL3":"int","anniPaeseL3":"int","anniFamigliaL3":"int","anniLavoroL3":"int"})
        history_scoreL3 = (BLP_data2["AoAL3"][0] + BLP_data2["AoAgioL3"][0] + BLP_data2["anniInstrL3"][0] + BLP_data2["anniPaeseL3"][0] + BLP_data2["anniFamigliaL3"][0] + BLP_data2["anniLavoroL3"][0])*0.454
    except KeyError:
        history_scoreL3 = 0  
    try:
        BLP_data2 = BLP_data2.astype({"AoAL4":"int","AoAgioL4":"int","anniInstrL4":"int","anniPaeseL4":"int","anniFamigliaL4":"int","anniLavoroL4":"int"})
        history_scoreL4 = (BLP_data2["AoAL4"][0] + BLP_data2["AoAgioL4"][0] + BLP_data2["anniInstrL4"][0] + BLP_data2["anniPaeseL4"][0] + BLP_data2["anniFamigliaL4"][0] + BLP_data2["anniLavoroL4"][0])*0.454
    except KeyError:
        history_scoreL4 = 0  
    all_history_scoreL1.append(history_scoreL1)
    all_history_scoreL2.append(history_scoreL2)
    all_history_scoreL3.append(history_scoreL3)
    all_history_scoreL4.append(history_scoreL4)
        
    # USE
    all_use_scoreL1 = []
    all_use_scoreL2 = []
    all_use_scoreL3 = []
    all_use_scoreL4 = []
    use_scoreL1 = (BLP_data2["PercAmiciL1"][0] + BLP_data2["PercFamigliaL1"][0] + BLP_data2["PercLavoroL1"][0] + BLP_data2["PercStessoL1"][0] + BLP_data2["PercCalcoliL1"][0])*1.09
    try:
        use_scoreL2 = (BLP_data2["PercAmiciL2"][0] + BLP_data2["PercFamigliaL2"][0] + BLP_data2["PercLavoroL2"][0] + BLP_data2["PercStessoL2"][0] + BLP_data2["PercCalcoliL2"][0])*1.09
    except KeyError:
        use_scoreL2 = 0
    try:
        use_scoreL3 = (BLP_data2["PercAmiciL3"][0] + BLP_data2["PercFamigliaL3"][0] + BLP_data2["PercLavoroL3"][0] + BLP_data2["PercStessoL3"][0] + BLP_data2["PercCalcoliL3"][0])*1.09
    except KeyError:
        use_scoreL3 = 0
    try:
        use_scoreL4 = (BLP_data2["PercAmiciL4"][0] + BLP_data2["PercFamigliaL4"][0] + BLP_data2["PercLavoroL4"][0] + BLP_data2["PercStessoL4"][0] + BLP_data2["PercCalcoliL4"][0])*1.09
    except KeyError:
        use_scoreL4 = 0
    all_use_scoreL1.append(use_scoreL1)
    all_use_scoreL2.append(use_scoreL2)
    all_use_scoreL3.append(use_scoreL3)
    all_use_scoreL4.append(use_scoreL4)
        
    # PROFICIENCY
    all_proficiency_scoreL1 = []
    all_proficiency_scoreL2 = []
    all_proficiency_scoreL3 = []
    all_proficiency_scoreL4 = []
    BLP_data2 = BLP_data2.astype({"ProfParlaL1":"int","ProfCapisceL1":"int","ProfLeggeL1":"int","ProfScriveL1":"int"})
    proficiency_scoreL1 = (BLP_data2["ProfParlaL1"][0] + BLP_data2["ProfCapisceL1"][0] + BLP_data2["ProfLeggeL1"][0] + BLP_data2["ProfScriveL1"][0])*2.27
    try:
        BLP_data2 = BLP_data2.astype({"ProfParlaL2":"int","ProfCapisceL2":"int","ProfLeggeL2":"int","ProfScriveL2":"int"})
        proficiency_scoreL2 = (BLP_data2["ProfParlaL2"][0] + BLP_data2["ProfCapisceL2"][0] + BLP_data2["ProfLeggeL2"][0] + BLP_data2["ProfScriveL2"][0])*2.27
    except KeyError:
        proficiency_scoreL2 = 0
    try:
        BLP_data2 = BLP_data2.astype({"ProfParlaL3":"int","ProfCapisceL3":"int","ProfLeggeL3":"int","ProfScriveL3":"int"})
        proficiency_scoreL3 = (BLP_data2["ProfParlaL3"][0] + BLP_data2["ProfCapisceL3"][0] + BLP_data2["ProfLeggeL3"][0] + BLP_data2["ProfScriveL3"][0])*2.27
    except KeyError:
        proficiency_scoreL3 = 0
    try:
        BLP_data2 = BLP_data2.astype({"ProfParlaL4":"int","ProfCapisceL4":"int","ProfLeggeL4":"int","ProfScriveL4":"int"})
        proficiency_scoreL4 = (BLP_data2["ProfParlaL4"][0] + BLP_data2["ProfCapisceL4"][0] + BLP_data2["ProfLeggeL4"][0] + BLP_data2["ProfScriveL4"][0])*2.27
    except KeyError:
        proficiency_scoreL4 = 0
    all_proficiency_scoreL1.append(proficiency_scoreL1)
    all_proficiency_scoreL2.append(proficiency_scoreL2)
    all_proficiency_scoreL3.append(proficiency_scoreL3)
    all_proficiency_scoreL4.append(proficiency_scoreL4)
        
    # ATTITUDE
    all_attitude_scoreL1 = []
    all_attitude_scoreL2 = []
    all_attitude_scoreL3 = []
    all_attitude_scoreL4 = []
    BLP_data2 = BLP_data2.astype({"AttMiStessoL1":"int","AttCulturaL1":"int","AttLivNativoL1":"int","AttMadrelinguaL1":"int"})
    attitude_scoreL1 = (BLP_data2["AttMiStessoL1"][0] + BLP_data2["AttCulturaL1"][0] + BLP_data2["AttLivNativoL1"][0] + BLP_data2["AttMadrelinguaL1"][0])*2.27
    try:
        BLP_data2 = BLP_data2.astype({"AttMiStessoL2":"int","AttCulturaL2":"int","AttLivNativoL2":"int","AttMadrelinguaL2":"int"})
        attitude_scoreL2 = (BLP_data2["AttMiStessoL2"][0] + BLP_data2["AttCulturaL2"][0] + BLP_data2["AttLivNativoL2"][0] + BLP_data2["AttMadrelinguaL2"][0])*2.27
    except KeyError:
        attitude_scoreL2 = 0
    try:
        BLP_data2 = BLP_data2.astype({"AttMiStessoL3":"int","AttCulturaL3":"int","AttLivNativoL3":"int","AttMadrelinguaL3":"int"})
        attitude_scoreL3 = (BLP_data2["AttMiStessoL3"][0] + BLP_data2["AttCulturaL3"][0] + BLP_data2["AttLivNativoL3"][0] + BLP_data2["AttMadrelinguaL3"][0])*2.27
    except KeyError:
        attitude_scoreL3 = 0
    try:
        BLP_data2 = BLP_data2.astype({"AttMiStessoL4":"int","AttCulturaL4":"int","AttLivNativoL4":"int","AttMadrelinguaL4":"int"})
        attitude_scoreL4 = (BLP_data2["AttMiStessoL4"][0] + BLP_data2["AttCulturaL4"][0] + BLP_data2["AttLivNativoL4"][0] + BLP_data2["AttMadrelinguaL4"][0])*2.27
    except KeyError:
        attitude_scoreL4 = 0
    all_attitude_scoreL1.append(attitude_scoreL1)
    all_attitude_scoreL2.append(attitude_scoreL2)
    all_attitude_scoreL3.append(attitude_scoreL3)
    all_attitude_scoreL4.append(attitude_scoreL4)
        
    # attention check
    attention_mapping = {"0": "false", "1": "false", "2": "true", "3": "false", "4": "false", "5": "false", "6": "false"}
    BLP_data3 = BLP_data2.replace({"AttentionL1": attention_mapping})
    BLP_data2 = BLP_data3.replace({"AttentionL2": attention_mapping})
    BLP_data3 = BLP_data2.replace({"AttentionL3": attention_mapping})
    BLP_data2 = BLP_data3.replace({"AttentionL4": attention_mapping})
    
    # add column to dataframe with scores per section per language
    BLP_data2["HistoryL1Score"] = all_history_scoreL1
    BLP_data2["HistoryL2Score"] = all_history_scoreL2
    BLP_data2["HistoryL3Score"] = all_history_scoreL3
    BLP_data2["HistoryL4Score"] = all_history_scoreL4
    BLP_data2["UseL1Score"] = all_use_scoreL1
    BLP_data2["UseL2Score"] = all_use_scoreL2
    BLP_data2["UseL3Score"] = all_use_scoreL3
    BLP_data2["UseL4Score"] = all_use_scoreL4
    BLP_data2["ProficiencyL1Score"] = all_proficiency_scoreL1
    BLP_data2["ProficiencyL2Score"] = all_proficiency_scoreL2
    BLP_data2["ProficiencyL3Score"] = all_proficiency_scoreL3
    BLP_data2["ProficiencyL4Score"] = all_proficiency_scoreL4
    BLP_data2["AttitudeL1Score"] = all_attitude_scoreL1
    BLP_data2["AttitudeL2Score"] = all_attitude_scoreL2
    BLP_data2["AttitudeL3Score"] = all_attitude_scoreL3
    BLP_data2["AttitudeL4Score"] = all_attitude_scoreL4
        
    # sum up section scores for each language
    all_L1_scores = []
    all_L2_scores = []
    all_L3_scores = []
    all_L4_scores = []
    L1_score = BLP_data2["HistoryL1Score"][0] + BLP_data2["UseL1Score"][0] + BLP_data2["ProficiencyL1Score"][0] + BLP_data2["AttitudeL1Score"][0]
    L2_score = BLP_data2["HistoryL2Score"][0] + BLP_data2["UseL2Score"][0] + BLP_data2["ProficiencyL2Score"][0] + BLP_data2["AttitudeL2Score"][0]
    L3_score = BLP_data2["HistoryL3Score"][0] + BLP_data2["UseL3Score"][0] + BLP_data2["ProficiencyL3Score"][0] + BLP_data2["AttitudeL3Score"][0]
    L4_score = BLP_data2["HistoryL4Score"][0] + BLP_data2["UseL4Score"][0] + BLP_data2["ProficiencyL4Score"][0] + BLP_data2["AttitudeL4Score"][0]
    all_L1_scores.append(L1_score)
    all_L2_scores.append(L2_score)
    all_L3_scores.append(L3_score)
    all_L4_scores.append(L4_score)
        
    # add column to dataframe for language scores
    BLP_data2["L1Score"] = all_L1_scores
    BLP_data2["L2Score"] = all_L2_scores
    BLP_data2["L3Score"] = all_L3_scores
    BLP_data2["L4Score"] = all_L4_scores
    return BLP_data2

all_BLP_data = pd.DataFrame() # empty dataframe
for x in range(len(BLP_data)): # for each participant datafile
    participant = BLP_data[x]
    sbj_ID = participant[0]['ID'] # extract subject ID
    
    # transform sections into dataframes:
    bioinfo = pd.DataFrame.from_dict(participant[1], orient='index')
    bioinfo = bioinfo.transpose()
    bioinfo.rename(columns = {'Età':'Age', 'Sesso':'Sex', 'Formazione':'Education'},inplace=True)
    bioinfo['sbj_ID'] = sbj_ID # add sbj ID column
    
    history = pd.DataFrame.from_dict(participant[2], orient='index')
    history = history.transpose()
    
    use = pd.DataFrame.from_dict(participant[3], orient='index')
    use = use.transpose()
    
    proficiency = pd.DataFrame.from_dict(participant[4], orient='index')
    proficiency = proficiency.transpose()
    
    attitude = pd.DataFrame.from_dict(participant[5], orient='index')
    attitude = attitude.transpose()
    
    # combine section dataframes into a BLP dataframe
    participant_BLP_data = pd.concat([bioinfo, history, use, proficiency, attitude], axis =1)
    col2 = participant_BLP_data.pop('sbj_ID') # move sbj_ID column to beginning
    participant_BLP_data.insert(0, 'sbj_ID', col2)

    # run code to score responses
    participant_BLP_data_scored = BLP_preprocessing(participant_BLP_data)
    
    # display completion message
    print(f'Finished pre-processing participant {sbj_ID} responses')
    
    # add participant scores to big BLP dataframe
    all_BLP_data = pd.concat([all_BLP_data, participant_BLP_data_scored],axis = 0)
    
### TESTING PRE-PROCESSING ###
testing_data = []
for x in range(len(all_data)): # extract testing responses
    participant_data = all_data[x]
    participant_testing_data = []
    for y in participant_data.keys():
        line = participant_data[y]
        if type(line['response']) == str and line['response'] != ' ' and line['task'] != 'testing' and line['task'] != 'familiarity':
            response_line = json.loads(line['response']) # convert from string to dict
        if line['trial_type'] == 'survey-html-form' and 'ID' in response_line.keys():
            participant_testing_data.append(line)
        if line['task'] == 'testing':
            participant_testing_data.append(line)
    if len(participant_testing_data) != 41:
        print("Warning: participant_testing_data doesn't have 41 items!")
    testing_data.append(participant_testing_data)
    
def testing_scoring(testing_data):
    '''
    Scores testing data.

    Parameters
    ----------
    testing_data : LIST
        List of raw participant responses.

    Returns
    -------
    testing_data_scored : LIST
        List of scored participant responses.
    '''

participant_testing_data_scored = pd.DataFrame()
all_testing_data_scored = pd.DataFrame()
for x in range(len(testing_data)):
    participant_testing_data = testing_data[x]
    ID_line = json.loads(participant_testing_data[0]['response'])
    sbj_ID = ID_line['ID']
    for y in range(1,41):
        trial = participant_testing_data[y]
        trialn = y
        if trial['correct_response'] == 'k':
            expected = 0
        if trial['correct_response'] == 'd':
            expected = 1
        if trial['response'] == 'k':
            observed = 0
        if trial['response'] == 'd':
            observed = 1
        trial_dict = {'sbj_ID':sbj_ID, 'trialn':trialn, 'item':trial['item'], 'expected':expected, 'observed':observed, 'correct':trial['correct'], 'rt':trial['rt']}
        trial_dict = {k:[v] for k,v in trial_dict.items()} # avoiding index error
        participant_testing_data_scored = pd.DataFrame(trial_dict)
        all_testing_data_scored = pd.concat([all_testing_data_scored, participant_testing_data_scored],axis = 0)
if all_testing_data_scored.shape[0] == (40*len(testing_data)):
    print('Finished pre-processing testing responses')

### FAMILIARITY PRE-PROCESSING ###