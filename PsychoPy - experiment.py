def import_words():
    '''
    Imports the text files of the different words to be presented from the word_generation.py output.
    Returns
    -------
    training : LIST
        A list of the training words.
    congruenttesting : LIST
        A list of the within-language testing words.
    incongruenttesting : LIST
        A list of the between-language testing words.
    '''
    trainingfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\training.txt", "r")
    data1 = trainingfile.read()
    training = data1.split("\n") # split text file into list
    training = training[0:80] # remove last \n from text file
    trainingfile.close()
    congruenttestingfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\congruenttesting.txt", "r")
    data2 = congruenttestingfile.read()
    congruenttesting = data2.split("\n")
    congruenttesting = congruenttesting[0:20]
    congruenttestingfile.close()
    incongruenttestingfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\incongruenttesting.txt", "r")
    data3 = incongruenttestingfile.read()
    incongruenttesting = data3.split("\n")
    incongruenttesting = incongruenttesting[0:20]
    incongruenttestingfile.close()
    return training, congruenttesting, incongruenttesting

def testing_list(congruenttesting, incongruenttesting):
    '''
    Combines the congruent and incongruent testing lists into a testing list with a label specifying congruency.

    Parameters
    ----------
    congruenttesting : LIST
        The list of congruent testing words.
    incongruenttesting : LIST
        The list of incongruent testing words.

    Returns
    -------
    testing : LIST
        A list of all the testing words. 0 denotes congruency, 1 incongruency.
    '''
    congruenttesting = [[word,0] for word in congruenttesting]
    incongruenttesting = [[word,1] for word in incongruenttesting]
    testing = congruenttesting + incongruenttesting
    return testing

training, congruenttesting, incongruenttesting = import_words()
testing = testing_list(congruenttesting,incongruenttesting)
trainingn = len(training)
testingn = len(testing)

from psychopy import visual, event, core, gui
def escape():
    win.close()
if 'escape' not in event.globalKeys.keys():
    event.globalKeys.add(key='escape', func=escape) # add esc to close window

win = visual.Window(size=[1800,1000],units="pix",fullscr=False)

gui = gui.Dlg()
gui.addField("Subject ID:") # ask for subject ID
gui.show()
sbj_id = int(gui.data[0])

clock = core.Clock()

bacsfile = ['BACS1.otf']
bacs = 'BACS1'

participant_responses = []
stim_duration = 0.5
isi = 0.5
trainingreps = 2 # number of times we repeat the training

# introduction
text = visual.TextStim(win, text = "Welcome to the experiment. You will be presented with two training sequences, followed by a testing phase. Please pay attention to the words as they're presented to you. Press any key to begin.",
                       height = 60, color=[.8,.8,.8], pos = [0,0], wrapWidth = 1000)
text.draw(win=win)
win.flip()
event.waitKeys()

# training:
import random
keys = event.getKeys()
keys = []
for reps in range(trainingreps):
    training = random.sample(training,len(training))
    for trialn in range(trainingn): # normally, trainingn
        clock.reset() # resets the trial clock   
        word = training[trialn]
        text = visual.TextStim(win, text=word, font = bacs, height = 100, color=[.8,.8,.8], pos=[0,0], ori=0)
        while clock.getTime() < stim_duration:
            text.draw(win=win)
            win.flip()
        while clock.getTime() < isi:
            win.flip()
    if reps == 0:
        text = visual.TextStim(win, text="End of the first training sequence. Press any key to continue.",
                               height = 60, color=[.8,.8,.8], pos=[0,0], ori=0, wrapWidth = 800)
        text.draw(win=win)
        win.flip()
        event.waitKeys()

inter_text = visual.TextStim(win, text = "You have now finished training. Press any key to begin testing.",
                             height = 60, color  = [.8,.8,.8], pos = [0,0], ori = 0, wrapWidth = 800)
inter_text.draw(win=win)
win.flip()
event.waitKeys()

# testing:
testing = random.sample(testing,len(testing))
for trialn in range(testingn): #normally, testingn
    word = testing[trialn][0]
    stim_text = visual.TextStim(win, text = word, font = bacs, height = 100, color = [.8,.8,.8], pos = [0,0], ori = 0)
    expl_text = visual.TextStim(win, text = "Does this word belong to what you previously saw?", height = 60,
                                color = [.8,.8,.8], pos = [0,300], ori = 0, wrapWidth = 800)
    expl2_text = visual.TextStim(win, text = "Press 'd' for yes, 'k' for no", height = 30,
                                 color = [.8,.8,.8], pos = [0,-300], ori = 0)
    stim_text.draw(win = win)
    expl_text.draw(win = win)
    expl2_text.draw(win = win)
    win.flip()
    keys = event.waitKeys(keyList=["d","k"])
    response = keys[0]
    participant_responses.append([word,testing[trialn][1],response])
    
# goodbye
text = visual.TextStim(win, text = "Thank you for participating! Press any key to exit.",
                       height = 100, color=[.8,.8,.8], pos = [0,0], wrapWidth = 800)
text.draw(win=win)
win.flip()
win.close()

all_responses = []
for trial in participant_responses:
    if trial[1] == 0: # if item congruent
        if trial[2] == 'd': # if answered yes
            all_responses.append([trial[0],trial[1],0]) # 0 means correct
        elif trial[2] == 'k': # if answered no
            all_responses.append([trial[0],trial[1],1]) # 1 means incorrect
        else:
            print(f"Problem sorting responses to word {trial[0]}")
    if trial[1] == 1: # if item incongruent
        if trial[2] == 'd': # if answered yes
            all_responses.append([trial[0],trial[1],0])
        elif trial[2] == 'k': # if answered no
            all_responses.append([trial[0],trial[1],1])
        else:
            print(f"Problem sorting responses to word {trial[0]}")

import os
output_folder = f"Participant_{sbj_id}"
os.makedirs(f"C://Users//annal//OneDrive//Documents//GitHub//affixproject//Participant Responses//{output_folder}", exist_ok=True) # change to False for real collection

import csv
file_name = f"C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Participant Responses/Participant_{sbj_id}/participant{sbj_id}_responses.tsv"
header = ['word','condition','response']
with open(file_name, 'w', newline='') as output:
    writer = csv.writer(output)
    writer.writerow(header)
    writer.writerows(all_responses)
output.close()