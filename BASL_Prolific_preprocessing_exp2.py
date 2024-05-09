### IMPORTING ###
from os import listdir, chdir
from os.path import isfile
chdir("C:\\Users\\annal\\Downloads\\test_data") # set working directory to responses folder
allfiles = [f for f in listdir() if isfile(f)] # get all file names

import pandas as pd
all_data = []
column_names = ['rt','response','trial_type','time_elapsed','internal_node_id','run_id','condition','recorded_at','source_code_version','ip','user_agent','device','browser','browser_version','platform','platform_version','referer','accept_language','PROLIFIC_PID','STUDY_ID','SESSION_ID','subject_id','study_id','session_id','stimulus','success','word','new_stim','input','stimuli','item','task','correct_response','testing_condition','correct','target','confound','name','view_history']
for file in allfiles:
    df = pd.read_csv(file, index_col=3) # separate into each line
    temp = df.to_dict("split")
    temp = dict(zip(temp["index"], temp["data"]))
    temp_length = len(temp.values())
    for x in range(temp_length): # replace response by column: reponse dictionary
        values = [i for i in temp.values()]
        value = values[x]
        value2 = {column_names[x]: value[x] for x in range(len(column_names))}
        temp[x] = value2
    all_data.append(temp)
if len(all_data) != len(allfiles):
    print('Not all data extracted!')
   
### BLP PRE-PROCESSING ###
import json, ast
BLP_data = []
for x in range(len(all_data)): # extract BLP responses
    participant_data = all_data[x]
    participant_BLP_data = []
    for y in participant_data.keys(): # weird bug with fullscreen closure line being a list instead of a dictionary: so discard
        line = participant_data[y]
        if type(line) == list and line[0] == 'fullscreen':
            continue
        if line['trial_type'] == 'survey-html-form':
            response_line = ast.literal_eval(line['response']) # convert from string to dict
            if  'consent1' not in response_line.keys() and 'testing_strategy' not in response_line.keys():
                participant_BLP_data.append(response_line)
    BLP_data.append(participant_BLP_data)
    
