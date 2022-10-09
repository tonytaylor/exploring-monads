import Prelude hiding (pure)

-- algebraic data type
data Tree a = Leaf a | Node (Tree a) (Tree a)
  deriving(Eq, Show)

-- let simple = (Leaf "alone")
-- let deeper = (Node (Node (Leaf "one") (Leaf "two")) (Node (Node (Leaf "four") (Node (Leaf "five") (Node (Leaf "seven") (Leaf "six")))) (Leaf "three")))

type State s a = s -> (a, s)
type WithCounter a = Int -> (a, Int)


-- Takes a value of type <a> and wraps in a `State Int` container.
pure :: a -> State Int a
pure x = \i -> (x, i)


numberOfLeaves :: Tree a -> Integer
numberOfLeaves (Leaf _)   = 1
numberOfLeaves (Node l r) = numberOfLeaves l + numberOfLeaves r


-- A `State Int` container transformation function.
--
-- Takes an State Int type container of value <a> and a function that takes
-- a value <a> parameter and returns a State Int type container of value <b>
--
-- Returns an State Int type container of value <b>
next :: State Int a -> (a -> State Int b) -> State Int b
f `next` g = \i -> let (r, i') = f i in g r i'


relabel' :: Tree a -> Int -> (Tree (Int, a), Int)
relabel' (Leaf x)   i = (Leaf (i, x), i + 1)
relabel' (Node l r) i = let (l', i1) = relabel' l i
                            (r', i2) = relabel' r i1
                        in (Node l' r', i2)

relabel :: Tree a -> Int -> (Tree (Int, a), Int)
relabel (Leaf x)   = \i -> (Leaf (i, x), i + 1)
relabel (Node l r) = relabel l `next` \l' ->
                     relabel r `next` \r' ->
                     pure (Node l' r')



