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

import itertools
def global_intersection(lst1,lst2,intersectiondist,LEdistprompt):
    '''
    Tests for identical chunks of characters in words from 2 lists.

    Parameters
    ----------
    lst1 : LIST
        The first list to run the intersection check on.
    lst2 : LIST
        The second list to run the intersection check on.
    intersectiondist : INTEGER
        Size of chunk taken for the intersection check.
    LEdistprompt : INTEGER
        The threshold for LE distance checks (rejects morphemes with distance <= LEdistprompt)

    Returns
    -------
    morphemes1_dict : DICTIONARY
        Output dictionary of non-intersecting morphemes from lst1.
    morphemes1_list : LIST
        Output list of non-intersecting morphemes from lst1.
    morphemes2_dict : DICTIONARY
        Output dictionary of non-intersecting morphemes from lst2.
    morphemes2_list : LIST
        Output list of non-intersecting morphemes from lst2.
    '''
    def intersection(lst1,intersectiondist,LEdistprompt):
        '''
        Tests for identical chunks of characters in morphemes from 1 list.

        Parameters
        ----------
        lst1 : LIST
            The list to perform the check on.
        intersectiondist : INTEGER
            Size of chunk taken for the check.
        LEdistprompt : INTEGER
            The threshold for LE distance checks (rejects morphemes with distance <= LEdistprompt)

        Returns
        -------
        morphemes_dict : DICTIONARY
            Output dictionary of non-intersecting morphemes.
        morphemes_list : LIST
            Output list of non-intersecting morphemes.
        '''
        if len(lst1) == 0: # tests to see whether the list given to the function contains something
            print('Careful, list is empty!')
        morphemes_dict = {}
        for i in lst1: # split lst1 into chunks of pre-defined length
            length1 = len(i)    
            n = 0
            morphemes_dict[i] = [i[0:intersectiondist]]
            n = 1
            while (intersectiondist + n) <= length1:
                test_chunk = i[n:(intersectiondist + n)]
                morphemes_dict[i].append(test_chunk) # add morpheme to dictionary
                n += 1
            else:
                n = 0
                continue
        chunks_list = morphemes_dict.values()
        chunks_list = list(itertools.chain.from_iterable(chunks_list))
        chunks_dellist = [x for x in chunks_list if chunks_list.count(x) > 1] # extract duplicates from chunks_list
        chunks_dellist = [*set(chunks_dellist)]
        dict_length = len(morphemes_dict)
        dict_list = list(morphemes_dict.keys())
        for i in range(dict_length): # for every morpheme key in the dictionary
            key = dict_list[i]
            for j in range(len(morphemes_dict[key])):
                if key in morphemes_dict.keys(): # if the key hasn't already been deleted
                    if morphemes_dict[key][j] in chunks_dellist: # if one of the morpheme's chunks is in the dellist
                        del morphemes_dict[key] # delete entry for that item
                else:
                    continue
        morphemes_list = list(morphemes_dict.keys())
        dellist = []
        l = len(morphemes_list) - 1
        i = 0
        for i in range(l):
            j = 0
            while j <= l:
                if morphemes_list[i] != morphemes_list[j]:
                    distance = LED(morphemes_list[i],morphemes_list[j]) # computation of LE distance
                    #print(morphemes_list[i], morphemes_list[j])
                    #print(distance)
                    if distance <= LEdistprompt:
                        dellist.append(morphemes_list[i])
                        dellist.append(morphemes_list[j])
                j += 1
        dellist = [*set(dellist)]
        for x in dellist:
            del morphemes_dict[x]
        morphemes_list = list(morphemes_dict.keys())
        return morphemes_dict, morphemes_list
        
    if len(lst1) == 0: # tests to see whether the lists given to the function contain something
        print('Careful, lst1 is empty!')
    if len(lst2) == 0:
        print('Careful, lst2 is empty!')
    if len(lst1) == 0 or len(lst2) == 0:
        return
    morphemes1_dict, morphemes1_list = intersection(lst1,intersectiondist,LEdistprompt)
    morphemes2_dict, morphemes2_list = intersection(lst2,intersectiondist,LEdistprompt)
    chunks1_list = morphemes1_dict.values()
    chunks2_list = morphemes2_dict.values()
    chunks1_list = list(itertools.chain.from_iterable(chunks1_list))
    chunks2_list = list(itertools.chain.from_iterable(chunks2_list))
    pooled_list = chunks1_list + chunks2_list
    chunks1_dellist = [x for x in pooled_list if pooled_list.count(x) > 1] # extract duplicates from chunks_list
    chunks2_dellist = [x for x in pooled_list if pooled_list.count(x) > 1]
    chunks1_dellist = [*set(chunks1_dellist)]
    chunks2_dellist = [*set(chunks2_dellist)]
    dict1_length = len(morphemes1_dict)
    dict1_list = list(morphemes1_dict.keys())
    for i in range(dict1_length): # for every morpheme key in the dictionary
        key = dict1_list[i]
        for j in range(len(morphemes1_dict[key])):
            if key in morphemes1_dict.keys(): # if the key hasn't already been deleted
                if morphemes1_dict[key][j] in chunks1_dellist: # if one of the morpheme's chunks is in the dellist
                    del morphemes1_dict[key] # delete entry for that item
            else:
                continue
    morphemes1_list = list(morphemes1_dict.keys())
    dict2_length = len(morphemes2_dict)
    dict2_list = list(morphemes2_dict.keys())
    for i in range(dict2_length): # for every morpheme key in the dictionary
        key = dict2_list[i]
        for j in range(len(morphemes2_dict[key])):
            if key in morphemes2_dict.keys(): # if the key hasn't already been deleted
                if morphemes2_dict[key][j] in chunks1_dellist: # if one of the morpheme's chunks is in the dellist
                    del morphemes2_dict[key] # delete entry for that item
            else:
                continue
    morphemes2_list = list(morphemes2_dict.keys())
    morphemes_dellist = LEdistance(morphemes1_list,morphemes2_list,LEdistprompt)
    morphemes1_list = [x for x in morphemes1_list if x not in morphemes_dellist]
    morphemes2_list = [x for x in morphemes2_list if x not in morphemes_dellist]
    return morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list


