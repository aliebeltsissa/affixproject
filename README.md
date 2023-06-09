<h1> affixproject </h1>
This is the repository for all code linked to the bilingual statistical learning morpheme experiment with Davide Crepaldi, written as part of Anna Liebelt's PhD thesis project.

<h2> Stimuli generation </h2>
The code written to generate the stimuli sets for participants is split between two scripts. First, `morpheme_generation.py`, to be run once, and `word_generation.py`, to be run for each participant.

<h3> Morpheme generation </h3>
The `morpheme_generation.py` script is intended to only be run once, prior to any participant testing. 

`language_characters` function: Taking uppercase and some lowercase Latin characters as input, the code separates these into two (overlapping or not) character sets for language 1 (L1) and language 2 (L2). The resulting character set is composed of:
<ul>
	<li><strong>L1</strong>: A, a, b, c, d, G, J, k, L, l, m, N, O, Q, r, U, u, v, Y, Z; or, in BACS1: <p style="font-family: BACS">A, a, b, c, d, G, J, k, L, l, m, N, O, Q, r, U, u, v, Y, Z</p></li>
	<li><strong>L2</strong>: A, B, b, C, c, D, d, E, h, K, k, l, M, m, O, P, R, T, t, Y; or, in BACS1: <p style="font-family: BACS">A, B, b, C, c, D, d, E, h, K, k, l, M, m, O, P, R, T, t, Y</p></li>
</ul>
Therefore, the (9) characters <strong>in common</strong> in L1 and L2 are: A, b, c, d, k, l, m, O, Y. This means that in each language, there are 11 characters that are unique. In total, 31 BACS characters are being used (A, a, B, b, C, c, D, d, E, G, h, J, K, k, L, l, M, m, N, O, P, Q, R, r, T, t, U, u, v, Y, Z).

`morpheme_generations` function: Following this, the code cycles through functions to form morphemes (affixes and stems) of different lengths (calling the `permutations` function), tests these for similar segments within and between languages, as well as for Levenstein distance within and between languages (calling the `global_intersection` function, which has the `intersection`, `LED`, and `LEdistance` functions embedded in it). At each step, morphemes not passing these tests are removed from the morpheme lists, and more are generated. 

`export_morphemes` function: When the morpheme lists for both languages are complete, the script exports these as text files.

<h3> Word generation </h3>
The word_generation.py script is for generating the training and testing word lists for each participant. The training set for each language is composed of only within-language morphemes. However, there are two different testing conditions: congruent testing words are made up of same-language stems and affixes, while incongruent testing words are made up of an L1 stem and L2 affix, or vice versa. The specific combinatorial structure of these incongruent words ensures that unique combinations are created, and that affixes and stems present in testing are shown within both congruent and incongruent words.

`import_morphemes` function: This imports the the morpheme text files for L1 and L2 that were exported at the end of the morpheme_generation.py script as lists.

`cycle_through` function: Similarly to the `morpheme_generations`, this function assembles a stem and an affix from a language, and sorts the words into the training and congruent testing sets (this is the **wordcycle** function). Next, the `cross_language_testing` function takes a stem and affix from different languages and assembles these to form the incongruent testing word set. 