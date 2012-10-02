(**Complementary LIbrary for Project Euler*)
module Info : 
sig 
  val version : string 
  (** Returns running version of library*)
  val authors : string 
(** Returns the authors of the library*)
end

type baseTypes = Int of int | Char of char

val int_of_baseTypes : baseTypes -> int
(**Takes a value of type baseTypes and returns an int*)
val char_of_baseTypes : baseTypes -> char
(**Takes a value of type baseTypes and returns a char*)

module ArrayTools :
sig
  val swap : int -> int -> baseTypes array -> unit 
  (**[ArrayTools.swap i j tbl] swaps elements with index i,j of an Array tbl.
    Raises Invalid_argument "index out of bounds" if i and/or j are outside the range 0..(Array.length tbl -1)*)
  val reverse : int -> int -> baseTypes array -> unit 
(**[ArrayTools.reverse a b tbl] reverses in place a subarray of tbl with length a-b+1 starting at index a
  Raise Invalid_argument "index out of bounds" if a and/or b are outside the range 0..(Array.length tbl -1) and/or b>a.*)
end
module Permutations :
sig 
  exception LastPermutation val nextPermutation : baseTypes array -> unit 
(**[Permutations.NextPermutation tbl] rearranges the elements of tbl into the lexicographically next greater permutation of elements. 
  Raises LastPermutation if tbl is the last permutation*)
end
module Primes :
sig
  val isPrime : int -> bool
  (** [isPrime n] takes an [int] and returns [true] if n is a prime number, false otherwise*)
  val sieve : int -> bool array
  (** [sieve n] takes an [int] n and returns an [Array] of booleans up to n, true indicating that the number corresponding to the current index is a prime*)
  val numDivisors : int -> int
  (** [numDivisors n] takes an [int] and returns the number of its divisors.*)
  val primeDecomposition : int -> (int * int) list
  (** [primeDecomposition n] takes an [int] n and returns a [List] of tuples (p{_i},e{_i}) where n = p{_1}^e{_1} * p{_2} ^ e{_2}...p{_k} * e{_k} *)
  val gcd : int -> int -> int
(** [gcd n m] takes an [int] a and an [int] b and returns an [int] which is their greatest common divisor*)
end
