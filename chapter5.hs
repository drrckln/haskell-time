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

