-- just starting
-- quotRem gives the quotient and remainder in a tuple
-- divMod does the same
import Data.List

divideThenAdd :: Fractional a => a -> a -> a
divideThenAdd x y = (x / y) + 1

subtractThenAdd :: Num a => a -> a -> a
subtractThenAdd x y = (x - y) + 1

-- we don't have to write f :: (Num a, Fractional a) => a -> a -> a
-- because it's redundant. Fractional is a subset of Num.
-- More explicitly, any Fractional is guaranteed to implement Num.

-- Enum and Show

-- time for chapter exercises!

{-
data Person = Person Bool
-- does not work because it's not deriving Show
-- error should say "no instance of (Show (Bool -> Person))"

printPerson :: Person -> IO ()
printPerson person = putStrLn (show Person)
-}
{-
data Mood = Blah | Woot deriving Show

settleDown x = if x == Woot
                  then Blah
                  else x
-- should not typecheck, since didn't derive Eq
-- error should be "no instance of (Eq Mood)"
-}


data Mood = Blah | Woot deriving (Show, Eq)

settleDown x = if x == Woot
                  then Blah
                  else x
-- acceptable inputs are Blah and Woot
-- settleDown 9 no instance for (Num Mood), 9 is Num a => a and it tries to
-- match that with Mood. But Mood doesn't implement the Num typeclass.
-- Blah > Woot should result in "no instance for (Ord Mood)"

type Subject = String
type Verb = String
type Object = String

data Sentence =
    Sentence Subject Verb Object
    deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
-- should not, since s1 is incomplete? also what does "type" do
-- OK, it does typecheck, you just can't use it really. It's partially
-- applied. Makes sense, since Sentence is a value constructor.
-- "type" is type synonym

data Rocks = Rocks String deriving (Eq, Show)

data Yeah = Yeah Bool deriving (Eq, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Show)

-- phew = Papu "chases" True
-- won't typecheck, since Papu :: Rocks -> Yeah -> Papu
-- there's no Rocks and Yeah constructors

truth = Papu (Rocks "chomskydoz") (Yeah True)
-- should typecheck

equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'
-- should work. We derived (Eq Papu), which should work because
-- all the components implement Eq as well, since we derived
-- those also

{-
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'
-- won't typecheck, since we didn't derive Ord for Papu
-- if we do, we also need to derive Ord for Rocks and Yeah
-- yup just tried, need to do that.
-}

i :: Num a => a
i = 1
-- ok, I was wrong. i :: a doesn't work since 1 is constrained by Num

-- f :: Float
-- f :: Num a => a
-- won't work, 1.0 is Fractional a => a
-- Fractional is a subclass of Num
-- f :: Fractional a => a -- should work
f :: RealFrac a => a -- I think this is fine, 1.0 is both Real and Fractional
f = 1.0

-- freud :: a -> a
freud :: Ord a => a -> a
-- should be fine, restricting to Ord only adds access to Ord methods, which
-- aren't used anyhow.
freud x = x

-- freud' :: a -> a
freud' :: Int -> Int
-- this definition is parametrically polymorphic, so using any concrete type
-- would work fine. It's an element of the set of all types.
freud' x = x

myX = 1 :: Int

sigmund :: Int -> Int
-- sigmund :: a -> a
-- can't work, it throws away x and puts in myX. myX is an Int, so that
-- constrains the type of a.
sigmund x = myX

sigmund' :: Int -> Int
-- sigmund' :: Num a => a -> a -- still, what if you give it a Float?
sigmund' x = myX


-- jung :: Ord a => [a] -> a
jung :: [Int] -> Int -- that's fine, narrowed
jung xs = head (sort xs)

-- young :: String -> Char
young :: Ord a => [a] -> a
-- fine, as we only use List (head) and Ord (sort)
young xs = head (sort xs)

mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
-- signifier :: Ord a => [a] -> a
-- breaks due to mySort being String -> String
signifier xs = head (mySort xs)
