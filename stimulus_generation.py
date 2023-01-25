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
    letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'y', 'z']
    overlap = input("Overlapping characters across languages? [y/n]: ")
    if overlap == 'n':
        random.shuffle(letters)
        letters1 = letters[12:]
        letters2 = letters[:12]
    elif overlap == 'y':
        letters1 = random.sample(letters, k = 12)
        letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'y', 'z']
        letters2 = random.sample(letters, k = 12)
    else:
        print("Sorry, not a valid choice.")
    print(f'Letters in language 1: {letters1}')
    print(f'Letters in language 2: {letters2}')
    all_letters = letters1 + letters2
    setlistcompare(all_letters) # test whether the letter sets are overlapping or not
    return letters1, letters2

def permutations(lst,l,n):
    '''
    Generates n permutations of length l of a list lst. Works if l [3;6].

    Parameters
    ----------
    lst : LIST
        Input list
    l : INTEGER
        Desired length of the segments
    n : INTEGER
        Number of segments to be added to output list

    Returns
    -------
    segments : LIST
        Output list containing generated permutations
    '''
    if len(lst) == 0:
        print('Careful, input list to permutations is empty!')
        return
    segments = []
    count = 0
    for i in lst:
        if l < 3 or l > 6: # break function if requested length is outside defined parameters
            print("Problem: invalid parameters. l must be between 3 and 6.")
            break
        else:
            while count < n:
                if l == 3: # randomly pick 3 characters to assemble into a segment
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    if a != b and b != c and c != a and a+b+c not in segments: # making sure there are only different letters in the segment
                        segments += [a + b + c]
                        count += 1
                    else:
                        continue
                if l == 4: # randomly pick 4 characters to assemble into a segment
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    if a !=b and b != c and c != d and d != a and a+b+c+d not in segments: # making sure there are only different letters in the segment
                        segments += [a + b + c + d]
                        count += 1
                    else:
                        continue
                if l == 5: # randomly pick 5 characters to assemble into a segment
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    e = random.choice(lst)
                    if a != b and b != c and c != d and d != e and e != a and a+b+c+d+e not in segments: # making sure there are only different letters in the segment
                        segments += [a + b + c + d + e]
                        count += 1
                    else:
                        continue
                if l == 6: # randomly pick 6 characters to assemble into a segment
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    e = random.choice(lst)
                    f = random.choice(lst)
                    if a != b and b != c and c != d and d != e and e != f and f != a and a+b+c+d+e+f not in segments: # making sure there are only different letters in the segment
                        segments += [a + b + c + d + e + f]
                        count += 1
                    else:
                        continue
    if segments != False:
        print(f"Finished generating list of {l}-character segments")
    return segments

