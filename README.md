# SpellIt, a simple spelling corrector in OCaml

SpellIt will take a malformed word and suggest a likely spelling correction.

# Directory structure

The logic of the application is broken up into 2 interfaces and 1 file with the primary logic:

* `text.mli`, which holds all the logic for dealing with text, including IO, text munging, and building the textual statistics we use to suggest spelling corrections
* `histogram.mli`, which handles logic for counting things, in this case, words
* `spellit.ml`, which handles the main application logic.
