# pilot 1 data
import os
os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Pilot1_data") # set working directory to responses folder

import pandas as pd
BLP_data_pilot1 = pd.read_csv("BLP_sbjs1-7.csv", index_col=1)
BLP_data_pilot1.drop('Luogo attuale di residenza: Città.1', inplace=True, axis=1)
BLP_data_pilot1.columns = ['Timestamp', 'Age', 'Sex', 'City', 'Country', 'MaxEdu', 'L1', 'L2', 'L3', 'L4', 'otherLs', 
                    'AoAL1', 'AoAL2', 'AoAL3', 'AoAL4', 'AoAgioL1', 'AoAgioL2', 'AoAgioL3', 'AoAgioL4', 'AnniInstiL1', 'AnniInstiL2', 'AnniInstiL3', 'AnniInstiL4', 'AnniPaeseL1', 'AnniPaeseL2', 'AnniPaeseL3', 'AnniPaeseL4', 'AnniFamigliaL1', 'AnniFamigliaL2', 'AnniFamigliaL3', 'AnniFamigliaL4', 'AnniLavoroL1', 'AnniLavoroL2', 'AnniLavoroL3', 'AnniLavoroL4', 
                    'PercentAmiciL1', 'PercentAmiciL2', 'PercentAmiciL3', 'PercentAmiciL4', 'PercentFamigliaL1', 'PercentFamigliaL2', 'PercentFamigliaL3', 'PercentFamigliaL4', 'PercentLavoroL1', 'PercentLavoroL2', 'PercentLavoroL3', 'PercentLavoroL4', 'PercentStessoL1', 'PercentStessoL2', 'PercentStessoL3', 'PercentStessoL4', 'PercentCalcoliL1', 'PercentCalcoliL2', 'PercentCalcoliL3', 'PercentCalcoliL4',
                    'ParlaL1', 'ParlaL2', 'ParlaL3', 'ParlaL4', 'CapisceL1', 'CapisceL2', 'CapisceL3', 'CapisceL4', 'LeggeL1', 'LeggeL2', 'LeggeL3', 'LeggeL4', 'ScriveL1', 'ScriveL2', 'ScriveL3', 'ScriveL4',
                    'SentoStessoL1', 'SentoStessoL2', 'SentoStessoL3', 'SentoStessoL4', 'CulturaL1', 'CulturaL2', 'CulturaL3', 'CulturaL4', 'LivelloL1', 'LivelloL2', 'LivelloL3', 'LivelloL4', 'MadrelinguaL1', 'MadrelinguaL2', 'MadrelinguaL3', 'MadrelinguaL4',
                    'AttentionCheck']

os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Pilot2_data")
import pandas as pd
BLP_data_pilot2 = pd.read_csv("BLP_sbjs8-15.csv", index_col=1)
BLP_data_pilot2.drop('Luogo attuale di residenza: Città.1', inplace=True, axis=1)
BLP_data_pilot2.columns = ['Timestamp', 'Age', 'Sex', 'City', 'Country', 'MaxEdu', 'L1', 'L2', 'L3', 'L4', 'otherLs', 
                    'AoAL1', 'AoAL2', 'AoAL3', 'AoAL4', 'AoAgioL1', 'AoAgioL2', 'AoAgioL3', 'AoAgioL4', 'AnniInstiL1', 'AnniInstiL2', 'AnniInstiL3', 'AnniInstiL4', 'AnniPaeseL1', 'AnniPaeseL2', 'AnniPaeseL3', 'AnniPaeseL4', 'AnniFamigliaL1', 'AnniFamigliaL2', 'AnniFamigliaL3', 'AnniFamigliaL4', 'AnniLavoroL1', 'AnniLavoroL2', 'AnniLavoroL3', 'AnniLavoroL4', 
                    'PercentAmiciL1', 'PercentAmiciL2', 'PercentAmiciL3', 'PercentAmiciL4', 'PercentFamigliaL1', 'PercentFamigliaL2', 'PercentFamigliaL3', 'PercentFamigliaL4', 'PercentLavoroL1', 'PercentLavoroL2', 'PercentLavoroL3', 'PercentLavoroL4', 'PercentStessoL1', 'PercentStessoL2', 'PercentStessoL3', 'PercentStessoL4', 'PercentCalcoliL1', 'PercentCalcoliL2', 'PercentCalcoliL3', 'PercentCalcoliL4',
                    'ParlaL1', 'ParlaL2', 'ParlaL3', 'ParlaL4', 'CapisceL1', 'CapisceL2', 'CapisceL3', 'CapisceL4', 'LeggeL1', 'LeggeL2', 'LeggeL3', 'LeggeL4', 'ScriveL1', 'ScriveL2', 'ScriveL3', 'ScriveL4',
                    'SentoStessoL1', 'SentoStessoL2', 'SentoStessoL3', 'SentoStessoL4', 'CulturaL1', 'CulturaL2', 'CulturaL3', 'CulturaL4', 'LivelloL1', 'LivelloL2', 'LivelloL3', 'LivelloL4', 'MadrelinguaL1', 'MadrelinguaL2', 'MadrelinguaL3', 'MadrelinguaL4',
                    'AttentionCheck']

