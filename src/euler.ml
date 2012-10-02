module Info =
struct

  let version = "0.01"
  let  authors = "Nick Giannarakis, Zoe Paraskevopoulou"

end

type baseTypes = Int of int | Char of char

let int_of_baseTypes x = match x with
  | Int x -> x
  | _ -> failwith "requires an int"
;;

let char_of_baseTypes x = match x with
  | Char x ->x
  | _ -> failwith "requires a char"
;;

module ArrayTools =
struct

  let xor a b =
    match a,b with 
      | Char a, Char b -> Char ((Char.chr ((Char.code a) lxor (Char.code b))))
      | Int a, Int b -> Int (a lxor b)
      | _,_ -> failwith "invalid arguments to xor"
  ;;

  let swap ind1 ind2 tbl =
    tbl.(ind1) <- (xor tbl.(ind1) tbl.(ind2));
    tbl.(ind2) <- (xor tbl.(ind1) tbl.(ind2));
    tbl.(ind1) <- (xor tbl.(ind1) tbl.(ind2));
  ;;

  let rec reverse ind1 ind2 tbl =
    match (ind2-ind1) with 
      | 0 -> ()
      | 1 -> swap ind1 ind2 tbl
      | _ -> swap ind1 ind2 tbl; 
             reverse (ind1 + 1) (ind2 - 1) tbl
  ;;

end

module Permutations =
struct

  exception LastPermutation


  let nextPermutation perm =
    let digits = Array.length perm in
    let rec findK ind =
      match ind with 
        | -1 -> -1
        | ind -> if (perm.(ind) < perm.(ind+1)) then ind else findK (ind-1)
    in   
    let rec findL ind k =
      match ind with 
        | ind when (ind=(k+1)) -> k+1
        | ind -> if (perm.(k) < perm.(ind)) then ind else findL (ind-1) k 
    in   
    let k = findK (digits-2) in
      if (k = -1) then raise LastPermutation;
      let l = findL (digits-1) k in
        ArrayTools.swap k l perm;
        ArrayTools.reverse (k+1) (digits-1) perm;   
  ;;

end

module Primes =
struct

  let isPrime x =
    if (((x land 1) = 0) || ((x mod 3) = 0)) then false
    else 
      let bound = ((truncate (sqrt (float x))) - 1) in
      let rec loop i =
        let k = 6*i in
          match k with
            | k when (k > bound) -> true
            | k ->  if (((x mod (k+1)) = 0) || ((x mod (k-1)) = 0)) then false
              else loop (i+1)
      in
        loop 1
  ;;

  let sieve bound =
    let bitmap = Array.make (bound+1) true in
      bitmap.(1) <- false; (*Project Euler Conventions*)
      let root = truncate (sqrt (float bound)) in   
        for i = 2 to root do
          if (bitmap.(i) == true) then 
            let j = ref (i*i) 
            in   
              while (!j <= bound) do
                bitmap.(!j) <- false;
                j := !j + i; 
              done;
        done;
        bitmap
  ;;

  let numDivisors num =
    let lim = truncate (sqrt (float num))  in  
    let rec divide n divisor power =
      match (n mod divisor) with 
        | 0 -> divide (n/divisor) divisor (power+1) 
        | _ -> (power,n)
    in    
    let rec divaux n divisor fact =
      if (n < 2) then fact 
      else
        begin
          let (power,res) = divide n divisor 0 in
            match divisor with 
              | d when (d==(lim+1)) -> if (n>1) then (fact*2) else (fact)
              | d -> divaux res (divisor+1) (fact*(power+1)) 
        end  
    in
      divaux num 2 1  
  ;;


  let primeDecomposition num =
    let lim = num/2  in   
    let rec divide n divisor power =
      match (n mod divisor) with 
        | 0 -> divide (n/divisor) divisor (power+1) 
        | _ -> (power,n)
    in    
    let rec divaux n divisor acc =
      if (n < 2) then List.rev acc
      else 
        begin
          let (power,res) = divide n divisor 0 in 
            match divisor with 
              | d when (d==(lim+1)) -> List.rev acc
              | d -> if (power > 0) then divaux res (divisor+1) ((divisor,power) :: acc) 
                else divaux res (divisor+1) acc
        end  
    in
      divaux num 2 [] 
  ;;


  let rec gcd a b =
    match b with 
      | 0 -> a 
      | b -> gcd b (a mod b)
  ;;

end



