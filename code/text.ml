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
  |> split_lines
  |> List.fold_left
      ~init:Histogram.empty
      ~f:(fun acc_hist words -> Histogram.touch_all acc_hist words)
