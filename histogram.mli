open Core.Std

type 'a t

val empty     : 'a t
val create    : ('a, int) Map.Poly.t -> 'a t
val find      : 'a t -> 'a -> int option
val touch     : 'a t -> 'a -> 'a t
val touch_all : 'a t -> 'a list -> 'a t
val iter      : 'a t -> f:(key:'a -> data:int -> unit) -> unit
