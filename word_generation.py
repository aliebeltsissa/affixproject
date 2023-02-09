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
    testingstem_indices = list(range(10))
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
            congruent_testing_list = []
            training_list = []
            words_dict = {}
            congruent_testing_dict = {}
            training_dict = {}    
            affix_subset = random.sample(affixes,a)
            stem_subset = random.sample(stems,s)        
            reps += 1
            for i in range(len(stem_subset)):
                for j in range(len(affix_subset)):
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
                if word not in congruent_testing_list:
                    congruent_testing_list += [stem + affix]
                    parts = [stem, affix]
                    word = stem + affix
                    congruent_testing_dict[word] = parts
            words_list = list(words_dict.keys())
            listlength = len(words_list)
            if listlength != 0:
                #print(f'Length of word list: {listlength}')
                print(f'Finished rep {reps} of generating {l} word list.')
            elif listlength < w: 
                print('List not yet length of w')
                words_list = []
                congruent_testing_list = []
                training_list = []
                words_dict = {}
                congruent_testing_dict = {}
                training_dict = {}
                if list(words_dict.keys()) != words_list:
                    print('Dictionaries not the same length as word lists!')
        
        if len(words_list) == w:
            print(f'Finished testing {l} word list.')
            training_dict = words_dict.copy()
            for x in congruent_testing_list:
                del training_dict[x]
            training_list = list(training_dict.keys())
        return affix_subset, stem_subset, words_dict, words_list, training_dict, training_list, congruent_testing_dict, congruent_testing_list
    
    def cross_language_testing(L1affixsubset_list,L1stemsubset_list,L2affixsubset_list,L2stemsubset_list):
        testingaffix_indices = [0,1,2,3,4,1,2,3,4,0]
        incongruent_testing_list = []
        incongruent_testing_dict = {}
        for i in range(len(L1stemsubset_list)): # L1 stem, L2 affix
            indice = testingaffix_indices[i]
            affix = L1affixsubset_list[indice]
            stem = L2stemsubset_list[i]
            word = stem + affix
            if word not in incongruent_testing_list:
                incongruent_testing_list += [stem + affix]
                parts = [stem, affix]
                word = stem + affix
                incongruent_testing_dict[word] = parts
        for j in range(len(L2stemsubset_list)): # L2 stem, L1 affix
            indice = testingaffix_indices[j]
            affix = L2affixsubset_list[indice]
            stem = L1stemsubset_list[j]
            word = stem + affix
            if word not in incongruent_testing_list:
                incongruent_testing_list += [stem + affix]
                parts = [stem, affix]
                word = stem + affix
                incongruent_testing_dict[word] = parts
        return incongruent_testing_list, incongruent_testing_list
    
    # generate word lists for both languages:
    L1affixsubset_list, L1stemsubset_list, L1words_dict, L1words_list, L1training_dict, L1training_list, L1congruent_testing_dict, L1congruent_testing_list = wordcycle(L1affixes_list, L1stems_list, 'L1', 5, 10, 50)
    L2affixsubset_list, L2stemsubset_list, L2words_dict, L2words_list, L2training_dict, L2training_list, L2congruent_testing_dict, L2congruent_testing_list = wordcycle(L2affixes_list, L2stems_list, 'L2', 5, 10, 50)
    congruent_testing_list = L1congruent_testing_list + L2congruent_testing_list
    congruent_testing_dict = dict(L1congruent_testing_dict, **L2congruent_testing_dict)
    incongruent_testing_list, incongruent_testing_dict = cross_language_testing(L1affixsubset_list, L1stemsubset_list, L2affixsubset_list, L2stemsubset_list)
    if len(L1words_list) == len(L2words_list) and list(L1words_dict.keys()) == L1words_list and list(L2words_dict.keys()) == L2words_list:
        print('Correctly generated complete stimuli set.')
    elif list(L1words_dict.keys()) != L1words_list or list(L2words_dict.keys()) != L2words_list:
        print('Dictionaries not the same length as word lists!')
    return L1affixsubset_list, L1stemsubset_list, L2affixsubset_list, L2stemsubset_list, L1words_dict, L1words_list, L1training_dict, L1training_list, L1congruent_testing_dict, L1congruent_testing_list, L2words_dict, L2words_list, L2training_dict, L2training_list, L2congruent_testing_dict, L2congruent_testing_list, congruent_testing_list, congruent_testing_dict, incongruent_testing_list, incongruent_testing_dict

import os.path
def export_participant_words(L1trainingwords_list,L1testingwords_list,L2trainingwords_list,L2testingwords_list):
    '''
    Exports the training and testing word lists as text files.

    Parameters
    ----------
    L1trainingwords_list : TYPE
        DESCRIPTION.
    L1testingwords_list : TYPE
        DESCRIPTION.
    L2trainingwords_list : TYPE
        DESCRIPTION.
    L2testingwords_list : TYPE
        DESCRIPTION.

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
    file_name = 'L1testing.txt'
    file_path = os.path.join(folder, file_name)
    with open(file_path, 'w') as output2:
        for word in L1congruent_testing_list:
            output2.write(word+"\n")
    output2.close()
    file_name = 'L2training.txt'
    file_path = os.path.join(folder, file_name)
    with open(file_path, 'w') as output3:
        for word in L2training_list:
            output3.write(word+"\n")
    output3.close()
    file_name = 'L2testing.txt'
    file_path = os.path.join(folder, file_name)
    with open(file_path, 'w') as output4:
        for word in L2congruent_testing_list:
            output4.write(word+"\n")
    output4.close()
    print('Participant stimuli lists exported.')

L1affixes_list, L1stems_list, L2affixes_list, L2stems_list = import_morphemes()
L1affixsubset_list, L1stemsubset_list, L2affixsubset_list, L2stemsubset_list, L1words_dict, L1words_list, L1training_dict, L1training_list, L1congruent_testing_dict, L1congruent_testing_list, L2words_dict, L2words_list, L2training_dict, L2training_list, L2congruent_testing_dict, L2congruent_testing_list, congruent_testing_list, congruent_testing_dict, incongruent_testing_list, incongruent_testing_dict = cycle_through(L1affixes_list,L1stems_list,L2affixes_list,L2stems_list)
export_participant_words(L1training_list, L1congruent_testing_list, L2training_list, L2congruent_testing_list)

end_time = time.time()
elapsed_time = (end_time - start_time)
print('Execution time: %.1f seconds' % elapsed_time)