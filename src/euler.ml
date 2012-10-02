module Info =
struct

  let version = "0.01"
  let  authors = "Nick Giannarakis, Zoe Paraskevopoulou"

end

module ArrayTools =
struct
    
  let swap ind1 ind2 tbl =
    tbl.(ind1) <- (tbl.(ind1) lxor tbl.(ind2));
    tbl.(ind2) <- (tbl.(ind1) lxor tbl.(ind2));
    tbl.(ind1) <- (tbl.(ind1) lxor tbl.(ind2));
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
