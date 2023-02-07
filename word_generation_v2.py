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
        words_list = []
        testingwords_list = []
        trainingwords_list = []
        words_dict = {}
        testingwords_dict = {}
        trainingwords_dict = {}
        reps = 0
        listlength = len(words_list)
        while listlength < w: # while word list incomplete
            affix_subset = random.sample(affixes,a)
            stem_subset = random.sample(stems,s)        
            reps += 1
            for i in range(len(stem_subset)):
                for j in range(len(affix_subset)):
                    stem = stem_subset[i]
                    affix = affix_subset[j]
                    if stem != affix: # if stem & affix different and the word isn't already in the word list
                    # HERE: can't have  and stem[-1] != affix[0]: maybe if we get lucky in the morpheme generation
                        words_list += [stem + affix]
                        parts = [stem, affix]
                        word = stem + affix
                        if word not in words_dict:
                            words_dict[word] = parts # add word to dictionary
                    if i == j or (i-j) == 5 or (j-i) == 1 or (i-j) == 4 or (i-j) == 9 and word not in testingwords_list:
                        testingwords_list += [stem + affix]
                        testingwords_dict[word] = parts
            words_list = list(words_dict.keys())
            listlength = len(words_list)
            if listlength != 0:
                print(f'Length of word list: {listlength}')
                print(f'Finished rep {reps} of generating {l} word list.')
            elif listlength < w: 
                words_list = []
                testingwords_list = []
                trainingwords_list = []
                words_dict = {}
                testingwords_dict = {}
                trainingwords_dict = {}
                if list(words_dict.keys()) != words_list:
                    print('Dictionaries not the same length as word lists!')
        
        if len(words_list) == w:
            print(f'Finished testing {l} word list.')
            trainingwords_dict = words_dict.copy()
            for x in testingwords_list:
                del trainingwords_dict[x]
            trainingwords_list = list(trainingwords_dict.keys())
        return affix_subset, stem_subset, words_dict, words_list, trainingwords_dict, trainingwords_list, testingwords_dict, testingwords_list
    
    # generate word lists for both languages:
    L1affixsubset_list, L1stemsubset_list, L1words_dict, L1words_list, L1trainingwords_dict, L1trainingwords_list, L1testingwords_dict, L1testingwords_list = wordcycle(L1affixes_list, L1stems_list, 'L1', 5, 10, 50)
    L2affixsubset_list, L2stemsubset_list, L2words_dict, L2words_list, L2trainingwords_dict, L2trainingwords_list, L2testingwords_dict, L2testingwords_list = wordcycle(L2affixes_list, L2stems_list, 'L2', 5, 10, 50)
    if len(L1words_list) == len(L2words_list) and list(L1words_dict.keys()) == L1words_list and list(L2words_dict.keys()) == L2words_list:
        print('Correctly generated complete stimuli set.')
    elif list(L1words_dict.keys()) != L1words_list or list(L2words_dict.keys()) != L2words_list:
        print('Dictionaries not the same length as word lists!')
    return L1affixsubset_list, L1stemsubset_list, L2affixsubset_list, L2stemsubset_list, L1words_dict, L1words_list, L1trainingwords_dict, L1trainingwords_list, L1testingwords_dict, L1testingwords_list, L2words_dict, L2words_list, L2trainingwords_dict, L2trainingwords_list, L2testingwords_dict, L2testingwords_list

L1affixes_list, L1stems_list, L2affixes_list, L2stems_list = import_morphemes()
L1affixsubset_list, L1stemsubset_list, L2affixsubset_list, L2stemsubset_list, L1words_dict, L1words_list, L1trainingwords_dict, L1trainingwords_list, L1testingwords_dict, L1testingwords_list, L2words_dict, L2words_list, L2trainingwords_dict, L2trainingwords_list, L2testingwords_dict, L2testingwords_list = cycle_through(L1affixes_list,L1stems_list,L2affixes_list,L2stems_list)

end_time = time.time()
elapsed_time = (end_time - start_time)
print('Execution time: %.1f seconds' % elapsed_time)