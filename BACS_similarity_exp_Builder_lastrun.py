#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
This experiment was created using PsychoPy3 Experiment Builder (v2022.2.5),
    on March 27, 2023, at 11:42
If you publish work using this script the most relevant publication is:

    Peirce J, Gray JR, Simpson S, MacAskill M, Höchenberger R, Sogo H, Kastman E, Lindeløv JK. (2019) 
        PsychoPy2: Experiments in behavior made easy Behav Res 51: 195. 
        https://doi.org/10.3758/s13428-018-01193-y

"""

# --- Import packages ---
from psychopy import locale_setup
from psychopy import prefs
from psychopy import sound, gui, visual, core, data, event, logging, clock, colors, layout
from psychopy.constants import (NOT_STARTED, STARTED, PLAYING, PAUSED,
                                STOPPED, FINISHED, PRESSED, RELEASED, FOREVER)

import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy import (sin, cos, tan, log, log10, pi, average,
                   sqrt, std, deg2rad, rad2deg, linspace, asarray)
from numpy.random import random, randint, normal, shuffle, choice as randchoice
import os  # handy system and path functions
import sys  # to get file system encoding

import psychopy.iohub as io
from psychopy.hardware import keyboard



# Ensure that relative paths start from the same directory as this script
_thisDir = os.path.dirname(os.path.abspath(__file__))
os.chdir(_thisDir)
# Store info about the experiment session
psychopyVersion = '2022.2.5'
expName = 'BACS_similarity_exp_Builder'  # from the Builder filename that created this script
expInfo = {
    'participant': f"{randint(0, 999999):06.0f}",
    'session': '001',
}
# --- Show participant info dialog --
dlg = gui.DlgFromDict(dictionary=expInfo, sortKeys=False, title=expName)
if dlg.OK == False:
    core.quit()  # user pressed cancel
expInfo['date'] = data.getDateStr()  # add a simple timestamp
expInfo['expName'] = expName
expInfo['psychopyVersion'] = psychopyVersion

# Data file name stem = absolute path + name; later add .psyexp, .csv, .log, etc
filename = _thisDir + os.sep + u'data/%s_%s_%s' % (expInfo['participant'], expName, expInfo['date'])

# An ExperimentHandler isn't essential but helps with data saving
thisExp = data.ExperimentHandler(name=expName, version='',
    extraInfo=expInfo, runtimeInfo=None,
    originPath='C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\BACS_similarity_exp_Builder_lastrun.py',
    savePickle=True, saveWideText=True,
    dataFileName=filename)
# save a log file for detail verbose info
logFile = logging.LogFile(filename+'.log', level=logging.EXP)
logging.console.setLevel(logging.WARNING)  # this outputs to the screen, not a file

endExpNow = False  # flag for 'escape' or other condition => quit the exp
frameTolerance = 0.001  # how close to onset before 'same' frame

# Start Code - component code to be run after the window creation

# --- Setup the Window ---
win = visual.Window(
    size=(1024, 768), fullscr=True, screen=0, 
    winType='pygame', allowStencil=False,
    monitor='testMonitor', color=[0,0,0], colorSpace='rgb',
    blendMode='avg', useFBO=True, 
    units='height')
win.mouseVisible = False
# store frame rate of monitor if we can measure it
expInfo['frameRate'] = win.getActualFrameRate()
if expInfo['frameRate'] != None:
    frameDur = 1.0 / round(expInfo['frameRate'])
else:
    frameDur = 1.0 / 60.0  # could not measure, so guess
# --- Setup input devices ---
ioConfig = {}

# Setup iohub keyboard
ioConfig['Keyboard'] = dict(use_keymap='psychopy')

ioSession = '1'
if 'session' in expInfo:
    ioSession = str(expInfo['session'])
ioServer = io.launchHubServer(window=win, **ioConfig)
eyetracker = None

# create a default keyboard (e.g. to check for escape)
defaultKeyboard = keyboard.Keyboard(backend='iohub')

# --- Initialize components for Routine "intro_screen" ---
intro = visual.TextStim(win=win, name='intro',
    text="Prima di cominciare, le chiediamo di leggere il modulo di consenso informato e confermare la sua volontà di partecipare all'esperimento.\n\nLa preghiamo di ricordare che questo è un progetto di ricerca e che la sua partecipazione è completamente volontaria. Lei si potra' ritirare in qualunque momento, senza necessariamente dover dare alcuna spiegazione. Lo studio al quale Le si chiede di partecipare ha lo scopo di esaminare come i lettori elaborno le parole scritte. La somministrazione delle prove è individuale. Lei sarà impegnato in una sessione di lavoro della durata media di 10 minuti. L’ordine delle prove ed il loro svolgimento sono stabiliti in modo tale da evitare un eventuale affaticamento. Tutte le prove saranno precedute da un breve addestramento in modo tale che abbia la possibilità di familiarizzare con il compito. Sono previste alcune pause nel corso dello svolgimento dell’esperimento. Nonostante il testing preveda delle prove cognitive, il presente esperimento non costituisce una prova clinica che permetta la diagnosi di eventuali patologie. \n\nPer la Sua partecipazione all’esperimento riceverà un compenso di X euro.\n\nTutti i dati raccolti grazie alla partecipazione Sua e di altre persone volontarie saranno custoditi in server sicuri e protetti da password, e non sarà consentito ad alcuna persona non autorizzata di accedervi. Le Sue informazioni personali saranno conservate separatamente dai risultati della presente ricerca, cui saranno associati soltanto attraverso un ID arbitrario. Grazie a questo processo di anonimizzazione dei dati, a nessun ricercatore sarà possibile analizzare i risultati sapendo da quale specifico partecipante essi provengono. Inoltre, questa procedura renderà impossibile la Sua identificazione anche nel momento in cui i risultati della ricerca fossero pubblicati su riviste scientifiche, o presentati a congressi o in qualsiasi altro pubblico consesso. Più in generale, i dati raccolti saranno trattati in accordo con le leggi sulla privacy e in conformità al Decreto Legislativo 30 giugno 2003 n. 196 “Codice in materia di protezione dei dati personali”.\n\nPrima di esprimere il suo consenso alla partecipazione, Le ricordiamo ancora che in caso Lei abbia bisogno di delucidazioni su qualunque aspetto della procedura sperimentale, il ricercatore è a Sua completa disposizione (aliebelt@sissa.it, davide.crepaldi@sissa.it).\n\nLe chiediamo di premere il tasto 'invio' per continuare al consenso.",
    font='Open Sans',
    units='pix', pos=(0, 0), height=28.0, wrapWidth=None, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);
key_resp = keyboard.Keyboard()

# --- Initialize components for Routine "consent" ---
consent_text = visual.TextStim(win=win, name='consent_text',
    text='Dichiaro di esprimere il mio consenso a partecipare allo studio e dichiaro:\n\n     di aver letto attentamente le spiegazioni relative a questo studio e all’intera procedura sperimentale;\n\n     di essere stato informata/o riguardo alle finalità e agli obiettivi della ricerca in questione;\n\n     di aver avuto la possibilità di porre domande a proposito di qualsiasi aspetto della procedura sperimentale e di aver ottenuto risposte soddisfacenti;\n\n     di essere a conoscenza dei disagi eventualmente causati dall’esperimento;\n\n     di aver ricevuto soddisfacenti assicurazioni sulla riservatezza delle informazioni ottenute dall’esame della propria persona;\n\n     di essere consapevole di potersi ritirare in qualsiasi fase dello studio.',
    font='Open Sans',
    pos=(0, 0), height=28.0, wrapWidth=1800.0, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);
button = visual.ButtonStim(win, 
    text=None, font='Arvo',
    pos=(-885, 160),
    letterHeight=0.05,
    size=[30,30], borderWidth=0.0,
    fillColor='darkgrey', borderColor=None,
    color='white', colorSpace='rgb',
    opacity=None,
    bold=True, italic=False,
    padding=None,
    anchor='center',
    name='button'
)
button.buttonClock = core.Clock()

# Create some handy timers
globalClock = core.Clock()  # to track the time since experiment started
routineTimer = core.Clock()  # to track time remaining of each (possibly non-slip) routine 

# --- Prepare to start Routine "intro_screen" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
key_resp.keys = []
key_resp.rt = []
_key_resp_allKeys = []
# keep track of which components have finished
intro_screenComponents = [intro, key_resp]
for thisComponent in intro_screenComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
frameN = -1

# --- Run Routine "intro_screen" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *intro* updates
    if intro.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        intro.frameNStart = frameN  # exact frame index
        intro.tStart = t  # local t and not account for scr refresh
        intro.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(intro, 'tStartRefresh')  # time at next scr refresh
        intro.setAutoDraw(True)
    
    # *key_resp* updates
    waitOnFlip = False
    if key_resp.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        key_resp.frameNStart = frameN  # exact frame index
        key_resp.tStart = t  # local t and not account for scr refresh
        key_resp.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp, 'tStartRefresh')  # time at next scr refresh
        key_resp.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp.status == STARTED and not waitOnFlip:
        theseKeys = key_resp.getKeys(keyList=['space',], waitRelease=False)
        _key_resp_allKeys.extend(theseKeys)
        if len(_key_resp_allKeys):
            key_resp.keys = _key_resp_allKeys[-1].name  # just the last key pressed
            key_resp.rt = _key_resp_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in intro_screenComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "intro_screen" ---
for thisComponent in intro_screenComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "intro_screen" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# --- Prepare to start Routine "consent" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
# keep track of which components have finished
consentComponents = [consent_text, button]
for thisComponent in consentComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
frameN = -1

# --- Run Routine "consent" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *consent_text* updates
    if consent_text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        consent_text.frameNStart = frameN  # exact frame index
        consent_text.tStart = t  # local t and not account for scr refresh
        consent_text.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(consent_text, 'tStartRefresh')  # time at next scr refresh
        consent_text.setAutoDraw(True)
    
    # *button* updates
    if button.status == NOT_STARTED and tThisFlip >= 0-frameTolerance:
        # keep track of start time/frame for later
        button.frameNStart = frameN  # exact frame index
        button.tStart = t  # local t and not account for scr refresh
        button.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(button, 'tStartRefresh')  # time at next scr refresh
        button.setAutoDraw(True)
    if button.status == STARTED:
        # check whether button has been pressed
        if button.isClicked:
            if not button.wasClicked:
                button.timesOn.append(button.buttonClock.getTime()) # store time of first click
                button.timesOff.append(button.buttonClock.getTime()) # store time clicked until
            else:
                button.timesOff[-1] = button.buttonClock.getTime() # update time clicked until
            if not button.wasClicked:
                continueRoutine = False  # end routine when button is clicked
                None
            button.wasClicked = True  # if button is still clicked next frame, it is not a new click
        else:
            button.wasClicked = False  # if button is clicked next frame, it is a new click
    else:
        button.wasClicked = False  # if button is clicked next frame, it is a new click
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in consentComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "consent" ---
for thisComponent in consentComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
thisExp.addData('button.numClicks', button.numClicks)
if button.numClicks:
   thisExp.addData('button.timesOn', button.timesOn[-1])
   thisExp.addData('button.timesOff', button.timesOff[-1])
else:
   thisExp.addData('button.timesOn', "")
   thisExp.addData('button.timesOff', "")
# the Routine "consent" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# --- End experiment ---
# Flip one final time so any remaining win.callOnFlip() 
# and win.timeOnFlip() tasks get executed before quitting
win.flip()

# these shouldn't be strictly necessary (should auto-save)
thisExp.saveAsWideText(filename+'.csv', delim='auto')
thisExp.saveAsPickle(filename)
logging.flush()
# make sure everything is closed down
if eyetracker:
    eyetracker.setConnectionState(False)
thisExp.abort()  # or data files will save again on exit
win.close()
core.quit()
