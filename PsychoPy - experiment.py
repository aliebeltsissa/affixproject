import os
os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject") # set working directory to affix project folder

import csv
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
    trainingfile = open("training.txt", "r")
    data1 = trainingfile.read()
    training = data1.split("\n") # split text file into list
    training = training[0:80] # remove last \n from text file
    trainingfile.close()
    congruenttestingfile = open("congruenttesting.txt", "r")
    data2 = congruenttestingfile.read()
    congruenttesting = data2.split("\n")
    congruenttesting = congruenttesting[0:20]
    congruenttestingfile.close()
    incongruenttestingfile = open("incongruenttesting.txt", "r")
    data3 = incongruenttestingfile.read()
    incongruenttesting = data3.split("\n")
    incongruenttesting = incongruenttesting[0:20]
    incongruenttestingfile.close()
    import pandas as pd
    df = pd.read_csv("training_dict.csv", index_col=0)
    training_dict = df.to_dict("split")
    training_dict = dict(zip(training_dict["index"], training_dict["data"]))
    with open('familiarity_pairs.csv', 'r') as read_obj:
        csv_reader = csv.reader(read_obj)
        familiarity_pairs = list(csv_reader)
        familiarity_pairs = familiarity_pairs[1:31]
    return training, congruenttesting, incongruenttesting, training_dict, familiarity_pairs

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
    
# importing & generating lists
from random import shuffle
training, congruenttesting, incongruenttesting, training_dict, familiarity_pairs = import_words()
testing = testing_list(congruenttesting,incongruenttesting)
trainingn = len(training)
testingn = len(testing)
rand_training1 = training_randomisation(training, trainingn)
rand_training2 = training_randomisation(training, trainingn)
rand_training3 = training_randomisation(training, trainingn)
rand_training4 = training_randomisation(training, trainingn)
rand_testing = testing_randomisation(testing, testingn)
shuffle(familiarity_pairs)

from psychopy import visual, event, core, gui

# press esc to close window
def escape():
    win.close()
if 'escape' not in event.globalKeys.keys():
    event.globalKeys.add(key='escape', func=escape)

win = visual.Window(size=[1800,1000],units="pix",fullscr=False)

# gui for subject ID prompt
gui = gui.Dlg()
gui.addField("Subject ID:") # ask for subject ID
gui.show()
sbj_id = int(gui.data[0])

clock = core.Clock()

bacsfile = ['BACS1.otf']
bacs = 'BACS1'

# experimental parameters
participant_responses = []
stim_duration = 0.8
isi = 0.2
trainingreps = 4 # number of times we repeat the training

# when inputted participant ID, go fullscreen
win.winHandle.maximize()
win.winHandle.activate()
win.fullscr=True
win.winHandle.set_fullscreen(True)
win.flip()

# consent
text = visual.TextStim(win, text="Prima di cominciare, le chiediamo di leggere il modulo di consenso informato e confermare la sua volontà di partecipare all'esperimento.\n\n La preghiamo di ricordare che questo è un progetto di ricerca e che la sua partecipazione è completamente volontaria. Lei si potra' ritirare in qualunque momento, senza necessariamente dover dare alcuna spiegazione. Lo studio al quale Le si chiede di partecipare ha lo scopo di esaminare come i lettori elaborno le parole scritte. La somministrazione delle prove è individuale. Lei sarà impegnato in una sessione di lavoro della durata media di 10 minuti, e un questionario di 10 minuti. L’ordine delle prove ed il loro svolgimento sono stabiliti in modo tale da evitare un eventuale affaticamento. Tutte le prove saranno precedute da un breve addestramento in modo tale che abbia la possibilità di familiarizzare con il compito. Sono previste alcune pause nel corso dello svolgimento dell’esperimento. Nonostante il testing preveda delle prove cognitive, il presente esperimento non costituisce una prova clinica che permetta la diagnosi di eventuali patologie.\n\n Tutti i dati raccolti grazie alla partecipazione Sua e di altre persone volontarie saranno custoditi in server sicuri e protetti da password, e non sarà consentito ad alcuna persona non autorizzata di accedervi. Le Sue informazioni personali saranno conservate separatamente dai risultati della presente ricerca, cui saranno associati soltanto attraverso un ID arbitrario. Grazie a questo processo di anonimizzazione dei dati, a nessun ricercatore sarà possibile analizzare i risultati sapendo da quale specifico partecipante essi provengono. Inoltre, questa procedura renderà impossibile la Sua identificazione anche nel momento in cui i risultati della ricerca fossero pubblicati su riviste scientifiche, o presentati a congressi o in qualsiasi altro pubblico consesso. Più in generale, i dati raccolti saranno trattati in accordo con le leggi sulla privacy e in conformità al Decreto Legislativo 30 giugno 2003 n. 196 “Codice in materia di protezione dei dati personali”.\n\n Prima di esprimere il suo consenso alla partecipazione, Le ricordiamo ancora che in caso Lei abbia bisogno di delucidazioni su qualunque aspetto della procedura sperimentale, il ricercatore è a Sua completa disposizione (aliebelt@sissa.it, davide.crepaldi@sissa.it).\n\n Le chiediamo di premere un tasto qualsiasi per continuare al consenso.",
                        height = 28, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1800)
