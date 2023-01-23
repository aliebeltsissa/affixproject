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
    length_count = 0
    intersections = []
    while length_count < len(lst1):
        for i,j in lst1, lst2:
            test_word1 = lst22[length_count][0:3]
            test_word2 = lst22[length_count][1:4]
            test_lst = [test_word1, test_word2]
            intersections += intersection(test_lst,lst11)
        length_count += 1
    print(lst11)
    print(lst22)
    print(test_word1)
    print(test_word2)
    print(test_lst)
    print(intersections)

example1 = ["bye", "log"]
example2 = ["hell", "logg"]
repeatscheck(example1, example2)