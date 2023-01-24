def repeats_check1(lst1, lst2):
    '''
    Cycles through items from list 2 to find segments from items in list 1. This version only works for 3-character items in list 1 and 4-character items in list 2

    Parameters
    ----------
    lst1 : LIST
        The first list. Must contain 3-character items.
    lst2 : LIST
        The second list. Must contain 4-character items.

    Returns
    -------
    List of intersecting segments from list 1.
    List 1b of items in list 1 that weren't intersecting with list 2.

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
    lst1b = [x for x in lst1 if x not in intersections]
    print(lst1b)

def repeats_check2(lst1, lst2):
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
    List of intersecting segments from list 1 called instersections.
    List of items in list 1 that are intersecting with list 2 called dellist.
    List of items from list 1 that don't intersect with list 2 called lst1_cleaned.

    '''
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
    print(f'The words those segments belong to are: {dellist}')
    lst1_cleaned = []
    lst1_cleaned = [x for x in lst1 if x not in dellist] # remove words with common segments from lst1
    print(f'List 1 without the repeated segments is: {lst1_cleaned}')
    return lst1_cleaned
    
example1 = ["wolf", "logs", "hate", "baby", "bust"]
example2 = ["heller", "loggie", "hatsie", "drugsy", "wolfer"]
repeats_check2(example1, example2)