# -*- coding: utf-8 -*-
"""
Created on Mon Jan 23 11:01:07 2023

@author: annal
"""

def repeatscheck(lst1, lst2): # for the moment, written for 3-character items in lst1 and 4-character items in lst2
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
    print(intersections)

example1 = ["bye", "log", "hat", "wol", "but"]
example2 = ["hell", "logg", "hats", "drug", "wolf"]
repeatscheck(example1, example2)