text.draw(win=win)
win.flip()
event.waitKeys()

from psychopy.constants import (NOT_STARTED, STARTED, FINISHED)
# create checkboxes
box1 = visual.ButtonStim(win, text="X",pos=[-885,160],letterHeight=16,
    size=(30, 30),borderWidth=1,borderColor =[-1,-1,-1],fillColor=[0,0,0],
    color=[0,0,0],name='consent1')
box2 = visual.ButtonStim(win, text="X",pos=[-885,90],letterHeight=16,
    size=(30, 30),borderWidth=1,borderColor =[-1,-1,-1],fillColor=[0,0,0],
    color=[0,0,0],name='consent2')
box3 = visual.ButtonStim(win, text="X",pos=[-885,20],letterHeight=16,
    size=(30, 30),borderWidth=1,borderColor =[-1,-1,-1],fillColor=[0,0,0],
    color=[0,0,0],name='consent3')
box4 = visual.ButtonStim(win, text="X",pos=[-885,-85],letterHeight=16,
    size=(30, 30),borderWidth=1,borderColor =[-1,-1,-1],fillColor=[0,0,0],
    color=[0,0,0],name='consent4')
box5 = visual.ButtonStim(win, text="X",pos=[-885,-155],letterHeight=16,
    size=(30, 30),borderWidth=1,borderColor =[-1,-1,-1],fillColor=[0,0,0],
    color=[0,0,0],name='consent5')
box6 = visual.ButtonStim(win, text="X",pos=[-885,-225],letterHeight=16,
    size=(30, 30),borderWidth=1,borderColor =[-1,-1,-1],fillColor=[0,0,0],
    color=[0,0,0],name='consent6')
boxes = [box1,box2,box3,box4,box5,box6]

mouse = event.Mouse(win=win)
continueRoutine = True
routineForceEnded = False
mouseup = True
trialComponents = [box1,box2,box3,box4,box5,box6,mouse]

