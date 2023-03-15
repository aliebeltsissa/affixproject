def import_words():
    '''
    Imports the text files of the different words to be presented from the word_generation.py output.
    Returns
    -------
    training : LIST
        A list of the training words.
    congruenttesting : LIST
        A list of the within-language testing words.
    incongruenttesting : LIST
        A list of the between-language testing words.
    '''
    trainingfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\training.txt", "r")
    data1 = trainingfile.read()
    training = data1.split("\n") # split text file into list
    training = training[0:80] # remove last \n from text file
    trainingfile.close()
    congruenttestingfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\congruenttesting.txt", "r")
    data2 = congruenttestingfile.read()
    congruenttesting = data2.split("\n")
    congruenttesting = congruenttesting[0:20]
    congruenttestingfile.close()
    incongruenttestingfile = open("C:\\Users\\annal\\OneDrive\\Documents\\GitHub\\affixproject\\incongruenttesting.txt", "r")
    data3 = incongruenttestingfile.read()
    incongruenttesting = data3.split("\n")
    incongruenttesting = incongruenttesting[0:20]
    incongruenttestingfile.close()
    return training, congruenttesting, incongruenttesting

def testing_list(congruenttesting, incongruenttesting):
    '''
    Combines the congruent and incongruent testing lists into a testing list with a label specifying congruency.

    Parameters
    ----------
    congruenttesting : LIST
        The list of congruent testing words.
    incongruenttesting : LIST
        The list of incongruent testing words.

    Returns
    -------
    testing : LIST
        A list of all the testing words. 0 denotes congruency, 1 incongruency.
    '''
    congruenttesting = [[word,0] for word in congruenttesting]
    incongruenttesting = [[word,1] for word in incongruenttesting]
    testing = congruenttesting + incongruenttesting
    return testing

def training_randomisation(lst, lstlen):
    '''
    Takes the training list and randomises it to avoid the orthographic structure to be evident.

    Parameters
    ----------
    lst : LIST
        The inputted training list of words.
    lstlen : INTEGER
        The length of the list.

    Returns
    -------
    rand_lst : LIST
        A randomised training list.
    '''
    import random
    rand_lst = ['efjnpqsz']
    while len(rand_lst) < (lstlen+1):
        for i in range(lstlen+2):
            while len(rand_lst) < i:
                inter_lst = random.sample(lst,lstlen) # shuffle list
                if inter_lst[0][0:1] != rand_lst[-1][0:1] and inter_lst[0][-2:-1] != rand_lst[-1][-2:-1]:
                    rand_lst.append(inter_lst[0])
    rand_lst.remove('efjnpqsz')
    return rand_lst

def testing_randomisation(lst, lstlen):
    '''
    Takes a testing stimuli list and randomises it to avoid the orthographic structure to be evident.

    Parameters
    ----------
    lst : LIST
        The inputted list of words.
    lstlen : INTEGER
        The length of the list.

    Returns
    -------
    rand_lst : LIST
        A randomised testing list.
    '''
    import random
    rand_lst = ['efjnpqsz']
    while len(rand_lst) < (lstlen+1):
        for i in range(lstlen+2):
            while len(rand_lst) < i:
                inter_lst = random.sample(lst,lstlen) # shuffle list
                if inter_lst[0][0:1] != rand_lst[-1][0:1] and inter_lst[0][-2:-1] != rand_lst[-1][-2:-1]:
                    rand_lst.append(inter_lst[0])
    rand_lst.remove('efjnpqsz')
    return rand_lst

training, congruenttesting, incongruenttesting = import_words()
testing = testing_list(congruenttesting,incongruenttesting)
trainingn = len(training)
testingn = len(testing)
rand_training1 = training_randomisation(training, trainingn)
rand_training2 = training_randomisation(training, trainingn)
#testing = list_randomisation(testing, testingn)
set1 = [x for x in rand_training1 if rand_training1.count(x) > 1] # extract duplicates from chunks_list
set1 = [*set(set1)]