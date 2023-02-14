# affixproject
This is the repository for all code linked to the bilingual statistical learning morpheme experiment with Davide Crepaldi, written as part of Anna Liebelt's PhD thesis project.

## Stimuli generation
The code written to generate the stimuli sets for participants is split between two scripts. First, morpheme_generation.py, to be run once, and word_generation.py, to be run for each participant.

### Morpheme generation
The morpheme_generation.py script is intended to only be run once, prior to any participant testing. 

**language_characters** function: Taking uppercase and some lowercase Latin characters as input, the code separates these into two (overlapping or not) character sets for language 1 (L1) and language 2 (L2).

**morpheme_generations** function: Following this, the code cycles through functions to form morphemes (affixes and stems) of different lengths (calling the **permutations** function), tests these for similar segments within and between languages, as well as for Levenstein distance within and between languages (calling the **global_intersection** function, which has the **intersection**, **LED**, and **LEdistance** functions embedded in it). At each step, morphemes not passing these tests are removed from the morpheme lists, and more are generated. 

**export_morphemes** function: When the morpheme lists for both languages are complete, the script exports these as text files.

### Word generation
The word_generation.py script is for generating the training and testing word lists for each participant. 