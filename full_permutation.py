import pandas as pd
import os
from unidecode import unidecode

os.chdir('C:/Users/annal/OneDrive/Documents/GitHub/affixproject')

letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

twos = []
threes = []
fours = []
fives = []
for letter in letters:
    for letter2 in letters:
        if not letter == letter2:
            twos.append(letter+letter2)
            for letter3 in letters:
                if not letter2 == letter3:
                    threes.append(letter+letter2+letter3)
                    for letter4 in letters:
                        if not letter3 == letter4:
                            fours.append(letter+letter2+letter3+letter4)
                            for letter5 in letters:
                                if not letter3 == letter4 == letter5:
                                    fives.append(letter+letter2+letter3+letter4+letter5)

with open('fullperms_two.txt', 'w+') as f:
    for items in twos:
        f.write('%s\n' %items)
f.close()
with open('fullperms_three.txt', 'w+') as f:
    for items in threes:
        f.write('%s\n' %items)
f.close()
with open('fullperms_four.txt', 'w+') as f:
    for items in fours:
        f.write('%s\n' %items)
f.close()
with open('fullperms_five.txt', 'w+') as f:
    for items in fives:
        f.write('%s\n' %items)
f.close()

os.chdir('C:/Users/annal/OneDrive/Documents/Me/SISSA/BASL/BASL design/BASLv3/Word lists')
# English
en_words = open("EN.txt").read().split()

# French
fr_words = open("FR.txt").read().split()

# German
de_words = open("DE.txt").read().split()

# Catalan
cat_words = open("CAT.txt").read().split()

# Spanish
esp_words = open("ESP.txt").read().split()

# Dutch
nl_words = open("NL.txt",encoding="utf8").read().split()

# Portuguese
pt_words = open("PT.txt").read().split()

# Italian
it_words = open("IT.txt",encoding="utf8").read().split()

langs = ['english','french','german','catalan','spanish',
         'dutch','portuguese','italian']
lists = {"english":en_words,"french":fr_words,
         "german":de_words,"catalan":cat_words,
         "spanish":esp_words,"dutch":nl_words,
         "portuguese":pt_words,"italian":it_words}

# clean up word lists
final_lang_lst = []
for lang in langs:
    lang_lst = lists[lang]
    processed_lang_lst = []
    for word in lang_lst:
        if len(word) > 1 and len(word) < 6:
            if "'" in word or "." in word or "-" in word:
                lang_lst.remove(word)
            else:
                decoded = unidecode(word)
                if "'" not in decoded and "." not in decoded and "-" not in decoded and "(" not in decoded:
                    processed_lang_lst.append(decoded.upper())
    finalset = {*processed_lang_lst}
    processed_lang_lst = list(finalset)
    final_lang_lst.append({'lang':lang,'lst':processed_lang_lst})

# create big database
intersections = []
for word in twos:
    intersections.append({'len':2,'word':word,'in_langs':[]})
for word in threes:
    intersections.append({'len':3,'word':word,'in_langs':[]})
for word in fours:
    intersections.append({'len':4,'word':word,'in_langs':[]})
for word in fives:
    intersections.append({'len':5,'word':word,'in_langs':[]})

# see whether generated letter combinations match words
# English
lang_lst = final_lang_lst[0]['lst']
lang = 'english'
count = 0
for item in intersections:
    count += 1
    word = item['word']
    if word in lang_lst:
        item['in_langs'].append(lang)
    if count % 10 == 0:
        print(f'Got to word {count}/10 985 650!')
print("Finished with English!")

# French
# German
# Catalan
# Spanish
# Dutch
# Portuguese
# Italian
for item in intersections:
    word = item['word']
    for i in range(len(langs)):
        lang = langs[i]
        lang_lst = final_lang_lst[i]['lst']
        if word in lang_lst:
            item['in_langs'].append(lang)

# find items in fewest languages
words_nolangs = []
words_1lang = []
words_2langs = []
words_3langs = []
words_4langs = []
words_5langs = []
words_6langs = []
words_7langs = []
words_8langs = []
for item in intersections:
    length = item['len']
    word = item['word']
    in_langs = item['in_langs']
    if len(in_langs) == 0:
        words_nolangs.append(item)
    if len(in_langs) == 1:
        words_1lang.append(item)
    if len(in_langs) == 2:
        words_2langs.append(item)
    if len(in_langs) == 3:
        words_3langs.append(item)
    if len(in_langs) == 4:
        words_4langs.append(item)
    if len(in_langs) == 5:
        words_5langs.append(item)
    if len(in_langs) == 6:
        words_6langs.append(item)
    if len(in_langs) == 7:
        words_7langs.append(item)
    if len(in_langs) == 8:
        words_8langs.append(item)
