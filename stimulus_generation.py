import time
start_time = time.time()

def setlistcompare(lst):
    '''
    Compares length of a set to length of a list to test for repeated strings

    Parameters
    ----------
    lst : LIST

    Returns
    -------
    Printed message saying whether duplicates were found in the list or not.
    '''
    testset = set(lst)
    if len(lst) != len(testset):
        print("Duplicates found in the list!")
    else:
        print("No duplicates found in the list.")

import random
def language_characters():
    '''
    Makes two lists with overlapping or non-overlapping character sets

    Returns
    -------
    letters1 : LIST
        First list of characters.
    letters2 : LIST
        Second list of characters.
    '''
    letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'Y', 'Z', 'a', 'b', 'c', 'd', 'g', 'h', 'i', 'k', 'l', 'm', 'o', 'r', 't', 'u', 'v', 'y']
    division = int(len(letters)/2)
    overlap = input("Overlapping characters across languages? [y/n]: ")
    if overlap == 'n':
        random.shuffle(letters)
        letters1 = letters[division:]
        letters2 = letters[:division]
    elif overlap == 'y':
        letters1 = random.sample(letters, k = division)
        letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'Y', 'Z', 'a', 'b', 'c', 'd', 'g', 'h', 'i', 'k', 'l', 'm', 'o', 'r', 't', 'u', 'v', 'y']
        letters2 = random.sample(letters, k = division)
    else:
        print("Sorry, not a valid choice.")
    print(f'Letters in language 1: {letters1}')
    print(f'Letters in language 2: {letters2}')
    all_letters = letters1 + letters2
    setlistcompare(all_letters) # test whether the letter sets are overlapping or not
    return letters1, letters2

def permutations(lst,l,n,morpheme_type):
    '''
    Generates n permutations of length l of a list lst. Works if l [2;6].

    Parameters
    ----------
    lst : LIST
        Input list
    l : INTEGER
        Desired length of the morphemes
    n : INTEGER
        Number of morphemes to be added to output list
    morpheme_type : STRING
        'Affixes' or 'stems' for the end printed message

    Returns
    -------
    morphemes : LIST
        Output list containing generated permutations
    '''
    if len(lst) == 0:
        print('Careful, input list to permutations is empty!')
        return
    morphemes = []
    count = 0
    for i in lst:
        if l < 2 or l > 6: # break function if requested length is outside defined parameters
            print("Problem: invalid parameters. l must be between 2 and 6.")
            break
        else:
            while count < n:
                if l == 2: # randomly pick 2 characters to assemble into a morpheme
                    a = random.choice(lst)
                    b = random.choice(lst)
                    if a != b and a + b not in morphemes:
                        morphemes += [a + b]
                        count += 1
                    else:
                        continue
                elif l == 3: # randomly pick 3 characters to assemble into a morpheme
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    if a != b and b != c and c != a and a+b+c not in morphemes: # making sure there are only different letters in the morpheme
                        morphemes += [a + b + c]
                        count += 1
                    else:
                        continue
                elif l == 4: # randomly pick 4 characters to assemble into a morpheme
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    if a !=b and b != c and c != d and d != a and a+b+c+d not in morphemes: # making sure there are only different letters in the morpheme
                        morphemes += [a + b + c + d]
                        count += 1
                    else:
                        continue
                elif l == 5: # randomly pick 5 characters to assemble into a morpheme
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    e = random.choice(lst)
                    if a != b and b != c and c != d and d != e and e != a and a+b+c+d+e not in morphemes: # making sure there are only different letters in the morpheme
                        morphemes += [a + b + c + d + e]
                        count += 1
                    else:
                        continue
                elif l == 6: # randomly pick 6 characters to assemble into a morpheme
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    e = random.choice(lst)
                    f = random.choice(lst)
                    if a != b and b != c and c != d and d != e and e != f and f != a and a+b+c+d+e+f not in morphemes: # making sure there are only different letters in the morpheme
                        morphemes += [a + b + c + d + e + f]
                        count += 1
                    else:
                        continue
    if morphemes != False:
        print(f"Finished generating list of {l}-character {morpheme_type}")
    return morphemes

