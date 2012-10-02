(**Complementary LIbrary for Project Euler*)
module Info : 
sig 
  val version : string 
  (** Returns running version of library*)
  val authors : string 
(** Returns the authors of the library*)
end
module ArrayTools :
sig
  val swap : int -> int -> int array -> unit 
  (**[ArrayTools.swap i j tbl] swaps elements with index i,j of an Array tbl.
    Raises Invalid_argument "index out of bounds" if i and/or j are outside the range 0..(Array.length tbl -1)*)
  val reverse : int -> int -> int array -> unit 
(**[ArrayTools.reverse a b tbl] reverses in place a subarray of tbl with length a-b+1 starting at index a
  Raise Invalid_argument "index out of bounds" if a and/or b are outside the range 0..(Array.length tbl -1) and/or b>a.*)
end
module Permutations :
sig 
  exception LastPermutation val nextPermutation : int array -> unit 
(**[Permutations.NextPermutation tbl] rearranges the elements of tbl into the lexicographically next greater permutation of elements. 
  Raises LastPermutation if tbl is the last permutation*)
end
