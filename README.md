# spellit, a simple spelling corrector in OCaml

spellit will take a malformed word and suggest a likely spelling correction. We do this by following two simple (naive) steps:

1. tally up the number of times each word occur in a large corpus of English text
2. generate a list of possible words that are close to the misspelled word
3. from these candidate words, choose the one that occurred most frequently in the corpus

Hopefully we have a corpus that's a representative sample of how people misspell! Ha ha! (Hint: we don't.)


# Directory structure

The logic of the application is broken up into 2 interfaces and 1 file with the primary logic:

* `data/`, which contains the corpus we train our model on
* `code/`, which contains the logic of our program
    * `text.mli`, which holds all the logic for dealing with text, including IO, text munging, and building the textual statistics we use to suggest spelling corrections
    * `histogram.mli`, which handles logic for counting things, in this case, words
    * `spellit.ml`, which handles the main application logic.
