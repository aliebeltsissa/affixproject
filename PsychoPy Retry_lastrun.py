#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
This experiment was created using PsychoPy3 Experiment Builder (v2022.2.5),
    on March 09, 2023, at 18:21
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
expName = 'PsychoPy Retry'  # from the Builder filename that created this script
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
    originPath='C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\PsychoPy Retry_lastrun.py',
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
    size=[1280, 720], fullscr=True, screen=0, 
    winType='pyglet', allowStencil=False,
    monitor='testMonitor', color=[0,0,0], colorSpace='rgb',
    blendMode='avg', useFBO=True, 
    units='pix')
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

# --- Initialize components for Routine "intro" ---
welcome_text = visual.TextStim(win=win, name='welcome_text',
    text="Welcome to the experiment. You will be shown a set of words twice, then asked some questions about what you've seen.\n\nPress space to begin.",
    font='Open Sans',
    pos=(0, 0), height=50.0, wrapWidth=800.0, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);
progress = keyboard.Keyboard()

# --- Initialize components for Routine "pre_training" ---
pretrainig_text = visual.TextStim(win=win, name='pretrainig_text',
    text="You're about to start a block of training. \n\nPress space when you're ready.",
    font='Open Sans',
    pos=(0, 0), height=50.0, wrapWidth=800.0, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);
key_resp = keyboard.Keyboard()

# --- Initialize components for Routine "training" ---
training_word = visual.TextStim(win=win, name='training_word',
    text='',
    font='BACS1',
    pos=(0, 0), height=100.0, wrapWidth=None, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);

# --- Initialize components for Routine "blank500" ---
blank = visual.TextStim(win=win, name='blank',
    text=None,
    font='Open Sans',
    pos=(0, 0), height=0.05, wrapWidth=None, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);

# --- Initialize components for Routine "pre_testing" ---
testing_intro = visual.TextStim(win=win, name='testing_intro',
    text="You have now completed training. Press space when you're ready to begin testing.",
    font='Open Sans',
    pos=(0, 0), height=50.0, wrapWidth=800.0, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);
progression2 = keyboard.Keyboard()

# --- Initialize components for Routine "testing" ---
testing_word = visual.TextStim(win=win, name='testing_word',
    text='',
    font='BACS1',
    pos=(0, 0), height=100.0, wrapWidth=None, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=0.0);
participant_response = keyboard.Keyboard()
testing_text = visual.TextStim(win=win, name='testing_text',
    text='Does this word belong to the words you saw before?',
    font='Open Sans',
    pos=(0, 300), height=50.0, wrapWidth=800.0, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=-2.0);
keyboard_instructions = visual.TextStim(win=win, name='keyboard_instructions',
    text="Press 'd' for yes, 'k' for no",
    font='Open Sans',
    pos=(0, -300), height=25.0, wrapWidth=800.0, ori=0.0, 
    color='white', colorSpace='rgb', opacity=None, 
    languageStyle='LTR',
    depth=-3.0);

# Create some handy timers
globalClock = core.Clock()  # to track the time since experiment started
routineTimer = core.Clock()  # to track time remaining of each (possibly non-slip) routine 

# --- Prepare to start Routine "intro" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
progress.keys = []
progress.rt = []
_progress_allKeys = []
# keep track of which components have finished
introComponents = [welcome_text, progress]
for thisComponent in introComponents:
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

