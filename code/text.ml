open Core.Std

(* string -> string list *)
let readlines filename =
  let file = In_channel.create filename in
  let lines =
    protect
      ~f:(fun () -> In_channel.input_lines file)
      ~finally:(fun () -> In_channel.close file)
  in
  lines
    
(* string list -> (string list) list *)
let split_lines lines =
  List.map
    lines
    ~f:(String.split ~on:' ')

(* string -> string Histogram.t *)
let word_hist filename =
  filename
  |> readlines
  |> List.map ~f:String.lowercase
  |> split_lines
  |> List.fold_left
      ~init:Histogram.empty
      ~f:(fun acc_hist words -> Histogram.touch_all acc_hist words)

(* string -> int -> int -> string *)
let slice s i j = match i,j with
    0,0 -> ""
  | _   -> String.slice s i j

(* string -> int -> string *)
let delete_char s index =
  let length = String.length s in
  let slice1 = slice s 0 index in
  let slice2 = slice s (index+1) length in
  String.concat [slice1; slice2]

(* string -> int -> string -> string *)
let splice_at s index to_splice =
  let length = String.length s in
  let slice1 = slice s 0 index in
  let slice2 = slice s index length in
  String.concat [slice1; to_splice; slice2]

(* string -> string list *)
let words_from_deletion word =
  String.foldi
    word
    ~init:[]
    ~f:(fun i acc_words _ -> (delete_char word i)::acc_words)

let words_from_insertion_char ~word c =
  String.foldi
    word
    ~init:[String.concat [word; c]]
    ~f:(fun i acc_words _ -> (splice_at word i c)::acc_words)

let letters =
  List.map
    (String.to_list "abcdefghijklmnopqrstuvwxyz")
    ~f:Char.to_string

(* string -> string list *)
let words_from_insertion word =
  let char_insertions =
    List.map
      letters
      ~f:(words_from_insertion_char ~word:word)
  in
  List.concat char_insertions

let word_suggestions hist word =
  let candidates =
    List.concat [words_from_deletion word; words_from_insertion word]
  in
  List.filter_map
    candidates
    ~f:(fun w ->
      match (Histogram.find hist w) with
          None       -> None
        | Some count -> Some (w, count))

let suggest hist word =
  if Histogram.contains hist word
  then Some word
  else
    let suggestions = word_suggestions hist word in
    let sorted_suggestions =
      List.sort
        suggestions
        ~cmp:(fun (_,count1) (_,count2) -> count1 - count2)
    in
    match List.hd sorted_suggestions with
        None -> None
      | Some (word,_) -> Some word
