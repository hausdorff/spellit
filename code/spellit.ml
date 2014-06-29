(* A simple spelling corrector in OCaml. You provide a malformed word, SpellIt
   will propose a likely correction. *)

open Core.Std

(*let () =
  Text.word_hist "../data/corpus.txt"
  |> Histogram.to_alist
  |> List.sort ~cmp:(fun w1 w2 -> (snd w2) - (snd w1))
  |> Fn.flip List.take 10
  |> List.iter ~f:(fun datum -> printf "%s %d\n" (fst datum) (snd datum))*)
(*let () =
  Text.word_suggestions (Text.word_hist "../data/corpus.txt") "mischevous"
  |> List.iter ~f:(fun (word,count) -> printf "%s %d\n" word count)*)
(*let () =
  Text.words_from_insertion "mischevous"
  |> List.iter ~f:(fun word -> printf "%s\n" word)*)
let () =
  let hist = (Text.word_hist "../data/corpus.txt") in
  match (Text.suggest hist "mischevous") with
      None -> printf "no value\n"
    | Some word -> printf "%s\n" word
  
