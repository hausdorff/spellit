(* Operations on text -- IO, text munging, simple string transformations, and so
   on*)

open Core.Std

(* A list of lines in some file *)
val readlines : string -> string list

(* Generates a histogram of word occurrences from some file *)
val word_hist : string -> string Histogram.t
