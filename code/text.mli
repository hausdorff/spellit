(* Operations on text -- IO, text munging, simple string transformations, and so
   on*)

open Core.Std

val readlines : string -> string list
val word_hist : string -> string Histogram.t
