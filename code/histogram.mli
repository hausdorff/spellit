(* Histograms track counts of things -- counds of words, object references, or
   whatever else strikes your fancy. *)

open Core.Std

type 'a t

(* An empty Histogram.t *)
val empty     : 'a t

(* Generate a Histogram.t from count data that already exists *)
val create    : ('a, int) Map.Poly.t -> 'a t

(* Returns the count for some key *)
val find      : 'a t -> 'a -> int option

(* Increment the count for some key, or initialize it to 1 if it hasn't occurred
 * yet *)
val touch     : 'a t -> 'a -> 'a t

(* Touch all keys in a list *)
val touch_all : 'a t -> 'a list -> 'a t

(* Iterate over, and perform some action on, each item in the Histogram.t *)
val iter      : 'a t -> f:(key:'a -> data:int -> unit) -> unit

(* Convert the Histogram.t to a list *)
val to_alist  : 'a t -> ('a * int) list

(* Check to see if a key is in histogram *)
val contains  : 'a t -> 'a -> bool