def BLP_preprocessing(BLP_file, file_number):
    '''
    Function taking a DataFrame of BLP data & scoring responses

    Parameters
    ----------
    BLP_file : DATAFRAME
        Raw DataFrame of BLP data for one participant.
    file_number : INTEGER
        Participant number

    Returns
    -------
    BLP_data2 : DATAFRAME
        Sorted & scored DataFrame with a line per participant.
    '''
    # replacing individual responses with their equivalent score
    AoA12_mapping = {"20+": 0, "19": 1, "18": 2, "17": 3, "16": 4, "15": 5, "14": 6, "13": 7, "12": 8, "11": 9, "10": 10, "9": 11, "8": 12, "7": 13, "6": 14, "5": 15, "4": 16, "3": 17, "2": 18, "1": 19, "0": 20, "Dalla nascita": 20, "Da quando ne ho ricordo": 20, "notyet": 0}
    BLP_data2 = BLP_file.replace({"AoAL1": AoA12_mapping, "AoAL2": AoA12_mapping, "AoAL3": AoA12_mapping, "AoAL4": AoA12_mapping})
    BLP_data3 = BLP_data2.replace({"AoEaseL1": AoA12_mapping, "AoEaseL2": AoA12_mapping, "AoEaseL3": AoA12_mapping, "AoEaseL4": AoA12_mapping})
    AoA_mapping = {"20+": 20, "19": 19, "18": 18, "17": 17, "16": 16, "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9, "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1, "0": 0}
    BLP_data2 = BLP_data3.replace({"yearsEduL1": AoA_mapping, "yearsEduL2": AoA_mapping, "yearsEduL3": AoA_mapping, "yearsEduL4": AoA_mapping})
    BLP_data3 = BLP_data2.replace({"yearsCountryL1": AoA_mapping, "yearsCountryL2": AoA_mapping, "yearsCountryL3": AoA_mapping, "yearsCountryL4": AoA_mapping})
    BLP_data2 = BLP_data3.replace({"yearsFamilyL1": AoA_mapping, "yearsFamilyL2": AoA_mapping, "yearsFamilyL3": AoA_mapping, "yearsFamilyL4": AoA_mapping})
    BLP_data3 = BLP_data2.replace({"yearsWorkL1": AoA_mapping, "yearsWorkL2": AoA_mapping, "yearsWorkL3": AoA_mapping, "yearsWorkL4": AoA_mapping})
    
    cols = ["PercFriendsL1","PercFriendsL2","PercFriendsL3","PercFriendsL4","PercFamilyL1","PercFamilyL2","PercFamilyL3","PercFamilyL4","PercWorkL1","PercWorkL2","PercWorkL3","PercWorkL4","PercSelfL1","PercSelfL2","PercSelfL3","PercSelfL4","PercCountL1","PercCountL2","PercCountL3","PercCountL4"]
    existing_cols = [col for col in cols if col in BLP_data3.columns]
    BLP_data3.loc[:, existing_cols] = BLP_data3.loc[:, existing_cols].apply(pd.to_numeric)
    BLP_data3.loc[:, existing_cols] = BLP_data3.loc[:, existing_cols] / 10
    BLP_data2 = BLP_data3.copy()
    
    # HISTORY
    all_history_scoreL1 = []
    all_history_scoreL2 = []
    all_history_scoreL3 = []
    all_history_scoreL4 = []
    BLP_data2 = BLP_data2.astype({"AoAL1":"int","AoEaseL1":"int","yearsEduL1":"int","yearsCountryL1":"int","yearsFamilyL1":"int","yearsWorkL1":"int"}) # transform scores into integers
    history_scoreL1 = (BLP_data2["AoAL1"][0] + BLP_data2["AoEaseL1"][0] + BLP_data2["yearsEduL1"][0] + BLP_data2["yearsCountryL1"][0] + BLP_data2["yearsFamilyL1"][0] + BLP_data2["yearsWorkL1"][0])*0.454
    try:
        BLP_data2 = BLP_data2.astype({"AoAL2":"int","AoEaseL2":"int","yearsEduL2":"int","yearsCountryL2":"int","yearsFamilyL2":"int","yearsWorkL2":"int"})
        history_scoreL2 = (BLP_data2["AoAL2"][0] + BLP_data2["AoEaseL2"][0] + BLP_data2["yearsEduL2"][0] + BLP_data2["yearsCountryL2"][0] + BLP_data2["yearsFamilyL2"][0] + BLP_data2["yearsWorkL2"][0])*0.454
    except KeyError: # if participant doesn't have L2 (so L2 questions weren't displayed - so have no data)
        history_scoreL2 = 0            
    try:
        BLP_data2 = BLP_data2.astype({"AoAL3":"int","AoEaseL3":"int","yearsEduL3":"int","yearsCountryL3":"int","yearsFamilyL3":"int","yearsWorkL3":"int"})
        history_scoreL3 = (BLP_data2["AoAL3"][0] + BLP_data2["AoEaseL3"][0] + BLP_data2["yearsEduL3"][0] + BLP_data2["yearsCountryL3"][0] + BLP_data2["yearsFamilyL3"][0] + BLP_data2["yearsWorkL3"][0])*0.454
    except KeyError:
        history_scoreL3 = 0  
    try:
        BLP_data2 = BLP_data2.astype({"AoAL4":"int","AoEaseL4":"int","yearsEduL4":"int","yearsCountryL4":"int","yearsFamilyL4":"int","yearsWorkL4":"int"})
        history_scoreL4 = (BLP_data2["AoAL4"][0] + BLP_data2["AoEaseL4"][0] + BLP_data2["yearsEduL4"][0] + BLP_data2["yearsCountryL4"][0] + BLP_data2["yearsFamilyL4"][0] + BLP_data2["yearsWorkL4"][0])*0.454
    except KeyError:
        history_scoreL4 = 0
        all_history_scoreL1.append(history_scoreL1)
        all_history_scoreL2.append(history_scoreL2)
        all_history_scoreL3.append(history_scoreL3)
        all_history_scoreL4.append(history_scoreL4)
            
    # USE
    variables = ["PercFriendsL1", "PercFriendsL2", "PercFriendsL3", "PercFriendsL4", 
                "PercFamilyL1", "PercFamilyL2", "PercFamilyL3", "PercFamilyL4", 
                "PercWorkL1", "PercWorkL2", "PercWorkL3", "PercWorkL4", 
                "PercSelfL1", "PercSelfL2", "PercSelfL3", "PercSelfL4", 
                "PercCountL1", "PercCountL2", "PercCountL3", "PercCountL4"]
    for var in variables: # fixing issue with some numbers being strings
        try: 
            BLP_data2.loc[0, var] = int(BLP_data2.loc[0, var])
        except KeyError:
            continue
        
    all_use_scoreL1 = []
    all_use_scoreL2 = []
    all_use_scoreL3 = []
    all_use_scoreL4 = []
    try:
        use_scoreL1 = (BLP_data2["PercFriendsL1"][0] + BLP_data2["PercFamilyL1"][0] + BLP_data2["PercWorkL1"][0] + BLP_data2["PercSelfL1"][0] + BLP_data2["PercCountL1"][0])*1.09
    except TypeError:
        print(BLP_data2["PercFriendsL1"][0], type(BLP_data2["PercFriendsL1"][0]))
        print(BLP_data2["PercFamilyL1"][0], type(BLP_data2["PercFamilyL1"][0]))
        print(BLP_data2["PercWorkL1"][0], type(BLP_data2["PercWorkL1"][0]))
        print(BLP_data2["PercSelfL1"][0], type(BLP_data2["PercSelfL1"][0]))
        print(BLP_data2["PercCountL1"][0], type(BLP_data2["PercCountL1"][0]))
    try:
        use_scoreL2 = (BLP_data2["PercFriendsL2"][0] + BLP_data2["PercFamilyL2"][0] + BLP_data2["PercWorkL2"][0] + BLP_data2["PercSelfL2"][0] + BLP_data2["PercCountL2"][0])*1.09
    except KeyError:
        use_scoreL2 = 0
    try:
        use_scoreL3 = (BLP_data2["PercFriendsL3"][0] + BLP_data2["PercFamilyL1"][0] + BLP_data2["PercWorkL3"][0] + BLP_data2["PercSelfL3"][0] + BLP_data2["PercCountL3"][0])*1.09
    except KeyError:
        use_scoreL3 = 0
    try:
        use_scoreL4 = (BLP_data2["PercFriendsL4"][0] + BLP_data2["PercFamilyL4"][0] + BLP_data2["PercWorkL4"][0] + BLP_data2["PercSelfL4"][0] + BLP_data2["PercCountL4"][0])*1.09
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
    BLP_data2 = BLP_data2.astype({"ProfSpeakL1":"int","ProfUnderstandL1":"int","ProfReadL1":"int","ProfWriteL1":"int"})
    proficiency_scoreL1 = (BLP_data2["ProfSpeakL1"][0] + BLP_data2["ProfUnderstandL1"][0] + BLP_data2["ProfReadL1"][0] + BLP_data2["ProfWriteL1"][0])*2.27
    try:
        BLP_data2 = BLP_data2.astype({"ProfSpeakL2":"int","ProfUnderstandL2":"int","ProfReadL2":"int","ProfWriteL2":"int"})
        proficiency_scoreL2 = (BLP_data2["ProfSpeakL2"][0] + BLP_data2["ProfUnderstandL2"][0] + BLP_data2["ProfReadL2"][0] + BLP_data2["ProfWriteL2"][0])*2.27
    except KeyError:
        proficiency_scoreL2 = 0
    try:
        BLP_data2 = BLP_data2.astype({"ProfSpeakL3":"int","ProfUnderstandL3":"int","ProfReadL3":"int","ProfWriteL3":"int"})
        proficiency_scoreL3 = (BLP_data2["ProfSpeakL3"][0] + BLP_data2["ProfUnderstandL3"][0] + BLP_data2["ProfReadL3"][0] + BLP_data2["ProfWriteL3"][0])*2.27
    except KeyError:
        proficiency_scoreL3 = 0
    try:
        BLP_data2 = BLP_data2.astype({"ProfSpeakL4":"int","ProfUnderstandL4":"int","ProfReadL4":"int","ProfWriteL4":"int"})
        proficiency_scoreL4 = (BLP_data2["ProfSpeakL4"][0] + BLP_data2["ProfUnderstandL4"][0] + BLP_data2["ProfReadL4"][0] + BLP_data2["ProfWriteL4"][0])*2.27
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
    
    BLP_data2 = BLP_data2.astype({"AttSelfL1":"int","AttCultureL1":"int","AttNativeLevelL1":"int","AttMothertongueL1":"int"})
    attitude_scoreL1 = (BLP_data2["AttSelfL1"][0] + BLP_data2["AttCultureL1"][0] + BLP_data2["AttNativeLevelL1"][0] + BLP_data2["AttMothertongueL1"][0])*2.27
    try:
        BLP_data2 = BLP_data2.astype({"AttSelfL2":"int","AttCultureL2":"int","AttNativeLevelL2":"int","AttMothertongueL2":"int"})
        attitude_scoreL2 = (BLP_data2["AttSelfL2"][0] + BLP_data2["AttCultureL2"][0] + BLP_data2["AttNativeLevelL2"][0] + BLP_data2["AttMothertongueL2"][0])*2.27
    except KeyError:
        attitude_scoreL2 = 0
    try:
        BLP_data2 = BLP_data2.astype({"AttSelfL3":"int","AttCultureL3":"int","AttNativeLevelL3":"int","AttMothertongueL3":"int"})
        attitude_scoreL3 = (BLP_data2["AttSelfL3"][0] + BLP_data2["AttCultureL3"][0] + BLP_data2["AttNativeLevelL3"][0] + BLP_data2["AttMothertongueL3"][0])*2.27
    except KeyError:
        attitude_scoreL3 = 0
    try:
        BLP_data2 = BLP_data2.astype({"AttSelfL4":"int","AttCultureL4":"int","AttNativeLevelL4":"int","AttMothertongueL4":"int"})
        attitude_scoreL4 = (BLP_data2["AttSelfL4"][0] + BLP_data2["AttCultureL4"][0] + BLP_data2["AttNativeLevelL4"][0] + BLP_data2["AttMothertongueL4"][0])*2.27
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

