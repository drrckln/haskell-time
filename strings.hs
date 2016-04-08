module Strings where

addExclamation s = s ++ "!"

fifth s = s !! 4

drop9 s = drop 9 s

thirdLetter :: String -> Char
thirdLetter s = s !! 2

letterIndex :: Int -> Char
letterIndex n = "Curry is awesome!" !! n

rvrs :: String -> String
rvrs s = (drop 9 s) ++ " " ++ (take 2 (drop 6 s)) ++ " " ++ (take 5 s)
