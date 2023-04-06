import os
os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Participant_Responses") # set working directory to responses folder
participantsn = len(next(os.walk("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Participant_Responses"))[1])

# importing data
all_data = []
for participantn in range(participantsn):
    response_file = open(f".//Participant_{participantn+1}//sbj{participantn+1}_responses.tsv", "r")
    name = f"sbj{participantn+1}_responses"
    data = response_file.read()
    data = data.split("\n") # split text file into list
    data = data[1:41] # remove last \n from text file
    for n in range(40):    
        data[n] = data[n].split(",") # split each line into list
    all_data.append(data)
    response_file.close()

# preprocessing scores
from statistics import mean
score = []
all_expected_responses = []
all_observed_responses = []
all_scores = []
all_numerical_scores = []
yes_no_scores = []
yes_no_scores2 = []
yes_no_responses = []
RTs = []
mean_RTs = []
scores_RTs = []
for participantn in range(participantsn):
    score = []
    expected_responses = []
    observed_responses = []
    RTs = []
    for n in range(40): # all testing items
        if all_data[participantn][n][3] == "0" and all_data[participantn][n][4] == "yes":
            score.append("hit")
            expected_responses.append(0)
            observed_responses.append(0)
        elif all_data[participantn][n][3] == "0" and all_data[participantn][n][4] == "no":
            score.append("miss")
            expected_responses.append(0)
            observed_responses.append(1)
        elif all_data[participantn][n][3] == "1" and all_data[participantn][n][4] == "no":
            score.append("correct_rejection")
            expected_responses.append(1)
            observed_responses.append(1)
        elif all_data[participantn][n][3] == "1" and all_data[participantn][n][4] == "yes":
            score.append("false_alarm")
            expected_responses.append(1)
            observed_responses.append(0)
        RTs.append(float(all_data[participantn][n][5]))
    all_scores.append(score)
    all_expected_responses.append(expected_responses)
    all_observed_responses.append(observed_responses)
    numerical_score = (score.count("hit") + score.count("correct_rejection"))/0.4 # calculate % correct
    all_numerical_scores.append(numerical_score)
    yes_score = (score.count("hit"))/0.2
    no_score = (score.count("correct_rejection"))/0.2
    yes_no_scores.append([yes_score, no_score]) # calculate accuracy for hits & correct rejections
    no_score2 = (score.count("miss"))/0.2
    yes_score2 = (score.count("false_alarm"))/0.2
    yes_no_scores2.append([no_score2, yes_score2]) # calculate accuracy for hits & correct rejections
    yes_responses = (score.count("hit") + score.count("false_alarm"))/0.4
    no_responses = (score.count("miss") + score.count("correct_rejection"))/0.4
    yes_no_responses.append([yes_responses, no_responses]) # calculate whether participants biased to yes or no
    mean_RTs.append(mean(RTs))
    scores_RTs.append([mean(RTs), numerical_score])

# collating preprocessed data
data_preprocessed = []
all_data_preprocessed = []
for participantn in range(participantsn):
    data_preprocessed = []
    for n in range(40):
        data_preprocessed = [all_data[participantn][n][0],all_data[participantn][n][1],
                             all_data[participantn][n][3],all_scores[participantn][n],
                             all_expected_responses[participantn][n],all_observed_responses[participantn][n],
                             all_data[participantn][n][5]]
        all_data_preprocessed.append(data_preprocessed)

# exporting preprocessed data
import csv
file_name = "preprocessed_data.tsv"
header = ['sbjID','trialn','condition','response','expected','observed','RT']
with open(file_name, 'w', newline='') as output1:
    writer = csv.writer(output1)
    writer.writerow(header)
    writer.writerows(all_data_preprocessed)
output1.close()