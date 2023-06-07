import os
os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject") # set working directory to responses folder

# importing data
all_data = []
for participantn in range(15,22):
    response_file = open(f".//Participant_Responses//Participant_{participantn+1}//sbj{participantn+1}_familiarity_responses.tsv", "r")
    name = f"sbj{participantn+1}_familiarity_responses"
    data = response_file.read()
    data = data.split("\n") # split text file into list
    data = data[1:31] # remove last \n from text file
    for n in range(30):    
        data[n] = data[n].split(",") # split each line into list
    all_data.append(data)
    response_file.close()

all_familiarity_scores = []
for participant in range(7):
    familiarity_score = 0
    for n in range(30):
        if all_data[participant][n][5] == "target":
            familiarity_score += 1
    familiarity_score = familiarity_score/0.3
    all_familiarity_scores.append([participant+16, familiarity_score])

# exporting preprocessed data
import csv
file_name = ".\\Pilot3_data\\preprocessed_familiarity_pilot3.tsv"
header = ['sbjID','familiarity_score']
with open(file_name, 'w', newline='') as output1:
    writer = csv.writer(output1)
    writer.writerow(header)
    writer.writerows(all_familiarity_scores)
output1.close()