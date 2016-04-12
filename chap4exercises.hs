
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

myAbs :: Integer -> Integer
myAbs x = if x >= 0
            then x
            else (- x)

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((second x, second y), (first x, first y))

x = (+)

f xs = w x 1
    where w = length xs

\x -> x

\(x:xs) -> x

f2 (a, b) = a

-- got them right, went on to chapter 5
