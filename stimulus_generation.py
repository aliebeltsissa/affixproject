import time
import math
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
        if l < 2 or l > 6: # break function if requested length is outside defined parameters
            print("Problem: invalid parameters. l must be between 2 and 6.")
            break
        else:
            while count < n:
                if l == 2: # randomly pick 2 characters to assemble into a segment
                    a = random.choice(lst)
                    b = random.choice(lst)
                    if a != b and a + b not in segments:
                        segments += [a + b]
                        count += 1
                    else:
                        continue
                elif l == 3: # randomly pick 3 characters to assemble into a segment
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    if a != b and b != c and c != a and a+b+c not in segments: # making sure there are only different letters in the segment
                        segments += [a + b + c]
                        count += 1
                    else:
                        continue
                elif l == 4: # randomly pick 4 characters to assemble into a segment
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    if a !=b and b != c and c != d and d != a and a+b+c+d not in segments: # making sure there are only different letters in the segment
                        segments += [a + b + c + d]
                        count += 1
                    else:
                        continue
                elif l == 5: # randomly pick 5 characters to assemble into a segment
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
                elif l == 6: # randomly pick 6 characters to assemble into a segment
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
        #print('There are no segments in common in these two lists.') # optional check
        lst1_cleaned = lst1.copy()
    else:
        #print(f'The common segments are: {intersections}') #optional check
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
        #if len(dellist) != 0: #optional check
            #print(f'The words those segments belong to are: {dellist}')
        lst1_cleaned = []
        lst1_cleaned = [x for x in lst1 if x not in dellist] # remove words with common segments from lst1
    #print('List 1 without the repeated segments is: {lst1_cleaned}')
    if len(lst1_cleaned) != 0:
        print('Finished cleaning list.')
    return intersections, dellist, lst1_cleaned

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
        A list of segments from lst2 to delete due to too great similarity to lst1.

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

    def cycle_throughs(lst,n1,n2,t1,t2):
        '''
        Cycles through the permutations and repeats_check function to obtain 2 lists without repeats.

        Parameters
        ----------
        lst : LIST
            List of the characters to assemble into segments.
        n1 : INTEGER
            Lower length of the segments to generate.
        n2 : INTEGER
            Upper length of the segments to generate.
        t1 : INTEGER
            Number of segments of length n1 to generate.
        t2 : INTEGER
            Number of segments of length n2 to generate.

        Returns
        -------
        segments1 : LIST
            List of the first set of segments.
        segments2 : LIST
            List of the second set of segments.
        '''
        segments1 = []
        segments2 = []
        if t1 != 0:
            segments1 = permutations(lst,n1,t1) # generate segments of a certain length
        else:
            print('Careful, t1 = 0')
        if t2 != 0:
            segments2 = permutations(lst,n2,t2) # generate segments 1 character longer than in segments1
        else:
            print('Careful, t2 = 0')
        intersections, dellist, segments = repeats_check(segments1, segments2) # find intersections in the segments lists
        n_inter = len(segments1)
        while n_inter < t1: # while segments1 has deletions due to intersections with segments2
            missing = t1 - n_inter # calculate how many more to generate
            print(f'Still missing {missing} segments')
            moresegments1 = permutations(lst,n1,missing)
            segments1 = moresegments1 + segments1
            intersections, dellist, segments1 = repeats_check(segments1, segments2) # calculate intersections between new segments1 and segments2
            n_inter = len(segments1)
        return segments1, segments2
    
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
        missing = w # to start, all n desired items are missing
        reps = 0
        words_dict = {}
        while len(words) < w: # while words list incomplete
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
                    j += 1
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
        missing = w
        L1words = []
        L1reps = []
        L2reps = []
        globalreps = 0
        while len(L1words) < w:
            globalreps += 1
            dellist1 = []
            dellist2 = []
            L1words, L1reps1, L1dict = wordcycle(L1affixes,L1stems,'L1',missing,dist_input)
            L1reps.append(L1reps1)
            L2words, L2reps1, L2dict = wordcycle(L2affixes,L2stems,'L2',missing,dist_input)
            L2reps.append(L2reps1)
            for i in range(len(L1words)):
                for j in range(len(L2words)):
                    if i != j:
                        distance = int(LED(L1words[i], L2words[j]))
                        #print(words[i], words[j], distance) optional: print tested word pairs & the LED
                        if distance < dist: # if LED below specified threshold LED
                            dellist1.append(L1words[i])
                            dellist2.append(L2words[j])
                    j += 1
            dellist1 = [*set(dellist1)]
            dellist2 = [*set(dellist2)]
            #print(f'Words to delete: {dellist}') optional: print list of words to delete
            missing = len(dellist1) # calculate how many more words it'll need to generate
            #print(f'Still missing {missing} word(s).') optional: print how many words it still has to generate
            for w in dellist1:
                del L1dict[w] # delete dictionary entry for too-similar words
            for w in dellist2:
                del L2dict[w] # delete dictionary entry for too-similar words
            L1words = [x for x in L1words if x in L1dict] # delete words in list if they're not in the dictionary
            L2words = [x for x in L2words if x in L2dict] # delete words in list if they're not in the dictionary  
            print(f'Rep {globalreps} of comparing L1 and L2 word lists finished.')
        if len(L1words) == len(L2words) == w and missing == 0:
            print('Finished comparing L1 and L2 word lists.')
        return L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps
        
    # generate character lists for both languages:
    letters1, letters2 = language_characters()
    
    # generate affix & stem lists for both languages:
    L1affixes1, L1affixes2 = cycle_throughs(letters1,3,4,(a/2),(a/2)) # a being the total number of affixes to generate, so want a/2 3-character and a/2 4-character affixes
    L1stems1, L1stems2 = cycle_throughs(letters1,4,5,(s/2),(s/2)) # s being the total number of stems to generate, so want s/2 4-character and s/2 5-character stems
    L2affixes1, L2affixes2 = cycle_throughs(letters2,3,4,(a/2),(a/2))
    L2stems1, L2stems2 = cycle_throughs(letters2,4,5,(s/2),(s/2))
    L1affixes = L1affixes1 + L1affixes2
    L1stems = L1stems1 + L1stems2
    L2affixes = L2affixes1 + L2affixes2
    L2stems = L2stems1 + L2stems2
    if len(L1affixes) != 0 and len(L1stems) != 0 and len(L2affixes) != 0 and len(L2stems) != 0 and len(L1affixes) == len(L2affixes) and len(L1stems) == len(L2stems):
        print('Finished generating affix and stem lists.')
    else:
        print('Problem generating affix and stem lists.')
    
    # generate word lists for both languages:
    dist_input = int(input("Desired LE distance threshold for words: ")) # LED threshold prompt
    #print(f'L1 reps: {L1reps}') optional: print how many cycles wordcycle had to go through to form the word lists
    #print(f'L2 reps: {L2reps}')
    L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps = globalcycle(L1affixes,L1stems,L2affixes,L2stems,'global',w,dist_input)
    if len(L1words) == len(L2words) == w:
        print('Correctly generated complete stimuli set.')
    return L1affixes, L1stems, L2affixes, L2stems, L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps

L1affixes, L1stems, L2affixes, L2stems, L1words, L2words, L1reps, L2reps, L1dict, L2dict, globalreps = cycle_through(100,200,300)
end_time = time.time()
elapsed_time = (end_time - start_time)/60
#'%.2f' % a
print('Execution time: %.2f minutes' % elapsed_time)