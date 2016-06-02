head' :: [a]->a
head' [] = error "empty"
head' (x:_) = x

head'' :: [a] -> a
head'' xs = case xs of
  [] -> error "empty"
  (x:_) -> x

describeList :: [a] -> String
describeList ls = "The list is "++ case ls of
  [] -> "empty."
  [x] -> "a singleton list"
  xs -> "a longer list"
