import os
os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Participant_Responses") # set working directory to responses folder
participantsn = len(next(os.walk("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Participant_Responses"))[1])

# importing data
all_data = []
all_data2 = []
all_data3 = []
for participantn in range(participantsn):
    response_file = open(f".//Participant_{participantn+1}//sbj{participantn+1}_responses.tsv", "r")
    name = f"sbj{participantn+1}_responses"
    data = response_file.read()
    data = data.split("\n") # split text file into list
    data = data[1:41] # remove last \n from text file
    all_data.append(data)
    for n in range(40):    
        data[n] = data[n].split(",") # split each line into list
        rt = data[n][5]
        new_rt = round((float(rt)*10),2)
        data2 = [data[n][0], data[n][1], data[n][2], data[n][3], data[n][4], new_rt]
        all_data2.append(data2)
    all_data3.append(all_data2)
    all_data2 = []

os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Participant_Responses_correctedRTs")
import csv
for participantn in range(participantsn):
    sbj_id = (participantn+1)
    output_folder = f"Participant_{sbj_id}"
    file_name = f"sbj{sbj_id}_responses.tsv"
    header = ['sbjID','trialn','word','condition','response','RT']
    with open(file_name, 'w', newline='') as output1:
        writer = csv.writer(output1)
        writer.writerow(header)
        writer.writerows(all_data3[participantn])
    output1.close()