# --- Run Routine "intro" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *welcome_text* updates
    if welcome_text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        welcome_text.frameNStart = frameN  # exact frame index
        welcome_text.tStart = t  # local t and not account for scr refresh
        welcome_text.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(welcome_text, 'tStartRefresh')  # time at next scr refresh
        welcome_text.setAutoDraw(True)
    
    # *progress* updates
    waitOnFlip = False
    if progress.status == NOT_STARTED and tThisFlip >= 1-frameTolerance:
        # keep track of start time/frame for later
        progress.frameNStart = frameN  # exact frame index
        progress.tStart = t  # local t and not account for scr refresh
        progress.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(progress, 'tStartRefresh')  # time at next scr refresh
        progress.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(progress.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(progress.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if progress.status == STARTED and not waitOnFlip:
        theseKeys = progress.getKeys(keyList=['space',], waitRelease=False)
        _progress_allKeys.extend(theseKeys)
        if len(_progress_allKeys):
            progress.keys = _progress_allKeys[-1].name  # just the last key pressed
            progress.rt = _progress_allKeys[-1].rt
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
    for thisComponent in introComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "intro" ---
for thisComponent in introComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "intro" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
blocks = data.TrialHandler(nReps=2.0, method='random', 
    extraInfo=expInfo, originPath=-1,
    trialList=[None],
    seed=None, name='blocks')
thisExp.addLoop(blocks)  # add the loop to the experiment
thisBlock = blocks.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisBlock.rgb)
if thisBlock != None:
    for paramName in thisBlock:
        exec('{} = thisBlock[paramName]'.format(paramName))

for thisBlock in blocks:
    currentLoop = blocks
    # abbreviate parameter names if possible (e.g. rgb = thisBlock.rgb)
    if thisBlock != None:
        for paramName in thisBlock:
            exec('{} = thisBlock[paramName]'.format(paramName))
    
    # --- Prepare to start Routine "pre_training" ---
    continueRoutine = True
    routineForceEnded = False
    # update component parameters for each repeat
    key_resp.keys = []
    key_resp.rt = []
    _key_resp_allKeys = []
    # keep track of which components have finished
    pre_trainingComponents = [pretrainig_text, key_resp]
    for thisComponent in pre_trainingComponents:
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
    
    # --- Run Routine "pre_training" ---
    while continueRoutine:
        # get current time
        t = routineTimer.getTime()
        tThisFlip = win.getFutureFlipTime(clock=routineTimer)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *pretrainig_text* updates
        if pretrainig_text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            pretrainig_text.frameNStart = frameN  # exact frame index
            pretrainig_text.tStart = t  # local t and not account for scr refresh
            pretrainig_text.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(pretrainig_text, 'tStartRefresh')  # time at next scr refresh
            pretrainig_text.setAutoDraw(True)
        
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
        for thisComponent in pre_trainingComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # --- Ending Routine "pre_training" ---
    for thisComponent in pre_trainingComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # the Routine "pre_training" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset()
    
    # set up handler to look after randomisation of conditions etc
    trials = data.TrialHandler(nReps=1.0, method='random', 
        extraInfo=expInfo, originPath=-1,
        trialList=data.importConditions('training.csv'),
        seed=None, name='trials')
    thisExp.addLoop(trials)  # add the loop to the experiment
    thisTrial = trials.trialList[0]  # so we can initialise stimuli with some values
    # abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
    if thisTrial != None:
        for paramName in thisTrial:
            exec('{} = thisTrial[paramName]'.format(paramName))
    
    for thisTrial in trials:
        currentLoop = trials
        # abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
        if thisTrial != None:
            for paramName in thisTrial:
                exec('{} = thisTrial[paramName]'.format(paramName))
        
        # --- Prepare to start Routine "training" ---
        continueRoutine = True
        routineForceEnded = False
        # update component parameters for each repeat
        training_word.setText(word)
        # keep track of which components have finished
        trainingComponents = [training_word]
        for thisComponent in trainingComponents:
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
        
        # --- Run Routine "training" ---
        while continueRoutine and routineTimer.getTime() < 0.5:
            # get current time
            t = routineTimer.getTime()
            tThisFlip = win.getFutureFlipTime(clock=routineTimer)
            tThisFlipGlobal = win.getFutureFlipTime(clock=None)
            frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
            # update/draw components on each frame
            
            # *training_word* updates
            if training_word.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
                # keep track of start time/frame for later
                training_word.frameNStart = frameN  # exact frame index
                training_word.tStart = t  # local t and not account for scr refresh
                training_word.tStartRefresh = tThisFlipGlobal  # on global time
                win.timeOnFlip(training_word, 'tStartRefresh')  # time at next scr refresh
                training_word.setAutoDraw(True)
            if training_word.status == STARTED:
                # is it time to stop? (based on global clock, using actual start)
                if tThisFlipGlobal > training_word.tStartRefresh + 0.5-frameTolerance:
                    # keep track of stop time/frame for later
                    training_word.tStop = t  # not accounting for scr refresh
                    training_word.frameNStop = frameN  # exact frame index
                    training_word.setAutoDraw(False)
            
            # check for quit (typically the Esc key)
            if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
                core.quit()
            
            # check if all components have finished
            if not continueRoutine:  # a component has requested a forced-end of Routine
                routineForceEnded = True
                break
            continueRoutine = False  # will revert to True if at least one component still running
            for thisComponent in trainingComponents:
                if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                    continueRoutine = True
                    break  # at least one component has not yet finished
            
            # refresh the screen
            if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
                win.flip()
        
        # --- Ending Routine "training" ---
        for thisComponent in trainingComponents:
            if hasattr(thisComponent, "setAutoDraw"):
                thisComponent.setAutoDraw(False)
        # using non-slip timing so subtract the expected duration of this Routine (unless ended on request)
        if routineForceEnded:
            routineTimer.reset()
        else:
            routineTimer.addTime(-0.500000)
        
        # --- Prepare to start Routine "blank500" ---
        continueRoutine = True
        routineForceEnded = False
        # update component parameters for each repeat
        # keep track of which components have finished
        blank500Components = [blank]
        for thisComponent in blank500Components:
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
        
        # --- Run Routine "blank500" ---
        while continueRoutine and routineTimer.getTime() < 0.5:
            # get current time
            t = routineTimer.getTime()
            tThisFlip = win.getFutureFlipTime(clock=routineTimer)
            tThisFlipGlobal = win.getFutureFlipTime(clock=None)
            frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
            # update/draw components on each frame
            
            # *blank* updates
            if blank.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
                # keep track of start time/frame for later
                blank.frameNStart = frameN  # exact frame index
                blank.tStart = t  # local t and not account for scr refresh
                blank.tStartRefresh = tThisFlipGlobal  # on global time
                win.timeOnFlip(blank, 'tStartRefresh')  # time at next scr refresh
                blank.setAutoDraw(True)
            if blank.status == STARTED:
                # is it time to stop? (based on global clock, using actual start)
                if tThisFlipGlobal > blank.tStartRefresh + 0.5-frameTolerance:
                    # keep track of stop time/frame for later
                    blank.tStop = t  # not accounting for scr refresh
                    blank.frameNStop = frameN  # exact frame index
                    blank.setAutoDraw(False)
            
            # check for quit (typically the Esc key)
            if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
                core.quit()
            
            # check if all components have finished
            if not continueRoutine:  # a component has requested a forced-end of Routine
                routineForceEnded = True
                break
            continueRoutine = False  # will revert to True if at least one component still running
            for thisComponent in blank500Components:
                if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                    continueRoutine = True
                    break  # at least one component has not yet finished
            
            # refresh the screen
            if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
                win.flip()
        
        # --- Ending Routine "blank500" ---
        for thisComponent in blank500Components:
            if hasattr(thisComponent, "setAutoDraw"):
                thisComponent.setAutoDraw(False)
        # using non-slip timing so subtract the expected duration of this Routine (unless ended on request)
        if routineForceEnded:
            routineTimer.reset()
        else:
            routineTimer.addTime(-0.500000)
    # completed 1.0 repeats of 'trials'
    
# completed 2.0 repeats of 'blocks'


# --- Prepare to start Routine "pre_testing" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
progression2.keys = []
progression2.rt = []
_progression2_allKeys = []
# keep track of which components have finished
pre_testingComponents = [testing_intro, progression2]
for thisComponent in pre_testingComponents:
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

# --- Run Routine "pre_testing" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *testing_intro* updates
    if testing_intro.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        testing_intro.frameNStart = frameN  # exact frame index
        testing_intro.tStart = t  # local t and not account for scr refresh
        testing_intro.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(testing_intro, 'tStartRefresh')  # time at next scr refresh
        testing_intro.setAutoDraw(True)
    
    # *progression2* updates
    waitOnFlip = False
    if progression2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        progression2.frameNStart = frameN  # exact frame index
        progression2.tStart = t  # local t and not account for scr refresh
        progression2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(progression2, 'tStartRefresh')  # time at next scr refresh
        progression2.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(progression2.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(progression2.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if progression2.status == STARTED and not waitOnFlip:
        theseKeys = progression2.getKeys(keyList=['space',], waitRelease=False)
        _progression2_allKeys.extend(theseKeys)
        if len(_progression2_allKeys):
            progression2.keys = _progression2_allKeys[-1].name  # just the last key pressed
            progression2.rt = _progression2_allKeys[-1].rt
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
    for thisComponent in pre_testingComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "pre_testing" ---
for thisComponent in pre_testingComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "pre_testing" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
trials_2 = data.TrialHandler(nReps=1.0, method='random', 
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('testing.csv'),
    seed=None, name='trials_2')
thisExp.addLoop(trials_2)  # add the loop to the experiment
thisTrial_2 = trials_2.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisTrial_2.rgb)
if thisTrial_2 != None:
    for paramName in thisTrial_2:
        exec('{} = thisTrial_2[paramName]'.format(paramName))

for thisTrial_2 in trials_2:
    currentLoop = trials_2
    # abbreviate parameter names if possible (e.g. rgb = thisTrial_2.rgb)
    if thisTrial_2 != None:
        for paramName in thisTrial_2:
            exec('{} = thisTrial_2[paramName]'.format(paramName))
    
    # --- Prepare to start Routine "testing" ---
    continueRoutine = True
    routineForceEnded = False
    # update component parameters for each repeat
    testing_word.setText(word)
    participant_response.keys = []
    participant_response.rt = []
    _participant_response_allKeys = []
    # keep track of which components have finished
    testingComponents = [testing_word, participant_response, testing_text, keyboard_instructions]
    for thisComponent in testingComponents:
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
    
    # --- Run Routine "testing" ---
    while continueRoutine:
        # get current time
        t = routineTimer.getTime()
        tThisFlip = win.getFutureFlipTime(clock=routineTimer)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *testing_word* updates
        if testing_word.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            testing_word.frameNStart = frameN  # exact frame index
            testing_word.tStart = t  # local t and not account for scr refresh
            testing_word.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(testing_word, 'tStartRefresh')  # time at next scr refresh
            testing_word.setAutoDraw(True)
        
        # *participant_response* updates
        if participant_response.status == NOT_STARTED and t >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            participant_response.frameNStart = frameN  # exact frame index
            participant_response.tStart = t  # local t and not account for scr refresh
            participant_response.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(participant_response, 'tStartRefresh')  # time at next scr refresh
            participant_response.status = STARTED
            # keyboard checking is just starting
            participant_response.clock.reset()  # now t=0
            participant_response.clearEvents(eventType='keyboard')
        if participant_response.status == STARTED:
            theseKeys = participant_response.getKeys(keyList=['d', 'k'], waitRelease=False)
            _participant_response_allKeys.extend(theseKeys)
            if len(_participant_response_allKeys):
                participant_response.keys = _participant_response_allKeys[-1].name  # just the last key pressed
                participant_response.rt = _participant_response_allKeys[-1].rt
                # a response ends the routine
                continueRoutine = False
        
        # *testing_text* updates
        if testing_text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            testing_text.frameNStart = frameN  # exact frame index
            testing_text.tStart = t  # local t and not account for scr refresh
            testing_text.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(testing_text, 'tStartRefresh')  # time at next scr refresh
            testing_text.setAutoDraw(True)
        
        # *keyboard_instructions* updates
        if keyboard_instructions.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            keyboard_instructions.frameNStart = frameN  # exact frame index
            keyboard_instructions.tStart = t  # local t and not account for scr refresh
            keyboard_instructions.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(keyboard_instructions, 'tStartRefresh')  # time at next scr refresh
            keyboard_instructions.setAutoDraw(True)
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            routineForceEnded = True
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in testingComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # --- Ending Routine "testing" ---
    for thisComponent in testingComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # check responses
    if participant_response.keys in ['', [], None]:  # No response was made
        participant_response.keys = None
    trials_2.addData('participant_response.keys',participant_response.keys)
    if participant_response.keys != None:  # we had a response
        trials_2.addData('participant_response.rt', participant_response.rt)
    # the Routine "testing" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset()
    thisExp.nextEntry()
    
# completed 1.0 repeats of 'trials_2'


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
