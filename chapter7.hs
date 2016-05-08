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

mflip f x y = f y x

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
antarcticPenguin (Peng Antarctica) = True
antarcticPenguin _                 = False

-- in this final function, the || operator
-- is an `or` function, which will return True
-- if either value is True
antarcticOrGalapagos :: Penguin -> Bool
antarcticOrGalapagos p = (galapagosPenguin p) || (antarcticPenguin p)

k :: (a, b) -> a
k (x, y) = x

--k1 :: Num a => a
k1 = k ((4-1), 10)

--k2 :: String
k2 = k ("three", (1 + 2))

--k3 :: Num a => a
k3 = k (3, True)

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))

pal xs =
    case xs == reverse xs of
        True  -> "yes"
        False -> "no"

pal' xs =
    case y of
        True  -> "yes"
        False -> "no"
    where y = xs == reverse xs

functionC x y =
    case x > y of
        True  -> x
        False -> y

ifEvenAdd2 n =
    case even n of
        True  -> n + 2
        False -> n

nums x =
    case compare x 0 of
        LT -> -1
        GT -> 1
        EQ -> 0

data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' =
  putStrLn $ show e ++ " is the boss of " ++ show e'

codersRuleCEOsDrool :: Employee -> Employee -> Ordering
codersRuleCEOsDrool Coder Coder = EQ
codersRuleCEOsDrool Coder _     = GT
codersRuleCEOsDrool _ Coder     = LT
codersRuleCEOsDrool e e'        = compare e e'

employeeRank :: (Employee -> Employee -> Ordering)
                -> Employee
                -> Employee 
                -> IO ()
employeeRank f e e' =
  case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither employee is the boss"
    LT -> (flip reportBoss) e e'


dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10

oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1

oneIsTwo :: Num a => a -> a
oneIsTwo = (flip dodgy) 2

-- dodgy 1 0 == 1
-- dodgy 1 1 == 11
-- dodgy 2 2 == 22
-- dodgy 1 2 == 21
-- dodgy 2 1 == 12
-- oneIsOne 1 == 11
-- oneIsOne 2 == 21
-- oneIsTwo 1 == 21
-- oneIsTwo 2 == 22
-- oneIsOne 3 == 31
-- oneIsTwo 3 == 23
