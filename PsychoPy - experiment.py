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
stim_duration = 0.8
isi = 0.2
trainingreps = 2 # number of times we repeat the training

# introduction
text = visual.TextStim(win, text = "Welcome to the experiment. You will be presented with two training sequences, followed by a testing phase. Please pay attention to the words as they're presented to you. Press any key to begin.",
                       height = 60, color=[.8,.8,.8], pos = [0,0], wrapWidth = 1000)
text.draw(win=win)
win.flip()
event.waitKeys()
text = visual.TextStim(win, text = "In questa parte di esperimento, vedrai delle parole prese da una lingua inventata. Le parole saranno scrite in un alfabeto nuovo. Facciamo finta che questa lingua sia una lingua parlata dagli alieni. Vorremmo chiederti di guardare queste parole aliene. Nella parte successiva, testeremo se hai prestato attenzione a queste parole. Per favore, chiama lo sperimentatore se hai qualche domanda.",
                       height = 40, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1200)
text.draw(win=win)
win.flip()
event.waitKeys()

# example
ex_text = visual.TextStim(win, text = "Here is an example of what you will be presented with:", height = 60, color = [.8,.8,.8], pos = [0,350], wrapWidth = 1000)
ex_rect = visual.Rect(win, width = 900, height = 500, pos = [0,0], lineWidth = 5, lineColor = [-1,-1,-1], fillColor = [0,0,0])
ex_stim = visual.TextStim(win, text = "efjnpqsz", font = bacs, height = 50, color=[.8,.8,.8], pos=[0,0], ori=0)
next_text = visual.TextStim(win, text = "When you're ready to start, press any key.", height = 30, pos = [0,-350], wrapWidth = 1000)
ex_text.draw(win=win)
ex_rect.draw(win=win)
ex_stim.draw(win=win)
next_text.draw(win=win)
win.flip()
event.waitKeys()

# training:
import random
keys = event.getKeys()
keys = []
for reps in range(trainingreps):
    training = random.sample(training,len(training))
    for trialn in range(trainingn):
        word = training[trialn]
        text = visual.TextStim(win, text=word, font = bacs, height = 100, color=[.8,.8,.8], pos=[0,0], ori=0)
        clock.reset() # resets the trial clock
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

inter_text = visual.TextStim(win, text = "You have now finished training. Press any key to continue the experiment.",
                             height = 60, color  = [.8,.8,.8], pos = [0,0], ori = 0, wrapWidth = 800)
inter_text.draw(win=win)
win.flip()
event.waitKeys()

# testing:
text = visual.TextStim(win, text = "Adesso vedrai altre parole nella stessa lingua aliena. Ma vedrai anche delle combinazioni di lettere che sono simili alle parole aliene, ma che sono qualcos'altro. C'è una differenza molto sottile tra le parole aliene e le nonparole. Non ti chiediamo di dirci qual è la differenza - cerca solo di capire cosa le distingue. Il tuo compito è quello di premere 'k' quando pensi che la combinazione di lettere e una parola aliena e 'd' quando pensi che la combinazione di lettere non e una parola aliena. Questo compito potrebbe sembrare difficile, ma non ti preoccupare! Cerca di fare del tuo meglio. Se non conosci la risposta giusta, usa semplicemente il tuo intuito e dai una risposta. Per favore, chiama lo sperimentatore se hai qualche domanda.",
                           height = 40, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1200)
text.draw(win=win)
win.flip()
event.waitKeys()
testing = random.sample(testing,len(testing))
for trialn in range(testingn):
    word = testing[trialn][0]
    stim_text = visual.TextStim(win, text = word, font = bacs, height = 100, color = [.8,.8,.8], pos = [0,0], ori = 0)
    expl_text = visual.TextStim(win, text = "Does this word belong to what you previously saw?", height = 60,
                                color = [.8,.8,.8], pos = [0,300], ori = 0, wrapWidth = 800)
    expl2_text = visual.TextStim(win, text = "Press 'k' for yes, 'd' for no", height = 30,
                                 color = [.8,.8,.8], pos = [0,-300], ori = 0)
    stim_text.draw(win = win)
    if trialn <= 2:
        expl_text.draw(win = win)
    expl2_text.draw(win = win)
    clock.reset()
    win.flip()
    keys = event.waitKeys(keyList=["d","k"])
    RT = clock.getTime()
    response = keys[0]
    participant_responses.append([word,testing[trialn][1],response,RT])
    
# goodbye
text = visual.TextStim(win, text = "Thank you for participating! Press any key to exit.",
                       height = 100, color=[.8,.8,.8], pos = [0,0], wrapWidth = 800)
text.draw(win=win)
win.flip()
event.waitKeys()
win.close()

all_responses = []
for trial in participant_responses:
    trialRT = round((trial[3]*100),2)
    if trial[1] == 0: # if item congruent
        if trial[2] == 'k': # if answered yes
            all_responses.append([trial[0],trial[1],'yes',trialRT])
        elif trial[2] == 'd': # if answered no
            all_responses.append([trial[0],trial[1],'no',trialRT])
        else:
            print(f"Problem sorting responses to word {trial[0]}")
    if trial[1] == 1: # if item incongruent
        if trial[2] == 'k': # if answered yes
            all_responses.append([trial[0],trial[1],'yes',trialRT])
        elif trial[2] == 'd': # if answered no
            all_responses.append([trial[0],trial[1],'no',trialRT])
        else:
            print(f"Problem sorting responses to word {trial[0]}")

import os
output_folder = f"Participant_{sbj_id}"
os.makedirs(f"C://Users//annal//OneDrive//Documents//GitHub//affixproject//Participant Responses//{output_folder}", exist_ok=True) # change to False for real collection

import csv
file_name = f"C:/Users/annal/OneDrive/Documents/GitHub/affixproject/Participant Responses/Participant_{sbj_id}/participant{sbj_id}_responses.tsv"
header = ['word','condition','response','RT']
with open(file_name, 'w', newline='') as output1:
    writer = csv.writer(output1)
    writer.writerow(header)
    writer.writerows(all_responses)
output1.close()
folder = f"C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\Participant Responses\\Participant_{sbj_id}"
file_name = f"training_{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output2:
    for word in training:
        output2.write(word+"\n")
output2.close()