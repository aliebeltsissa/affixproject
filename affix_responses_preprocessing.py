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
score = []
all_scores = []
all_numerical_scores = []
for participantn in range(participantsn):
    score = []
    for n in range(40): # all testing items
        if all_data[participantn][n][3] == "0" and all_data[participantn][n][4] == "yes":
            score.append("hit")
        elif all_data[participantn][n][3] == "0" and all_data[participantn][n][4] == "no":
            score.append("miss")
        elif all_data[participantn][n][3] == "1" and all_data[participantn][n][4] == "no":
            score.append("correct_rejection")
        elif all_data[participantn][n][3] == "1" and all_data[participantn][n][4] == "yes":
            score.append("false_alarm")
    all_scores.append(score)
    numerical_score = (score.count("hit") + score.count("correct_rejection"))/0.4 # calculate % correct
    all_numerical_scores.append(numerical_score)

# collating preprocessed data
data_preprocessed = []
all_data_preprocessed = []
for participantn in range(participantsn):
    data_preprocessed = []
    for n in range(40):
        data_preprocessed = [all_data[participantn][n][0],all_data[participantn][n][1],
                             all_data[participantn][n][3],all_scores[participantn][n],
                             all_data[participantn][n][5]]
        all_data_preprocessed.append(data_preprocessed)

# exporting preprocessed data
import csv
file_name = "preprocessed_data.tsv"
header = ['sbjID','trialn','condition','response','RT']
with open(file_name, 'w', newline='') as output1:
    writer = csv.writer(output1)
    writer.writerow(header)
    writer.writerows(all_data_preprocessed)
output1.close()