def getDuplicateColumns(df):
    duplicateColumnNames = set()
    for x in range(df.shape[1]):
        col = df.iloc[:, x]
        for y in range(x + 1, df.shape[1]):
            otherCol = df.iloc[:, y]
            if col.equals(otherCol):
                duplicateColumnNames.add(df.columns.values[y])
    return list(duplicateColumnNames)

all_BLP_data = pd.DataFrame() # empty dataframe
for x in range(len(BLP_data)): # for each participant datafile
    participant = BLP_data[x]
    sbj_ID = participant[0]['ID'] # extract subject ID
    
    # transform sections into dataframes:
    bioinfo = pd.DataFrame.from_dict(participant[1], orient='index')
    bioinfo = bioinfo.transpose()

    bioinfo['sbj_ID'] = sbj_ID # add sbj ID column
    bioinfo['task'] = 'BLP'
    
    history = pd.DataFrame.from_dict(participant[2], orient='index')
    history = history.transpose()
    
    use = pd.DataFrame.from_dict(participant[3], orient='index')
    use = use.transpose()
        
    if len(participant) == 6:
        proficiency = pd.DataFrame.from_dict(participant[4], orient='index')
    elif len(participant) == 7:
        proficiency = pd.DataFrame.from_dict(participant[5], orient='index')
    proficiency = proficiency.transpose()
    
    if len(participant) == 6:
        attitude = pd.DataFrame.from_dict(participant[5], orient='index')
    elif len(participant) == 7:
        attitude = pd.DataFrame.from_dict(participant[6], orient='index')
    attitude = attitude.transpose()

    # combine section dataframes into a BLP dataframe
    participant_BLP_data = pd.concat([bioinfo, history, use, proficiency, attitude], axis =1)
    col2 = participant_BLP_data.pop('sbj_ID') # move sbj_ID column to beginning
    participant_BLP_data.insert(0, 'sbj_ID', col2)

    # run code to score responses
    participant_BLP_data_scored = BLP_preprocessing(participant_BLP_data, x)
    
    # display completion message
    print(f'Finished pre-processing participant {sbj_ID} BLP responses ({x+1}/{len(BLP_data)})')
    
    # add participant scores to big BLP dataframe
    all_BLP_data = pd.concat([all_BLP_data, participant_BLP_data_scored],axis = 0)
    
