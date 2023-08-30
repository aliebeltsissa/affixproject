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
    if file_number < 40: # if part of first 40 participant files in Italian
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
                
    else: # if part of more recent versions in English
        BLP_data2 = BLP_file.replace({"AoAL1": AoA12_mapping, "AoAL2": AoA12_mapping, "AoAL3": AoA12_mapping, "AoAL4": AoA12_mapping})
        BLP_data3 = BLP_data2.replace({"AoEaseL1": AoA12_mapping, "AoEaseL2": AoA12_mapping, "AoEaseL3": AoA12_mapping, "AoEaseL4": AoA12_mapping})
        AoA_mapping = {"20+": 20, "19": 19, "18": 18, "17": 17, "16": 16, "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9, "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1, "0": 0}
        BLP_data2 = BLP_data3.replace({"yearsEduL1": AoA_mapping, "yearsEduL2": AoA_mapping, "yearsEduL3": AoA_mapping, "yearsEduL4": AoA_mapping})
        BLP_data3 = BLP_data2.replace({"yearsCountryL1": AoA_mapping, "yearsCountryL2": AoA_mapping, "yearsCountryL3": AoA_mapping, "yearsCountryL4": AoA_mapping})
        BLP_data2 = BLP_data3.replace({"yearsFamilyL1": AoA_mapping, "yearsFamilyL2": AoA_mapping, "yearsFamilyL3": AoA_mapping, "yearsFamilyL4": AoA_mapping})
        BLP_data3 = BLP_data2.replace({"yearsWorkL1": AoA_mapping, "yearsWorkL2": AoA_mapping, "yearsWorkL3": AoA_mapping, "yearsWorkL4": AoA_mapping})
        
        percent_mapping = {"0": 0, "10": 1, "20": 2, "30": 3, "40": 4, "50": 5, "60": 6, "70": 7, "80": 8, "90": 9, "100": 10}
        BLP_data2 = BLP_data3.replace({"PercFriendsL1": percent_mapping, "PercFriendsL2": percent_mapping, "PercFriendsL3": percent_mapping, "PercFriendsL4": percent_mapping})
        BLP_data3 = BLP_data2.replace({"PercFamilyL1": percent_mapping, "PercFamilyL2": percent_mapping, "PercFamilyL3": percent_mapping, "PercFamilyL4": percent_mapping})
        BLP_data2 = BLP_data3.replace({"PercWorkL1": percent_mapping, "PercWorkL2": percent_mapping, "PercWorkL3": percent_mapping, "PercWorkL4": percent_mapping})
        BLP_data3 = BLP_data2.replace({"PercSelfL1": percent_mapping, "PercSelfL2": percent_mapping, "PercSelfL3": percent_mapping, "PercSelfL4": percent_mapping})
        BLP_data2 = BLP_data3.replace({"PercCountL1": percent_mapping, "PercCountL2": percent_mapping, "PercCountL3": percent_mapping, "PercCountL4": percent_mapping})
        
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
        all_use_scoreL1 = []
        all_use_scoreL2 = []
        all_use_scoreL3 = []
        all_use_scoreL4 = []
        use_scoreL1 = (BLP_data2["PercFriendsL1"][0] + BLP_data2["PercFamilyL1"][0] + BLP_data2["PercWorkL1"][0] + BLP_data2["PercSelfL1"][0] + BLP_data2["PercCountL1"][0])*1.09
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
    try:
        bioinfo.rename(columns = {'Età':'Age', 'Sesso':'Gender', 'Formazione':'Education'},inplace=True)
    except KeyError:
        print('Moving on to pilot 5 data')
    bioinfo['sbj_ID'] = sbj_ID # add sbj ID column
    bioinfo['task'] = 'BLP'
    
    history = pd.DataFrame.from_dict(participant[2], orient='index')
    history = history.transpose()
    
    if x < 40:
        use = pd.DataFrame.from_dict(participant[3], orient='index')
        use = use.transpose()
        
        proficiency = pd.DataFrame.from_dict(participant[4], orient='index')
        proficiency = proficiency.transpose()
        
        attitude = pd.DataFrame.from_dict(participant[5], orient='index')
        attitude = attitude.transpose()
    else:
        use_1 = pd.DataFrame.from_dict(participant[3], orient='index')
        use_1 = use_1.transpose()
        use_2 = pd.DataFrame.from_dict(participant[4], orient='index')
        use_2 = use_2.transpose()
        use = pd.concat([use_1,use_2])
        use.drop (index = 0, inplace= True)
        
        proficiency = pd.DataFrame.from_dict(participant[5], orient='index')
        proficiency = proficiency.transpose()
        
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
for x in range(len(all_data)): # extract testing responses
    participant_data = all_data[x]
    participant_testing_data = []
    for y in participant_data.keys():
        line = participant_data[y]
        if type(line['response']) == str and line['response'] != ' ' and line['task'] != 'testing' and line['task'] != 'familiarity' and len(line['response']) > 20:
            response_line = json.loads(line['response']) # convert from string to dict
        if line['trial_type'] == 'survey-html-form' and 'ID' in response_line.keys():
            participant_testing_data.append(line)
        if line['trial_type'] == 'survey-html-form' and 'testing_strategy' in response_line.keys():
            participant_testing_data.append(line)
        if line['task'] == 'testing':
            participant_testing_data.append(line)
    if len(participant_testing_data) != 42 and len(participant_testing_data) != 122:
        print("Warning: participant_testing_data doesn't have correct number of items!")
    testing_data.append(participant_testing_data)
    
def testing_scoring(testing_data):
    '''
    Scores testing data.

    Parameters
    ----------
    testing_data : LIST
        List of raw participant testing responses.

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
        if x < 41:
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
                trial_dict = {'sbj_ID':sbj_ID, 'task':'testing', 'testing_condition':'2M', 'trialn':trialn, 'item':trial['item'], 'expected':expected, 'observed':observed, 'correct':trial['correct'], 'rt':trial['rt'], 'strategy':strat}
                trial_dict = {k:[v] for k,v in trial_dict.items()} # avoiding index error
                participant_testing_data_scored = pd.DataFrame(trial_dict)
                all_testing_data_scored = pd.concat([all_testing_data_scored, participant_testing_data_scored],axis = 0)
        else:
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
    return all_testing_data_scored

all_testing_data_scored = testing_scoring(testing_data)
all_testing_data_scored = all_testing_data_scored.sort_values(by=['sbj_ID','trialn'])
if all_testing_data_scored.shape[0] == (40*len(testing_data)):
    print('Finished pre-processing testing responses')

### FAMILIARITY PRE-PROCESSING ###
familiarity_data = []
for x in range(len(all_data)): # extract testing responses
    participant_data = all_data[x]
    participant_familiarity_data = []
    for y in participant_data.keys():
        line = participant_data[y]
        if type(line['response']) == str and line['response'] != ' ' and line['task'] != 'testing' and line['task'] != 'familiarity' and len(line['response']) > 20:
            response_line = json.loads(line['response']) # convert from string to dict
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
all_familiarity_data_scored.to_csv('C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\familiarity_preprocessed.csv', index=True, header=True)
all_testing_data_scored.to_csv('C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\testing_preprocessed.csv', index=True, header=True)
all_BLP_data.to_csv('C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\BLP_preprocessed.csv', index=True, header=True)