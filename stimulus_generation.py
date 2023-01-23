letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'y', 'z']
letters1 = letters[0:12]
letters2 = letters[12:24]
import random
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
    segments = []
    count = 0
    for i in lst: # break function if requested length is outside defined parameters
        if l < 3 or l > 6:
            print("Problem: invalid parameters. l must be between 3 and 6.")
            break
        else:
            while count < n:
                if l == 3: # for 3-character word parts
                    a = random.choice(lst)
                    b = random.choice(lst)
                    if a != i and b != i and a != b and i+a+b not in segments: # making sure there are only different letters in the segment
                        segments += [i + a + b]
                        count += 1
                    else:
                        continue
                if l == 4: # for 4-character word parts
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    if a != i and b != i and c != i and a != b and a != c and b != c and i+a+b+c not in segments: # making sure there are only different letters in the segment
                        segments += [i + a + b + c]
                        count += 1
                    else:
                        continue
                if l == 5: # for 5-character word parts
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    if a != b and b != c and c != d and d != i and i != a and a != c and a != d and b != i and b != d and c != i and i+a+b+c+d not in segments: # making sure there are only different letters in the segment
                        segments += [i + a + b + c + d]
                        count += 1
                    else:
                        continue
                if l == 6: # for 6-character word parts
                    a = random.choice(lst)
                    b = random.choice(lst)
                    c = random.choice(lst)
                    d = random.choice(lst)
                    e = random.choice(lst)
                    if a != b and b != c and c != d and d != e and e != i and i != a and a != c and a != d and a != e and b != i and b != e and b != d and c != i and c != e and d != i and i+a+b+c+d+e not in segments: # making sure there are only different letters in the segment
                        segments += [i + a + b + c + d + e]
                        count += 1
                    else:
                        continue
    if segments != False:
        print(f"Finished generating list of {l}-character segments")
    return segments

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

#L1affixes1 = permutations(letters1,3,100) # generate 3-character affixes for L1
#L1affixes2 = permutations(letters1,4,100) # generate 4-character affixes for L1
#L1stems1 = permutations(letters1,4,200) # generate 4-character affixes for L1
#L1stems2 = permutations(letters1,5,200) # generate 5-character affixes for L1

def repeats_check(lst1, lst2): # for the moment, written for 3-character items in lst1 and 4-character items in lst2
    '''
    Flags words from lst1 that are part of lst2.

    Parameters
    ----------
    lst1 : LIST
        Input list 1
    lst2 : LIST
        Input list 2

    Returns
    -------
    intersections : LIST
        Output list containing repeated words from list 1
    '''    
    lst11 = []   
    lst22 = []
    for word in lst1:
        lst11.append([*word])
    for word in lst2:
        lst22.append([*word])
    def intersection(lst1, lst2):
        lst3 = [value for value in lst1 if value in lst2]
        return lst3
    intersections = []
    test_lst = []
    ints = []
    for j in  lst22:
        test_word1 = j[0:3]
        test_word2 = j[1:4]
        test_lst = [test_word1, test_word2]
        ints = intersection(test_lst, lst11)
        intersections += ints
        ints = []
        test_lst = []
    intersections = [''.join(i) for i in intersections]
    print(intersections)

example1 = ["wol", "log", "hat", "bye", "but"]
example2 = ["hell", "logg", "hats", "drug", "wolf"]
repeats_check(example1, example2)

import numpy as np
def LEdistance(word1,word2):
    '''
    Calculates the Levenshtein distance between 2 given words.

    Parameters
    ----------
    word1 : STRING
    word2 : STRING

    Returns
    -------
    distances: LE distance between the two words
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
