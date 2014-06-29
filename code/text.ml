open Core.Std

(* string -> string list *)
let readlines filename =
  let file = In_channel.create filename in
  let lines =
    protect
      ~f:(fun () -> In_channel.input_lines file)
      ~finally:(fun () -> In_channel.close file) in
  lines
    
(* string list -> (string list) list *)
let split_lines lines =
  List.map
    lines
    ~f:(fun l -> String.split l ~on:' ')

(* string -> string Histogram.t *)
let word_hist filename =
  let lines = readlines filename in
  let as_splits = split_lines lines in
  let hist =
    List.fold
      as_splits
      ~init:Histogram.empty
      ~f:(fun acc_hist words -> Histogram.touch_all acc_hist words) in
  hist

