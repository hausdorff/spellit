(* A simple spelling corrector in OCaml. You provide a malformed word, SpellIt
   will propose a likely correction. *)

open Core.Std

let () =
  Text.word_hist "../data/corpus.txt"
  |> Histogram.to_alist
  |> List.sort ~cmp:(fun w1 w2 -> (snd w2) - (snd w1))
  |> Fn.flip List.take 10
  |> List.iter ~f:(fun datum -> printf "%s %d\n" (fst datum) (snd datum))
  