os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Pilot3_data")
import pandas as pd
BLP_data_pilot3 = pd.read_csv("BLP_sbjs16-22.csv", index_col=1)
BLP_data_pilot3.columns = ['Timestamp', 'Age', 'Sex', 'City', 'Country', 'MaxEdu', 'L1', 'L2', 'L3', 'L4', 'otherLs', 
                    'AoAL1', 'AoAL2', 'AoAL3', 'AoAL4', 'AoAgioL1', 'AoAgioL2', 'AoAgioL3', 'AoAgioL4', 'AnniInstiL1', 'AnniInstiL2', 'AnniInstiL3', 'AnniInstiL4', 'AnniPaeseL1', 'AnniPaeseL2', 'AnniPaeseL3', 'AnniPaeseL4', 'AnniFamigliaL1', 'AnniFamigliaL2', 'AnniFamigliaL3', 'AnniFamigliaL4', 'AnniLavoroL1', 'AnniLavoroL2', 'AnniLavoroL3', 'AnniLavoroL4', 
                    'PercentAmiciL1', 'PercentAmiciL2', 'PercentAmiciL3', 'PercentAmiciL4', 'PercentFamigliaL1', 'PercentFamigliaL2', 'PercentFamigliaL3', 'PercentFamigliaL4', 'PercentLavoroL1', 'PercentLavoroL2', 'PercentLavoroL3', 'PercentLavoroL4', 'PercentStessoL1', 'PercentStessoL2', 'PercentStessoL3', 'PercentStessoL4', 'PercentCalcoliL1', 'PercentCalcoliL2', 'PercentCalcoliL3', 'PercentCalcoliL4',
                    'ParlaL1', 'ParlaL2', 'ParlaL3', 'ParlaL4', 'CapisceL1', 'CapisceL2', 'CapisceL3', 'CapisceL4', 'LeggeL1', 'LeggeL2', 'LeggeL3', 'AttentionCheck', 'LeggeL4', 'ScriveL1', 'ScriveL2', 'ScriveL3', 'ScriveL4',
                    'SentoStessoL1', 'SentoStessoL2', 'SentoStessoL3', 'SentoStessoL4', 'CulturaL1', 'CulturaL2', 'CulturaL3', 'CulturaL4', 'LivelloL1', 'LivelloL2', 'LivelloL3', 'LivelloL4', 'MadrelinguaL1', 'MadrelinguaL2', 'MadrelinguaL3', 'MadrelinguaL4']