import itertools
def global_intersection(lst1,lst2,intersectiondist):
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
    def intersection(lst1,intersectiondist):
        '''
        Tests for identical chunks of characters in morphemes from 1 list.

        Parameters
        ----------
        lst1 : LIST
            The list to perform the check on.
        intersectiondist : INTEGER
            Size of chunk taken for the check.

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
        return morphemes_dict, morphemes_list
        
    if len(lst1) == 0: # tests to see whether the lists given to the function contain something
        print('Careful, lst1 is empty!')
    if len(lst2) == 0:
        print('Careful, lst2 is empty!')
    if len(lst1) == 0 or len(lst2) == 0:
        return
    morphemes1_dict, morphemes1_list = intersection(lst1, intersectiondist)
    morphemes2_dict, morphemes2_list = intersection(lst2, intersectiondist)
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
    l = len(lst1) - 1
    i = 0
    for i in range(l):
        j = 0
        while j <= l:
            distance = LED(lst1[i],lst2[j]) # computation of LE distance
            #print(lst1[i], lst2[j])
            #print(distance)
            if distance <= dist_input:
                dellist.append(lst2[i])
            j += 1
    #print(f'Words to delete: {dellist}')
    return dellist

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
    def list_generations(lst,n1,n2,t1,t2,intersectiondist,morpheme_type):
        '''
        Cycles through the permutations and global_intersection function to obtain 2 lists without repeats.

        Parameters
        ----------
        lst : LIST
            List of the characters to assemble into morphemes.
        n1 : INTEGER
            Lower length of the morphemes to generate.
        n2 : INTEGER
            Upper length of the morphemes to generate.
        t1 : INTEGER
            Number of morphemes of length n1 to generate.
        t2 : INTEGER
            Number of morphemes of length n2 to generate.
        intersectiondist : INTEGER
            The size of chunks to take.
        morpheme_type : STRING
            'Affixes' or 'stems' for the end printed message
        
        Returns
        -------
        morphemes1 : LIST
            List of the first set of morphemes.
        morphemes2 : LIST
            List of the second set of morphemes.
        '''
        morphemes1_list = []
        morphemes2_list = []
        if t1 != 0:
            morphemes1_list = permutations(lst,n1,t1,morpheme_type) # generate morphemes of a certain length
        else:
            print('Careful, t1 == 0')
        if t2 != 0:
            morphemes2_list = permutations(lst,n2,t2,morpheme_type) # generate morphemes 1 character longer than in morphemes1
        else:
            print('Careful, t2 == 0')
        morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list = global_intersection(morphemes1_list, morphemes2_list, intersectiondist) # find intersections in the morphemes lists
        n_inter = len(morphemes1_list)
        while n_inter < t1: # while morphemes1 has deletions due to intersections with morphemes2
            missing = int(t1 - n_inter) # calculate how many more to generate
            #print(f'Still missing {missing} morphemes')
            moremorphemes1_list = permutations(lst,n1,missing,morpheme_type)
            morphemes1_list = moremorphemes1_list + morphemes1_list
            morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list = global_intersection(morphemes1_list, morphemes2_list, intersectiondist) # calculate intersections between new morphemes1 and morphemes2
            n_inter = len(morphemes1_list)
        return morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list
    
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
        
    # generate character lists for both languages:
    letters1, letters2 = language_characters()
    
    # generate affix & stem lists for both languages:
    intersectiondist = int(input("Desired intersections chunk size for morphemes: ")) # intersections check chunk size prompt
    L1affixes1_dict, L1affixes1_list, L1affixes2_dict, L1affixes2_list = list_generations(letters1,3,4,(a/2),(a/2),intersectiondist,'affixes') # a being the total number of affixes to generate, so want a/2 3-character and a/2 4-character affixes
    L1stems1_dict, L1stems1_list, L1stems2_dict, L1stems2_list = list_generations(letters1,4,5,(s/2),(s/2),intersectiondist,'stems') # s being the total number of stems to generate, so want s/2 4-character and s/2 5-character stems
    L2affixes1_dict, L2affixes1_list, L2affixes2_dict, L2affixes2_list = list_generations(letters2,3,4,(a/2),(a/2),intersectiondist,'affixes')
    L2stems1_dict, L2stems1_list, L2stems2_dict, L2stems2_list = list_generations(letters2,4,5,(s/2),(s/2),intersectiondist,'stems')
    L1affixes_dict = L1affixes1_dict.update(L1affixes2_dict)
    L1affixes_list = L1affixes1_list + L1affixes2_list
    L1stems_dict = L1stems1_dict.update(L1stems2_dict)
    L1stems_list = L1stems1_list + L1stems2_list
    L2affixes_dict = L2affixes1_dict.update(L2affixes2_dict)
    L2affixes_list = L2affixes1_list + L2affixes2_list
    L2stems_dict = L2stems1_dict.update(L2stems2_dict)
    L2stems_list = L2stems1_list + L2stems2_list
    if len(L1affixes_list) != 0 and len(L1stems_list) != 0 and len(L2affixes_list) != 0 and len(L2stems_list) != 0 and len(L1affixes_list) == len(L2affixes_list) and len(L1stems_list) == len(L2stems_list):
        print('Finished generating affix and stem lists.')
    else:
        print('Problem generating affix and stem lists.')
    
    # generate word lists for both languages:
    dist_input = int(input("Desired LE distance threshold for words: ")) # LED threshold prompt
    L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps = globalcycle(L1affixes_list,L1stems_list,L2affixes_list,L2stems_list,'global',w,dist_input)
    if len(L1words) == len(L2words) == w and list(L1dict.keys()) == L1words and list(L2dict.keys()) == L2words:
        print('Correctly generated complete stimuli set.')
    elif list(L1dict.keys()) != L1words or list(L2dict.keys()) != L2words:
        print('Dictionaries not the same length as word lists!')
    return L1affixes_dict, L1affixes_list, L1stems_dict, L1stems_list, L2affixes_dict, L2affixes_list, L2stems_dict, L2stems_list, L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps

L1affixes_dict, L1affixes_list, L1stems_dict, L1stems_list, L2affixes_dict, L2affixes_list, L2stems_dict, L2stems_list, L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps = cycle_through(100,200,300)

end_time = time.time()
elapsed_time = (end_time - start_time)/60

print('Execution time: %.2f minutes' % elapsed_time)