all_BLP_data = all_BLP_data.sort_values(by='sbj_ID')

### TESTING PRE-PROCESSING ###
testing_data = []
training_data = []
for x in range(len(all_data)): # extract testing responses
    participant_data = all_data[x]
    participant_testing_data = []
    participant_training_stim = []
    for y in participant_data.keys():
        line = participant_data[y]
        if type(line) == list and line[0] == 'fullscreen':
            continue
        if type(line['response']) == str and line['response'] != ' ' and line['task'] != 'testing' and line['task'] != 'familiarity' and len(line['response']) > 15: # CHANGE BACK TO 20 
            response_line = ast.literal_eval(line['response']) # convert from string to dict
        if line['trial_type'] == 'survey-html-form' and 'ID' in response_line.keys():
            participant_testing_data.append(line)
            participant_training_stim.append(line)
        if line['trial_type'] == 'survey-html-form' and 'testing_strategy' in response_line.keys():
            participant_testing_data.append(line)
        if line['trial_type'] == 'html-keyboard-response' and line['task'] != 'testing' and type(line['stimulus']) == str:
            if line['stimulus'][0:46] == '<p style="font-size: 60px; font-family: BACS">':
                participant_training_stim.append(line['stimulus'][46:-4])
        if line['task'] == 'testing':
            participant_testing_data.append(line)
    if len(participant_testing_data) != 122:
        print("Warning: participant_testing_data doesn't have correct number of items!")
    testing_data.append(participant_testing_data)
    training_data.append(participant_training_stim)
    
    
