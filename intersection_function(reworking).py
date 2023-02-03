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
        Tests for identical chunks of characters in words from 1 list.

        Parameters
        ----------
        lst1 : LIST
            The list to perform the check on.
        intersectiondist : INTEGER
            Size of chunk taken for the check.

        Returns
        -------
        morphemes_dict : DICTIONARY
            Output dictionary of non-intersecting words.
        morphemes_list : LIST
            Output list of non-intersecting words.
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

example_list1 = ['helps', 'elgar', 'garde', 'toads']
example_list2 = ['pretty', 'stills', 'roadin', 'playin']
morphemes1_dict, morphemes1_list, morphemes2_dict, morphemes2_list = global_intersection(example_list1, example_list2, 3)