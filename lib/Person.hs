
type Name = String
data Person	= Person { name :: Name, age :: Int }


validateName :: String -> Maybe Name
validateAge  :: Int    -> Maybe Int


then_ :: Maybe a -> (a -> Maybe b) -> Maybe b
then_ v g = case v of
			  Nothing -> Nothing
			  Just v' -> g v'


flatten_ :: Maybe (Maybe a) -> Maybe a
flatten_ (Just (Just x)) = Just x
flatten_ _               = Nothing


map_ :: (a -> b) -> Maybe a -> Maybe b
map_ f Nothing  = Nothing
map_ f (Just x) = Just (f x)


singleton_ :: a -> Maybe a
singleton_ = Just


validatePerson name age
  = validateName name `then_` \name' ->
	validateAge  age  `then_` \age'  ->
	Just (Person name' age')
