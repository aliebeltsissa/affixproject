import random
import numpy as np
import itertools
import os.path
import pandas as pd

# read in generated perfect permutations
morph_perms = pd.read_csv("C:\\Users\\annal\\Documents\\Me\\SISSA\\BASL\\BASL design\\BASLv3\\BASL_exp3_perfperms.csv", header=0)
morph_perms = morph_perms['strings'].tolist()

# number of morphemes to generate
affix_n = 200 # we want to generate 200 affixes
stem_n = 400 # we want to generate 400 stems

morph_n = affix_n + stem_n
morph_3n = int(affix_n/2) # half of affixes need to be 3 characters long
morph_4n = int(affix_n/2) + int(stem_n/2) # half of affixes need to be 4 characters long 
# + half of stems need to be 4 characters long
morph_5n = int(stem_n/2) # half of stems need to be 5 characters long


# intersection parameters
min_LD = 2 # morphemes must have a Levenshtein distance of at least 2
max_intersection = 2 # morphemes must not have any chunks larger than 2 characters in common

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

perms_threes = [x for x in morph_perms if len(x) == 3] # 13011 options
perms_fours = [x for x in morph_perms if len(x) == 4] # 397883 options
perms_fives = [x for x in morph_perms if len(x) == 5] # 10546584 options

def LED_cleaning(lst,min_LD=min_LD):
    '''
    Calculates Levenshtein distance of all words within a list, and removes any that have a smaller LD than desired.

    Parameters
    ----------
    lst : LIST
        The list to clean.

    Returns
    ----------
    cleaned_lst : LIST
        A cleaned list with all violative words removed.
    '''
    # FIRST: LD CHECK
    problem_items = [] # create list for problematic items
    for word1 in lst: # for every word in list
        for word2 in lst: # for every word in list
            LD = LED(word1,word2) # calculate LD of words
            if LD < min_LD:
                problem_items.append(word1) # if LD too big, add to problem items list
                problem_items.append(word2) # if LD too big, add to problem items list
    counts = {x: problem_items.count(x) for x in set(problem_items)} # count occurrences of problem items
    counts = dict(sorted(counts.items(), key=lambda item: item[1], reverse=True)) # sort by more problematic items first
    counts = {key: value for key, value in counts.items() if value > 2} # remove any items present more than twice in problem items
    # every item is word1 once and word 2 once: So word1 "ABC" will be compared against word2 "ABC" once, and word2 "ABC" will be compared
    # against word1 "ABC" once - so perfect words with an LD of at least 2 to all other words will get an LD of 0 due to a comparison with
    # ITSELF twice. Therefore, removing all words present MORE THAN twice each will remove all those with an LD lower than 2 with OTHER words.
    cleaned_list = [word for word in lst if word not in list(counts.keys())] # remove from original list any word that were problematic
    
    # NEXT: INTERSECTIONS CHECK
    problem_items = []
    if max_intersection != 2:
        print("Careful! This code not flexible, written for max_intersection=2 only.")
    for word in cleaned_list:
        test_strings = [word[0:3]] # morphemes of all sizes have at least two 3-character chunks
        if len(word) > 3: # if the morpheme is longer, is has an additional 3-character chunk
            test_strings.append(word[1:4])
        if len(word) > 4: # if the morpheme is longer, is has an additional 3-character chunk
            test_strings.append(word[2:5])
        test_list = [x for x in cleaned_list if x != word] # list excluding current morpheme being tested
        for morph in test_list: # for each of the other morphemes
            for string in test_strings: # for each string making up morpheme
                if string in morph: # if one of the other morphemes contains a string from this morpheme
                    problem_items.append(word) # flag word being tested
        counts = {x: problem_items.count(x) for x in set(problem_items)} # count occurrences of problem items
        counts = dict(sorted(counts.items(), key=lambda item: item[1], reverse=True)) # sort by more problematic items first
        cleaned_list = [word for word in lst if word not in list(counts.keys())]
    return cleaned_list

# ALL MORPHEMES
affixes_threes = random.sample(perms_threes,k=morph_3n) # pick required number of three-letter morphemes
morphs_fours = random.sample(perms_fours,k=morph_4n) # pick required number of four-letter morphemes
stems_fives = random.sample(perms_fives,k=morph_5n) # pick required number of five-letter morphemes
morphs = affixes_threes + morphs_fours + stems_fives

cleaned_list = LED_cleaning(morphs) # clean list for LD
missing_n = morph_n - len(cleaned_list) # calculate how many more we need to pick to make up for problematic items