while continueRoutine:
    for box in boxes:
        text = visual.TextStim(win, text="Dichiaro di esprimere il mio consenso a partecipare allo studio e dichiaro:\n\n     di aver letto attentamente le spiegazioni relative a questo studio e all’intera procedura sperimentale;\n\n     di essere stato informata/o riguardo alle finalità e agli obiettivi della ricerca in questione;\n\n     di aver avuto la possibilità di porre domande a proposito di qualsiasi aspetto della procedura sperimentale e di aver ottenuto risposte soddisfacenti;\n\n     di essere a conoscenza dei disagi eventualmente causati dall’esperimento;\n\n     di aver ricevuto soddisfacenti assicurazioni sulla riservatezza delle informazioni ottenute dall’esame della propria persona;\n\n     di essere consapevole di potersi ritirare in qualsiasi fase dello studio.",
                            height = 30, color = [.8,.8,.8], pos = [0,0], alignText='left', wrapWidth = 1800)
        exittext = visual.TextStim(win, text = "Oppure, per uscire dell'esperimento, premi il tasto 'esc'", height = 30, color = [.8,.8,.8], pos = [0,-300], wrapWidth = 1400)
        text.draw(win=win)
        exittext.draw(win=win)
        if mouseup:
            if mouse.isPressedIn(box):
                mouseup = False
                if list(box.color) == [0, 0, 0]: # if checkbox was blank, turn X green
                    box.color = [-1, -0.22, -1]
                elif list(box.color) == [-1, -0.22, -1]:
                    box.color = [0,0,0] # if checkbox X was green, turn it blank again
        else:
            if not 1 in mouse.getPressed():
                mouseup = True
    
        # button updates
        if box.status == NOT_STARTED:
            box.setAutoDraw(True)
        if box.status == STARTED:
            # check whether button has been pressed
            if box.isClicked:
                box.wasClicked = True  # if button is still clicked next frame, it is not a new click
            else:
                box.wasClicked = False  # if button is clicked next frame, it is a new click
        else:
            box.wasClicked = False  # if button is clicked next frame, it is a new click
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            routineForceEnded = True
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in trialComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    if list(box1.color) == [-1, -0.22, -1] and list(box2.color) == [-1, -0.22, -1] and list(box3.color) == [-1, -0.22, -1] and list(box4.color) == [-1, -0.22, -1] and list(box5.color) == [-1, -0.22, -1] and list(box6.color) == [-1, -0.22, -1]:
        consent = ['yes','yes','yes','yes','yes','yes'] # participant must have ticked all consent boxes
        textcont = visual.TextStim(win, text = "Per cominciare l'esperimento, premi il tasto 'invio'.", height = 40, color = [.8,.8,.8], pos = [0,-400], wrapWidth = 1400)
        textcont.draw(win=win)
        text.draw(win=win)
        exittext.draw(win=win)
        win.flip()
        event.waitKeys(keyList=['return']) # participant must press 'return' to continue
        continueRoutine = False
        box1.setAutoDraw(False)
        box2.setAutoDraw(False)
        box3.setAutoDraw(False)
        box4.setAutoDraw(False)
        box5.setAutoDraw(False)
        box6.setAutoDraw(False)
        win.flip()

# welcome
text = visual.TextStim(win, text = "Benvenuta/o, e grazie mille del tuo tempo!\n\n In questo esperimento sarai un esperto/un'esperta di linguaggio cui è stato chiesto di dare un'occhiata ad alcuni messaggi che la Terra ha ricevuto dallo spazio. Il tuo compito, in questa prima parte dell'esperimento, sarà di fare molta attenzione alle parole che ti verranno mostrate; più tardi, i leader del mondo ti chiederanno qualche informazione su quello che hai visto. Le parole si susseguiranno abbastanza velocemente; sembra che questi alieni abbiano una certa fretta :-)\n\n Premi la barra per continuare.",
                        height = 40, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1500)
text.draw(win=win)
win.flip()
event.waitKeys(keyList=["space"])

# example
ex_text = visual.TextStim(win, text = "Ecco un esempio delle parole che vedrai:", height = 60, color = [.8,.8,.8], pos = [0,350], wrapWidth = 1400)
ex_rect = visual.Rect(win, width = 900, height = 500, pos = [0,0], lineWidth = 5, lineColor = [-1,-1,-1], fillColor = [0,0,0])
ex_stim = visual.TextStim(win, text = "efjnpqsz", font = bacs, height = 50, color=[.8,.8,.8], pos=[0,0], ori=0)
next_text = visual.TextStim(win, text = "Quando sei pronti per iniziare, premi la barra.", height = 30, pos = [0,-350], wrapWidth = 1000)
ex_text.draw(win=win)
ex_rect.draw(win=win)
ex_stim.draw(win=win)
next_text.draw(win=win)
win.flip()
event.waitKeys(keyList=["space"])

