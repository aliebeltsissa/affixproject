import os
os.chdir("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject") # set working directory to affix project folder

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
letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'Y', 'Z', 'a', 'b', 'c', 'd', 'g', 'h', 'i', 'k', 'l', 'm', 'o', 'r', 't', 'u', 'v', 'y']

# when inputted participant ID, go fullscreen
win.winHandle.maximize()
win.winHandle.activate()
win.fullscr=True
win.winHandle.set_fullscreen(True)
win.flip()

# consent
text = visual.TextStim(win, text="Prima di cominciare, le chiediamo di leggere il modulo di consenso informato e confermare la sua volontà di partecipare all'esperimento.\n\n La preghiamo di ricordare che questo è un progetto di ricerca e che la sua partecipazione è completamente volontaria. Lei si potra' ritirare in qualunque momento, senza necessariamente dover dare alcuna spiegazione. Lo studio al quale Le si chiede di partecipare ha lo scopo di esaminare come i lettori elaborno le parole scritte. La somministrazione delle prove è individuale. Lei sarà impegnato in una sessione di lavoro della durata media di 10 minuti. L’ordine delle prove ed il loro svolgimento sono stabiliti in modo tale da evitare un eventuale affaticamento. Tutte le prove saranno precedute da un breve addestramento in modo tale che abbia la possibilità di familiarizzare con il compito. Sono previste alcune pause nel corso dello svolgimento dell’esperimento. Nonostante il testing preveda delle prove cognitive, il presente esperimento non costituisce una prova clinica che permetta la diagnosi di eventuali patologie.\n\n Per la Sua partecipazione all’esperimento riceverà un compenso di X euro.\n\n Tutti i dati raccolti grazie alla partecipazione Sua e di altre persone volontarie saranno custoditi in server sicuri e protetti da password, e non sarà consentito ad alcuna persona non autorizzata di accedervi. Le Sue informazioni personali saranno conservate separatamente dai risultati della presente ricerca, cui saranno associati soltanto attraverso un ID arbitrario. Grazie a questo processo di anonimizzazione dei dati, a nessun ricercatore sarà possibile analizzare i risultati sapendo da quale specifico partecipante essi provengono. Inoltre, questa procedura renderà impossibile la Sua identificazione anche nel momento in cui i risultati della ricerca fossero pubblicati su riviste scientifiche, o presentati a congressi o in qualsiasi altro pubblico consesso. Più in generale, i dati raccolti saranno trattati in accordo con le leggi sulla privacy e in conformità al Decreto Legislativo 30 giugno 2003 n. 196 “Codice in materia di protezione dei dati personali”.\n\n Prima di esprimere il suo consenso alla partecipazione, Le ricordiamo ancora che in caso Lei abbia bisogno di delucidazioni su qualunque aspetto della procedura sperimentale, il ricercatore è a Sua completa disposizione (aliebelt@sissa.it, davide.crepaldi@sissa.it).\n\n Le chiediamo di premere un tasto qualsiasi per continuare al consenso.",
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
text = visual.TextStim(win, text = "Buenvenuto all'esperimento. Vedrai delle lettere scrite in un alfabeto nuovo. \n\n Vorremmo chiederle di guardare queste lettere, e di dire quanti sono simili.\n\n Per favore, chiama lo sperimentatore se ha qualche domanda.",
                       height = 40, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1200)
text.draw(win=win)
win.flip()
event.waitKeys()

# testing:
text = visual.TextStim(win, text = "Quanto sono simili queste lettere? Premi la sua risposta da 'k' quando pensi che la combinazione di lettere sia una parola aliena e 'd' quanda pensi che invece non lo sia. Per favore, chiama lo sperimentatore se hai qualche domanda.",
                           height = 40, color = [.8,.8,.8], pos = [0,0], wrapWidth = 1200)
text.draw(win=win)
win.flip()
event.waitKeys()
slider = visual.Slider(win=win, name='slider',
    startValue=None, size=(1.0, 0.1), pos=(0, 0), units=None,
    labels=(0, 1), ticks=(0, 1), granularity=0.0,
    style='rating', styleTweaks=(), opacity=None,
    labelColor='LightGray', markerColor='Black', lineColor='White', colorSpace='rgb',
    font='Open Sans', labelHeight=0.05,
    flip=False, ori=0.0, depth=0, readOnly=False)
ratings = []

# --- Prepare to start Routine "trial" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
slider.reset()
# keep track of which components have finished
trialComponents = [slider]
for thisComponent in trialComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

# --- Run Routine "trial" ---
while continueRoutine:
    # *slider* updates
    if slider.status == NOT_STARTED:
        slider.setAutoDraw(True)
    
    # Check slider for response to end routine
    if slider.getRating() is not None and slider.status == STARTED:
        continueRoutine = False
        
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in trialComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    if continueRoutine:
        win.flip()

for trialn in range(testingn):
    word = rand_testing[trialn][0] # get the next testing word
    stimulus = visual.TextStim(win, text = word, font = bacs, height = 100, color = [.8,.8,.8], pos = [0,0], ori = 0)
    expl_text = visual.TextStim(win, text = "Questa parola appartiene alla lingua aliena?", height = 60,
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
    response = keys[0]
    participant_responses.append([sbj_id,(trialn+1),word,rand_testing[trialn][1],response,RT])
    
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
    trialRT = round((trial[5]*100),2) # round RTs
    if trial[4] == 'k': # if answered yes
        all_responses.append([trial[0],trial[1],trial[2],trial[3],'yes',trialRT])
    elif trial[4] == 'd': # if answered no
        all_responses.append([trial[0],trial[1],trial[2],trial[3],'no',trialRT])
    else:
        print(f"Problem sorting responses to trial {trial[0]}")

# data output
output_folder = f"Participant_{sbj_id}"
os.makedirs(f"Participant_Responses//{output_folder}", exist_ok=True) # change to False for real collection

import csv
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
folder = f"Participant_Responses\\{output_folder}"
file_name = f"training_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output3:
    for word in training:
        output3.write(word+"\n")
output3.close()
folder = f"Participant_Responses\\{output_folder}"
file_name = f"random_training1_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output4:
    for word in rand_training1:
        output4.write(word+"\n")
output4.close()
folder = f"Participant_Responses\\{output_folder}"
file_name = f"random_training2_sbj{sbj_id}.txt"
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output5:
    for word in rand_training2:
        output5.write(word+"\n")
output5.close()