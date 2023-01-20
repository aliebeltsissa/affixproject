letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'y', 'z']
letters1 = letters[0:12]
letters2 = letters[12:24]
import random
def permutations(lst,l,n):
    '''
    Generates n permutations of length l of a list lst. Works if l [3;6].

    Parameters
    ----------
    lst : TYPE
        DESCRIPTION.
    n : TYPE
        DESCRIPTION.

    Returns
    -------
    affixes : TYPE
        DESCRIPTION.

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
    return segments
segments_list = permutations(letters1,4,100)
print(segments_list)
myset = set(segments_list) #create set from affix list
if len(segments_list) != len(myset): #compare length of set to length of affix list to test for repeated strings
    print("Duplicates found in the list")
else:
    print("No duplicates found in the list!")

import numpy as np
def LEdistance(word1,word2):
    '''
    Calculates the Levenshtein distance between 2 given words.

    Parameters
    ----------
    word1 : TYPE
        DESCRIPTION.
    word2 : TYPE
        DESCRIPTION.

    Returns
    -------
    TYPE
        DESCRIPTION.

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