# training
keys = event.getKeys()
keys = []
for reps in range(trainingreps):
    for trialn in range(trainingn):
        if reps == 0: # the first training session, use random training list 1
            word = rand_training1[trialn]
        elif reps == 1: # the second training session, use random training list 2
            word = rand_training2[trialn]
        elif reps == 2:
            word = rand_training3[trialn]
        elif reps == 3:
            word = rand_training4[trialn]
        elif reps > 3:
            print("Error: too many training reps, not enough lists.")
            win.close()
        stimulus = visual.TextStim(win, text=word, font = bacs, height = 100, color=[.8,.8,.8], pos=[0,0], ori=0)
        clock.reset() # resets the trial clock
        while clock.getTime() < stim_duration: # show word for desired time
            stimulus.draw(win=win)
            win.flip()
        clock.reset()
        while clock.getTime() < isi: # show blank screen for ISI length
            win.flip()
    if reps == 0: # show inter-training session message
        text = visual.TextStim(win, text="Ottimo, hai visto il primo blocco di parole. Ora puoi prenderti una piccola pausa.\n\n Premi la barra quando sei pronta/o per riprendere.",
                                height = 60, color=[.8,.8,.8], pos=[0,0], ori=0, wrapWidth = 1500)
        text.draw(win=win)
        win.flip()
        event.waitKeys(keyList=["space"])
    if reps == 1: # show inter-training session message
        text = visual.TextStim(win, text="Ottimo, hai visto il secondo blocco di parole. Ora puoi prenderti una piccola pausa.\n\n Premi la barra quando sei pronta/o per riprendere.",
                                height = 60, color=[.8,.8,.8], pos=[0,0], ori=0, wrapWidth = 1200)
        text.draw(win=win)
        win.flip()
        event.waitKeys(keyList=["space"])
    if reps == 2: # show inter-training session message
        text = visual.TextStim(win, text="Ottimo, hai visto il terzo blocco di parole. Ora puoi prenderti una piccola pausa.\n\n Premi la barra quando sei pronta/o per riprendere.",
                                height = 60, color=[.8,.8,.8], pos=[0,0], ori=0, wrapWidth = 1200)
        text.draw(win=win)
        win.flip()
        event.waitKeys(keyList=["space"])

inter_text = visual.TextStim(win, text = "Ottimo! Hai visto tutte le parole che abbiamo ricevuto dallo spazio. Premi la barra quando sei pronta/o per continuare.",
                              height = 60, color  = [.8,.8,.8], pos = [0,0], ori = 0, wrapWidth = 1200)
inter_text.draw(win=win)
win.flip()
event.waitKeys(keyList=["space"])

# testing
text = visual.TextStim(win, text = "In questa seconda parte, vedrai delle nuove parole che abbiamo ricevuto dallo stesso gruppo di alieni, e altre che invece provengono da un'altra comunicazione, con un altro gruppo di alieni. Purtroppo le due comunicazioni non arrivano a noi separatamente, per cui le parole sono mescolate tra loro.\n\n Il tuo compito sarà quello di individuare le parole che provengono dal gruppo che hai studiato nella prima parte dell'esperimento. Questo compito non è per nulla facile; le due comunicazioni infatti usano gli stessi caratteri.\n\n Il tuo meeting con i leader mondiali inizia tra poco, per cui non avrai molto tempo per prendere la tua decisione; dovrai essere veloce. Cerca di fare del tuo meglio usando la tua intuizione; non hai tempo di stare a pensare a lungo su ogni singola parola.\n\n Premi 'k' quando pensi che la parola che stai vedendo sia degli stessi alieni che hai studiato prima, e 'd' quando invece pensi che la parola che stai vedendo venga dall'altra comunicazione, con il nuovo gruppo di alieni.\n\n Premi la barra quando sei pronta/o per iniziare.",
                           height = 40, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1500)
