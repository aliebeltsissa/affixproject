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

def permutations(lst,l,n,morpheme_type,language):
    '''
    Generates n permutations of length l of a list lst. Works if l [2;6].

    Parameters
    ----------
    lst : LIST
        Input list.
    l : INTEGER
        Desired length of the morphemes.
    n : INTEGER
        Number of morphemes to be added to output list.
    morpheme_type : STRING
        'Affixes' or 'stems' for the end printed message.
    language : STRING
        'L1' or 'L2' for the end printed message.

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
        print(f"Finished generating {language} list of {l}-character {morpheme_type}")
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

def morpheme_generations(a,s):
    '''
    Cycles through list_generation function to get sets of morphemes for L1 & L2.

    Parameters
    ----------
    a : INTEGER
        The number of affixes to generate for each language.
    s : INTEGER
        The number of stems to generate for each language.

    Returns
    -------
    L1affixes_dict : DICTIONARY
        A dictionary of morphemes belonging to L2.
    L1affixes_list : LIST
        A list of morphemes belonging to L2.
    L1stems_dict : DICTIONARY
        A dictionary of morphemes belonging to L2.
    L1stems_list : LIST
        A list of morphemes belonging to L2.
    L2affixes_dict : DICTIONARY
        A dictionary of morphemes belonging to L2.
    L2affixes_list : LIST
        A list of morphemes belonging to L2.
    L2stems_dict : DICTIONARY
        A dictionary of morphemes belonging to L2.
    L2stems_list : LIST
        A list of morphemes belonging to L2.
    '''
    def list_generations(lst,n1,n2,t1,t2,intersectiondist,morpheme_type,language):
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
            'Affixes' or 'stems' for the end printed message.
        language : STRING
            'L1' or 'L2' for the end printed message.
        
        Returns
        -------
        moprhemes1_dict : DICTIONARY
            Dictionary of the first set of morphemes.
        morphemes1_list : LIST
            List of the first set of morphemes.
        morphemes2_dict : DICTIONARY
            Dictionary of the second set of morphemes.
        morphemes2_list : LIST
            List of the second set of morphemes.
        '''
        morphemes1_list = []
        morphemes2_list = []
        if t1 != 0:
            morphemes1_list = permutations(lst,n1,t1,morpheme_type,language) # generate morphemes of a certain length
        else:
            print('Careful, t1 == 0')
        if t2 != 0:
            morphemes2_list = permutations(lst,n2,t2,morpheme_type,language) # generate morphemes 1 character longer than in morphemes1
        else:
            print('Careful, t2 == 0')
        morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list = global_intersection(morphemes1_list, morphemes2_list, intersectiondist) # find intersections in the morphemes lists
        n_inter1 = len(morphemes1_list)
        missing = int(t1 - n_inter1) # calculate how many more to generate
        #print(f'Still missing {missing} morphemes')
        while n_inter1 < t1: # while morphemes1 has deletions due to intersections with morphemes2
            moremorphemes1_list = permutations(lst,n1,missing,morpheme_type,language)
            morphemes1_list = moremorphemes1_list + morphemes1_list
            morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list = global_intersection(morphemes1_list, morphemes2_list, intersectiondist) # calculate intersections between new morphemes1 and morphemes2
            n_inter1 = len(morphemes1_list)
            missing = int(t1 - n_inter1) # calculate how many more to generate
            #print(f'Still missing {missing} morphemes')
        n_inter2 = len(morphemes2_list)
        missing = int(t2 - n_inter2) # calculate how many more to generate
        #print(f'Still missing {missing} morphemes')
        while n_inter2 < t2: # while morphemes2 has deletions due to intersections with morphemes1
            moremorphemes2_list = permutations(lst,n2,missing,morpheme_type,language)
            morphemes2_list = moremorphemes2_list + morphemes2_list
            morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list = global_intersection(morphemes1_list, morphemes2_list, intersectiondist) # calculate intersections between new morphemes2 and morphemes1
            n_inter2 = len(morphemes2_list)
            missing = int(t2 - n_inter2) # calculate how many more to generate
            #print(f'Still missing {missing} morphemes')
        return morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list
            
    # generate character lists for both languages:
    letters1, letters2 = language_characters()
    
    # generate morpheme lists and dictionaries for both languages:
    intersectiondist = int(input("Desired intersections chunk size for morphemes: ")) # intersections check chunk size prompt
    L1affixes1_dict, L1affixes1_list, L1affixes2_dict, L1affixes2_list = list_generations(letters1,3,4,(a/2),(a/2),intersectiondist,'affixes','L1') # a being the total number of affixes to generate, so want a/2 3-character and a/2 4-character affixes
    L1stems1_dict, L1stems1_list, L1stems2_dict, L1stems2_list = list_generations(letters1,4,5,(s/2),(s/2),intersectiondist,'stems','L1') # s being the total number of stems to generate, so want s/2 4-character and s/2 5-character stems
    L2affixes1_dict, L2affixes1_list, L2affixes2_dict, L2affixes2_list = list_generations(letters2,3,4,(a/2),(a/2),intersectiondist,'affixes','L2')
    L2stems1_dict, L2stems1_list, L2stems2_dict, L2stems2_list = list_generations(letters2,4,5,(s/2),(s/2),intersectiondist,'stems','L2')

    # combine morpheme lists and dictionaries for both languages:
    L1affixes_dict = dict(L1affixes1_dict, **L1affixes2_dict)
    L1affixes_list = L1affixes1_list + L1affixes2_list
    L1stems_dict = dict(L1stems1_dict, **L1stems2_dict)
    L1stems_list = L1stems1_list + L1stems2_list
    L2affixes_dict = dict(L2affixes1_dict, **L2affixes2_dict)
    L2affixes_list = L2affixes1_list + L2affixes2_list
    L2stems_dict = dict(L2stems1_dict, **L2stems2_dict)
    L2stems_list = L2stems1_list + L2stems2_list
    if len(L1affixes_list) == len(L2affixes_list) == a and len(L1stems_list) == len(L2stems_list) == s:
        print('Finished generating morpheme lists.')
    else:
        print('Problem generating morpheme lists.')
    return L1affixes_dict, L1affixes_list, L1stems_dict, L1stems_list, L2affixes_dict, L2affixes_list, L2stems_dict, L2stems_list
        
L1affixes_dict, L1affixes_list, L1stems_dict, L1stems_list, L2affixes_dict, L2affixes_list, L2stems_dict, L2stems_list = morpheme_generations(50,100)
    
end_time = time.time()
elapsed_time = end_time - start_time
print('Execution time: %.1f seconds' % elapsed_time)