from psychopy import visual, core, event
import numpy as np
import pandas as pd
import csv
import random as rn
​
# importing stimuli
inputStimuli = pd.read_csv('inputStimuli.csv')
nStimuli = len(inputStimuli['targetWord'])
​
#randomising the order of presentation of the stimuli
inputStimuliRand = inputStimuli.reindex( rn.sample(range(nStimuli), nStimuli) )
inputStimuliRand.index = range(4)
​
# defining output file name
timeStamp = core.getAbsTime()
​
outputFileName_pptResponse = 'out_' + sbjId + '_' + str(timeStamp) + '.csv'
outputFileName_timingCheck = 'tc_' + sbjId + '_' + str(timeStamp) + '.csv'
outputFileName_randStim = 'rs_' + sbjId + '_' + str(timeStamp) + '.csv'
​
win = visual.Window(fullScr=True, color=[-1,-1,-1], units='pix')
​
# variables collecting participant responses
timingCheck = list()
pptResponse = list()
​
# looping over trials
for trialNumber in range(nStimuli):
    clock = core.Clock() # starts the trial clock
    
    # variables collecting participant responses on a specific trial
    timingCheckTemp = list()
    pptResponseTemp = list()
    
    text = visual.TextStim(win, text=inputStimuliRand['targetWord'][trialNumber], color=[.8,.8,.8], pos=[0,0], ori=0)
​
    for i in range(60):
        text.draw(win=win)
        win.flip()
        timingCheckTemp.append(clock.getTime())
        if len(pptResponseTemp)==0:
            pptResponseTemp = event.getKeys(timeStamped=clock)
​
    win.flip()
    if len(pptResponseTemp)==0:
        pptResponseTemp = event.waitKeys(timeStamped=clock)
    
    pptResponse.append(pptResponseTemp)
    timingCheck.append(timingCheckTemp)
    
    core.wait(1)
​
win.close()
​
with open(outputFileName_pptResponse,'wb') as out:
   csv_out = csv.writer(out)
   csv_out.writerow(['resp','responseTime'])
   for row in pptResponse:
       csv_out.writerow(row)
        
timingCheck = pd.DataFrame(timingCheck)
timingCheck.to_csv(outputFileName_timingCheck)
inputStimuliRand.to_csv(outputFileName_randStim)