text.draw(win=win)
win.flip()
event.waitKeys(keyList=["space"])
for trialn in range(testingn):
    word = rand_testing[trialn][0] # get the next testing word
    stimulus = visual.TextStim(win, text = word, font = bacs, height = 100, color = [.8,.8,.8], pos = [0,0], ori = 0)
    expl_text = visual.TextStim(win, text = "La parola viene del gruppo di alieni che hai studiato prima?", height = 60,
                                color = [.8,.8,.8], pos = [0,300], ori = 0, wrapWidth = 800)
    expl2_text = visual.TextStim(win, text = "Premi 'k' per sì, 'd' per no", height = 30,
                                 color = [.8,.8,.8], pos = [0,-300], ori = 0)
    stimulus.draw(win = win)
    if trialn <= 2: # show instruction text for first 3 words
        expl_text.draw(win = win)
    expl2_text.draw(win = win)
    clock.reset()
    win.flip()
    keys = event.waitKeys(keyList=["d","k"]) # only accept 'd' and 'k' keypresses
    RT = clock.getTime()
    if RT > 1:
        timeout_text = visual.TextStim(win, text = "Attenzione! Sei stato troppo lento con questa parola.\n\n Cerca di essere piu veloce.", height = 60,
                                    color = 'red', pos = [0,0], ori = 0, wrapWidth = 1400)
        timeout2_text = visual.TextStim(win, text = "Premi la barra per continuare.", height = 40,
                                     color = [.8,.8,.8], pos = [0,-300], ori = 0, wrapWidth = 1000)
        timeout_text.draw(win=win)
        timeout2_text.draw(win=win)
        win.flip()
        event.waitKeys(keyList=["space"])
    response = keys[0]
    participant_responses.append([sbj_id,(trialn+1),word,rand_testing[trialn][1],response,RT])
        
    
# familiarity test
text = visual.TextStim(win, text = "Sei arrivata/o al meeting giusto in tempo, ottimo!\n\n I leader mondiali vorrebbero mandare un messaggio di risposta agli alieni, e hanno bisogno che tu li aiuti a riconoscere le combinazioni di lettere che hai visto nel loro linguaggio. Avrai da scegliere tra due alternative: una di esse viene dalle parole che hai visto, mentre l'altra no. E' importante che si riesca a essere amichevoli con questi alieni, per cui cerca di fare la scelta giusta!\n\n Premi 'd' se pensi che la combinazione di lettere sulla sinistra sia quella che era presente nella comunicazione degli alieni, oppure 'k' se invece pensi che sia quella sulla destra.\n\n Premi la barra quando sei pronta/o per cominciare.",
                           height = 40, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1500)
text.draw(win=win)
win.flip()
event.waitKeys(keyList=["space"])

import random
familiarity_responses = []
exp_word_side = []
sides = [-300,300]
for trialn in range(30):
    confound_side = random.choice(sides) # randomly puts the confounds to the right or left on each trial
    if confound_side == -300:
        exp_word_side = "right"
    elif confound_side == 300:
        exp_word_side = "left"
    exp_word = visual.TextStim(win, text = familiarity_pairs[trialn][0], 
        font = bacs, height = 100, color = [.8,.8,.8], pos = [(-confound_side),0], ori = 0)
    confound = visual.TextStim(win, text = familiarity_pairs[trialn][1], 
        font = bacs, height = 100, color = [.8,.8,.8], pos = [confound_side, 0], ori = 0)
    expl_text = visual.TextStim(win, text = "Quale combinazione di lettere hai già visto?", height = 60,
                                color = [.8,.8,.8], pos = [0,300], ori = 0, wrapWidth = 800)
    expl2_text = visual.TextStim(win, text = "Premi 'd' per questa combinazione di lettere", height = 30,
                                 color = [.8,.8,.8], pos = [-300,-200], ori = 0, wrapWidth = 300)
    expl3_text = visual.TextStim(win, text = "Premi 'k' per questa combinazione di lettere", height = 30,
                                 color = [.8,.8,.8], pos = [300,-200], ori = 0, wrapWidth = 300)
    exp_word.draw(win=win)
    confound.draw(win=win)
    if trialn <= 2: # show instruction text for first 3 trials
        expl_text.draw(win = win)
    expl2_text.draw(win = win)
    expl3_text.draw(win=win)
    clock.reset()
    win.flip()
    keys = event.waitKeys(keyList=["d","k"]) # only accept 'd' and 'k' keypresses
    RT = clock.getTime()
    response = keys[0]
    familiarity_responses.append([sbj_id,(trialn+1),familiarity_pairs[trialn][0],familiarity_pairs[trialn][1],exp_word_side,response,RT])