import numpy as np
def LED(word1,word2):
    '''
    Calculates the Levenshtein distance between 2 given words.
    
    Parameters
    ----------
    word1 : STRING
        The first word to compare.
        word2 : STRING
        The second word to compare
        
    Returns
    -------
    distances : INTEGER
    LE distance between the two words
    '''
    distances = np.zeros((len(word1)+1, len(word2)+1))
    for w1 in range(len(word1)+1):
        distances[w1][0] = w1
    for w2 in range(len(word2)+1):
        distances[0][w2] = w2
    a = 0
    b = 0
    c = 0
    for w1 in range(1, len(word1)+1):
        for w2 in range(1, len(word2)+1):
            if (word1[w1-1] == word2[w2-1]):
                distances[w1][w2] = distances[w1-1][w2-1]
            else:
                a = distances[w1][w2-1]
                b = distances[w1-1][w2]
                c = distances[w1-1][w2-1]
                if a <= b and a <= c:
                    distances[w1][w2] = a + 1
                elif b <= a and b <= c:
                    distances[w1][w2] = b + 1
                else:
                    distances[w1][w2] = c + 1
    return distances[len(word1)][len(word2)]

def LEdistance(lst1,lst2,dist_input):
    '''
    Uses the LED function to cycle through 2 lists and compile a list of words too similar between the lists.

    Parameters
    ----------
    lst1 : LIST
        The first list to compare.
    lst2 : LIST
        The second list to compare.
    dist_input : INTEGER
        The accepted LE threshold value.

    Returns
    -------
    dellist : LIST
        A list of morphemes from lst2 to delete due to too great similarity to lst1.
    '''
    dellist = []
    l1 = len(lst1) - 1
    l2 = len(lst2) - 1
    i = 0
    for i in range(l1):
        j = 0
        while j <= l2:
            distance = LED(lst1[i],lst2[j]) # computation of LE distance
            #print(lst1[i], lst2[j])
            #print(distance)
            if distance <= dist_input:
                dellist.append(lst1[i])
                dellist.append(lst2[j])
            j += 1
    #print(f'Words to delete: {dellist}')
    return dellist

