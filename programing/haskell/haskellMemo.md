# 1章

## リスト
```hs
[1,2,3]
0:[1,2,3] # 要素の追加
[1,2,3]++[5,6] # リストの結合
```

* 関数

```haskell
head [1,2,3,4,5] # 5
tail [1,2,3,4,5] # [2,3,4,5]
init [1,2,3,4,5] # [1,2,3,4]
length [1,2,3,4,5] # 5
null [1,2,3] # False
null [] # True
reverse [1,2,3] # [3,2,1]
take 3 [1,2,3,4,5] # [1,2,3]
drop 3 [1,2,3,4,5] # [4,5]
maximum [1,2,3] # 3
minimum [1,2,3] # 1
sum [2,3,4] # 9
product [2,3,4] # 24
4 `elem` [3,4,5,6] # True (含む)
```

* range

```haskell
[1..20]
['a'..'z']
[2,4..20]
[3,6..20] # [3,6,9,12,15,18]
```

* 無限リスト

```haskell
take 24 [13,26..] # [13,26..24*13]
```

* cycle

```haskell
take 7 (cycle [1,2,3]) # [1,2,3,1,2,3,1]
```

* repeat
```haskell
take 3 (repeat 5) # [5,5,5]
```

* replicate
```haskell
replicate 3 10 # [10,10,10]
```

* リスト内包表記
```haskell
[x*2|x<-[1..10],x `mod` >=12] # [12,14,16,18,20]
```

略

## タプル
* 違う型を入れられる
* `[(1,2),(3,4,5),(6,7)]` は作れない
* ペア(要素が2つのタプル)の関数
```haskell
fst
snd
```

* zip
```haskell
zip [1,2,3] [4,4,4] # [(1,4),(2,4),(3,4)]
```

* 例
```hs
rightTriangles = [(a,b,c)|c<-[1..10],a<-[1..c],b<-[1..a],a^2+b^2 == c^2 , a+b+c == 24]
```

# 2章 型
```hs
addThree1 x y z = x+y+z

addThree2 :: Int -> Int -> Int -> Int
addThree2 x y z = x+y+z
```

```bash
*Main> :t addThree1
addThree1 :: Num a => a -> a -> a -> a
*Main> :t addThree2
addThree2 :: Int -> Int -> Int -> Int
```

## 型クラス
Eq a =>は型クラス制約といい,等価性を比較できるようにする
```bash
(==) :: Eq a => a -> a -> Bool
```

## 型クラス制約
### Ord型クラス
順序をつけるための型クラス

```haskell
*Main> :t (<)
(<) :: Ord a => a -> a -> Bool

*Main> :t compare
compare :: Ord a => a -> a -> Ordering
```

### Show型クラス
### Read型クラス
```haskell
*Main> :t show
show :: Show a => a -> String
*Main> :t read
read :: Read a => String -> a
```

### Enum型クラス
### Num型クラス
### Floating型クラス
### Integral型クラス

# 3章 関数の構文
## パターンマッチ
すげえ便利

```haskell
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)
```

## タプルのパターンマッチ
```haskell
addVectors :: (Double, Double) -> (Double, Double) -> (Double,Double)
addVectors (x1,y1) (x2,y2) = (x1+x2,y1+y2)
```

```haskell
first :: (a,b,c) -> a
first(x,_,_) = x
```

```haskell
head' :: [a] -> a
head' [] = "error"
head' (x:_)= x
```

### as パターン

```haskell
firstLetter :: String -> String
firstLetter "" = "Empty"
firstLetter all@(x:xs) = "The first letter of "++all ++ " is " ++ [x]
```

### ガード
ifの代わりになるようなやつ
```haskell
bmiTell :: Double -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight."
    | bmi <= 25.0 = "You're normal."
    | bmi <= 30.0 = "You're fat."
    | otherwise   = "You're a whale."
```

```haskell
max' :: (Ord a) => a -> a -> a
max' a b
    |a <= b = b
    |otherwise = a
```

### where

```haskell
bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "underweight"
    | bmi <= normal = "normal"
    | bmi <= fat = "fat"
    | otherwise = "whale"
    where
       bmi = weight / height ^ 2
       skinny = 18.5
       normal = 25.0
       fat = 30.0
```

#### whereのスコープ
niceGreetingはスコープ外

```haskell
greet :: String -> String
greet "Juan" = niceGreeting ++ "Juan!"
greet "Fernando" = niceGreeting ++ "Fernando!"
greet name = badGreeding ++ " " ++ name
    where
      niceGreeting = "hello!"
      badGreeding = "Oh!"
```

### let

```haskell
cylinder :: Double -> Double -> Double
cylinder r h =
  let
    sideArea = 2*pi*r*h
    topArea = pi*r^2
    in sideArea +2*topArea
```

#### リスト表記内でのlet

```haskell
calcBmis :: [(Double,Double)]->[Double]
calcBmis xs = [bmi | (w,h)<- xs, let bmi = w/h^2]

calcBmis' :: [(Double,Double)] -> Double
calcBmis' xs = [bmi | (w,h) <- xs,let bmi = w/h^2,bmi>25.0]
```

## case

```haskell
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
```

# 4章 再帰

## クイックソート
