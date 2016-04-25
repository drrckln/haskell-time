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