# goodbye
text = visual.TextStim(win, text = "Grazie per la tua partecipazione! Premi un tasto qualsiasi per uscire.",
                       height = 60, color=[.8,.8,.8], pos = [0,0], wrapWidth = 800)
text.draw(win=win)
win.flip()
event.waitKeys()
win.close()

# initial data sorting
all_responses = []
for trial in participant_responses:
    trialRT = round((trial[5]*1000),2) # round RTs
    if trial[4] == 'k': # if answered yes
        all_responses.append([trial[0],trial[1],trial[2],trial[3],'yes',trialRT])
    elif trial[4] == 'd': # if answered no
        all_responses.append([trial[0],trial[1],trial[2],trial[3],'no',trialRT])
    else:
        print(f"Problem sorting responses to trial {trial[0]}")
all_familiarity_responses = []
for i in range(30):
    RT = round((familiarity_responses[i][6]*1000),2) # round RTs
    if familiarity_responses[i][5] == 'k' and familiarity_responses[i][4] == 'right':
        all_familiarity_responses.append([familiarity_responses[i][0],familiarity_responses[i][1],familiarity_responses[i][2],familiarity_responses[i][3],"right","target",RT])
    elif familiarity_responses[i][5] == 'd' and familiarity_responses[i][4] == 'right':
        all_familiarity_responses.append([familiarity_responses[i][0],familiarity_responses[i][1],familiarity_responses[i][2],familiarity_responses[i][3],"right","confound",RT])
    elif familiarity_responses[i][5] == 'k' and familiarity_responses[i][4] == 'left':
        all_familiarity_responses.append([familiarity_responses[i][0],familiarity_responses[i][1],familiarity_responses[i][2],familiarity_responses[i][3],"left","confound",RT])
    elif familiarity_responses[i][5] == 'd' and familiarity_responses[i][4] == 'left':
        all_familiarity_responses.append([familiarity_responses[i][0],familiarity_responses[i][1],familiarity_responses[i][2],familiarity_responses[i][3],"left","target",RT])

# data output
output_folder = f"Participant_{sbj_id}"
os.makedirs(f"Participant_Responses//{output_folder}", exist_ok=True) # change to False for real collection

file_name = f"Participant_Responses/{output_folder}/sbj{sbj_id}_responses.tsv"
header = ['sbjID','trialn','word','condition','response','RT']
with open(file_name, 'w', newline='') as output1:
    writer = csv.writer(output1)
    writer.writerow(header)
    writer.writerows(all_responses)
output1.close()
folder = f"Participant_Responses\\{output_folder}"
file_name = f"consent_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output2:
    for word in consent:
        output2.write(word+"\n")
output2.close()
file_name = f"training_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output3:
    for word in training:
        output3.write(word+"\n")
output3.close()
file_name = f"random_training1_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output4:
    for word in rand_training1:
        output4.write(word+"\n")
output4.close()
file_name = f"random_training2_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output5:
    for word in rand_training2:
        output5.write(word+"\n")
output5.close()
file_name = f"random_training3_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output6:
    for word in rand_training3:
        output6.write(word+"\n")
output6.close()
file_name = f"random_training4_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output7:
    for word in rand_training4:
        output7.write(word+"\n")
output7.close()
file_name = f"Participant_Responses/{output_folder}/sbj{sbj_id}_familiarity_responses.tsv"
header = ['sbjID','trialn','target','confound','target_side','response','RT']
with open(file_name, 'w', newline='') as output8:
    writer = csv.writer(output8)
    writer.writerow(header)
    writer.writerows(all_familiarity_responses)
output8.close()
