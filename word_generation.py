import time
start_time = time.time()

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
def cycle_through(a,s,w):
    '''
    Cycles through the permutations and repeats_check function to obtain lists of stems and affixes in each language without repeats.

    Parameters
    ----------
    a : INTEGER
        The number of affixes to generate in each language.
    s : INTEGER
        The number of stems to generate in each language.
    w : INTEGER
        The number of words to generate in each language.

    Returns
    -------
    L1affixes : LIST
        The list of affixes for L1.
    L1stems : LIST
        The list of stems for L1.
    L2affixes : LIST
        The list of affixes for L2.
    L2stems : LIST
        The list of stems for L2.
    L1words : LIST
        The list of words for L1.
    L2words : LIST
        The list of words for L2.
    L1dict : DICTIONARY
        The dictionary of words for L1, with the stem and affix they're composed of
    L2dict : DICTIONARY
        The dictionary of words for L2, with the stem and affix they're composed of
    '''
    def wordcycle(affixes,stems,l,w,dist):
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
        w : INTEGER
            Number of words to generate.
        dist : INTEGER
            The desired LE distance threshold.

        Returns
        -------
        words : LIST
            Generated words list.
        '''
        words = []
        missing = w # to start, all w desired items are missing
        reps = 0
        words_dict = {}
        while len(words) < w: # while word list incomplete
            reps += 1
            for i in affixes:
                for j in stems:
                    while missing > 0:
                        s = random.choice(stems)
                        a = random.choice(affixes)
                        if s != a and s[-1] != a[0] and s + a not in words: # if stem & affix different, plus if the boundary letters are different, and the word isn't already in the word list
                            words += [s + a]
                            missing -= 1
                            parts = [s, a]
                            word = s + a
                            words_dict[word] = parts # add word to dictionary
            if len(words) == w:
                print(f'Finished rep {reps} of generating {l} word list. Testing LE distance...')
            else:
                print(f'Problem on rep {reps} of generating {l} word list.')
                break
            
            dellist = []
            for i in range(len(words)):
                for j in range(len(words)):
                    if i != j:
                        distance = int(LED(words[i], words[j]))
                        #print(words[i], words[j], distance) optional: print tested word pairs & the LED
                        if distance < dist: # if LED below specified threshold LED
                            dellist.append(words[i])
            dellist = [*set(dellist)]
            #print(f'Words to delete: {dellist}') optional: print list of words to delete
            missing = len(dellist) # calculate how many more words it'll need to generate
            #print(f'Still missing {missing} word(s).') optional: print how many words it still has to generate
            for x in dellist:
                del words_dict[x] # delete dictionary entry for too-similar words
            words = [x for x in words if x in words_dict] # delete words in list if they're not in the dictionary
        if len(words) == w:
            print(f'Finished testing {l} word list.')
        return words, reps, words_dict
    
    def globalcycle(L1affixes,L1stems,L2affixes,L2stems,l,w,dist):
        '''
        Uses the wordcycle function to generate stem + affix pairings in L1 and L2, tests the LE distance between languages, and returns complete word lists.

        Parameters
        ----------
        L1affixes : LIST
            The list of affixes from L1.
        L1stems : LIST
            The list of stems from L1.
        L2affixes : LIST
            The list of affixes from L2.
        L2stems : LIST
            The list of stems from L2.
        l : STRING
            The label for what the function is working with (usually, enter 'global').
        w : INTEGER
            The total number of words to generate for each language.
        dist : INTEGER
            The input for the threshold accepted LE distance.

        Returns
        -------
        L1words : LIST
            A list of words in L1.
        L2words : LIST
            A list of words in L2.
        L1reps : LIST
            A list of the amount of cycles needed for the function to get all the L1 words for each global cycle.
        L2reps : LIST
            A list of the amount of cycles needed for the function to get all the L2 words for each global cycle..
        L1dict : DICT
            A dictionary matching L1 words with the stem & affix they're made of (order: stem, then affix).
        L2dict : DICT
            A dictionary matching L2 words with the stem & affix they're made of (order: stem, then affix)..
        globalreps : INTEGER
            The number of cycles that globalcycle had to go through to get all the L1 & L2 words.
        '''
        dist2 = int(input("Desired LE distance threshold for words between languages: ")) # LED threshold prompt
        missing2 = w # to start, all w desired items are missing
        L1words = []
        L1reps = []
        L2reps = []
        globalreps = 1
        L1words, L1reps1, L1dict = wordcycle(L1affixes,L1stems,'L1',missing2,dist)
        L1reps.append(L1reps1)
        L2words, L2reps1, L2dict = wordcycle(L2affixes,L2stems,'L2',missing2,dist)
        L2reps.append(L2reps1)
        if len(L1words) != len(L2words):
            print('Warning: L1 words not the same length as L2 words')
        print('Testing LE distance between languages...')
        dellist1 = []
        dellist2 = []            
        for i in range(len(L1words)):
            for j in range(len(L2words)):
                L1testword = L1words[i]
                L2testword = L2words[j]
                distance = int(LED(L1testword, L2testword)) # LE distance calculations between L1 & L2 words
                #print(L1words[i], L2words[j], distance) # optional: print tested word pairs & the LED
                if distance < dist2: # if LED below specified threshold LED
                    dellist1.append(L1testword)
                    dellist2.append(L2testword)
        if len(dellist1) != len(dellist2):
            print('Warning: different lengths of the dellists!')
        dellist1 = [*set(dellist1)]
        dellist2 = [*set(dellist2)]
        #print(f'Words to delete: {dellist}') optional: print list of words to delete
        for x in dellist1:
            del L1dict[x] # delete dictionary entry for too-similar words
        for y in dellist2:
            del L2dict[y] # delete dictionary entry for too-similar words
        L1words = list(L1dict.keys()) # delete words in list if they're not in the dictionary
        L2words = list(L2dict.keys()) # delete words in list if they're not in the dictionary
        missing1 = w - len(L1words) # calculate how many more words it'll need to generate
        missing2 = w - len(L2words)
        #print(f'Still missing {missing} word(s).') optional: print how many words it still has to generate
        print(f'Rep {globalreps} of comparing L1 and L2 word lists finished.')
        while len(L1words) < w : # while word lists incomplete
            globalreps += 1
            L1words_a, L1reps_a, L1dict_a = wordcycle(L1affixes,L1stems,'L1',missing1,dist)
            L1reps.append(L1reps_a) # add repetition count to reps list
            L1dict.update(L1dict_a) # update dictionary
            L1words += L1words_a # update words list
            L2words_a, L2reps_a, L2dict_a = wordcycle(L2affixes,L2stems,'L2',missing2,dist)
            L2reps.append(L2reps_a) # add repetition count to reps list
            L2dict.update(L2dict_a) # update dictionary
            L2words += L2words_a # update words list
            if len(L1words) != len(L2words):
                print('Warning: L1words length different from L2words length after update')
            print('Testing LE distance between languages...')
            dellist1 = []
            dellist2 = []            
            for i in range(len(L1words)):
                for j in range(len(L2words)):
                    distance = int(LED(L1words[i], L2words[j])) # LE distance calculations between L1 & L2 words
                    #print(L1words[i], L2words[j], distance) # optional: print tested word pairs & the LED
                    if distance < dist2: # if LED below specified threshold LED
                        dellist1.append(L1words[i])
                        dellist2.append(L2words[j])
            if len(dellist1) != len(dellist2):
                print('Warning: different lengths of the dellists!')
            dellist1 = [*set(dellist1)]
            dellist2 = [*set(dellist2)]
            #print(f'Words to delete: {dellist}') optional: print list of words to delete
            for x in dellist1:
                del L1dict[x] # delete dictionary entry for too-similar words
            for y in dellist2:
                del L2dict[y] # delete dictionary entry for too-similar words
            L1words = list(L1dict.keys()) # delete words in list if they're not in the dictionary
            L2words = list(L2dict.keys()) # delete words in list if they're not in the dictionary  
            missing1 = w - len(L1words)
            missing2 = w - len(L2words)
            print(f'Rep {globalreps} of comparing L1 and L2 word lists finished.')
        if len(L1words) == len(L2words) == w and missing1 == 0 and missing2 == 0:
            print('Finished comparing L1 and L2 word lists.')
        elif len(L1words) != len(L2words):
            print(f'Warning: L1word and L2word length different at end of rep {globalreps}')
        return L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps
    
    # generate word lists for both languages:
    dist_input = int(input("Desired LE distance threshold for words: ")) # LED threshold prompt
    L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps = globalcycle(L1affixes_list,L1stems_list,L2affixes_list,L2stems_list,'global',w,dist_input)
    if len(L1words) == len(L2words) == w and list(L1dict.keys()) == L1words and list(L2dict.keys()) == L2words:
        print('Correctly generated complete stimuli set.')
    elif list(L1dict.keys()) != L1words or list(L2dict.keys()) != L2words:
        print('Dictionaries not the same length as word lists!')
    return L1affixes_dict, L1affixes_list, L1stems_dict, L1stems_list, L2affixes_dict, L2affixes_list, L2stems_dict, L2stems_list, L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps


end_time = time.time()
elapsed_time = (end_time - start_time)/60
print('Execution time: %.2f minutes' % elapsed_time)