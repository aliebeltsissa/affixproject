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

def training_randomisation(lst, lstlen):
    '''
    Takes the training list and randomises it to avoid the orthographic structure to be evident.

    Parameters
    ----------
    lst : LIST
        The inputted training list of words.
    lstlen : INTEGER
        The length of the list.

    Returns
    -------
    rand_lst : LIST
        A randomised training list.
    '''
    import random
    rand_lst = ['efjnpqsz'] # creating a temporary 1st word for the code to compare against
    rep = 0
    while len(rand_lst) < (lstlen+1):
        if rep < 500:
            word = random.choice(lst)
            if word[0:1] != rand_lst[-1][0:1] and word[-2:-1] != rand_lst[-1][-2:-1] and word not in rand_lst: # if there are different 1st and last letters, and not yet in list
                rand_lst.append(word)
            rep += 1
        if rep >= 500: # timeout: if done too many reps, restart
            rand_lst = ['efjnpqsz']
            rep = 0
    rand_lst.remove('efjnpqsz')
    return rand_lst

def testing_randomisation(lst, lstlen):
    '''
    Takes a testing stimuli list and randomises it to avoid the orthographic structure to be evident.

    Parameters
    ----------
    lst : LIST
        The inputted list of words.
    lstlen : INTEGER
        The length of the list.

    Returns
    -------
    rand_lst : LIST
        A randomised testing list.
    '''
    import random
    rand_lst = [['efjnpqsz',0]] # creating a temporary 1st word for the code to compare against
    rep = 0
    while len(rand_lst) < (lstlen+1):
        if rep < 500:
            word = random.choice(lst)
            #print(word)
            if word[0][0:1] != rand_lst[-1][0][0:1] and word[0][-2:-1] != rand_lst[-1][0][-2:-1] and [word[0],word[1]] not in rand_lst:
                rand_lst.append([word[0],word[1]]) # add word and its congruency index
            rep += 1
        if rep >= 500: # timeout: if done too many reps, restart
            rand_lst = [['efjnpqsz',0]]
            rep = 0
    rand_lst.remove(['efjnpqsz',0])
    return rand_lst

training, congruenttesting, incongruenttesting = import_words()
testing = testing_list(congruenttesting,incongruenttesting)
trainingn = len(training)
testingn = len(testing)
rand_training1 = training_randomisation(training, trainingn)
rand_training2 = training_randomisation(training, trainingn)
rand_testing = testing_randomisation(testing, testingn)

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
win.winHandle.maximize()
win.winHandle.activate()
win.fullscr=True
win.winHandle.set_fullscreen(True)
win.flip()

text = visual.TextStim(win, text = "Buenvenuto all'esperimento. In questa parte, vedrai delle parole prese da una lingua inventata. Le parole saranno scrite in un alfabeto nuovo. Facciamo finta che questa lingua sia una lingua parlata dagli alieni. Vorremmo chiederti di guardare queste parole aliene. Nella parte successiva, testeremo se hai prestato attenzione a queste parole. Per favore, chiama lo sperimentatore se hai qualche domanda.",
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
keys = event.getKeys()
keys = []
for reps in range(trainingreps):
    for trialn in range(trainingn):
        if reps == 0:
            word = rand_training1[trialn]
        elif reps == 1:
            word = rand_training2[trialn]
        elif reps > 1:
            print("Error: too many training reps, not enought lists.")
        stimulus = visual.TextStim(win, text=word, font = bacs, height = 100, color=[.8,.8,.8], pos=[0,0], ori=0)
        clock.reset() # resets the trial clock
        while clock.getTime() < stim_duration:
            stimulus.draw(win=win)
            win.flip()
        clock.reset()
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
text = visual.TextStim(win, text = "Adesso vedrai altre parole nella stessa lingua aliena. Ma vedrai anche delle combinazioni di lettere che sono simili alle parole aliene, ma che sono qualcos'altro. C'è una differenza molto sottile tra le parole aliene e le nonparole. Non ti chiediamo di dirci qual è la differenza - cerca solo di capire cosa le distingue. Il tuo compito è quello di premere 'k' quando pensi che la combinazione di lettere è una parola aliena e 'd' quando pensi che la combinazione di lettere non è una parola aliena. Questo compito potrebbe sembrare difficile, ma non ti preoccupare! Cerca di fare del tuo meglio. Se non conosci la risposta giusta, usa semplicemente il tuo intuito e dai una risposta. Per favore, chiama lo sperimentatore se hai qualche domanda.",
                           height = 40, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1200)
text.draw(win=win)
win.flip()
event.waitKeys()
for trialn in range(testingn):
    word = rand_testing[trialn][0]
    stimulus = visual.TextStim(win, text = word, font = bacs, height = 100, color = [.8,.8,.8], pos = [0,0], ori = 0)
    expl_text = visual.TextStim(win, text = "Does this word belong to what you previously saw?", height = 60,
                                color = [.8,.8,.8], pos = [0,300], ori = 0, wrapWidth = 800)
    expl2_text = visual.TextStim(win, text = "Premi 'k' per sì, 'd' per no", height = 30,
                                 color = [.8,.8,.8], pos = [0,-300], ori = 0)
    stimulus.draw(win = win)
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
text = visual.TextStim(win, text = "Grazie per la tua partecipazione! Press any key to exit.",
                       height = 60, color=[.8,.8,.8], pos = [0,0], wrapWidth = 800)
text.draw(win=win)
win.flip()
event.waitKeys()
win.close()

# initial data sorting
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

# data output
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