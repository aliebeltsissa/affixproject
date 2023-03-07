import sys
import os
import numpy as np
import random
from psychopy import visual, event, core, gui

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
training = random.sample(training,len(training))
testing = testing_list(congruenttesting,incongruenttesting)
trainingn = len(training)
testingn = len(testing)

win = visual.Window(size=[800,600],units="pix",fullscr=False)

gui = gui.Dlg()
gui.addField("Subject ID:")
gui.show()
subj_id = gui.data

clock = core.Clock()

bacsfile = ['BACS1.otf']
bacs = 'BACS1'

participant_response = []
stim_duration = 0.5
isi = 0.5
trainingreps = 2 # number of times we repeat the training

# training:
keys = event.getKeys()
for reps in range(trainingreps):
    if 'escape' in keys:
        core.quit()
    for trialn in range(5): # normally, trainingn
        clock.reset() # resets the trial clock   
        word = training[trialn]
        text = visual.TextStim(win, text=word, font = bacs, height = 100, color=[.8,.8,.8], pos=[0,0], ori=0)
        while clock.getTime() < stim_duration:
            text.draw(win=win)
            win.flip()
        while clock.getTime() < isi:
            win.flip()
    training = random.sample(training,len(training))
    if reps == 0:
        text = visual.TextStim(win, text="End of the first training sequence. Press any key to continue.", height = 60, color=[.8,.8,.8], pos=[0,0], ori=0)
        text.draw(win=win)
        win.flip()
        event.waitKeys()
win.close()

# for trial in range(10):
#     keys = event.waitKeys(timeStamped=clock,keyList=["left","right"])
#     keys = keys[0]
#     print(keys)
#     data.append(keys)
# print(data)
# win.close()

# binary_responses = []

# for data_row in data:
#     if data_row[0] == "left":
#         data_row = 1
#     elif data_row[0] == "right":
#         data_row = 0
#     binary_responses.append(data_row)
# print(binary_responses)

# np.savetxt(f"{subj_id}.tsv",binary_responses,delimiter="\t")

# data_path="sbj1.tsv"
# data_path_exists=os.path.exists(data_path)
# if data_path_exists:
#     sys.exit("Filename " + data_path + " already exists")