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


data WherePenguinsLive =
      Galapagos
    | Antarctica
    | Australia
    | SouthAfrica
    | SouthAmerica
    deriving (Eq, Show)

data Penguin = Peng WherePenguinsLive deriving (Eq, Show)

-- is it SouthAfrica? If so, return True
isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica _           = False

gimmeWhereTheyLive :: Penguin -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereitlives) = whereitlives

humboldt = Peng SouthAmerica
gentoo = Peng Antarctica
macaroni = Peng Antarctica
little = Peng Australia
galapagos = Peng Galapagos

galapagosPenguin :: Penguin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _                = False

antarcticPenguin :: Penguin -> Bool
galapagosPenguin (Peng Antarctica) = True
galapagosPenguin _                 = False

-- in this final function, the || operator
-- is an `or` function, which will return True
-- if either value is True
antarcticOrGalapagos :: Penguin -> Bool
antarcticOrGalapagos p = (galapagosPenguin p) || (antarcticPenguin p)

-- prep for R and Kaggle