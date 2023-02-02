# -*- coding: utf-8 -*-
"""
Created on Thu Feb  2 15:34:23 2023

@author: annal
"""
import itertools
def global_intersection(lst1,lst2,intersectiondist):
    '''
    Tests for identical chunks of characters in words from 2 lists.

    Parameters
    ----------
    lst1 : TYPE
        DESCRIPTION.
    lst2 : TYPE
        DESCRIPTION.
    intersectiondist : TYPE
        DESCRIPTION.

    Returns
    -------
    None.

    '''
    def intersection(lst1,intersectiondist):
        '''
        Tests for identical chunks of characters in words from 1 list.

        Parameters
        ----------
        lst1 : TYPE
            DESCRIPTION.
        intersectiondist : TYPE
            DESCRIPTION.

        Returns
        -------
        None.

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
        chunks_dellist = [x for x in chunks_list if chunks_list.count(x) > 1]
        chunks_dellist = [*set(chunks_dellist)]
        dict_length = len(morphemes_dict)
        dict_list = list(morphemes_dict.keys())
        for i in range(dict_length):
            key = dict_list[i]
            for j in range(len(morphemes_dict[key])):
                if key in morphemes_dict.keys():
                    if morphemes_dict[key][j] in chunks_dellist:
                        del morphemes_dict[key]
            else:
                continue
        print(morphemes_dict)
        return morphemes_dict
        
    #if len(lst1) == 0: # tests to see whether the lists given to the function contain something
    #    print('Careful, lst1 is empty!')
    #if len(lst2) == 0:
    #    print('Careful, lst2 is empty!')
    #if len(lst1) == 0 or len(lst2) == 0:
    #    return
    # morphemes_dict1 = {}
    # for i in lst1: # split lst1 into chunks of pre-defined length
    #     length1 = len(i)    
    #     n = 0
    #     while (intersectiondist + n) <= length1:
    #         test_word = i[n:(intersectiondist + n)]
    #         morphemes_dict1[i] = [morphemes_dict1[i],test_word] # add morpheme to dictionary
    #         n +=1
    #     else:
    #         n = 0
    #         continue
    # morphemes_dict2 = {}
    # for j in lst2: # split lst2 into chunks of pre-defined length
    #     length2 = len(j)    
    #     n = 0
    #     while (intersectiondist + n) <= length2:
    #         test_word = j[n:(intersectiondist + n)]
    #         morphemes_dict2[j] = [morphemes_dict2[j],test_word] # add morpheme to dictionary
    #         n += 1
    #     else:
    #         n = 0
    #         continue

example_list = ['helps', 'elgar', 'garde']
morphemes_dict = intersection(example_list, 3)