import random
def cycle_through(L1affixes,L1stems,L2affixes,L2stems):
    '''
    Cycles through the permutations and repeats_check function to obtain lists of stems and affixes in each language without repeats.

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
    def wordcycle(affixes,stems,l,a,s,w,dist):
        '''
        Combines affixes and stems into words, tests LED, delete similar words, cycles through again if word list incomplete.

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
        dist : INTEGER
            The desired LE distance threshold.

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
        missing = w # to start, all w desired items are missing
        reps = 0
        while len(words_list) < w: # while word list incomplete
            affix_subset = random.sample(affixes,a)
            stem_subset = random.sample(stems,s)        
            reps += 1
            for i in range(len(stem_subset)):
                for j in range(len(affix_subset)):
                    stem = stems[i]
                    affix = affixes[j]
                    if stem != affix and stem[-1] != affix[0]: # if stem & affix different, plus if the boundary letters are different, and the word isn't already in the word list
                        words_list += [stem + affix]
                        missing -= 1
                        parts = [stem, affix]
                        word = stem + affix
                        words_dict[word] = parts # add word to dictionary
                    if i  == j:
                        testingwords_list += [stem + affix]
                        testingwords_dict[word] = parts
            if len(words_list) != 0:
                print(f'Finished rep {reps} of generating {l} word list. Testing LE distance...')
            
            dellist = []
            for i in range(len(words_list)):
                for j in range(len(words_list)):
                    if i != j:
                        distance = int(LED(words_list[i], words_list[j]))
                        #print(words_list[i], words_list[j], distance) #optional: print tested word pairs & the LED
                        if distance <= dist: # if LED below specified threshold LED
                            dellist.append(words_list[i])
            dellist = [*set(dellist)]
            #print(f'Words to delete: {dellist}') optional: print list of words to delete
            if len(dellist) != 0:
                for x in dellist:
                    del words_dict[x] # delete dictionary entry for too-similar words
            words_list = [x for x in words_list if x in words_dict] # delete words in list if they're not in the dictionary
            if len(words_list) != w:
                print(len(words_list))
                words_list = []
        if len(words_list) == w:
            print(f'Finished testing {l} word list.')
            trainingwords_dict = words_dict.copy()
            for x in testingwords_list:
                del trainingwords_dict[x]
            trainingwords_list = list(trainingwords_dict.keys())
        return words_dict, words_list, trainingwords_dict, trainingwords_list, testingwords_dict, testingwords_list
    
    # generate word lists for both languages:
    #intersectiondist = int(input("Desired intersections chunk size for morphemes: ")) # intersections check chunk size prompt
    dist_input = int(input("Desired LE distance threshold for words: ")) # LED threshold prompt
    L1words_dict, L1words_list, L1trainingwords_dict, L1trainingwords_list, L1testingwords_dict, L1testingwords_list = wordcycle(L1affixes_list, L1stems_list, 'L1', 5, 10, 50, dist_input)
    L2words_dict, L2words_list, L2trainingwords_dict, L2trainingwords_list, L2testingwords_dict, L2testingwords_list = wordcycle(L2affixes_list, L2stems_list, 'L2', 5, 10, 50, dist_input)
    if len(L1words_list) == len(L2words_list) and list(L1words_dict.keys()) == L1words_list and list(L2words_dict.keys()) == L2words_list:
        print('Correctly generated complete stimuli set.')
    elif list(L1words_dict.keys()) != L1words_list or list(L2words_dict.keys()) != L2words_list:
        print('Dictionaries not the same length as word lists!')
    return L1words_dict, L1words_list, L1trainingwords_dict, L1trainingwords_list, L1testingwords_dict, L1testingwords_list, L2words_dict, L2words_list, L2trainingwords_dict, L2trainingwords_list, L2testingwords_dict, L2testingwords_list

L1affixes_list, L1stems_list, L2affixes_list, L2stems_list = import_morphemes()
L1words_dict, L1words_list, L1trainingwords_dict, L1trainingwords_list, L1testingwords_dict, L1testingwords_list, L2words_dict, L2words_list, L2trainingwords_dict, L2trainingwords_list, L2testingwords_dict, L2testingwords_list = cycle_through(L1affixes_list,L1stems_list,L2affixes_list,L2stems_list)

end_time = time.time()
elapsed_time = (end_time - start_time)/60
print('Execution time: %.2f minutes' % elapsed_time)