iter = 1
while missing_n > 0 and iter <= 50: # if we need to pick more items
    print(f"Starting iteration {iter+1}: {missing_n} missing")
    missing_threes = morph_3n - len([x for x in cleaned_list if len(x) == 3]) # how many more 3-letter morphemes do we need?
    missing_fours = morph_4n - len([x for x in cleaned_list if len(x) == 4]) # how many more 4-letter morphemes do we need?
    missing_fives = morph_5n - len([x for x in cleaned_list if len(x) == 5]) # how many more 5-letter morphemes do we need?

    affixes_threes = random.sample(perms_threes,k=int(missing_threes)) # select missing number of morphemes
    morphs_fours = random.sample(perms_fours,k=int(missing_fours)) # select missing number of morphemes
    stems_fives = random.sample(perms_fives,k=int(missing_fives)) # select missing number of morphemes

    morphs = cleaned_list + affixes_threes + morphs_fours + stems_fives # combine new items with cleaned list
    cleaned_list = LED_cleaning(morphs) # clean list for LD

    missing_n = morph_n - len(cleaned_list) # calculate how many more we need to pick to make up for problematic items
    if missing_n == 0:
        print("No more missing.")
        morphs = cleaned_list # make that definitive list
    iter += 1
    if iter > 50:
        print(f"Finished iteration 50 with {missing_n} remaining bad items. Please try again.")

# divide bank of morphemes into correct affix/stem, L1/L2 bins
if len(morphs) == morph_n: # if we do have as many as we need
    threes = [x for x in morphs if len(x) == 3] # 3-letter morphemes
    L1affixes_threes = random.sample(threes,k=int(len(threes)/2)) # half of the 3-letter morphemes are L1 affixes
    L2affixes_threes = [item for item in threes if item not in L1affixes_threes] # the other half of the 3-letter morphemes are L2 affixes
    if len(L2affixes_threes) != int(len(threes)/2):
        print(f"Error! L2 affixes list is of length {len(L2affixes_threes)} instead of {int(len(threes)/2)}. Possible duplicates in list.")

    fours = [x for x in morphs if len(x) == 4] # 4-letter morphemes
    fours_affixes = random.sample(fours,k=int(affix_n/2)) # half of the 4-letter morphemes are affixes
    L1affixes_fours = random.sample(fours_affixes,k=int(len(fours_affixes)/2)) # half of the 4-letter morphemes are L1 affixes
    L2affixes_fours = [item for item in fours_affixes if item not in L1affixes_fours] # the other half of the 4-letter morphemes are L2 affixes
    if len(L2affixes_fours) != int(affix_n/2):
        print(f"Error! L2 affixes list is of length {len(L2affixes_fours)} instead of {int(affix_n/2)}. Possible duplicates in list.")
    fours_stems = [item for item in fours if item not in fours_affixes] # the other half of the 4-letter morphemes are stems
    L1stems_fours = random.sample(fours_stems,k=int(len(fours_stems)/2)) # half of the 4-letter morphemes are L1 affixes
    L2stems_fours = [item for item in fours_stems if item not in L1stems_fours] # the other half of the 4-letter morphemes are L2 affixes
    if len(L2stems_fours) != int(affix_n/2):
        print(f"Error! L2 affixes list is of length {len(L2stems_fours)} instead of {int(affix_n/2)}. Possible duplicates in list.")

    fives = [x for x in morphs if len(x) == 5] # 5-letter morphemes
    L1stems_fives = random.sample(fives,k=int(len(fives)/2)) # half of the 5-letter morphemes are L1 stems
    L2stems_fives = [item for item in fives if item not in L1stems_fives] # the other half of the 5-letter morphemes are L2 stems
    if len(L2stems_fives) != int(len(fives)/2):
        print(f"Error! L2 stems list is of length {len(L2stems_fives)} instead of {int(len(fives)/2)}. Possible duplicates in list.")

    L1affixes = L1affixes_threes + L1affixes_fours # combine all L1 affixes into one list
    L2affixes = L2affixes_threes + L2affixes_fours # combine all L2 affixes into one list
    L1stems = L1stems_fours + L1stems_fives # combine all L1 stems into one list
    L2stems = L2stems_fours + L2stems_fives # combine all L2 stems into one list
    if len(L1affixes) != len(L2affixes): # check if L1 and L2 affixes are of same length
        print("Careful! L1 and L2 affixes not of same length.")
    if len(L1stems) != len(L2stems): # check if L1 and L2 stems are of same length
        print("Careful! L1 and L2 stems not of same length.")


# export files
folder = "C:\\Users\\annal\\Documents\\GitHub\\affixproject"
file_name = 'L1affixesV3.txt'
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output1:
    for morpheme in L1affixes:
        output1.write(morpheme+"\n")
output1.close()
file_name = 'L1stemsV3.txt'
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output2:
    for morpheme in L1stems:
        output2.write(morpheme+"\n")
output2.close()
file_name = 'L2affixesV3.txt'
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output3:
    for morpheme in L2affixes:
        output3.write(morpheme+"\n")
output3.close()
file_name = 'L2stemsV3.txt'
file_path = os.path.join(folder, file_name)
with open(file_path, 'w') as output4:
    for morpheme in L2stems:
        output4.write(morpheme+"\n")
output4.close()