import time
start_time = time.time()

def import_morphemes():
    '''
    Imports the text files for each morpheme group from the morpheme_generation.py output.
    Returns
    -------
    L1affixes : LIST
        A list of the affixes in L1.
    L1stems : LIST
        A list of the stems in L1.
    L2affixes : LIST
        A list of the affixes in L2.
    L2stems : LIST
        A list of the stems in L2.
    '''
    L1affixesfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\L1affixes.txt", "r")
    data1 = L1affixesfile.read()
    L1affixes = data1.split("\n") # split text file into list
    L1affixes = L1affixes[0:100] # remove last \n from text file
    L1affixesfile.close()
    L1stemsfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\L1stems.txt", "r")
    data2 = L1stemsfile.read()
    L1stems = data2.split("\n")
    L1stems = L1stems[0:200]
    L1stemsfile.close()
    L2affixesfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\L2affixes.txt", "r")
    data3 = L2affixesfile.read()
    L2affixes = data3.split("\n")
    L2affixes = L2affixes[0:100]
    L2affixesfile.close()
    L2stemsfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\L2stems.txt", "r")
    data4 = L2stemsfile.read()
    L2stems = data4.split("\n")
    L2stems = L2stems[0:200]
    L2stemsfile.close()
    return L1affixes,L1stems,L2affixes,L2stems

import random
def cycle_through(L1affixes,L1stems,L2affixes,L2stems):
    '''
    Runs the wordcycle function to obtain lists of words for each language.

    Parameters
    ----------
    L1affixes : LIST
        The list of affixes for L1.
    L1stems : LIST
        The list of stems for L1.
    L2affixes : LIST
        The list of affixes for L2.
    L2stems : LIST
        The list of stems for L2.

    Returns
    -------
    L1words : LIST
        The list of words for L1.
    L2words : LIST
        The list of words for L2.
    L1dict : DICTIONARY
        The dictionary of words for L1, with the stem and affix they're composed of
    L2dict : DICTIONARY
        The dictionary of words for L2, with the stem and affix they're composed of
    '''
    testingaffix_indices = [0,1,2,3,4,1,2,3,4,0]
    def wordcycle(affixes,stems,l,a,s,w):
        '''
        Combines affixes and stems into words and cycles through again if word list incomplete.

        Parameters
        ----------
        affixes : LIST
            The list of affixes.
        stems : LIST
            The list of stems.
        l : STRING
            Label for printed output specifying the language ('L1' or 'L2').
        a : INTEGER
            Number of affixes to pull.
        s : INTEGER
            Number of stems to pull.
        w : INTEGER
            Number of words to generate.

        Returns
        -------
        words : LIST
            Generated words list.
        '''
        reps = 0
        words_list = []
        listlength = len(words_list)
        while listlength < w: # while word list incomplete
            words_list = []
            congruenttesting_list = []
            training_list = []
            words_dict = {}
            congruenttesting_dict = {}
            training_dict = {}    
            affix_subset = random.sample(affixes,a)
            stem_subset = random.sample(stems,s)        
            reps += 1
            for i in range(len(stem_subset)): # for every stem
                for j in range(len(affix_subset)): # for every affix
                    stem = stem_subset[i]
                    affix = affix_subset[j]
                    if stem != affix and stem[-1] != affix[0]: # if stem & affix different and the word isn't already in the word list
                    # HERE: can't have  and stem[-1] != affix[0]: maybe if we get lucky in the morpheme generation
                        words_list += [stem + affix]
                        parts = [stem, affix]
                        word = stem + affix
                        if word not in words_dict:
                            words_dict[word] = parts # add word to dictionary
                indice = testingaffix_indices[i]
                affix = affix_subset[indice]
                stem = stem_subset[i]
                word = stem + affix
                if word not in congruenttesting_list: # add stems & affixes with the same indice to the testing list
                    congruenttesting_list += [stem + affix]
                    parts = [stem, affix]
                    word = stem + affix
                    congruenttesting_dict[word] = parts
            words_list = list(words_dict.keys())
            listlength = len(words_list)
            if listlength != 0:
                #print(f'Length of word list: {listlength}')
                print(f'Finished rep {reps} of generating {l} word list.')
            elif listlength < w: # if there are still missing words, start over
                print('List not yet length of w')
                words_list = []
                congruenttesting_list = []
                training_list = []
                words_dict = {}
                congruenttesting_dict = {}
                training_dict = {}
                if list(words_dict.keys()) != words_list:
                    print('Dictionaries not the same length as word lists!')
        
        if len(words_list) == w:
            print(f'Finished testing {l} word list.')
            training_dict = words_dict.copy()
            for x in congruenttesting_list:
                del training_dict[x] # make sure the training words dict doesn't have any entries for items selected for testing
            training_list = list(training_dict.keys())
        return affix_subset, stem_subset, words_dict, words_list, training_dict, training_list, congruenttesting_dict, congruenttesting_list
    
    def cross_language_testing(L1affixsubset_list,L1stemsubset_list,L2affixsubset_list,L2stemsubset_list):
        testingaffix_indices = [0,1,2,3,4,1,2,3,4,0] # indices to match stems & affixes
        incongruenttesting_list = []
        incongruenttesting_dict = {}
        for i in range(len(L1stemsubset_list)): # L1 stem + L2 affix
            indice = testingaffix_indices[i]
            affix = L1affixsubset_list[indice]
            stem = L2stemsubset_list[i]
            word = stem + affix
            if stem[-1] != affix[0] and word not in incongruenttesting_list:
                incongruenttesting_list += [stem + affix]
                parts = [stem, affix]
                word = stem + affix
                incongruenttesting_dict[word] = parts
        for j in range(len(L2stemsubset_list)): # L2 stem + L1 affix
            indice = testingaffix_indices[j]
            affix = L2affixsubset_list[indice]
            stem = L1stemsubset_list[j]
            word = stem + affix
            if stem[-1] != affix[0] and word not in incongruenttesting_list:
                incongruenttesting_list += [stem + affix]
                parts = [stem, affix]
                word = stem + affix
                incongruenttesting_dict[word] = parts
        return incongruenttesting_list, incongruenttesting_dict
    
    # generate word lists for both languages:
    incongruenttesting_list = []
    while len(incongruenttesting_list) < 20: # if cross-language words have the same letter at the word boundary, start again
        L1affixsubset_list, L1stemsubset_list, L1words_dict, L1words_list, L1training_dict, L1training_list, L1congruenttesting_dict, L1congruenttesting_list \
            = wordcycle(L1affixes_list, L1stems_list, 'L1', 5, 10, 50)
        L2affixsubset_list, L2stemsubset_list, L2words_dict, L2words_list, L2training_dict, L2training_list, L2congruenttesting_dict, L2congruenttesting_list \
            = wordcycle(L2affixes_list, L2stems_list, 'L2', 5, 10, 50)
        training_list = L1training_list + L2training_list
        training_dict = dict(L1training_dict, **L2training_dict)
        congruenttesting_list = L1congruenttesting_list + L2congruenttesting_list
        congruenttesting_dict = dict(L1congruenttesting_dict, **L2congruenttesting_dict)
        incongruenttesting_list, incongruenttesting_dict = cross_language_testing(L1affixsubset_list, L1stemsubset_list, L2affixsubset_list, L2stemsubset_list)
        for x in incongruenttesting_list:
            if x in training_dict:
                del training_dict[x] # make sure the training words dict doesn't have any entries for items selected for testing
    if len(L1words_list) == len(L2words_list) and list(L1words_dict.keys()) == L1words_list and list(L2words_dict.keys()) == L2words_list:
        print('Correctly generated complete stimuli set.')
    elif list(L1words_dict.keys()) != L1words_list or list(L2words_dict.keys()) != L2words_list:
        print('Dictionaries not the same length as word lists!')
    return L1affixsubset_list, L1stemsubset_list, L2affixsubset_list, L2stemsubset_list, \
        L1words_dict, L1words_list, L1training_dict, L1training_list, L1congruenttesting_dict, L1congruenttesting_list, \
        L2words_dict, L2words_list, L2training_dict, L2training_list, L2congruenttesting_dict, L2congruenttesting_list, \
        training_list, training_dict, congruenttesting_list, \
        congruenttesting_dict, incongruenttesting_list, incongruenttesting_dict

