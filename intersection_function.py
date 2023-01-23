def repeats_check(lst1, lst2):
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

def repeats_check2(lst1, lst2):
    '''
    Cycles through items from list 2 to find segments from items in list 1. This version is flexible for lists with any length of items.

    Parameters
    ----------
    lst1 : LIST
        The first list.
    lst2 : LIST
        The second list.

    Returns
    -------
    List of intersecting segments from list 1.

    '''
    length1 = len(lst1[0])
    length2 = len(lst2[0])    
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
    for j in lst22:
        n = 0
        while length1+n <= length2:
            print(j)
            test_word = j[n:(length1+n)]
            print(test_word)
            test_lst += [test_word]
            print(test_lst)
            ints = intersection(test_lst, lst11)
            print(ints)
            intersections += ints
            ints = []
            test_lst = []
            n += 1
        else:
            n = 0
            continue
    intersections = [''.join(i) for i in intersections]
    print(intersections)