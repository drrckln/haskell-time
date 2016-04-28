myNum :: Integer
myNum = 1

myVal f = myNum

-- 1. these are all the same
-- 2. Num a => a -> a -> a
-- 3.
addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = \n -> n + 1

addFive = \x -> \y -> (if x > y then y else x) + 5

mflip f x y= f y x
