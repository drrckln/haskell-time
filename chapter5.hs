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

-- 1. c
-- 2. a
-- 3. b
-- 4. c

-- did more

-- f :: zed -> Zed -> Blah
-- zed is fully polymorphic
-- Zed is a concrete type constructor
-- Blah is a concrete type constructor

-- f :: Enum b => a -> b -> C
-- a is fully polymorphic
-- b is constrained polymorphic
-- C is a concrete type constructor

-- f :: f -> g -> C
-- f is fully polymorphic
-- as is g
-- C is a concrete type constructor

functionH :: [a] -> a
functionH (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False

functionS :: (a,b) -> b
functionS (x, y) = y

i :: a -> a
i = id

c :: a -> b -> a
c x y = x
-- yes c'' is the same

c' - a -> b -> b
c x y = y

r :: [a] -> [a]
r x = concat [x, x]

co :: (b -> c) -> (a -> b) -> (a -> c)
co f1 f2 = f2 $ f1

a :: (a -> c) -> a -> a
a x y = y

a' :: (a -> b) -> a -> b
a f x = f x
