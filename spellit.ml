open Core.Std

let () =
  let hist = Text.word_hist "corpus.txt" in
  Histogram.iter
    hist
    ~f:(fun ~key ~data -> printf "%s %d\n" key data)
  
