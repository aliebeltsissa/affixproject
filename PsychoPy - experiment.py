import sys
import os
import numpy as np
from psychopy import visual, event, core, gui

#win = visual.Window(size=[400,400],units="pix",fullscr=False)

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
print(testing)

# gui = gui.Dlg()
# gui.addField("Subject ID:")
# gui.show()
# print(gui.data)
# subj_id = gui.data

# clock =core.Clock()

# data = []
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