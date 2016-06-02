match [1;2;3] with
  [] -> ""
| hd::tl -> string_of_int hd;;

match name,address,mail with
 Some name ,Some address , _ -> dm
| _,_,mail  -> mail
| _ -> nothing;;

let list = Some "ogasawara"
and address = Some "Nagoya"
and mail = None
in
match name,address,mail with
| [] -> 1
| _ -> 2;;

match list with
| [] -> ""
| [hd] -> hd
| hd :: next :: t1 when hd < next -> next
| _ -> "hd > next";;
