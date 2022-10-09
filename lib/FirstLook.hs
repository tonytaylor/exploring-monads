
-- Monads are a `higher-kinded abstraction`
-- Monads are not a property of a concrete-type (think Int or Bool), but of
-- a type constructor (think Maybe or List). Haskell's syntax obfuscate this
-- point.


-- Monads comes from the more generic abstraction called a `Functor`. These
-- encompass the simplest notion of a "magic box", in which we can only
-- inspect, but never unwrap or generate.
--
-- Modifying the type signature of fmap as shown below transforms the 
-- functor map function into a new function that operates contained in the
-- functor. This is called "lifting", since it "lifts" the function to
-- operate at a higher level of abstraction. 
class Functor f where
    -- fmap :: (a -> b) -> f a -> f b
    fmap :: (a -> b) -> (f a -> f b)


-- Monad as context
class Monad' m where
    return :: a -> m a
    (>>=)  :: m a -> (a -> m b) -> m b


-- Monad as a box
-- class Monad' mb where
-- 	return :: a -> mb a
-- 	fmap   :: (a -> b) -> mb a mb b
-- 	join   :: mb (mb a) -> mb a
