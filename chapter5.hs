-- doing lots of ghci exercises
-- holy shit, (->) is a type constructor?!
-- got to the explanation about Foldable t
-- did two more intermission exercises
-- read about polymorphism

hyp1 :: a -> a -> a
hyp1 x y = x

hyp2 :: a -> a -> a
hyp2 x y = y

hyp3 :: a -> b -> b
hyp3 x y = y
-- I don't believe you can have any other implementations..
-- you don't know what b is, so you have no functions/methods
-- available. You can only return it.

-- learned about polymorphic constants

myConcat :: String -> String
myConcat x = x ++ " yo"

myMult :: Fractional a => a -> a
myMult x = (x / 3) * 5

myTake :: Int -> String
myTake x = take x "hey you"

myCom :: Int -> Bool
myCom x = x > (length [1..10])

myAlph :: Char -> Bool
myAlph x = x < 'z'