def testing_scoring(testing_data):
    '''
    Scores testing data.

    Parameters
    ----------
    testing_data : LIST
        List of raw participant testing responses.
    training_repeated : LIST
        List of participants with repeated training words.

    Returns
    -------
    all_testing_data_scored : DataFrame
        List of scored participant testing responses.
    '''
    participant_testing_data_scored = pd.DataFrame()
    all_testing_data_scored = pd.DataFrame()
    for x in range(len(testing_data)):
        participant_testing_data = testing_data[x]
        ID_line = json.loads(participant_testing_data[0]['response'])
        sbj_ID = ID_line['ID']
        strat_line = json.loads(participant_testing_data[-1]['response'])
        strat = strat_line['testing_strategy']
        for y in range(1,121):
            trial = participant_testing_data[y]
            trialn = y
            condition = 0
            if trial['testing_condition'] == '["morphemeXmorpheme"]':
                condition = '2M'
                if trial['correct_response'] == 'k':
                    expected = 0
                if trial['correct_response'] == 'd':
                    expected = 1
                if trial['response'] == 'k':
                    observed = 0
                if trial['response'] == 'd':
                     observed = 1
            if trial['testing_condition'] == '["morphemeXmorcode"]' or trial['testing_condition'] == '["morcodeXmorpheme"]':
                condition = '1M'
                expected = 0
                if trial['response'] == 'k':
                    observed = 0
                if trial['response'] == 'd':
                    observed = 1
            if trial['testing_condition'] == '["morcodeXmorcode"]':
                condition = '0M'
                expected = 1
                if trial['response'] == 'k':
                    observed = 0
                if trial['response'] == 'd':
                    observed = 1
            trial_dict = {'sbj_ID':sbj_ID, 'task':'testing', 'testing_condition':condition, 'trialn':trialn, 'item':trial['item'], 'expected':expected, 'observed':observed, 'correct':trial['correct'], 'rt':trial['rt'], 'strategy':strat}
            trial_dict = {k:[v] for k,v in trial_dict.items()} # avoiding index error
            participant_testing_data_scored = pd.DataFrame(trial_dict)
            all_testing_data_scored = pd.concat([all_testing_data_scored, participant_testing_data_scored],axis = 0)
        print(f'Finished pre-processing testing data {x+1}/{len(testing_data)}')
    return all_testing_data_scored