def repeats_check(lst1, lst2):
    '''
    Cycles through items from list 2 to find segments from items in list 1. This version is flexible for lists with any length of items.

    Parameters
    ----------
    lst1 : LIST
        The first list, with shorter words a minimum of 3 characters in length.
    lst2 : LIST
        The second list, with longer words.

    Returns
    -------
    intersections : LIST
        List of intersecting segments from list 1.
    dellist : LIST
        List of items in list 1 that are intersecting with list 2.
    lst1_cleaned : LIST
        List of items from list 1 that don't intersect with list 2.
    '''
    if len(lst1) == 0: # tests to see whether the lists given to the function contain something
        print('Careful, lst1 is empty!')
    if len(lst2) == 0:
        print('Careful, lst2 is empty!')
    if len(lst1) == 0 or len(lst2) == 0:
        return
    length1 = len(lst1[0])
    length2 = len(lst2[0])    
    lst11 = []   
    lst22 = []
    for word in lst1:
        lst11.append([*word]) # split apart words in lst1 into sublists
    for word in lst2: 
        lst22.append([*word]) # split apart words in lst1 into sublists
    def intersection(lst1, lst2):
        '''
        Finds the intersection of lst1 and lst2, where lst1 has shorter words.

        Parameters
        ----------
        lst1 : LIST
            The list with shorter words.
        lst2 : LIST
            The list with longer words.

        Returns
        -------
        lst3 : LIST
            A list with the segments that are in both lists.
        '''
        incommon_lst = [value for value in lst1 if value in lst2]
        return incommon_lst
    test_lst1 = []
    for i in lst11: # split lst11 into 3-character segments
        n = 0
        while 3+n <= length1:
            test_word = i[n:(3+n)]
            test_lst1 += [test_word]
            n +=1
        else:
            n = 0
            continue
    test_lst2 = []
    intersections = []
    for j in lst22:
        n = 0
        while 3+n <= length2:
            test_word = j[n:(3+n)] # split lst22 into 3-character segments
            test_lst2 += [test_word]
            ints = intersection(test_lst1, test_lst2) # calculate the intersection of the 3-character segments from both lists
            intersections += ints
            test_lst2 = []
            n += 1
        else:
            n = 0
            continue
    intersections = [''.join(i) for i in intersections]
    dellist = []
    if intersections == []:
        print('There are no segments in common in these two lists.')
        lst1_cleaned = lst1.copy()
    else:
        print(f'The common segments are: {intersections}')
        test_lst = []
        for i in lst11:
            n = 0
            while 3+n <= length1:
                test_word = i[n:(3+n)] # split lst11 into 3-character segments
                test_words = [test_word, i] # create joined sublists with the segments and the words they belong to
                test_words = [''.join(i) for i in test_words] # group the separated sublist segments and words 
                test_lst += [test_words]
                n += 1
            else:
                n = 0
                continue
        dellist = []
        for i in range(0,len(test_lst)):
            if test_lst[i][0] in intersections:
                dellist += [test_lst[i][1]] # makes list of words whose associated segments were in common with lst2
            else:
                continue
        if len(dellist) != 0:
            print(f'The words those segments belong to are: {dellist}')
        lst1_cleaned = []
        lst1_cleaned = [x for x in lst1 if x not in dellist] # remove words with common segments from lst1
    print(f'List 1 without the repeated segments is: {lst1_cleaned}')
    return intersections, dellist, lst1_cleaned

import numpy as np
def LEdistance(word1,word2):
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

def cycle_through(a,s):
    '''
    Cycles through the permutations and repeats_check function to obtain lists of stems and affixes in each language without repeats.

    Parameters
    ----------
    a : INTEGER
        The number of affixes to generate in each language.
    s : INTEGER
        The number of stems to generate in each language.

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
    '''
    letters1 = []
    letters2 = []
    letters1, letters2 = language_characters()
    L1affixes = []
    L1affixes1 = []
    L1affixes2 = []
    L1stems = []
    L1stems1 = []
    L2stems2 = []
    def cycle_throughs(lst,n,t):
        '''
        Cycles through the permutations and repeats_check function to obtain 2 lists without repeats.

        Parameters
        ----------
        lst : LIST
            List of the characters to assemble into segments.
        n : INTEGER
            Lower length of the segments to generate. For example, if you want 3- & 4- letter segments, enter '3'.
        t : INTEGER
            Number of segments to generate.

        Returns
        -------
        segments1 : LIST
            List of the first set of segments.
        segments2 : LIST
            List of the second set of segments.
        '''
        segments1 = permutations(lst,n,t)
        segments2 = permutations(lst,n+1,t)
        intersections, dellist, segments = repeats_check(segments1, segments2)
        n_inter = len(segments1)
        while n_inter < t:
            missing = t - n_inter
            print(f'Still missing {missing} segments')
            moresegments1 = permutations(lst,n,missing)
            segments1 = moresegments1 + segments1
            intersections, dellist, segments1 = repeats_check(segments1, segments2)
            n_inter = len(segments1)
        return segments1, segments2
    
    L1affixes1, L1affixes2 = cycle_throughs(letters1,3,a)
    L1stems1, L1stems2 = cycle_throughs(letters1,4,s)
    L2affixes1, L2affixes2 = cycle_throughs(letters2,3,a)
    L2stems1, L2stems2 = cycle_throughs(letters2,4,s)
    L1affixes = L1affixes1 + L1affixes2
    L1stems = L1stems1 + L1stems2
    L2affixes = L2affixes1 + L2affixes2
    L2stems = L2stems1 + L2stems2
    
    print(f'L1 affixes: {L1affixes}')
    print(f'L1 stems: {L1stems}')
    print(f'L2 affixes: {L2affixes}')
    print(f'L2 stems: {L2stems}')
    return L1affixes, L1stems, L2affixes, L2stems

cycle_through(100,200)