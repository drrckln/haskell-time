data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
    (==) (TisAn v) (TisAn v') = v == v'

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two x y) (Two x' y') = x == x' && y == y'

data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt x) (TisAnInt y) = x == y
    (==) (TisAString s) (TisAString s') = s == s'
    (==) _ _ = False

data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
    (==) (Pair x y) (Pair x' y') = x == x' && y == y'

data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'

data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThisOne v) (ThisOne v') = v == v'
    (==) (ThatOne v) (ThatOne v') = v == v'
    (==) _ _ = False

data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello a) (Hello a') = a == a'
    (==) (Goodbye b) (Goodbye b') = b == b'
    (==) _ _ = False