def BLP_preprocessing(BLP_file):
    AoA12_mapping = {"Non so questa lingua": 0, "20+": 0, "19": 1, "18": 2, "17": 3, "16": 4, "15": 5, "14": 6, "13": 7, "12": 8, "11": 9, "10": 10, "9": 11, "8": 12, "7": 13, "6": 14, "5": 15, "4": 16, "3": 17, "2": 18, "1": 19, "Dalla nascita": 20, "Da quando ne ho ricordo": 20, "Ancora no": 0}
    BLP_data2 = BLP_file.replace({"AoAL1": AoA12_mapping, "AoAL2": AoA12_mapping, "AoAL3": AoA12_mapping, "AoAL4": AoA12_mapping})
    BLP_data3 = BLP_data2.replace({"AoAgioL1": AoA12_mapping, "AoAgioL2": AoA12_mapping, "AoAgioL3": AoA12_mapping, "AoAgioL4": AoA12_mapping})
    AoA_mapping = {"Non so questa lingua": 0, "20+": 20, "19": 19, "18": 18, "17": 17, "16": 16, "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9, "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1, "0": 0}
    BLP_data2 = BLP_data3.replace({"AnniInstiL1": AoA_mapping, "AnniInstiL2": AoA_mapping, "AnniInstiL3": AoA_mapping, "AnniInstiL4": AoA_mapping})
    BLP_data3 = BLP_data2.replace({"AnniPaeseL1": AoA_mapping, "AnniPaeseL2": AoA_mapping, "AnniPaeseL3": AoA_mapping, "AnniPaeseL4": AoA_mapping})
    BLP_data2 = BLP_data3.replace({"AnniFamigliaL1": AoA_mapping, "AnniFamigliaL2": AoA_mapping, "AnniFamigliaL3": AoA_mapping, "AnniFamigliaL4": AoA_mapping})
    BLP_data3 = BLP_data2.replace({"AnniLavoroL1": AoA_mapping, "AnniLavoroL2": AoA_mapping, "AnniLavoroL3": AoA_mapping, "AnniLavoroL4": AoA_mapping})
    
    percent_mapping = {"0%": 0, "10%": 1, "20%": 2, "30%": 3, "40%": 4, "50%": 5, "60%": 6, "70%": 7, "80%": 8, "90%": 9, "100%": 10}
    BLP_data2 = BLP_data3.replace({"PercentAmiciL1": percent_mapping, "PercentAmiciL2": percent_mapping, "PercentAmiciL3": percent_mapping, "PercentAmiciL4": percent_mapping})
    BLP_data3 = BLP_data2.replace({"PercentFamigliaL1": percent_mapping, "PercentFamigliaL2": percent_mapping, "PercentFamigliaL3": percent_mapping, "PercentFamigliaL4": percent_mapping})
    BLP_data2 = BLP_data3.replace({"PercentLavoroL1": percent_mapping, "PercentLavoroL2": percent_mapping, "PercentLavoroL3": percent_mapping, "PercentLavoroL4": percent_mapping})
    BLP_data3 = BLP_data2.replace({"PercentStessoL1": percent_mapping, "PercentStessoL2": percent_mapping, "PercentStessoL3": percent_mapping, "PercentStessoL4": percent_mapping})
    BLP_data2 = BLP_data3.replace({"PercentCalcoliL1": percent_mapping, "PercentCalcoliL2": percent_mapping, "PercentCalcoliL3": percent_mapping, "PercentCalcoliL4": percent_mapping})
    
    all_history_scoreL1 = []
    all_history_scoreL2 = []
    all_history_scoreL3 = []
    all_history_scoreL4 = []
    for sbj in BLP_data2.index:
        history_scoreL1 = (BLP_data2["AoAL1"][sbj] + BLP_data2["AoAgioL1"][sbj] + BLP_data2["AnniInstiL1"][sbj] + BLP_data2["AnniPaeseL1"][sbj] + BLP_data2["AnniFamigliaL1"][sbj] + BLP_data2["AnniLavoroL1"][sbj])*0.454
        history_scoreL2 = (BLP_data2["AoAL2"][sbj] + BLP_data2["AoAgioL2"][sbj] + BLP_data2["AnniInstiL2"][sbj] + BLP_data2["AnniPaeseL2"][sbj] + BLP_data2["AnniFamigliaL2"][sbj] + BLP_data2["AnniLavoroL2"][sbj])*0.454
        history_scoreL3 = (BLP_data2["AoAL3"][sbj] + BLP_data2["AoAgioL3"][sbj] + BLP_data2["AnniInstiL3"][sbj] + BLP_data2["AnniPaeseL3"][sbj] + BLP_data2["AnniFamigliaL3"][sbj] + BLP_data2["AnniLavoroL3"][sbj])*0.454
        history_scoreL4 = (BLP_data2["AoAL4"][sbj] + BLP_data2["AoAgioL4"][sbj] + BLP_data2["AnniInstiL4"][sbj] + BLP_data2["AnniPaeseL4"][sbj] + BLP_data2["AnniFamigliaL4"][sbj] + BLP_data2["AnniLavoroL4"][sbj])*0.454
        all_history_scoreL1.append(history_scoreL1)
        all_history_scoreL2.append(history_scoreL2)
        all_history_scoreL3.append(history_scoreL3)
        all_history_scoreL4.append(history_scoreL4)
        
    all_use_scoreL1 = []
    all_use_scoreL2 = []
    all_use_scoreL3 = []
    all_use_scoreL4 = []
    for sbj in BLP_data2.index:
        use_scoreL1 = (BLP_data2["PercentAmiciL1"][sbj] + BLP_data2["PercentFamigliaL1"][sbj] + BLP_data2["PercentLavoroL1"][sbj] + BLP_data2["PercentStessoL1"][sbj] + BLP_data2["PercentCalcoliL1"][sbj])*1.09
        use_scoreL2 = (BLP_data2["PercentAmiciL2"][sbj] + BLP_data2["PercentFamigliaL2"][sbj] + BLP_data2["PercentLavoroL2"][sbj] + BLP_data2["PercentStessoL2"][sbj] + BLP_data2["PercentCalcoliL2"][sbj])*1.09
        use_scoreL3 = (BLP_data2["PercentAmiciL3"][sbj] + BLP_data2["PercentFamigliaL3"][sbj] + BLP_data2["PercentLavoroL3"][sbj] + BLP_data2["PercentStessoL3"][sbj] + BLP_data2["PercentCalcoliL3"][sbj])*1.09
        use_scoreL4 = (BLP_data2["PercentAmiciL4"][sbj] + BLP_data2["PercentFamigliaL4"][sbj] + BLP_data2["PercentLavoroL4"][sbj] + BLP_data2["PercentStessoL4"][sbj] + BLP_data2["PercentCalcoliL4"][sbj])*1.09
        all_use_scoreL1.append(use_scoreL1)
        all_use_scoreL2.append(use_scoreL2)
        all_use_scoreL3.append(use_scoreL3)
        all_use_scoreL4.append(use_scoreL4)
        
    all_proficiency_scoreL1 = []
    all_proficiency_scoreL2 = []
    all_proficiency_scoreL3 = []
    all_proficiency_scoreL4 = []
    for sbj in BLP_data2.index:
        proficiency_scoreL1 = (BLP_data2["ParlaL1"][sbj] + BLP_data2["CapisceL1"][sbj] + BLP_data2["LeggeL1"][sbj] + BLP_data2["ScriveL1"][sbj])*2.27
        proficiency_scoreL2 = (BLP_data2["ParlaL2"][sbj] + BLP_data2["CapisceL2"][sbj] + BLP_data2["LeggeL2"][sbj] + BLP_data2["ScriveL2"][sbj])*2.27
        proficiency_scoreL3 = (BLP_data2["ParlaL3"][sbj] + BLP_data2["CapisceL3"][sbj] + BLP_data2["LeggeL3"][sbj] + BLP_data2["ScriveL3"][sbj])*2.27
        proficiency_scoreL4 = (BLP_data2["ParlaL4"][sbj] + BLP_data2["CapisceL4"][sbj] + BLP_data2["LeggeL4"][sbj] + BLP_data2["ScriveL4"][sbj])*2.27
        all_proficiency_scoreL1.append(proficiency_scoreL1)
        all_proficiency_scoreL2.append(proficiency_scoreL2)
        all_proficiency_scoreL3.append(proficiency_scoreL3)
        all_proficiency_scoreL4.append(proficiency_scoreL4)
        
    all_attitude_scoreL1 = []
    all_attitude_scoreL2 = []
    all_attitude_scoreL3 = []
    all_attitude_scoreL4 = []
    for sbj in BLP_data2.index:
        attitude_scoreL1 = (BLP_data2["SentoStessoL1"][sbj] + BLP_data2["CulturaL1"][sbj] + BLP_data2["LivelloL1"][sbj] + BLP_data2["MadrelinguaL1"][sbj])*2.27
        attitude_scoreL2 = (BLP_data2["SentoStessoL2"][sbj] + BLP_data2["CulturaL2"][sbj] + BLP_data2["LivelloL2"][sbj] + BLP_data2["MadrelinguaL2"][sbj])*2.27
        attitude_scoreL3 = (BLP_data2["SentoStessoL3"][sbj] + BLP_data2["CulturaL3"][sbj] + BLP_data2["LivelloL3"][sbj] + BLP_data2["MadrelinguaL3"][sbj])*2.27
        attitude_scoreL4 = (BLP_data2["SentoStessoL4"][sbj] + BLP_data2["CulturaL4"][sbj] + BLP_data2["LivelloL4"][sbj] + BLP_data2["MadrelinguaL4"][sbj])*2.27
        all_attitude_scoreL1.append(attitude_scoreL1)
        all_attitude_scoreL2.append(attitude_scoreL2)
        all_attitude_scoreL3.append(attitude_scoreL3)
        all_attitude_scoreL4.append(attitude_scoreL4)
        
    # this code doesn't work well: inversed binary coding for pilot 3
    attention_mapping = {0: "false", 1: "false", 2: "true", 3: "false", 4: "false", 5: "false", 6: "false"}
    BLP_data3 = BLP_data2.replace({"AttentionCheck": attention_mapping})
    
    BLP_data3["HistoryL1Score"] = all_history_scoreL1
    BLP_data3["HistoryL2Score"] = all_history_scoreL2
    BLP_data3["HistoryL3Score"] = all_history_scoreL3
    BLP_data3["HistoryL4Score"] = all_history_scoreL4
    BLP_data3["UseL1Score"] = all_use_scoreL1
    BLP_data3["UseL2Score"] = all_use_scoreL2
    BLP_data3["UseL3Score"] = all_use_scoreL3
    BLP_data3["UseL4Score"] = all_use_scoreL4
    BLP_data3["ProficiencyL1Score"] = all_proficiency_scoreL1
    BLP_data3["ProficiencyL2Score"] = all_proficiency_scoreL2
    BLP_data3["ProficiencyL3Score"] = all_proficiency_scoreL3
    BLP_data3["ProficiencyL4Score"] = all_proficiency_scoreL4
    BLP_data3["AttitudeL1Score"] = all_attitude_scoreL1
    BLP_data3["AttitudeL2Score"] = all_attitude_scoreL2
    BLP_data3["AttitudeL3Score"] = all_attitude_scoreL3
    BLP_data3["AttitudeL4Score"] = all_attitude_scoreL4
    
    all_L1_scores = []
    all_L2_scores = []
    all_L3_scores = []
    all_L4_scores = []
    for sbj in BLP_data3.index:
        L1_score = BLP_data3["HistoryL1Score"][sbj] + BLP_data3["UseL1Score"][sbj] + BLP_data3["ProficiencyL1Score"][sbj] + BLP_data3["AttitudeL1Score"][sbj]
        L2_score = BLP_data3["HistoryL2Score"][sbj] + BLP_data3["UseL2Score"][sbj] + BLP_data3["ProficiencyL2Score"][sbj] + BLP_data3["AttitudeL2Score"][sbj]
        L3_score = BLP_data3["HistoryL3Score"][sbj] + BLP_data3["UseL3Score"][sbj] + BLP_data3["ProficiencyL3Score"][sbj] + BLP_data3["AttitudeL3Score"][sbj]
        L4_score = BLP_data3["HistoryL4Score"][sbj] + BLP_data3["UseL4Score"][sbj] + BLP_data3["ProficiencyL4Score"][sbj] + BLP_data3["AttitudeL4Score"][sbj]
        all_L1_scores.append(L1_score)
        all_L2_scores.append(L2_score)
        all_L3_scores.append(L3_score)
        all_L4_scores.append(L4_score)
        
    BLP_data3["L1Score"] = all_L1_scores
    BLP_data3["L2Score"] = all_L2_scores
    BLP_data3["L3Score"] = all_L3_scores
    BLP_data3["L4Score"] = all_L4_scores
    return BLP_data3

BLP_data_pilot1 = BLP_preprocessing(BLP_data_pilot1)
BLP_data_pilot1.to_csv('C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Pilot1_data\\BLP_preprocessed_pilot1.csv', index=True, header=True)
BLP_data_pilot2 = BLP_preprocessing(BLP_data_pilot2)
BLP_data_pilot2.to_csv('C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Pilot2_data\\BLP_preprocessed_pilot2.csv', index=True, header=True)
BLP_data_pilot3 = BLP_preprocessing(BLP_data_pilot3)
BLP_data_pilot3.to_csv('C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Pilot3_data\\BLP_preprocessed_pilot3.csv', index=True, header=True)