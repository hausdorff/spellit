open Core.Std

type 'a t = { counter : ('a, int) Map.Poly.t }

(* 'a Histogram.t *)
let empty = { counter = Map.Poly.empty }

(* 'a Histogram.t *)
let create m = { counter = m }

(* 'a Histogram.t -> 'a -> int option *)
let find t k = Map.Poly.find t.counter k

(* 'a Histogram.t -> key:'a -> count:int -> 'a Histogram.t *)
let add t ~key ~count =
  let new_counter = Map.Poly.add t.counter ~key:key ~data:count in
  create new_counter

(* 'a Histogram.t -> 'a -> 'a Histogram.t *)
let touch t k = match find t k with
    None   -> add t ~key:k ~count:1
  | Some n -> add t ~key:k ~count:(n+1)

(* 'a Histogram.t -> 'a list -> 'a Histogram.t *)
let touch_all t data =
  List.fold
    data
    ~init:t
    ~f:(fun acc_t datum -> touch acc_t datum)

(* 'a Histogram.t -> f:(key:'a -> data:int -> unit) -> unit *)
let iter t ~f =
  Map.Poly.iter
    t.counter
    ~f:f

(* 'a Histogram.t -> ('a, int) list *)
let to_alist t = Map.Poly.to_alist t.counter
