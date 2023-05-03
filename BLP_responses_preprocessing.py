# for now, just set to pilot 1 data
import os
os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Pilot1_data") # set working directory to responses folder

import pandas as pd
BLP_data = pd.read_csv("BLP_sbjs1-7.csv", index_col=1)
print(BLP_data.columns)
BLP_data.drop('Luogo attuale di residenza: Città.1', inplace=True, axis=1)
BLP_data.columns = ['Timestamp', 'Age', 'Sex', 'City', 'Country', 'MaxEdu', 'L1', 'L2', 'L3', 'L4', 'otherLs', 
                    'AoAL1', 'AoAL2', 'AoAL3', 'AoAL4', 'AoAgioL1', 'AoAgioL2', 'AoAgioL3', 'AoAgioL4', 'AnniInstiL1', 'AnniInstiL2', 'AnniInstiL3', 'AnniInstiL4', 'AnniPaeseL1', 'AnniPaeseL2', 'AnniPaeseL3', 'AnniPaeseL4', 'AnniFamigliaL1', 'AnniFamigliaL2', 'AnniFamigliaL3', 'AnniFamigliaL4', 'AnniLavoroL1', 'AnniLavoroL2', 'AnniLavoroL3', 'AnniLavoroL4', 
                    'PercentAmiciL1', 'PercentAmiciL2', 'PercentAmiciL3', 'PercentAmiciL4', 'PercentFamigliaL1', 'PercentFamigliaL2', 'PercentFamigliaL3', 'PercentFamigliaL4', 'PercentLavoroL1', 'PercentLavoroL2', 'PercentLavoroL3', 'PercentLavoroL4', 'PercentStessoL1', 'PercentStessoL2', 'PercentStessoL3', 'PercentStessoL4', 'PercentCalcoliL1', 'PercentCalcoliL2', 'PercentCalcoliL3', 'PercentCalcoliL4',
                    'ParlaL1', 'ParlaL2', 'ParlaL3', 'ParlaL4', 'CapisceL1', 'CapisceL2', 'CapisceL3', 'CapisceL4', 'LeggeL1', 'LeggeL2', 'LeggeL3', 'LeggeL4', 'ScriveL1', 'ScriveL2', 'ScriveL3', 'ScriveL4',
                    'SentoStessoL1', 'SentoStessoL2', 'SentoStessoL3', 'SentoStessoL4', 'CulturaL1', 'CulturaL2', 'CulturaL3', 'CulturaL4', 'LivelloL1', 'LivelloL2', 'LivelloL3', 'LivelloL4', 'MadrelinguaL1', 'MadrelinguaL2', 'MadrelinguaL3', 'MadrelinguaL4',
                    'AttentionCheck']