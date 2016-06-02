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

greet :: String -> String
greet "Juan" = niceGreeting ++ "Juan!"
greet "Fernando" = niceGreeting ++ "Fernando!"
greet name = badGreeding ++ " " ++ name
    where
      niceGreeting = "hello!"
      badGreeding = "Oh!"
