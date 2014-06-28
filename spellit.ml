open Core.Std

let () =
  let hist = Text.word_hist "corpus.txt" in
  let sorted_words =
    List.sort
      (Histogram.to_alist hist)
      ~cmp:(fun w1 w2 -> (snd w2) - (snd w1)) in
  List.iter
    (List.take sorted_words 10)
    ~f:(fun datum -> printf "%s %d\n" (fst datum) (snd datum))
  
