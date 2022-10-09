import Prelude hiding (length)

length :: [a] -> Integer
length []     = 0
length (_:xs) = 1 + length xs

-- map' :: (a -> b) -> [a] -> [b]

singleton :: a -> [a]
singleton x = x : []


concat' :: [[a]] -> [a]
concat' []     = []
concat' (x:xs) = x ++ concat xs