all_testing_data_scored = testing_scoring(testing_data)
all_testing_data_scored = all_testing_data_scored.sort_values(by=['sbj_ID','trialn'])
if all_testing_data_scored.shape[0] != 0:
    print('Finished pre-processing testing responses')

### FAMILIARITY PRE-PROCESSING ###
familiarity_data = []
for x in range(len(all_data)): # extract testing responses
    participant_data = all_data[x]
    participant_familiarity_data = []
    for y in participant_data.keys():
        line = participant_data[y]
        if type(line) == list and line[0] == 'fullscreen':
            continue
        if type(line['response']) == str and line['response'] != ' ' and line['task'] != 'testing' and line['task'] != 'familiarity' and len(line['response']) > 15: # CHANGE BACK TO 20!
            response_line = ast.literal_eval(line['response']) # convert from string to dict
        if line['trial_type'] == 'survey-html-form' and 'ID' in response_line.keys():
            participant_familiarity_data.append(line)
        if line['task'] == 'familiarity':
            participant_familiarity_data.append(line)
    if len(participant_familiarity_data) != 31:
        print("Warning: participant_testing_data doesn't have 31 items!")
    familiarity_data.append(participant_familiarity_data)
    
def familiarity_scoring(familiarity_data):
    '''
    Scores familiarity data.

    Parameters
    ----------
    familiarity_data : LIST
        List of raw participant familiarity responses.

    Returns
    -------
    all_familiarity_data_scored : DataFrame
        List of scored participant familiarity responses.
    '''
    participant_familiarity_data_scored = pd.DataFrame()
    all_familiarity_data_scored = pd.DataFrame()
    for x in range(len(familiarity_data)):
        participant_familiarity_data = familiarity_data[x]
        ID_line = json.loads(participant_familiarity_data[0]['response'])
        sbj_ID = ID_line['ID']
        if sbj_ID == "5e42f03607b468000d8eb9125e42f03607b468000d8eb912":
            sbj_ID = "5e42f03607b468000d8eb912"
        for y in range(1,31):
            trial = participant_familiarity_data[y]
            trialn = y
            if trial['correct_response'] == 'k':
                expected = 0
            if trial['correct_response'] == 'd':
                expected = 1
            if trial['response'] == 'k':
                observed = 0
            if trial['response'] == 'd':
                observed = 1
            trial_dict = {'sbj_ID':sbj_ID, 'task':'familiarity', 'trialn':trialn, 'target':trial['target'], 'confound':trial['confound'], 'expected':expected, 'observed':observed, 'correct':trial['correct'], 'rt':trial['rt']}
            trial_dict = {k:[v] for k,v in trial_dict.items()} # avoiding index error
            participant_familiarity_data_scored = pd.DataFrame(trial_dict)
            all_familiarity_data_scored = pd.concat([all_familiarity_data_scored, participant_familiarity_data_scored],axis = 0)
    return all_familiarity_data_scored

all_familiarity_data_scored = familiarity_scoring(familiarity_data)
all_familiarity_data_scored = all_familiarity_data_scored.sort_values(by=['sbj_ID','trialn'])
if all_familiarity_data_scored.shape[0] == (30*len(familiarity_data)):
    print('Finished pre-processing familiarity responses')

### EXPORTING ###
all_familiarity_data_scored.to_csv("C:\\Users\\annal\\Downloads\\test_data\\familiarity_preprocessed.csv", index=True, header=True)
all_testing_data_scored.to_csv("C:\\Users\\annal\\Downloads\\test_data\\testing_preprocessed.csv", index=True, header=True)
all_BLP_data.to_csv("C:\\Users\\annal\\Downloads\\test_data\\BLP_preprocessed.csv", index=True, header=True)