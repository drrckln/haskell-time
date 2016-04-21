-- just starting
-- quotRem gives the quotient and remainder in a tuple
-- divMod does the same


divideThenAdd :: Fractional a => a -> a -> a
divideThenAdd x y = (x / y) + 1

subtractThenAdd :: Num a => a -> a -> a
subtractThenAdd x y = (x - y) + 1

-- we don't have to write f :: (Num a, Fractional a) => a -> a -> a
-- because it's redundant. Fractional is a subset of Num.
-- More explicitly, any Fractional is guaranteed to implement Num.