import os.path
import csv
import numpy as np
def export_participant_words(L1training_list, L2training_list, training_list, congruenttesting_list, incongruenttesting_list, testing):
    '''
    Exports the training and testing word lists as text files.

    Parameters
    ----------
    None.

    Returns
    -------
    None.
    '''
    folder = "C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject"
    file_name = 'L1training.txt'
    file_path = os.path.join(folder, file_name)
    with open(file_path, 'w') as output1:
        for word in L1training_list:
            output1.write(word+"\n")
    output1.close()
    file_name = 'L2training.txt'
    file_path = os.path.join(folder, file_name)
    with open(file_path, 'w') as output2:
        for word in L2training_list:
            output2.write(word+"\n")
    output2.close()
    file_name = 'training.txt'
    file_path = os.path.join(folder, file_name)
    with open(file_path, 'w') as output3:
        for word in training_list:
            output3.write(word+"\n")
    output3.close()
    file_name = 'congruenttesting.txt'
    file_path = os.path.join(folder, file_name)
    with open(file_path, 'w') as output4:
        for word in congruenttesting_list:
            output4.write(word+"\n")
    output4.close()
    file_name = 'incongruenttesting.txt'
    file_path = os.path.join(folder, file_name)
    with open(file_path, 'w') as output5:
        for word in incongruenttesting_list:
            output5.write(word+"\n")
    output5.close()
    file_name = 'C:/Users/annal/OneDrive/Documents/GitHub/affixproject/testing.csv'
    word  = np.array([x[0] for x in testing])
    condition = np.array([x[1] for x in testing])
    ab = np.zeros(word.size, dtype=[('var1', 'U6'), ('var2', int)])
    ab['var1'] = word
    ab['var2'] = condition
    np.savetxt(file_name, ab, delimiter = ", ", fmt = "%s")
    print('Participant stimuli lists exported.') 

L1affixes_list, L1stems_list, L2affixes_list, L2stems_list = import_morphemes()
L1affixsubset_list, L1stemsubset_list, L2affixsubset_list, L2stemsubset_list, \
    L1words_dict, L1words_list, L1training_dict, L1training_list, L1congruenttesting_dict, L1congruenttesting_list, \
    L2words_dict, L2words_list, L2training_dict, L2training_list, L2congruenttesting_dict, L2congruenttesting_list, \
    training_list, training_dict, congruenttesting_list, congruenttesting_dict, incongruenttesting_list, incongruenttesting_dict \
    = cycle_through(L1affixes_list,L1stems_list,L2affixes_list,L2stems_list)
congruenttesting = [[word,int(0)] for word in congruenttesting_list]
incongruenttesting = [[word,int(1)] for word in incongruenttesting_list]
testing = congruenttesting + incongruenttesting
export_participant_words(L1training_list, L2training_list, training_list, congruenttesting_list, incongruenttesting_list, testing)

end_time = time.time()
elapsed_time = (end_time - start_time)
print('Execution time: %.1f seconds' % elapsed_time)